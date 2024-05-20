# Natural-Language-SQL-Project
AI SQL

## Hollow Knight
My project models data that someone playing Hollow Knight might find useful. Includes player stats and information about areas, enemies, and bosses.

## Query I thought it did well on
#### Question: Which players have defeated multiple bosses?
GPT SQL Response: 
>SELECT pb.player_id\nFROM Players_Bosses pb\nGROUP BY pb.player_id\nHAVING COUNT(pb.boss_id) > 1;
##### Friendly Response: Player 1 and Player 3 have defeated multiple bosses.

## Question that it tripped up on
It did the SQL part right, but didn't quite get the data back in a friendly way. I wanted to know the area names. It returned the area id and I think player id’s with it.
#### Question: What are the top 3 areas players are currently located at?
GPT SQL Response:
>SELECT curr_area, COUNT(player_id) as num_players\nFROM Players\nGROUP BY curr_area\nORDER BY num_players DESC\nLIMIT 3;

SQL Result is just "IDs": (5, 2), (4, 2), (3, 1)]
#### Friendly response: The top 3 areas players are currently located at are (5, 2), (4, 2), and (3, 1).
The response doesn’t make any sense. They are the ID’s of the area which wouldn’t make any sense to a player. I would have preferred it to say something like, "The top 3 areas players are currently located at are City of Tears, Deepnest, and Greenpath“.
I think I could probably get the answer I'm looking for with a different prompting strategy. I used double_shot, but the zero_shot friendly response was exactly what I was looking for.

## Multi-shot
It successfully retrieved what every player is carrying even player 5 who was carrying nothing.
#### Question (multi-shot): Will we have a problem getting the name and amount of items each player has collected?
SQL Result is just "IDs": [(1, 'Simple Key', 1), (2, 'Geo', 2000), (2, 'Rancid Egg', 5), (3, 'Geo', 3000), (3, 'Hallownest Seal', 2), (3, 'Pale Ore', 3), (4, 'Geo', 1000), (5, None, None)]
#### Friendly response: No problem, here is the concise response: Yes, we can get the name and amount of items each player has collected.

## Conclusion
My findings is that for fairly simple joins chatgpt 3.5 turbo does well at creating SQL queries. 
This can be useful for beginners to learn SQL. Sometimes I find it helpful to see examples to understand a concept better, and the SQL queries chatgpt came up with were pretty accurate.
