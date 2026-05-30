#!/bin/bash
set -e

DB="test.db"

echo "Recreating database..."
rm -f $DB
sqlite3 $DB < sql/schema/schema.sql

echo "Running test cases..."
for t in tests/cases/*.sql; do
    echo "----------------------------------------"
    echo "Running $t"
    sqlite3 $DB < "$t"
done

echo "All tests executed successfully."
