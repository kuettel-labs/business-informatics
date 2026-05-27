--
-- File generated with SQLiteStudio v3.4.21 on Wed May 27 08:29:58 2026
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: categories
CREATE TABLE categories (
    id          INTEGER PRIMARY KEY,
    category    TEXT,
    description TEXT
);


-- Table: cities
CREATE TABLE cities (
    id   INTEGER PRIMARY KEY,
    name TEXT
);


-- Table: clubs
CREATE TABLE clubs (
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    ssv        TEXT,
    name       TEXT    NOT NULL,
    zipcode_id INTEGER REFERENCES zipcodes (id) ON DELETE CASCADE
);


-- Table: clubs_disciplines
CREATE TABLE clubs_disciplines (
    club_id        INTEGER REFERENCES clubs (id) ON DELETE CASCADE
                                                 ON UPDATE CASCADE
                           NOT NULL,
    disclipline_id INTEGER REFERENCES disciplines (id) ON DELETE CASCADE
                                                       ON UPDATE CASCADE
                           NOT NULL,
    category_id    INTEGER REFERENCES categories (id) ON DELETE SET DEFAULT
                                                      ON UPDATE CASCADE
                           DEFAULT (4) 
);


-- Table: competitive_groups
CREATE TABLE competitive_groups (
    id          INTEGER NOT NULL
                        PRIMARY KEY AUTOINCREMENT,
    description TEXT
);


-- Table: contact_types
CREATE TABLE contact_types (
    id   INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT    NOT NULL
);


-- Table: contacts
CREATE TABLE contacts (
    person_id INTEGER REFERENCES people (id) ON DELETE CASCADE
                                             ON UPDATE CASCADE,
    type_id   INTEGER REFERENCES contact_types (id) ON DELETE CASCADE
                                                    ON UPDATE CASCADE,
    detail    TEXT    NOT NULL
);


-- Table: disciplines
CREATE TABLE disciplines (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    name        TEXT    NOT NULL,
    description TEXT
);


-- Table: members
CREATE TABLE members (
    person_id INTEGER REFERENCES people (id) ON DELETE CASCADE
                                             ON UPDATE CASCADE,
    club_id   INTEGER REFERENCES clubs (id) ON DELETE CASCADE
                                            ON UPDATE CASCADE,
    role_id   INTEGER REFERENCES person_roles (id) ON DELETE CASCADE
                                                   ON UPDATE CASCADE,
    group_id  INTEGER REFERENCES competitive_groups (id) ON DELETE SET DEFAULT
                                                         ON UPDATE CASCADE
                      DEFAULT (4) 
);


-- Table: people
CREATE TABLE people (
    id         INTEGER PRIMARY KEY,
    surname    TEXT    NOT NULL,
    name       TEXT,
    ssv        INTEGER DEFAULT (0),
    birth_date TEXT    DEFAULT '[1900-01-01]'
);


-- Table: person_roles
CREATE TABLE person_roles (
    id          INTEGER PRIMARY KEY,
    role        TEXT    NOT NULL,
    description TEXT
);


-- Table: zipcodes
CREATE TABLE zipcodes (
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    code      INTEGER,
    extension INTEGER DEFAULT (0),
    city_id   INTEGER REFERENCES cities (id) ON DELETE CASCADE
                                             ON UPDATE CASCADE
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
