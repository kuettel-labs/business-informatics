INSERT INTO people (surname, name) VALUES ('Huber', 'Anna');
INSERT INTO clubs (ssv, name) VALUES ('200', 'Club A');

-- Insert person_roles
INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO dictionary_languages (dictionary_id, lang, name)
VALUES ((SELECT MAX(id) FROM dictionaries), 'de', 'Rolen-Test');
INSERT INTO person_roles (dictionary_id) SELECT MAX(id) FROM dictionaries;

-- Insert competitive_groups
INSERT INTO dictionaries (reference) VALUES ('person_roles');
INSERT INTO dictionary_languages (dictionary_id, lang, name)
VALUES ((SELECT MAX(id) FROM dictionaries), 'de', 'Gruppe-Test');
INSERT INTO competitive_groups (dictionary_id) SELECT MAX(id) FROM dictionaries;

INSERT INTO members (person_id, club_id, role_id, group_id)
VALUES ((SELECT MAX(id) from people), 
	(SELECT MAX(id) from clubs), 
	(SELECT MAX(id) from person_roles),
	(SELECT MAX(id) from competitive_groups));

UPDATE members SET role_id=1 WHERE id=(SELECT MAX(id) from members);

DELETE FROM members WHERE id=(SELECT MAX(id) from members);

SELECT * FROM audit_log WHERE table_name='members';
