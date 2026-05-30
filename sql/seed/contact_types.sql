DELETE FROM dictionaries WHERE reference = 'contact_types';

INSERT INTO dictionaries (reference) VALUES ('contact_types');
INSERT INTO contact_types (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'Mobile', ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Handy', ''),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Portable', ''),
((SELECT MAX(id) FROM dictionaries), 'it', 'cellulare', '');

INSERT INTO dictionaries (reference) VALUES ('contact_types');
INSERT INTO contact_types (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', 'email', ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'E-Mail', ''),
((SELECT MAX(id) FROM dictionaries), 'fr', 'Courriel', ''),
((SELECT MAX(id) FROM dictionaries), 'it', 'E-mail', '');