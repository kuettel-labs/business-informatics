INSERT INTO people (id, surname, name, ssv, birth_date)
VALUES (1, 'Muster', 'Max', 12345, '1980-01-01');

DELETE FROM people WHERE id=1;

SELECT old_values FROM audit_log
WHERE table_name='people' AND action='DELETE';
