-- dictionary_id is NOT NULL and UNIQUE
INSERT INTO categories (id, dictionary_id) VALUES (20, NULL);  -- expected fail
