INSERT INTO people (surname, name, ssv, birth_date)
VALUES ('Muster', 'Max', 12345, '1980-01-01');

DELETE FROM people WHERE id = (SELECT MAX(id) FROM people);

SELECT old_values FROM audit_log
WHERE table_name='people' AND action='DELETE';
