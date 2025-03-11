#!/bin/bash
# To migrate all environments (dev, test, prod):

# Run migrations for dev
echo "Migrating dev environment..."
DJANGO_ENV=dev python3 WorkoutTrackerApp/backend/manage.py migrate

# Run migrations for test
echo "Migrating test environment..."
DJANGO_ENV=test python3 WorkoutTrackerApp/backend/manage.py migrate

# Run migrations for prod
echo "Migrating prod environment..."
DJANGO_ENV=prod python3 WorkoutTrackerApp/backend/manage.py migrate
