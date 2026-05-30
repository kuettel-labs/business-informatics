-- Insert dictionary entry
INSERT INTO dictionaries (reference) VALUES ('cat-test');
INSERT INTO dictionary_languages (dictionary_id, lang, name)
VALUES ((SELECT MAX(id) FROM dictionaries), 'de', 'Kategorie-Test');

-- Insert category
INSERT INTO categories (dictionary_id) VALUES ((SELECT MAX(id) FROM dictionaries));

-- Update category
UPDATE categories SET dictionary_id = 1 WHERE id = (SELECT MAX(id) FROM dictionaries);

-- Delete category
DELETE FROM categories WHERE id = (SELECT MAX(id) FROM dictionaries);

-- Validate audit log
SELECT * FROM audit_log WHERE table_name='categories';
