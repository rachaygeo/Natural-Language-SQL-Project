INSERT INTO Players (player_id, curr_area, hours_played) VALUES
(1, 3, 25),
(2, 2, 30),
(3, 1, 40),
(4, 5, 35),
(5, 4, 28),
(6, 1, 20),
(7, 2, 15),
(8, 4, 50),
(9, 3, 45),
(10, 5, 22);

INSERT INTO Areas (area_id, name, num_benches) VALUES
(1, 'Forgotten Crossroads', 12),
(2, 'Greenpath', 8),
(3, 'Fungal Wastes', 10),
(4, 'City of Tears', 15),
(5, 'Deepnest', 7),
(6, 'Crystal Peak', 10),
(7, 'Kingdom's Edge', 8),
(8, 'Ancient Basin', 12),
(9, 'Royal Waterways', 6),
(10, 'White Palace', 5);

INSERT INTO Enemies (enemy_id, name, health, area_id) VALUES
(1, 'Vengefly', 60, 1),
(2, 'Mosscreep', 50, 2),
(3, 'Mantis Youth', 80, 3),
(4, 'Husk Guard', 70, 4),
(5, 'Weaverling', 90, 5),
(6, 'Crystal Hunter', 100, 6),
(7, 'Winged Sentry', 110, 7),
(8, 'Husk Dandy', 120, 8),
(9, 'Flukemon', 130, 9),
(10, 'Soul Twister', 140, 10);

INSERT INTO Bosses (boss_id, name, health, area_id) VALUES
(1, 'False Knight', 400, 1),
(2, 'Hornet', 600, 2),
(3, 'Mantis Lords', 800, 3),
(4, 'Soul Master', 1000, 4),
(5, 'Nosk', 1200, 5),
(6, 'Crystal Guardian', 1500, 6),
(7, 'Traitor Lord', 1800, 7),
(8, 'Broken Vessel', 2000, 8),
(9, 'Dung Defender', 2200, 9),
(10, 'White Defender', 2500, 10);

INSERT INTO Players_Bosses (player_id, boss_id) VALUES
(1, 3),
(2, 2),
(4, 5),
(5, 4),
(6, 1),
(6, 3),
(8, 7),
(9, 9),
(10, 10);

INSERT INTO Items (item_id, player_id, name, amount) VALUES
(1, 1, 'Pale Ore', 3),
(2, 2, 'Rancid Egg', 5),
(4, 4, 'Geo', 4000),
(5, 5, 'Simple Key', 1),
(6, 6, 'Hallownest Seal', 2),
(6, 8, 'Hallownest Seal', 1),
(8, 8, 'Mask Shard', 3),
(9, 9, 'Soul Vessel', 2),
(10, 10, 'Arcane Egg', 1);
