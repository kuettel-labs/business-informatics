DELETE FROM dictionaries WHERE reference = 'categories';

INSERT INTO dictionaries (reference) VALUES ('categories');
INSERT INTO categories (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Lowest',  'Smaller clubs, less competition'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Tiefste',  'Kleinere Vereine, weniger Wettkampfbetrieb');

INSERT INTO dictionaries (reference) VALUES ('categories');
INSERT INTO categories (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Middle',  'Solid, active clubs'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Mittlere',  'Solide, aktive Vereine');

INSERT INTO dictionaries (reference) VALUES ('categories');
INSERT INTO categories (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Strong',  'Above-average performance level'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Starke',  'Überdurchschnittliche Leistungsstufe');

INSERT INTO dictionaries (reference) VALUES ('categories');
INSERT INTO categories (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Highest',  'Very strong, competition-tested clubs'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Höchste',  'Sehr starke, wettkampferprobte Vereine');