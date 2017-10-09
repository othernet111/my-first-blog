#!/bin/bash
USER=www-data
GROUP=www-data
export LANG=ru_RU.UTF-8
export LC_ALL=ru_RU.UTF-8
cd /var/www/django/
source ./myvenv/bin/activate
exec ./myvenv/bin/python3.4 /var/www/django/manage.py runserver 192.168.1.123:8000

