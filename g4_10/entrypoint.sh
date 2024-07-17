#!/bin/bash

echo "Entrypoint script started"

# Start PostgreSQL
su - postgres -c "postgres -D /var/lib/postgresql/data" &

# Wait for PostgreSQL to start
while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
  sleep 0.1
done

echo "PostgreSQL started"

echo "clearing database"
python3 manage.py flush --no-input

echo "migrating database"
python3 manage.py migrate

echo "creating admin user"
python3 manage.py add_admin

echo "collecting static files"
python3 manage.py collectstatic --no-input --clear

echo "Entrypoint script finished"

exec "$@"