#!/bin/bash
set -e

# Create a temporary database for this test
DB=$(mktemp)

echo "Recreating database..."
rm -f $DB
sqlite3 $DB < sql/schema/schema.sql

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
