DELETE FROM dictionaries WHERE reference = 'categories';

INSERT INTO dictionaries (reference) VALUES ('categories');
INSERT INTO categories (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Lowest',  'Smaller clubs, less competition'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Tiefste', 'Kleinere Vereine, weniger Wettkampfbetrieb'),
((SELECT MAX(id) FROM dictionaries), 'fr', 'La plus basse', 'Clubs plus petits, moins de compétition'),
((SELECT MAX(id) FROM dictionaries), 'it', 'Più bassa', 'Club più piccoli, meno competizione');

INSERT INTO dictionaries (reference) VALUES ('categories');
INSERT INTO categories (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Middle',  'Solid, active clubs'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Mittlere', 'Solide, aktive Vereine'),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Moyenne', 'Clubs solides et actifs'),
((SELECT MAX(id) FROM dictionaries), 'it', 'Media', 'Club solidi e attivi');

INSERT INTO dictionaries (reference) VALUES ('categories');
INSERT INTO categories (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Strong',  'Above-average performance level'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Starke', 'Überdurchschnittliche Leistungsstufe'),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Forte', 'Niveau de performance supérieur à la moyenne'),
((SELECT MAX(id) FROM dictionaries), 'it', 'Forte', 'Livello di prestazione superiore alla media');

INSERT INTO dictionaries (reference) VALUES ('categories');
INSERT INTO categories (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Highest',  'Very strong, competition-tested clubs'),
((SELECT MAX(id) FROM dictionaries), 'de', 'Höchste', 'Sehr starke, wettkampferprobte Vereine'),
((SELECT MAX(id) FROM dictionaries), 'fr', 'La plus élevée', 'Clubs très forts, éprouvés en compétition'),
((SELECT MAX(id) FROM dictionaries), 'it', 'Più alta', 'Club molto forti, collaudati in competizione');