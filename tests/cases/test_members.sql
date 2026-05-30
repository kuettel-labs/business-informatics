INSERT INTO people (id, surname, name) VALUES (2, 'Huber', 'Anna');
INSERT INTO clubs (ssv, name) VALUES ('200', 'Club A');
INSERT INTO person_roles (id, dictionary_id) VALUES (1, 1);
INSERT INTO competitive_groups (id, dictionary_id) VALUES (4, 1);

INSERT INTO members (person_id, club_id, role_id, group_id)
VALUES (2, 1, 1, 4);

UPDATE members SET role_id=1 WHERE id=1;

DELETE FROM members WHERE id=1;

SELECT * FROM audit_log WHERE table_name='members';
