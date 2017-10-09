#!/bin/bash
set -e
LOGFILE=/var/www/django/log/gunicorn.log
LOGDIR=$(dirname $LOGFILE)
NUM_WORKERS=5
# user/group to run as
USER=www-data
GROUP=www-data

export LANG=ru_RU.UTF-8
export LC_ALL=ru_RU.UTF-8

cd /var/www/django/
source ./myvenv/bin/activate
test -d $LOGDIR || mkdir -p $LOGDIR
exec ./myvenv/bin/gunicorn -w $NUM_WORKERS \
#exec gunicorn newApp.wsgi:application -w $NUM_WORKERS \
  --user=$USER --group=$GROUP --log-level=debug \
  --log-file=$LOGFILE 2>>$LOGFILE

