-- ============================================
-- ETL Import Script for AMTOVZ_CSV_LV95.csv
-- Author: Dani’s Copilot
-- Examples
-- * sqlite3 MarksmanScoring.sqlite < etl_import_communities.sql
-- * .read etl_import_communities.sql
-- ============================================

-- CSV mode + semicolon separator
.mode csv
.separator ; "\n"

-- Drop temp table if it exists
DROP TABLE IF EXISTS raw_communities;

-- Clear target table
DELETE FROM communities;

-- Import CSV into raw table
.import AMTOVZ_CSV_LV95.csv raw_communities

-- Transfer into final table
INSERT INTO communities
SELECT * FROM raw_communities;

-- Cleanup
DROP TABLE raw_communities;

-- Link clubs to communities via name or bfs
WITH ranked AS (
    SELECT clubs.id AS club_id,
        communities.bfs_id,
        communities.zip_id,
        row_number() OVER (
            PARTITION BY clubs.id
            ORDER BY bfs_id, zip_id
        ) AS matches
    FROM clubs
    JOIN communities ON ifnull(bfs_name, CASE
            WHEN instr(clubs.name, ' ') = 0 THEN clubs.name
            ELSE substr(clubs.name, 1, instr(clubs.name, ' ') - 1)
        END) IN (communities.name, communities.city, CASE
            WHEN instr(communities.name, ' ') = 0 THEN communities.name
            ELSE substr(communities.name, 1, instr(communities.name, ' ') - 1)
        END, CASE
            WHEN instr(communities.city, ' ') = 0 THEN communities.city
            ELSE substr(communities.city, 1, instr(communities.city, ' ') - 1)
        END)
)
INSERT INTO club_communities (club_id, bfs_id, zip_id)
SELECT club_id, bfs_id, zip_id
FROM ranked
WHERE matches = 1
ORDER BY club_id, bfs_id, zip_id;

-- Done.
