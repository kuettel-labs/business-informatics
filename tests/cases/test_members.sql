INSERT INTO people (surname, name) VALUES ('Huber', 'Anna');
INSERT INTO clubs (ssv, name) VALUES ('200', 'Club A');
INSERT INTO person_roles (dictionary_id) VALUES (1);
INSERT INTO competitive_groups (dictionary_id) VALUES (1);

INSERT INTO members (person_id, club_id, role_id, group_id)
VALUES ((SELECT MAX(id) from people), 
	(SELECT MAX(id) from clubs), 
	(SELECT MAX(id) from person_roles),
	(SELECT MAX(id) from competitive_groups));

UPDATE members SET role_id=1 WHERE id=(SELECT MAX(id) from members);

DELETE FROM members WHERE id=(SELECT MAX(id) from members);

SELECT * FROM audit_log WHERE table_name='members';
