#!/bin/bash
set -e

DB="test.db"

echo "Recreating database..."
rm -f $DB
sqlite3 $DB < sql/schema/schema.sql

# Reset database state before each test
sqlite3 "$DB" < tests/setup.sql

echo "inserting data..."
for t in sql/seed/*.sql; do
    echo "----------------------------------------"
    echo "Running $t"
    sqlite3 $DB < "$t"
done

echo "Running test cases..."
for t in tests/cases/*.sql; do
    echo "----------------------------------------"
    echo "Running $t"
    sqlite3 $DB < "$t"
done

echo "All tests executed successfully."
