-- Insert dictionary entry
INSERT INTO dictionaries (reference) VALUES ('cat-test');
INSERT INTO dictionary_languages (dictionary_id, lang, name)
VALUES (1, 'de', 'Kategorie-Test');

-- Insert category
INSERT INTO categories (id, dictionary_id) VALUES (10, 1);

-- Update category
UPDATE categories SET dictionary_id = 1 WHERE id = 10;

-- Delete category
DELETE FROM categories WHERE id = 10;

-- Validate audit log
SELECT * FROM audit_log WHERE table_name='categories';
