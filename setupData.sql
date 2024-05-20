-- Players
INSERT INTO Players (player_id, curr_area, hours_played) VALUES
(1, 3, 25),
(2, 5, 30),
(3, 4, 40),
(4, 5, 35),
(5, 4, 28);

-- Areas
INSERT INTO Areas (area_id, name, num_benches) VALUES
(1, 'Forgotten Crossroads', 12),
(2, 'Greenpath', 8),
(3, 'Fungal Wastes', 10),
(4, 'City of Tears', 15),
(5, 'Deepnest', 7);

-- Enemies
INSERT INTO Enemies (enemy_id, area_id, name, health) VALUES
(1, 1, 'Vengefly', 60),
(2, 2, 'Mosscreep', 50),
(3, 3, 'Mantis Youth', 80),
(4, 4, 'Husk Guard', 70),
(5, 5, 'Weaverling', 90);

-- Bosses
INSERT INTO Bosses (boss_id, area_id, name, health) VALUES
(1, 1, 'False Knight', 400),
(2, 2, 'Hornet', 600),
(3, 3, 'Mantis Lords', 800),
(4, 4, 'Soul Master', 1000),
(5, 5, 'Nosk', 1200);

-- Players_Bosses
INSERT INTO Players_Bosses (player_id, boss_id) VALUES
(1, 3),
(2, 3),
(3, 1),
(4, 5),
(3, 3),
(3, 5),
(1, 4);

-- Items
INSERT INTO Items (item_id, player_id, name, amount) VALUES
(1, 3, 'Pale Ore', 3),
(2, 2, 'Rancid Egg', 5),
(3, 3, 'Hallownest Seal', 2),
(4, 2, 'Geo', 2000),
(5, 4, 'Geo', 1000),
(6, 3, 'Geo', 3000),
(7, 1, 'Simple Key', 1);
