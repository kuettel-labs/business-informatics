#!/bin/bash
set -e

DB_FILE=$(mktemp)

echo "Recreating database..."
rm -f $DB_FILE
sqlite3 $DB_FILE < sql/schema/schema.sql

# Reset database state before each test
sqlite3 "$DB_FILE" < tests/setup.sql

echo "inserting data..."
for t in sql/seed/*.sql; do
    echo "----------------------------------------"
    echo "Running $t"
    sqlite3 $DB_FILE < "$t"
done

echo "Running test cases..."
for t in tests/cases/*.sql; do
    echo "----------------------------------------"
    echo "Running $t"
    sqlite3 $DB_FILE < "$t"
done

echo "All tests executed successfully."
