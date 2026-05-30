DELETE FROM dictionaries WHERE reference = 'competitive_groups';

INSERT INTO dictionaries (reference) VALUES ('competitive_groups');
INSERT INTO competitive_groups (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Strongest shooters', ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Stärkste Schützen', ''),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Tireurs les plus forts', ''),
((SELECT MAX(id) FROM dictionaries), 'it', 'Tiratori più forti', '');

INSERT INTO dictionaries (reference) VALUES ('competitive_groups');
INSERT INTO competitive_groups (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Good shooters', ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Gute Schützen', ''),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Bons tireurs', ''),
((SELECT MAX(id) FROM dictionaries), 'it', 'Buoni tiratori', '');

INSERT INTO dictionaries (reference) VALUES ('competitive_groups');
INSERT INTO competitive_groups (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Solid shooters', ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Solide Schützen', ''),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Tireurs solides', ''),
((SELECT MAX(id) FROM dictionaries), 'it', 'Tiratori solidi', '');

INSERT INTO dictionaries (reference) VALUES ('competitive_groups');
INSERT INTO competitive_groups (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Junior / Senior / Occasional shooters', ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Nachwuchs / Senioren / Gelegenheitsschützen', ''),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Jeunes / Seniors / Tireurs occasionnels', ''),
((SELECT MAX(id) FROM dictionaries), 'it', 'Giovani / Seniores / Tiratori occasionali', '');