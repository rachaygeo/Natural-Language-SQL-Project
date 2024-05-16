INSERT INTO Players (player_id, curr_area, hours_played) VALUES
(1, 3, 25),
(2, 2, 30),
(3, 1, 40),
(4, 5, 35),
(5, 4, 28);

INSERT INTO Areas (area_id, name, num_benches) VALUES
(1, 'Forgotten Crossroads', 12),
(2, 'Greenpath', 8),
(3, 'Fungal Wastes', 10),
(4, 'City of Tears', 15),
(5, 'Deepnest', 7);

INSERT INTO Enemies (enemy_id, name, health, area_id) VALUES
(1, 'Vengefly', 60, 1),
(2, 'Mosscreep', 50, 2),
(3, 'Mantis Youth', 80, 3),
(4, 'Husk Guard', 70, 4),
(5, 'Weaverling', 90, 5);

INSERT INTO Bosses (boss_id, name, health, area_id) VALUES
(1, 'False Knight', 400, 1),
(2, 'Hornet', 600, 2),
(3, 'Mantis Lords', 800, 3),
(4, 'Soul Master', 1000, 4),
(5, 'Nosk', 1200, 5);

INSERT INTO Players_Bosses (player_id, boss_id) VALUES
(1, 3),
(2, 2),
(3, 1),
(4, 5),
(5, 4);

INSERT INTO Items (item_id, player_id, name, amount) VALUES
(1, 1, 'Pale Ore', 3),
(2, 2, 'Rancid Egg', 5),
(3, 3, 'Hallownest Seal', 2),
(4, 4, 'Geo', 4000),
(5, 5, 'Simple Key', 1);
