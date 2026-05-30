DELETE FROM dictionaries WHERE reference = 'disciplines';

INSERT INTO dictionaries (reference) VALUES ('disciplines');
INSERT INTO disciplines (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'G300',  'Rifle 300 m'),
((SELECT MAX(id) FROM dictionaries), 'de', 'G300',  'Gewehr 300 m');

INSERT INTO dictionaries (reference) VALUES ('disciplines');
INSERT INTO disciplines (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'G50',  'Small?bore rifle 50?m'),
((SELECT MAX(id) FROM dictionaries), 'de', 'G50',  'Kleinkaliber 50 m');

INSERT INTO dictionaries (reference) VALUES ('disciplines');
INSERT INTO disciplines (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'G10',  'Air rifle 10 m'),
((SELECT MAX(id) FROM dictionaries), 'de', 'G10',  'Luftgewehr 10 m');

INSERT INTO dictionaries (reference) VALUES ('disciplines');
INSERT INTO disciplines (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'P50',  'Pistol 50 m'),
((SELECT MAX(id) FROM dictionaries), 'de', 'P50',  'Pistole 50 m');

INSERT INTO dictionaries (reference) VALUES ('disciplines');
INSERT INTO disciplines (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'P25',  'Pistol 25 m'),
((SELECT MAX(id) FROM dictionaries), 'de', 'P25',  'Pistole 25 m');

INSERT INTO dictionaries (reference) VALUES ('disciplines');
INSERT INTO disciplines (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'P10',  'Air pistol 10 m'),
((SELECT MAX(id) FROM dictionaries), 'de', 'P10',  'Luftpistole 10 m');