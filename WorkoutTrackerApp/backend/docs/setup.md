# Backend Setup Guide

This document provides instructions on how to set up and manage the Django backend for the **Workout Tracker** project. It includes steps for environment configuration, database setup, running migrations, and working with the different environments (development, test, production).

## **Prerequisites**

Before you begin, ensure that you have the following installed:

- **Python** 3.13 or higher
- **Conda** for environment management
- **PostgreSQL** (or access to a PostgreSQL instance)
- **Django** (Installed in the environment)
- **Git** (to clone the repository)

## **Clone the Repository**


Clone the project from the remote repository:

```bash
git clone https://github.com/CribbJ/Workout-Tracker.git
cd WorkoutTrackerApp/backend
```

## **Create and Activate Conda Environment**

Create a conda environment for the backend using the `environement.yml`
file provided in the backend folder in the `.envs/`.

```bash
conda env create -f environment.yml
conda activate workout-tracker
```

## **Environment Variables Setup**

The environment variables are managed using the `django-environ`
package which loads variables from the `.env` files.

Inside the backend folder, you will find the `.envs/` directory, where specific .env files are stored.

- `.env`: Default for local development
- `.env.test`: For testing environment
- `.env.prod`: For production environment


To set the environment for development:
```aiignore
export DJANGO_ENV=dev
```
For testing:
```aiignore
export DJANGO_ENV=test
```
For production:
```aiignore
export DJANGO_ENV=prod
```
You can alternatively set the `DJANGO_ENV` inline while running commands:
```aiignore
DJANGO_ENV=prod python3 manage.py runserver
```


## **Role Permissions**

Data is stored in a `postgreSQL` database. Below are the permissions for each
role and what that user can access. This information is linked to the 
`.env` files.

- dev_workout_tracker_db: Available to roles `dev`, `test`, and `prod`
- test_workout_tracker_db: Available to roles `test` and `prod`
- prod_workout_tracker_db: Available to role `prod` only

## **Running Migrations**

Before running the backend or performing any testing, it is crucial to apply the 
migrations for the correct environment.

***Migration Script:***

To migrate all environments (dev, test, prod), use the following script.

```aiignore
/bin/bash migrate_backend_all.sh
```

***Manual Migration for Specific Environment:***

If you want to migrate a specific environment, set the `DJANGO_ENV` environment variable
and then run the migration command.

For development:
```aiignore
DJANGO_ENV=dev python3 manage.py migrate
```

For testing:
```aiignore
DJANGO_ENV=test python3 manage.py migrate
```

For production:
```aiignore
DJANGO_ENV=prod python3 manage.py migrate
```

## **Running the Django Development Server**

To run the development server, set the appropriate environment and execute:

For development:
```aiignore
DJANGO_ENV=dev python3 manage.py runserver
```

For testing:
```aiignore
DJANGO_ENV=test python3 manage.py runserver
```

For production:
```aiignore
DJANGO_ENV=prod python3 manage.py runserver
```

The development server will be accessible at `http://127.0.0.1:8000/`.

## **Running Tests**

To run tests in a specific environment:
```aiignore
DJANGO_ENV=test python3 manage.py test
```

Make sure your `DJANGO_ENV` is set to `test` to run tests 
against the testing database. For production or development testing, 
make sure to set the appropriate environment.

## **Important Notes:**
Ensure you use the correct database configuration for each 
environment (dev, test, prod). The databases for each environment are 
defined in the .env files. 

Role-based access control (RBAC) is enforced using the environment settings:
- R1 (dev): Access to dev database only.
- R2 (test): Access to dev and test databases.
- R3 (prod): Access to dev, test, and prod databases.

Ensure the PostgreSQL user roles and permissions are set up accordingly 
to reflect the correct access control.

## **Further Documentation**

- API Documentation: `backend/docs/api_documentation.md`
