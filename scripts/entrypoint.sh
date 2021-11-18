#!/bin/sh

set -e

python manage.py collectstatic --noinput

# commands that runs our application using uWSGI
uwsgi --socket :8000 --master --enable-threads --module app.wsgi