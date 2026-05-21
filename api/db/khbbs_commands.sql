-- KH BBS Command Meld Database
-- Source: https://www.khwiki.com/Command_Meld
--
-- terra/ventus/aqua: 0 = unavailable, 1-100 = success rate %

PRAGMA journal_mode=WAL;
PRAGMA foreign_keys=ON;

CREATE TABLE IF NOT EXISTS crystals (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS abilities (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS type_crystal_abilities (
    recipe_type TEXT NOT NULL,
    crystal_id INTEGER NOT NULL REFERENCES crystals(id),
    ability_id INTEGER NOT NULL REFERENCES abilities(id),
    PRIMARY KEY (recipe_type, crystal_id)
);

CREATE TABLE IF NOT EXISTS commands (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS recipes (
    id INTEGER PRIMARY KEY,
    recipe_type TEXT NOT NULL,
    ingredient1_id INTEGER NOT NULL REFERENCES commands(id),
    ingredient1_lv INTEGER NOT NULL,
    ingredient2_id INTEGER NOT NULL REFERENCES commands(id),
    ingredient2_lv INTEGER NOT NULL,
    result_id INTEGER NOT NULL REFERENCES commands(id),
    terra INTEGER NOT NULL DEFAULT 0,
    ventus INTEGER NOT NULL DEFAULT 0,
    aqua INTEGER NOT NULL DEFAULT 0
);

CREATE INDEX IF NOT EXISTS idx_recipes_result ON recipes(result_id);
CREATE INDEX IF NOT EXISTS idx_recipes_ingredient1 ON recipes(ingredient1_id);
CREATE INDEX IF NOT EXISTS idx_recipes_ingredient2 ON recipes(ingredient2_id);
CREATE INDEX IF NOT EXISTS idx_recipes_type ON recipes(recipe_type);

INSERT INTO crystals VALUES (1,'Shimmering Crystal');
INSERT INTO crystals VALUES (2,'Fleeting Crystal');
INSERT INTO crystals VALUES (3,'Pulsing Crystal');
INSERT INTO crystals VALUES (4,'Wellspring Crystal');
INSERT INTO crystals VALUES (5,'Soothing Crystal');
INSERT INTO crystals VALUES (6,'Hungry Crystal');
INSERT INTO crystals VALUES (7,'Abounding Crystal');

INSERT INTO abilities VALUES (1,'Air Combo Plus');
INSERT INTO abilities VALUES (2,'Attack Haste');
INSERT INTO abilities VALUES (3,'Blizzard Boost');
INSERT INTO abilities VALUES (4,'Blizzard Screen');
INSERT INTO abilities VALUES (5,'Combo F Boost');
INSERT INTO abilities VALUES (6,'Combo Plus');
INSERT INTO abilities VALUES (7,'Cure Boost');
INSERT INTO abilities VALUES (8,'Damage Syphon');
INSERT INTO abilities VALUES (9,'Dark Screen');
INSERT INTO abilities VALUES (10,'Defender');
INSERT INTO abilities VALUES (11,'EXP Chance');
INSERT INTO abilities VALUES (12,'EXP Walker');
INSERT INTO abilities VALUES (13,'Finish Boost');
INSERT INTO abilities VALUES (14,'Fire Boost');
INSERT INTO abilities VALUES (15,'Fire Screen');
INSERT INTO abilities VALUES (16,'HP Boost');
INSERT INTO abilities VALUES (17,'HP Prize Plus');
INSERT INTO abilities VALUES (18,'Item Boost');
INSERT INTO abilities VALUES (19,'Leaf Bracer');
INSERT INTO abilities VALUES (20,'Link Prize Plus');
INSERT INTO abilities VALUES (21,'Lucky Strike');
INSERT INTO abilities VALUES (22,'Magic Haste');
INSERT INTO abilities VALUES (23,'Once More');
INSERT INTO abilities VALUES (24,'Reload Boost');
INSERT INTO abilities VALUES (25,'Second Chance');
INSERT INTO abilities VALUES (26,'Thunder Boost');
INSERT INTO abilities VALUES (27,'Thunder Screen');
INSERT INTO abilities VALUES (28,'Treasure Magnet');

INSERT INTO type_crystal_abilities VALUES ('A',1,14);
INSERT INTO type_crystal_abilities VALUES ('A',2,22);
INSERT INTO type_crystal_abilities VALUES ('A',3,19);
INSERT INTO type_crystal_abilities VALUES ('A',4,1);
INSERT INTO type_crystal_abilities VALUES ('A',5,16);
INSERT INTO type_crystal_abilities VALUES ('A',6,17);
INSERT INTO type_crystal_abilities VALUES ('A',7,20);
INSERT INTO type_crystal_abilities VALUES ('B',1,3);
INSERT INTO type_crystal_abilities VALUES ('B',2,22);
INSERT INTO type_crystal_abilities VALUES ('B',3,19);
INSERT INTO type_crystal_abilities VALUES ('B',4,6);
INSERT INTO type_crystal_abilities VALUES ('B',5,18);
INSERT INTO type_crystal_abilities VALUES ('B',6,17);
INSERT INTO type_crystal_abilities VALUES ('B',7,21);
INSERT INTO type_crystal_abilities VALUES ('C',1,26);
INSERT INTO type_crystal_abilities VALUES ('C',2,22);
INSERT INTO type_crystal_abilities VALUES ('C',3,5);
INSERT INTO type_crystal_abilities VALUES ('C',4,1);
INSERT INTO type_crystal_abilities VALUES ('C',5,16);
INSERT INTO type_crystal_abilities VALUES ('C',6,28);
INSERT INTO type_crystal_abilities VALUES ('C',7,20);
INSERT INTO type_crystal_abilities VALUES ('D',1,7);
INSERT INTO type_crystal_abilities VALUES ('D',2,22);
INSERT INTO type_crystal_abilities VALUES ('D',3,5);
INSERT INTO type_crystal_abilities VALUES ('D',4,6);
INSERT INTO type_crystal_abilities VALUES ('D',5,18);
INSERT INTO type_crystal_abilities VALUES ('D',6,28);
INSERT INTO type_crystal_abilities VALUES ('D',7,21);
INSERT INTO type_crystal_abilities VALUES ('E',1,15);
INSERT INTO type_crystal_abilities VALUES ('E',2,2);
INSERT INTO type_crystal_abilities VALUES ('E',3,19);
INSERT INTO type_crystal_abilities VALUES ('E',4,6);
INSERT INTO type_crystal_abilities VALUES ('E',5,16);
INSERT INTO type_crystal_abilities VALUES ('E',6,17);
INSERT INTO type_crystal_abilities VALUES ('E',7,20);
INSERT INTO type_crystal_abilities VALUES ('F',1,4);
INSERT INTO type_crystal_abilities VALUES ('F',2,2);
INSERT INTO type_crystal_abilities VALUES ('F',3,19);
INSERT INTO type_crystal_abilities VALUES ('F',4,1);
INSERT INTO type_crystal_abilities VALUES ('F',5,18);
INSERT INTO type_crystal_abilities VALUES ('F',6,17);
INSERT INTO type_crystal_abilities VALUES ('F',7,21);
INSERT INTO type_crystal_abilities VALUES ('G',1,27);
INSERT INTO type_crystal_abilities VALUES ('G',2,2);
INSERT INTO type_crystal_abilities VALUES ('G',3,13);
INSERT INTO type_crystal_abilities VALUES ('G',4,6);
INSERT INTO type_crystal_abilities VALUES ('G',5,16);
INSERT INTO type_crystal_abilities VALUES ('G',6,28);
INSERT INTO type_crystal_abilities VALUES ('G',7,20);
INSERT INTO type_crystal_abilities VALUES ('H',1,9);
INSERT INTO type_crystal_abilities VALUES ('H',2,2);
INSERT INTO type_crystal_abilities VALUES ('H',3,13);
INSERT INTO type_crystal_abilities VALUES ('H',4,1);
INSERT INTO type_crystal_abilities VALUES ('H',5,18);
INSERT INTO type_crystal_abilities VALUES ('H',6,28);
INSERT INTO type_crystal_abilities VALUES ('H',7,21);
INSERT INTO type_crystal_abilities VALUES ('I',1,15);
INSERT INTO type_crystal_abilities VALUES ('I',2,2);
INSERT INTO type_crystal_abilities VALUES ('I',3,13);
INSERT INTO type_crystal_abilities VALUES ('I',4,6);
INSERT INTO type_crystal_abilities VALUES ('I',5,16);
INSERT INTO type_crystal_abilities VALUES ('I',6,17);
INSERT INTO type_crystal_abilities VALUES ('I',7,20);
INSERT INTO type_crystal_abilities VALUES ('J',1,4);
INSERT INTO type_crystal_abilities VALUES ('J',2,22);
INSERT INTO type_crystal_abilities VALUES ('J',3,5);
INSERT INTO type_crystal_abilities VALUES ('J',4,1);
INSERT INTO type_crystal_abilities VALUES ('J',5,18);
INSERT INTO type_crystal_abilities VALUES ('J',6,17);
INSERT INTO type_crystal_abilities VALUES ('J',7,12);
INSERT INTO type_crystal_abilities VALUES ('K',1,27);
INSERT INTO type_crystal_abilities VALUES ('K',2,2);
INSERT INTO type_crystal_abilities VALUES ('K',3,13);
INSERT INTO type_crystal_abilities VALUES ('K',4,6);
INSERT INTO type_crystal_abilities VALUES ('K',5,16);
INSERT INTO type_crystal_abilities VALUES ('K',6,28);
INSERT INTO type_crystal_abilities VALUES ('K',7,21);
INSERT INTO type_crystal_abilities VALUES ('L',1,9);
INSERT INTO type_crystal_abilities VALUES ('L',2,22);
INSERT INTO type_crystal_abilities VALUES ('L',3,5);
INSERT INTO type_crystal_abilities VALUES ('L',4,1);
INSERT INTO type_crystal_abilities VALUES ('L',5,18);
INSERT INTO type_crystal_abilities VALUES ('L',6,28);
INSERT INTO type_crystal_abilities VALUES ('L',7,12);
INSERT INTO type_crystal_abilities VALUES ('M',1,14);
INSERT INTO type_crystal_abilities VALUES ('M',2,24);
INSERT INTO type_crystal_abilities VALUES ('M',3,13);
INSERT INTO type_crystal_abilities VALUES ('M',4,23);
INSERT INTO type_crystal_abilities VALUES ('M',5,8);
INSERT INTO type_crystal_abilities VALUES ('M',6,17);
INSERT INTO type_crystal_abilities VALUES ('M',7,11);
INSERT INTO type_crystal_abilities VALUES ('N',1,3);
INSERT INTO type_crystal_abilities VALUES ('N',2,24);
INSERT INTO type_crystal_abilities VALUES ('N',3,25);
INSERT INTO type_crystal_abilities VALUES ('N',4,1);
INSERT INTO type_crystal_abilities VALUES ('N',5,8);
INSERT INTO type_crystal_abilities VALUES ('N',6,17);
INSERT INTO type_crystal_abilities VALUES ('N',7,21);
INSERT INTO type_crystal_abilities VALUES ('O',1,26);
INSERT INTO type_crystal_abilities VALUES ('O',2,24);
INSERT INTO type_crystal_abilities VALUES ('O',3,5);
INSERT INTO type_crystal_abilities VALUES ('O',4,23);
INSERT INTO type_crystal_abilities VALUES ('O',5,10);
INSERT INTO type_crystal_abilities VALUES ('O',6,28);
INSERT INTO type_crystal_abilities VALUES ('O',7,11);
INSERT INTO type_crystal_abilities VALUES ('P',1,7);
INSERT INTO type_crystal_abilities VALUES ('P',2,24);
INSERT INTO type_crystal_abilities VALUES ('P',3,25);
INSERT INTO type_crystal_abilities VALUES ('P',4,6);
INSERT INTO type_crystal_abilities VALUES ('P',5,10);
INSERT INTO type_crystal_abilities VALUES ('P',6,28);
INSERT INTO type_crystal_abilities VALUES ('P',7,21);

INSERT INTO commands VALUES (1,'Aerial Slam');
INSERT INTO commands VALUES (2,'Aero');
INSERT INTO commands VALUES (3,'Aeroga');
INSERT INTO commands VALUES (4,'Aerora');
INSERT INTO commands VALUES (5,'Air Slide');
INSERT INTO commands VALUES (6,'Ars Arcanum');
INSERT INTO commands VALUES (7,'Ars Solum');
INSERT INTO commands VALUES (8,'Barrier');
INSERT INTO commands VALUES (9,'Barrier Surge');
INSERT INTO commands VALUES (10,'Bind');
INSERT INTO commands VALUES (11,'Binding Strike');
INSERT INTO commands VALUES (12,'Bio Barrage');
INSERT INTO commands VALUES (13,'Blackout');
INSERT INTO commands VALUES (14,'Blitz');
INSERT INTO commands VALUES (15,'Blizzaga');
INSERT INTO commands VALUES (16,'Blizzara');
INSERT INTO commands VALUES (17,'Blizzard');
INSERT INTO commands VALUES (18,'Blizzard Edge');
INSERT INTO commands VALUES (19,'Block');
INSERT INTO commands VALUES (20,'Break Time');
INSERT INTO commands VALUES (21,'Brutal Blast');
INSERT INTO commands VALUES (22,'Cartwheel');
INSERT INTO commands VALUES (23,'Chaos Blade');
INSERT INTO commands VALUES (24,'Collision Magnet');
INSERT INTO commands VALUES (25,'Confuse');
INSERT INTO commands VALUES (26,'Confuse Barrier');
INSERT INTO commands VALUES (27,'Confusing Strike');
INSERT INTO commands VALUES (28,'Confusion Strike');
INSERT INTO commands VALUES (29,'Counter Hammer');
INSERT INTO commands VALUES (30,'Crawling Fire');
INSERT INTO commands VALUES (31,'Cura');
INSERT INTO commands VALUES (32,'Curaga');
INSERT INTO commands VALUES (33,'Cure');
INSERT INTO commands VALUES (34,'D-Link Magnet');
INSERT INTO commands VALUES (35,'Dark Firaga');
INSERT INTO commands VALUES (36,'Dark Haze');
INSERT INTO commands VALUES (37,'Deep Freeze');
INSERT INTO commands VALUES (38,'Dodge Roll');
INSERT INTO commands VALUES (39,'Energy Magnet');
INSERT INTO commands VALUES (40,'Esuna');
INSERT INTO commands VALUES (41,'Faith');
INSERT INTO commands VALUES (42,'Fira');
INSERT INTO commands VALUES (43,'Firaga');
INSERT INTO commands VALUES (44,'Firaga Burst');
INSERT INTO commands VALUES (45,'Fire');
INSERT INTO commands VALUES (46,'Fire Dash');
INSERT INTO commands VALUES (47,'Fire Glide');
INSERT INTO commands VALUES (48,'Fire Strike');
INSERT INTO commands VALUES (49,'Fire Surge');
INSERT INTO commands VALUES (50,'Firewheel');
INSERT INTO commands VALUES (51,'Fission Firaga');
INSERT INTO commands VALUES (52,'Focus Barrier');
INSERT INTO commands VALUES (53,'Focus Block');
INSERT INTO commands VALUES (54,'Freeze Raid');
INSERT INTO commands VALUES (55,'Geo Impact');
INSERT INTO commands VALUES (56,'Glacier');
INSERT INTO commands VALUES (57,'Glide');
INSERT INTO commands VALUES (58,'High Jump');
INSERT INTO commands VALUES (59,'Homing Slide');
INSERT INTO commands VALUES (60,'Ice Barrage');
INSERT INTO commands VALUES (61,'Ice Slide');
INSERT INTO commands VALUES (62,'Ignite');
INSERT INTO commands VALUES (63,'Lightning Ray');
INSERT INTO commands VALUES (64,'Limit Storm');
INSERT INTO commands VALUES (65,'Magic Hour');
INSERT INTO commands VALUES (66,'Magnega');
INSERT INTO commands VALUES (67,'Magnera');
INSERT INTO commands VALUES (68,'Magnet');
INSERT INTO commands VALUES (69,'Magnet Spiral');
INSERT INTO commands VALUES (70,'Mega Flare');
INSERT INTO commands VALUES (71,'Meteor');
INSERT INTO commands VALUES (72,'Meteor Crash');
INSERT INTO commands VALUES (73,'Meteor Shower');
INSERT INTO commands VALUES (74,'Mine Shield');
INSERT INTO commands VALUES (75,'Mine Square');
INSERT INTO commands VALUES (76,'Mini');
INSERT INTO commands VALUES (77,'Munny Magnet');
INSERT INTO commands VALUES (78,'Payback Fang');
INSERT INTO commands VALUES (79,'Payback Raid');
INSERT INTO commands VALUES (80,'Payback Surge');
INSERT INTO commands VALUES (81,'Poison');
INSERT INTO commands VALUES (82,'Poison Block');
INSERT INTO commands VALUES (83,'Poison Edge');
INSERT INTO commands VALUES (84,'Quake');
INSERT INTO commands VALUES (85,'Quick Blitz');
INSERT INTO commands VALUES (86,'Raging Storm');
INSERT INTO commands VALUES (87,'Renewal Barrier');
INSERT INTO commands VALUES (88,'Renewal Block');
INSERT INTO commands VALUES (89,'Sacrifice');
INSERT INTO commands VALUES (90,'Salvation');
INSERT INTO commands VALUES (91,'Seeker Mine');
INSERT INTO commands VALUES (92,'Sliding Dash');
INSERT INTO commands VALUES (93,'Slot Edge');
INSERT INTO commands VALUES (94,'Slow');
INSERT INTO commands VALUES (95,'Sonic Blade');
INSERT INTO commands VALUES (96,'Spark Raid');
INSERT INTO commands VALUES (97,'Stop');
INSERT INTO commands VALUES (98,'Stop Barrier');
INSERT INTO commands VALUES (99,'Stopga');
INSERT INTO commands VALUES (100,'Stopra');
INSERT INTO commands VALUES (101,'Strike Raid');
INSERT INTO commands VALUES (102,'Stun Block');
INSERT INTO commands VALUES (103,'Stun Edge');
INSERT INTO commands VALUES (104,'Thundaga');
INSERT INTO commands VALUES (105,'Thundaga Shot');
INSERT INTO commands VALUES (106,'Thundara');
INSERT INTO commands VALUES (107,'Thunder');
INSERT INTO commands VALUES (108,'Thunder Roll');
INSERT INTO commands VALUES (109,'Thunder Surge');
INSERT INTO commands VALUES (110,'Time Splicer');
INSERT INTO commands VALUES (111,'Tornado');
INSERT INTO commands VALUES (112,'Tornado Strike');
INSERT INTO commands VALUES (113,'Transcendence');
INSERT INTO commands VALUES (114,'Treasure Raid');
INSERT INTO commands VALUES (115,'Triple Blizzaga');
INSERT INTO commands VALUES (116,'Triple Firaga');
INSERT INTO commands VALUES (117,'Warp');
INSERT INTO commands VALUES (118,'Wind Raid');
INSERT INTO commands VALUES (119,'Windcutter');
INSERT INTO commands VALUES (120,'Wishing Edge');
INSERT INTO commands VALUES (121,'Zantetsuken');
INSERT INTO commands VALUES (122,'Zero Graviga');
INSERT INTO commands VALUES (123,'Zero Gravira');
INSERT INTO commands VALUES (124,'Zero Gravity');

INSERT INTO recipes VALUES (1,'Type A',46,3,13,3,36,100,0,0);
INSERT INTO recipes VALUES (2,'Type A',46,3,58,3,1,100,100,100);
INSERT INTO recipes VALUES (3,'Type A',120,2,62,2,48,0,0,100);
INSERT INTO recipes VALUES (4,'Type A',48,3,42,3,49,100,100,100);
INSERT INTO recipes VALUES (5,'Type A',45,2,45,2,42,100,100,100);
INSERT INTO recipes VALUES (6,'Type A',45,3,42,3,43,100,100,90);
INSERT INTO recipes VALUES (7,'Type A',45,3,42,3,86,0,0,10);
INSERT INTO recipes VALUES (8,'Type A',45,3,10,3,62,100,100,100);
INSERT INTO recipes VALUES (9,'Type A',42,3,43,3,116,0,0,90);
INSERT INTO recipes VALUES (10,'Type A',42,3,43,3,86,0,0,10);
INSERT INTO recipes VALUES (11,'Type A',42,3,124,3,74,100,100,100);
INSERT INTO recipes VALUES (12,'Type A',42,3,3,3,51,100,100,80);
INSERT INTO recipes VALUES (13,'Type A',42,3,3,3,44,0,0,20);
INSERT INTO recipes VALUES (14,'Type A',42,3,97,3,75,100,100,100);
INSERT INTO recipes VALUES (15,'Type A',43,3,104,3,105,0,0,85);
INSERT INTO recipes VALUES (16,'Type A',43,3,4,3,51,100,100,80);
INSERT INTO recipes VALUES (17,'Type A',43,3,4,3,44,0,0,20);
INSERT INTO recipes VALUES (18,'Type A',43,3,94,3,30,100,100,80);
INSERT INTO recipes VALUES (19,'Type A',43,3,94,3,44,0,0,20);
INSERT INTO recipes VALUES (20,'Type B',92,2,17,2,18,100,95,100);
INSERT INTO recipes VALUES (21,'Type B',92,2,17,2,6,0,5,0);
INSERT INTO recipes VALUES (22,'Type B',54,3,104,3,105,0,0,85);
INSERT INTO recipes VALUES (23,'Type B',17,2,17,2,16,100,100,100);
INSERT INTO recipes VALUES (24,'Type B',17,3,16,3,15,100,100,100);
INSERT INTO recipes VALUES (25,'Type B',16,3,15,3,115,0,0,100);
INSERT INTO recipes VALUES (26,'Type B',15,4,37,5,56,0,0,100);
INSERT INTO recipes VALUES (27,'Type B',2,2,2,2,4,100,95,100);
INSERT INTO recipes VALUES (28,'Type B',2,2,2,2,111,0,5,0);
INSERT INTO recipes VALUES (29,'Type C',101,3,16,3,54,100,100,100);
INSERT INTO recipes VALUES (30,'Type C',101,3,104,3,105,0,0,85);
INSERT INTO recipes VALUES (31,'Type C',103,3,106,3,109,100,100,100);
INSERT INTO recipes VALUES (32,'Type C',103,2,124,2,11,100,100,100);
INSERT INTO recipes VALUES (33,'Type C',28,3,106,3,109,95,100,100);
INSERT INTO recipes VALUES (34,'Type C',28,3,106,3,7,5,0,0);
INSERT INTO recipes VALUES (35,'Type C',107,2,107,2,106,100,100,100);
INSERT INTO recipes VALUES (36,'Type C',107,3,106,3,104,90,90,90);
INSERT INTO recipes VALUES (37,'Type C',107,2,33,2,31,100,100,100);
INSERT INTO recipes VALUES (38,'Type C',107,2,124,2,123,90,100,100);
INSERT INTO recipes VALUES (39,'Type C',107,2,124,2,117,10,0,0);
INSERT INTO recipes VALUES (40,'Type C',107,2,68,2,67,100,100,100);
INSERT INTO recipes VALUES (41,'Type C',107,2,2,2,4,100,95,100);
INSERT INTO recipes VALUES (42,'Type C',107,2,2,2,111,0,5,0);
INSERT INTO recipes VALUES (43,'Type C',106,3,123,3,122,80,100,100);
INSERT INTO recipes VALUES (44,'Type C',106,3,123,3,117,20,0,0);
INSERT INTO recipes VALUES (45,'Type C',106,3,67,3,77,0,0,100);
INSERT INTO recipes VALUES (46,'Type C',104,4,19,1,102,100,100,0);
INSERT INTO recipes VALUES (47,'Type C',123,3,68,3,24,80,80,80);
INSERT INTO recipes VALUES (48,'Type C',123,3,68,3,69,20,20,20);
INSERT INTO recipes VALUES (49,'Type C',68,3,67,3,66,100,100,100);
INSERT INTO recipes VALUES (50,'Type C',67,3,100,3,34,0,0,100);
INSERT INTO recipes VALUES (51,'Type C',66,4,10,3,76,100,100,100);
INSERT INTO recipes VALUES (52,'Type C',97,2,97,2,100,100,100,100);
INSERT INTO recipes VALUES (53,'Type C',97,3,100,3,99,100,100,100);
INSERT INTO recipes VALUES (54,'Type D',33,2,33,2,31,100,100,100);
INSERT INTO recipes VALUES (55,'Type D',33,3,31,3,32,100,100,100);
INSERT INTO recipes VALUES (56,'Type D',33,3,67,3,39,0,0,100);
INSERT INTO recipes VALUES (57,'Type D',124,2,124,2,123,90,100,100);
INSERT INTO recipes VALUES (58,'Type D',124,2,124,2,117,10,0,0);
INSERT INTO recipes VALUES (59,'Type D',124,3,123,3,122,80,100,100);
INSERT INTO recipes VALUES (60,'Type D',124,3,123,3,117,20,0,0);
INSERT INTO recipes VALUES (61,'Type D',124,3,25,3,13,100,100,100);
INSERT INTO recipes VALUES (62,'Type D',68,2,68,2,67,100,100,100);
INSERT INTO recipes VALUES (63,'Type D',2,3,4,3,3,100,90,100);
INSERT INTO recipes VALUES (64,'Type D',2,3,4,3,111,0,10,0);
INSERT INTO recipes VALUES (65,'Type D',100,3,19,1,74,100,100,0);
INSERT INTO recipes VALUES (66,'Type D',100,3,8,1,75,0,0,100);
INSERT INTO recipes VALUES (67,'Type E',14,4,36,4,95,90,0,0);
INSERT INTO recipes VALUES (68,'Type E',14,3,43,3,116,0,0,90);
INSERT INTO recipes VALUES (69,'Type E',14,3,43,3,86,0,0,10);
INSERT INTO recipes VALUES (70,'Type E',92,2,45,2,46,100,100,100);
INSERT INTO recipes VALUES (71,'Type E',46,2,45,2,42,100,100,100);
INSERT INTO recipes VALUES (72,'Type E',46,3,42,3,43,100,100,90);
INSERT INTO recipes VALUES (73,'Type E',46,3,42,3,86,0,0,10);
INSERT INTO recipes VALUES (74,'Type E',46,3,106,3,109,100,100,100);
INSERT INTO recipes VALUES (75,'Type E',46,3,123,3,36,100,0,0);
INSERT INTO recipes VALUES (76,'Type E',46,3,62,3,49,100,100,100);
INSERT INTO recipes VALUES (77,'Type E',46,3,8,3,9,0,0,100);
INSERT INTO recipes VALUES (78,'Type E',36,4,43,4,35,100,0,0);
INSERT INTO recipes VALUES (79,'Type E',101,2,81,2,83,95,95,95);
INSERT INTO recipes VALUES (80,'Type E',49,3,2,3,1,100,100,100);
INSERT INTO recipes VALUES (81,'Type E',83,2,42,2,48,100,100,100);
INSERT INTO recipes VALUES (82,'Type E',83,3,117,5,89,100,0,0);
INSERT INTO recipes VALUES (83,'Type E',93,3,68,3,114,0,100,0);
INSERT INTO recipes VALUES (84,'Type E',48,3,21,4,72,100,0,0);
INSERT INTO recipes VALUES (85,'Type E',48,2,45,2,42,100,100,100);
INSERT INTO recipes VALUES (86,'Type E',28,2,45,2,46,100,100,100);
INSERT INTO recipes VALUES (87,'Type E',11,3,21,4,64,100,0,0);
INSERT INTO recipes VALUES (88,'Type E',43,3,100,3,30,100,100,80);
INSERT INTO recipes VALUES (89,'Type E',43,3,100,3,44,0,0,20);
INSERT INTO recipes VALUES (90,'Type E',75,4,66,4,91,0,0,100);
INSERT INTO recipes VALUES (91,'Type E',4,3,4,3,75,100,100,100);
INSERT INTO recipes VALUES (92,'Type E',62,3,97,3,74,100,100,100);
INSERT INTO recipes VALUES (93,'Type F',85,2,17,2,18,100,95,100);
INSERT INTO recipes VALUES (94,'Type F',85,2,17,2,6,0,5,0);
INSERT INTO recipes VALUES (95,'Type F',85,2,2,2,4,100,95,100);
INSERT INTO recipes VALUES (96,'Type F',85,2,2,2,111,0,5,0);
INSERT INTO recipes VALUES (97,'Type F',14,3,15,3,115,0,0,100);
INSERT INTO recipes VALUES (98,'Type F',14,4,84,5,72,100,0,0);
INSERT INTO recipes VALUES (99,'Type F',92,2,16,2,18,100,95,100);
INSERT INTO recipes VALUES (100,'Type F',92,2,16,2,6,0,5,0);
INSERT INTO recipes VALUES (101,'Type F',101,2,17,2,16,100,100,100);
INSERT INTO recipes VALUES (102,'Type F',101,2,25,2,28,100,100,100);
INSERT INTO recipes VALUES (103,'Type F',54,4,15,4,37,100,100,100);
INSERT INTO recipes VALUES (104,'Type F',54,3,106,3,109,100,100,100);
INSERT INTO recipes VALUES (105,'Type F',18,2,17,2,16,100,100,100);
INSERT INTO recipes VALUES (106,'Type F',18,3,16,3,15,100,100,100);
INSERT INTO recipes VALUES (107,'Type F',18,2,31,2,93,100,95,100);
INSERT INTO recipes VALUES (108,'Type F',18,2,31,2,6,0,5,0);
INSERT INTO recipes VALUES (109,'Type F',28,3,21,4,72,100,0,0);
INSERT INTO recipes VALUES (110,'Type F',28,3,3,4,119,100,0,0);
INSERT INTO recipes VALUES (111,'Type F',28,3,3,4,112,0,100,0);
INSERT INTO recipes VALUES (112,'Type G',85,3,67,3,24,80,80,80);
INSERT INTO recipes VALUES (113,'Type G',85,3,67,3,69,20,20,20);
INSERT INTO recipes VALUES (114,'Type G',85,2,10,2,11,100,100,100);
INSERT INTO recipes VALUES (115,'Type G',92,2,107,2,103,95,100,100);
INSERT INTO recipes VALUES (116,'Type G',92,2,107,2,7,5,0,0);
INSERT INTO recipes VALUES (117,'Type G',92,2,124,2,28,100,100,100);
INSERT INTO recipes VALUES (118,'Type G',92,2,81,2,83,95,95,95);
INSERT INTO recipes VALUES (119,'Type G',46,4,109,4,95,90,90,90);
INSERT INTO recipes VALUES (120,'Type G',101,3,106,3,103,95,100,100);
INSERT INTO recipes VALUES (121,'Type G',101,3,106,3,7,5,0,0);
INSERT INTO recipes VALUES (122,'Type G',9,2,103,2,120,0,0,100);
INSERT INTO recipes VALUES (123,'Type G',120,3,67,3,77,0,0,100);
INSERT INTO recipes VALUES (124,'Type G',18,3,11,3,54,100,100,100);
INSERT INTO recipes VALUES (125,'Type G',103,3,93,3,14,100,90,90);
INSERT INTO recipes VALUES (126,'Type G',103,3,93,3,110,0,10,10);
INSERT INTO recipes VALUES (127,'Type G',103,2,45,2,48,100,100,100);
INSERT INTO recipes VALUES (128,'Type G',103,2,107,2,106,100,100,100);
INSERT INTO recipes VALUES (129,'Type G',103,2,68,2,67,100,100,100);
INSERT INTO recipes VALUES (130,'Type G',103,3,8,3,9,0,0,100);
INSERT INTO recipes VALUES (131,'Type G',93,3,67,3,114,0,100,0);
INSERT INTO recipes VALUES (132,'Type G',11,3,24,4,69,100,100,100);
INSERT INTO recipes VALUES (133,'Type G',11,3,42,3,49,100,100,100);
INSERT INTO recipes VALUES (134,'Type G',11,3,106,3,104,90,90,90);
INSERT INTO recipes VALUES (135,'Type G',94,2,97,2,100,100,100,100);
INSERT INTO recipes VALUES (136,'Type H',85,2,92,2,101,100,100,100);
INSERT INTO recipes VALUES (137,'Type H',85,3,93,3,14,100,90,100);
INSERT INTO recipes VALUES (138,'Type H',85,3,93,3,6,0,10,0);
INSERT INTO recipes VALUES (139,'Type H',85,3,4,3,3,100,90,100);
INSERT INTO recipes VALUES (140,'Type H',85,3,4,3,111,0,10,0);
INSERT INTO recipes VALUES (141,'Type H',85,2,25,2,27,100,100,100);
INSERT INTO recipes VALUES (142,'Type H',85,2,81,2,83,95,95,95);
INSERT INTO recipes VALUES (143,'Type H',14,4,122,4,65,0,0,90);
INSERT INTO recipes VALUES (144,'Type H',101,2,9,2,120,0,0,100);
INSERT INTO recipes VALUES (145,'Type H',101,3,93,3,114,0,100,0);
INSERT INTO recipes VALUES (146,'Type H',101,2,10,2,11,100,100,100);
INSERT INTO recipes VALUES (147,'Type H',120,2,33,2,93,0,0,100);
INSERT INTO recipes VALUES (148,'Type H',103,3,74,3,21,70,0,0);
INSERT INTO recipes VALUES (149,'Type H',103,3,74,3,84,30,0,0);
INSERT INTO recipes VALUES (150,'Type H',28,3,42,3,49,100,100,100);
INSERT INTO recipes VALUES (151,'Type H',33,2,2,2,31,100,100,100);
INSERT INTO recipes VALUES (152,'Type I',92,2,49,2,80,0,0,100);
INSERT INTO recipes VALUES (153,'Type I',92,2,42,2,46,100,100,100);
INSERT INTO recipes VALUES (154,'Type I',92,3,5,3,59,0,100,100);
INSERT INTO recipes VALUES (155,'Type I',49,3,124,3,36,100,0,0);
INSERT INTO recipes VALUES (156,'Type I',49,3,22,4,86,0,0,10);
INSERT INTO recipes VALUES (157,'Type I',49,3,22,4,50,0,0,90);
INSERT INTO recipes VALUES (158,'Type I',49,3,57,0,47,0,100,0);
INSERT INTO recipes VALUES (159,'Type I',48,3,4,3,1,100,90,100);
INSERT INTO recipes VALUES (160,'Type I',48,3,4,3,6,0,10,0);
INSERT INTO recipes VALUES (161,'Type I',28,3,8,1,26,0,0,100);
INSERT INTO recipes VALUES (162,'Type I',21,4,66,4,84,90,0,0);
INSERT INTO recipes VALUES (163,'Type I',21,4,66,4,71,10,0,0);
INSERT INTO recipes VALUES (164,'Type I',45,2,62,2,42,100,100,100);
INSERT INTO recipes VALUES (165,'Type I',42,3,10,3,62,100,100,100);
INSERT INTO recipes VALUES (166,'Type I',42,3,19,1,74,100,100,0);
INSERT INTO recipes VALUES (167,'Type I',42,3,8,1,75,0,0,100);
INSERT INTO recipes VALUES (168,'Type I',40,0,19,1,88,100,100,0);
INSERT INTO recipes VALUES (169,'Type I',74,4,66,4,91,0,0,100);
INSERT INTO recipes VALUES (170,'Type I',99,3,8,1,110,0,0,20);
INSERT INTO recipes VALUES (171,'Type I',99,3,8,1,98,0,0,80);
INSERT INTO recipes VALUES (172,'Type J',85,2,16,2,18,100,95,100);
INSERT INTO recipes VALUES (173,'Type J',85,2,16,2,6,0,5,0);
INSERT INTO recipes VALUES (174,'Type J',83,3,19,1,82,80,80,0);
INSERT INTO recipes VALUES (175,'Type J',11,3,15,4,37,100,100,100);
INSERT INTO recipes VALUES (176,'Type J',17,2,2,2,16,100,100,100);
INSERT INTO recipes VALUES (177,'Type J',15,4,75,4,60,0,0,100);
INSERT INTO recipes VALUES (178,'Type J',15,4,5,4,61,100,100,100);
INSERT INTO recipes VALUES (179,'Type K',92,2,109,2,80,0,0,100);
INSERT INTO recipes VALUES (180,'Type K',101,2,107,2,103,95,100,100);
INSERT INTO recipes VALUES (181,'Type K',101,2,107,2,7,5,0,0);
INSERT INTO recipes VALUES (182,'Type K',103,3,67,3,24,80,80,80);
INSERT INTO recipes VALUES (183,'Type K',103,3,67,3,24,20,20,20);
INSERT INTO recipes VALUES (184,'Type K',103,3,19,1,102,100,100,0);
INSERT INTO recipes VALUES (185,'Type K',11,3,75,3,21,70,0,0);
INSERT INTO recipes VALUES (186,'Type K',11,3,75,3,84,30,0,0);
INSERT INTO recipes VALUES (187,'Type K',104,4,38,4,96,0,20,0);
INSERT INTO recipes VALUES (188,'Type K',104,4,38,4,108,0,80,0);
INSERT INTO recipes VALUES (189,'Type K',124,2,68,2,106,100,100,100);
INSERT INTO recipes VALUES (190,'Type K',123,3,67,3,34,0,0,100);
INSERT INTO recipes VALUES (191,'Type K',68,3,5,3,59,0,100,100);
INSERT INTO recipes VALUES (192,'Type K',25,3,8,1,26,0,0,100);
INSERT INTO recipes VALUES (193,'Type K',94,3,94,3,100,100,100,100);
INSERT INTO recipes VALUES (194,'Type K',102,3,38,4,96,0,20,0);
INSERT INTO recipes VALUES (195,'Type K',102,3,38,4,108,0,80,0);
INSERT INTO recipes VALUES (196,'Type L',92,2,101,2,79,0,100,0);
INSERT INTO recipes VALUES (197,'Type L',92,3,67,3,59,0,100,100);
INSERT INTO recipes VALUES (198,'Type L',92,2,29,2,78,100,0,0);
INSERT INTO recipes VALUES (199,'Type L',9,3,120,3,14,0,0,90);
INSERT INTO recipes VALUES (200,'Type L',9,3,120,3,110,0,0,10);
INSERT INTO recipes VALUES (201,'Type L',109,4,38,4,96,0,80,0);
INSERT INTO recipes VALUES (202,'Type L',109,4,38,4,108,0,20,0);
INSERT INTO recipes VALUES (203,'Type L',83,2,31,2,93,100,95,100);
INSERT INTO recipes VALUES (204,'Type L',83,2,31,2,6,0,5,0);
INSERT INTO recipes VALUES (205,'Type L',32,4,19,1,88,100,100,0);
INSERT INTO recipes VALUES (206,'Type L',32,2,53,2,93,90,90,0);
INSERT INTO recipes VALUES (207,'Type L',32,2,53,2,20,10,10,0);
INSERT INTO recipes VALUES (208,'Type L',32,4,8,1,87,0,0,100);
INSERT INTO recipes VALUES (209,'Type L',32,2,52,2,93,0,0,90);
INSERT INTO recipes VALUES (210,'Type L',32,2,52,2,20,0,0,10);
INSERT INTO recipes VALUES (211,'Type L',123,3,81,3,13,100,100,100);
INSERT INTO recipes VALUES (212,'Type L',68,2,2,2,123,90,100,100);
INSERT INTO recipes VALUES (213,'Type L',68,2,2,2,117,10,0,0);
INSERT INTO recipes VALUES (214,'Type L',81,3,19,1,82,80,80,0);
INSERT INTO recipes VALUES (215,'Type M',36,4,95,5,23,80,0,0);
INSERT INTO recipes VALUES (216,'Type M',36,4,95,5,23,20,0,0);
INSERT INTO recipes VALUES (217,'Type M',36,4,117,5,89,100,0,0);
INSERT INTO recipes VALUES (218,'Type M',36,4,99,4,121,80,0,0);
INSERT INTO recipes VALUES (219,'Type M',36,4,99,4,7,20,0,0);
INSERT INTO recipes VALUES (220,'Type M',54,4,3,4,118,0,100,0);
INSERT INTO recipes VALUES (221,'Type M',21,4,122,4,84,90,0,0);
INSERT INTO recipes VALUES (222,'Type M',21,4,122,4,71,10,0,0);
INSERT INTO recipes VALUES (223,'Type M',55,5,84,5,71,100,0,0);
INSERT INTO recipes VALUES (224,'Type M',42,3,42,3,43,100,100,90);
INSERT INTO recipes VALUES (225,'Type M',42,3,42,3,86,0,0,10);
INSERT INTO recipes VALUES (226,'Type M',43,3,43,3,116,0,0,90);
INSERT INTO recipes VALUES (227,'Type M',43,3,43,3,86,0,0,10);
INSERT INTO recipes VALUES (228,'Type M',43,3,3,3,51,100,100,80);
INSERT INTO recipes VALUES (229,'Type M',43,3,3,3,44,0,0,20);
INSERT INTO recipes VALUES (230,'Type M',43,4,13,3,35,100,0,0);
INSERT INTO recipes VALUES (231,'Type M',43,3,99,3,30,100,100,80);
INSERT INTO recipes VALUES (232,'Type M',43,3,99,3,44,0,0,20);
INSERT INTO recipes VALUES (233,'Type M',43,4,22,4,50,0,0,100);
INSERT INTO recipes VALUES (234,'Type M',43,4,57,0,47,0,100,0);
INSERT INTO recipes VALUES (235,'Type M',51,4,30,4,70,100,100,100);
INSERT INTO recipes VALUES (236,'Type M',51,4,44,5,86,0,0,100);
INSERT INTO recipes VALUES (237,'Type M',51,4,22,4,50,0,0,100);
INSERT INTO recipes VALUES (238,'Type M',74,4,75,4,91,0,0,100);
INSERT INTO recipes VALUES (239,'Type N',14,4,1,4,6,0,100,0);
INSERT INTO recipes VALUES (240,'Type N',95,5,99,4,121,80,0,0);
INSERT INTO recipes VALUES (241,'Type N',95,5,99,4,7,20,0,0);
INSERT INTO recipes VALUES (242,'Type N',114,4,3,4,118,0,100,0);
INSERT INTO recipes VALUES (243,'Type N',1,4,99,4,110,0,100,100);
INSERT INTO recipes VALUES (244,'Type N',18,3,5,4,61,100,100,100);
INSERT INTO recipes VALUES (245,'Type N',11,3,3,4,119,100,0,0);
INSERT INTO recipes VALUES (246,'Type N',11,3,3,4,112,0,100,0);
INSERT INTO recipes VALUES (247,'Type N',16,3,16,3,15,100,100,100);
INSERT INTO recipes VALUES (248,'Type N',15,3,15,3,115,0,0,100);
INSERT INTO recipes VALUES (249,'Type N',15,4,115,4,37,0,0,100);
INSERT INTO recipes VALUES (250,'Type N',15,4,74,4,60,0,0,100);
INSERT INTO recipes VALUES (251,'Type N',115,4,37,5,56,0,0,100);
INSERT INTO recipes VALUES (252,'Type O',54,4,66,4,96,0,100,0);
INSERT INTO recipes VALUES (253,'Type O',103,2,11,2,120,0,0,100);
INSERT INTO recipes VALUES (254,'Type O',11,3,66,4,69,100,100,100);
INSERT INTO recipes VALUES (255,'Type O',69,5,122,4,113,100,100,100);
INSERT INTO recipes VALUES (256,'Type O',106,3,106,3,104,90,90,90);
INSERT INTO recipes VALUES (257,'Type O',67,3,67,3,66,100,100,100);
INSERT INTO recipes VALUES (258,'Type O',66,4,66,4,76,100,100,100);
INSERT INTO recipes VALUES (259,'Type O',100,3,100,3,99,100,100,100);
INSERT INTO recipes VALUES (260,'Type P',14,4,5,4,95,90,90,90);
INSERT INTO recipes VALUES (261,'Type P',114,4,66,4,96,0,100,0);
INSERT INTO recipes VALUES (262,'Type P',118,5,20,4,41,0,100,0);
INSERT INTO recipes VALUES (263,'Type P',118,5,32,4,90,0,100,0);
INSERT INTO recipes VALUES (264,'Type P',9,3,3,4,65,0,0,90);
INSERT INTO recipes VALUES (265,'Type P',21,4,21,4,55,70,0,0);
INSERT INTO recipes VALUES (266,'Type P',21,4,21,4,84,30,0,0);
INSERT INTO recipes VALUES (267,'Type P',31,3,31,3,32,100,100,100);
INSERT INTO recipes VALUES (268,'Type P',31,3,67,3,39,0,0,100);
INSERT INTO recipes VALUES (269,'Type P',32,2,88,2,93,90,90,0);
INSERT INTO recipes VALUES (270,'Type P',32,2,88,2,20,10,10,0);
INSERT INTO recipes VALUES (271,'Type P',32,2,87,2,93,0,0,90);
INSERT INTO recipes VALUES (272,'Type P',32,2,87,2,20,0,0,10);
INSERT INTO recipes VALUES (273,'Type P',40,0,8,1,87,0,0,100);
INSERT INTO recipes VALUES (274,'Type P',123,3,123,3,122,80,100,100);
INSERT INTO recipes VALUES (275,'Type P',123,3,123,3,117,20,0,0);
INSERT INTO recipes VALUES (276,'Type P',123,3,25,3,13,100,100,100);
INSERT INTO recipes VALUES (277,'Type P',67,3,117,4,76,100,0,0);
INSERT INTO recipes VALUES (278,'Type P',66,4,3,4,111,0,100,0);
INSERT INTO recipes VALUES (279,'Type P',4,3,4,3,3,100,90,100);
INSERT INTO recipes VALUES (280,'Type P',4,3,4,3,111,0,10,0);
INSERT INTO recipes VALUES (281,'Shotlocks',85,2,81,2,12,5,5,5);
INSERT INTO recipes VALUES (282,'Shotlocks',14,4,36,4,63,10,0,0);
INSERT INTO recipes VALUES (283,'Shotlocks',14,4,122,4,73,0,0,10);
INSERT INTO recipes VALUES (284,'Shotlocks',14,4,5,4,63,10,10,10);
INSERT INTO recipes VALUES (285,'Shotlocks',92,2,81,2,12,5,5,5);
INSERT INTO recipes VALUES (286,'Shotlocks',46,4,109,4,63,10,10,10);
INSERT INTO recipes VALUES (287,'Shotlocks',101,3,104,3,73,0,0,15);
INSERT INTO recipes VALUES (288,'Shotlocks',101,2,81,2,12,5,5,5);
INSERT INTO recipes VALUES (289,'Shotlocks',54,3,104,3,73,0,0,15);
INSERT INTO recipes VALUES (290,'Shotlocks',9,3,3,4,63,0,0,10);
INSERT INTO recipes VALUES (291,'Shotlocks',83,3,19,1,12,20,20,0);
INSERT INTO recipes VALUES (292,'Shotlocks',11,3,106,3,63,10,10,10);
INSERT INTO recipes VALUES (293,'Shotlocks',43,3,104,3,73,0,0,15);
INSERT INTO recipes VALUES (294,'Shotlocks',107,3,106,3,63,10,10,10);
INSERT INTO recipes VALUES (295,'Shotlocks',106,3,106,3,63,10,10,10);
INSERT INTO recipes VALUES (296,'Shotlocks',81,3,19,1,12,20,20,0);

CREATE VIEW IF NOT EXISTS v_recipes AS
SELECT r.id,r.recipe_type,
  c1.name AS ingredient1,r.ingredient1_lv,
  c2.name AS ingredient2,r.ingredient2_lv,
  c3.name AS result,
  r.terra,r.ventus,r.aqua
FROM recipes r
JOIN commands c1 ON r.ingredient1_id=c1.id
JOIN commands c2 ON r.ingredient2_id=c2.id
JOIN commands c3 ON r.result_id=c3.id;

CREATE VIEW IF NOT EXISTS v_type_abilities AS
SELECT tca.recipe_type,
  cr.name AS crystal,
  ab.name AS ability
FROM type_crystal_abilities tca
JOIN crystals cr ON tca.crystal_id=cr.id
JOIN abilities ab ON tca.ability_id=ab.id;

CREATE VIEW IF NOT EXISTS v_recipes_with_abilities AS
SELECT r.id AS recipe_id,r.recipe_type,
  c1.name AS ingredient1,r.ingredient1_lv,
  c2.name AS ingredient2,r.ingredient2_lv,
  c3.name AS result,
  r.terra,r.ventus,r.aqua,
  cr.name AS crystal,
  ab.name AS attached_ability
FROM recipes r
JOIN commands c1 ON r.ingredient1_id=c1.id
JOIN commands c2 ON r.ingredient2_id=c2.id
JOIN commands c3 ON r.result_id=c3.id
LEFT JOIN type_crystal_abilities tca ON tca.recipe_type=r.recipe_type
LEFT JOIN crystals cr ON tca.crystal_id=cr.id
LEFT JOIN abilities ab ON tca.ability_id=ab.id;

-- Example queries:
--   SELECT * FROM v_recipes WHERE result='Firaga';
--   SELECT * FROM v_recipes WHERE ingredient1='Fire' OR ingredient2='Fire';
--   SELECT * FROM v_recipes WHERE aqua > 0;          -- available to Aqua
--   SELECT * FROM v_recipes WHERE terra = 100;       -- 100% for Terra
--   SELECT * FROM commands WHERE name LIKE '%fire%';
