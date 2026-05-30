INSERT INTO clubs (ssv, name, bfs_name)
VALUES ('100', 'Testclub', 'BFS-Old');

UPDATE clubs
SET name='Testclub Neu', bfs_name='BFS-New'
WHERE id=1;

SELECT json_extract(new_values, '$.name') AS new_name
FROM audit_log
WHERE table_name='clubs' AND action='UPDATE';
