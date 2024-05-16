CREATE TABLE `Players` (
  `player_id` integer PRIMARY KEY,
  `curr_area` integer,
  `hours_played` integer
);

CREATE TABLE `Areas` (
  `area_id` integer PRIMARY KEY,
  `name` varchar(100),
  `num_benches` smallint
);

CREATE TABLE `Enemies` (
  `enemy_id` integer PRIMARY KEY,
  `name` varchar(50),
  `health` integer,
  `area_id` integer
);

CREATE TABLE `Bosses` (
  `boss_id` integer PRIMARY KEY,
  `name` varchar(50),
  `health` integer,
  `area_id` integer
);

CREATE TABLE `Players_Bosses` (
  `player_id` integer,
  `boss_id` integer
);

CREATE TABLE `Items` (
  `item_id` integer PRIMARY KEY,
  `player_id` integer,
  `name` varchar(50),
  `amount` integer
);

ALTER TABLE `Players` ADD FOREIGN KEY (`curr_area`) REFERENCES `Areas` (`area_id`);

ALTER TABLE `Enemies` ADD FOREIGN KEY (`area_id`) REFERENCES `Areas` (`area_id`);

ALTER TABLE `Bosses` ADD FOREIGN KEY (`area_id`) REFERENCES `Areas` (`area_id`);

ALTER TABLE `Players_Bosses` ADD FOREIGN KEY (`player_id`) REFERENCES `Players` (`player_id`);

ALTER TABLE `Players_Bosses` ADD FOREIGN KEY (`boss_id`) REFERENCES `Bosses` (`boss_id`);

ALTER TABLE `Items` ADD FOREIGN KEY (`player_id`) REFERENCES `Players` (`player_id`);
