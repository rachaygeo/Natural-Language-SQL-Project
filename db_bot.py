import json
from openai import OpenAI
import os
import sqlite3
from time import time

print("Running db_bot.py!")

fdir = os.path.dirname(__file__)


def getPath(fname):
    return os.path.join(fdir, fname)


# SQLITE
sqliteDbPath = getPath("aidb.sqlite")
setupSqlPath = getPath("setup.sql")
setupSqlDataPath = getPath("setupData.sql")

# Erase previous db
if os.path.exists(sqliteDbPath):
    os.remove(sqliteDbPath)

sqliteCon = sqlite3.connect(sqliteDbPath)  # create new db
sqliteCursor = sqliteCon.cursor()
with (
    open(setupSqlPath) as setupSqlFile,
    open(setupSqlDataPath) as setupSqlDataFile
):
    setupSqlScript = setupSqlFile.read()
    setupSQlDataScript = setupSqlDataFile.read()

sqliteCursor.executescript(setupSqlScript)  # setup tables and keys
sqliteCursor.executescript(setupSQlDataScript)  # setup tables and keys


def runSql(query):
    result = sqliteCursor.execute(query).fetchall()
    return result


# OPENAI
configPath = getPath("config.json")
print(configPath)
with open(configPath) as configFile:
    config = json.load(configFile)

openAiClient = OpenAI(
    api_key=config["openaiKey"],
    organization=config["orgId"]
)


def getChatGptResponse(content):
    stream = openAiClient.chat.completions.create(
        model="gpt-3.5-turbo",
        messages=[{"role": "user", "content": content}],
        stream=True,
    )

    responseList = []
    for chunk in stream:
        if chunk.choices[0].delta.content is not None:
            responseList.append(chunk.choices[0].delta.content)

    result = "".join(responseList)
    return result


# strategies
commonSqlOnlyRequest = " Give me a sqlite select statement that answers the question. Only respond with sqlite syntax. If there is an error do not explain it!"
strategies = {
    "zero_shot": setupSqlScript + commonSqlOnlyRequest,
    "single_domain_double_shot": (setupSqlScript +
                                  " Who hasn't defeated any bosses? " +
                                  " \nSELECT p.player_id\nFROM Players p\nLEFT JOIN Players_Bosses pb ON p.player_id = pb.player_id IS NULL;\n " +
                                  commonSqlOnlyRequest)
}

questions = [
    "Which players carry the most items?",
    "Which players have defeated multiple bosses?",
    "Which bosses have been defeated by multiple players?",
    "What are the top 3 areas players are currently located at?",
    "Who has defeated more than 2 bosses?",
    "Who has more than 30 hours of game play?",
    "Who hasn't defeated any bosses?",
    "Will we have a problem getting the name and amount of items each player has collected?"
]


def sanitizeForJustSql(value):
    gptStartSqlMarker = "```sql"
    gptEndSqlMarker = "```"
    if gptStartSqlMarker in value:
        value = value.split(gptStartSqlMarker)[1]
    if gptEndSqlMarker in value:
        value = value.split(gptEndSqlMarker)[0]

    return value


for strategy in strategies:
    responses = {"strategy": strategy, "prompt_prefix": strategies[strategy]}
    questionResults = []
    for question in questions:
        print(question)
        error = "None"
        sqlSyntaxResponse = ""
        queryRawResponse = ""
        friendlyResponse = ""
        try:
            sqlSyntaxResponse = getChatGptResponse(strategies[strategy] + " " + question)
            sqlSyntaxResponse = sanitizeForJustSql(sqlSyntaxResponse)
            print(sqlSyntaxResponse)
            queryRawResponse = str(runSql(sqlSyntaxResponse))
            print(queryRawResponse)
            friendlyResultsPrompt = "I asked a question \"" + question + "\" and the response was \"" + queryRawResponse + "\" Please, just give a concise response in a more friendly way? Please do not give any other suggests or chatter."
            friendlyResponse = getChatGptResponse(friendlyResultsPrompt)
            print(friendlyResponse)
        except Exception as err:
            error = str(err)
            print(err)

        questionResults.append({
            "question": question,
            "sql": sqlSyntaxResponse,
            "queryRawResponse": queryRawResponse,
            "friendlyResponse": friendlyResponse,
            "error": error
        })

    responses["questionResults"] = questionResults

    with open(getPath(f"response_{strategy}_{time()}.json"), "w") as outFile:
        json.dump(responses, outFile, indent=2)

sqliteCursor.close()
sqliteCon.close()
print("Done!")
