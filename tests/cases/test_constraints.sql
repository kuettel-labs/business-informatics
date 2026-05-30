-- dictionary_id is NOT NULL ? this should be ignored
INSERT OR IGNORE INTO categories (id, dictionary_id)
VALUES (20, NULL);

-- verify that row was NOT inserted
SELECT COUNT(*) AS should_be_zero
FROM categories
WHERE id = 20;
