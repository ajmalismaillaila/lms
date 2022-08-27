#!/bin/sh

mysql_host=$1
mysql_port=$2
shift 2
cmd="$@"

while ! nc $mysql_host $mysql_port; do
  >&2 echo "mysql is unavailable - sleeping"
  sleep 1
done

>&2 echo "mysql is up - executing command"

# run the command
exec $cmd