DELETE FROM dictionaries WHERE reference = 'competitive_groups';

INSERT INTO dictionaries (reference) VALUES ('competitive_groups');
INSERT INTO competitive_groups (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Strongest shooters',  ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Stärkste Schützen',  '');

INSERT INTO dictionaries (reference) VALUES ('competitive_groups');
INSERT INTO competitive_groups (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Good shooters',  ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Gute Schützen',  '');

INSERT INTO dictionaries (reference) VALUES ('competitive_groups');
INSERT INTO competitive_groups (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Solid shooters',  ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Solide Schützen',  '');

INSERT INTO dictionaries (reference) VALUES ('competitive_groups');
INSERT INTO competitive_groups (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Junior / Senior / Occasional shooters',  ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Nachwuchs / Senioren / Gelegenheitsschützen',  '');