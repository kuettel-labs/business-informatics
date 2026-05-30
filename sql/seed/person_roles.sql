DELETE FROM dictionaries WHERE reference = 'person_roles';

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', '',  ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Mitglied',  'Eine natürliche Person, die dem Verein beigetreten ist, im Mitgliederverzeichnis geführt wird und an Aktivitäten, Veranstaltungen und Entscheidungsprozessen des Vereins teilnehmen darf');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', '',  ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Präsidium',  'Gesamtverantwortung für den Verein');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', '',  ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Vizepräsidium',  'Stellvertretung des Präsidenten');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', '',  ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Finanzen',  'Finanzen, Buchhaltung, Budget, Mitgliederbeiträge, Abrechnung mit Verbänden und Behörden');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', '',  ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Aktuariat',  'Protokolle, Korrespondenz, Administration, Vereinsregister, Einladungen, GV-Unterlagen');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', '',  ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Schützenmeisteramt',  'Verantwortlich für den Schiessbetrieb, Sicherheitsaufsicht, Organisation von Trainings und Schiessanlässen, Betreuung der Schiessanlage');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', '',  ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Jungschützenleitung',  'Ausbildung der Jungschützen, Kurse, Trainings, Wettkämpfe, Zusammenarbeit mit SSV / KSV');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', '',  ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Materialverwaltung',  'Waffen, Scheiben, Munition, Ausrüstung, Unterhalt und Inventar');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', '',  ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Standbetrieb',  'Betrieb und Unterhalt der Schiessanlage, Öffnungszeiten, Aufsicht, Technik');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', '',  ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Festwirtschaftsleitung',  'Organisation von Festwirtschaft, Events, Helfereinsätzen');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', '',  ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Medien',  'Berichte, Medien, Social Media');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', '',  ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Systemverantwortung',  'Website, Resultate, Kommunikation');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', '',  ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Beisitz',  'Unterstützen Projekte, Vertreten Sektionen oder Gruppen');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', '',  ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Munitionsverwaltung',  'Bestellung, Lagerung, Abgabe');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', '',  ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Sicherheitsverantwortung',  'Sicherheitskonzepte, Aufsichtsschulung, Kontrolle der Sicherheitsvorschriften');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', '',  ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Revisionsstelle',  'Finanzkontrolle, Prüfung der Jahresrechnung');

INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO person_roles (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));
INSERT INTO dictionary_languages (dictionary_id, lang, name, description) VALUES
((SELECT MAX(id) FROM dictionaries), 'en', '',  ''),
((SELECT MAX(id) FROM dictionaries), 'de', 'Verbandsvertretung',  'Vertretung des Vereins an KSV/SSV?Versammlungen');

