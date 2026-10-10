#!/bin/bash

if [ -f /tmp/mysql-root-password.txt ]; then
    MYSQL_ROOT_PASSWORD=$(cat /tmp/mysql-root-password.txt)
else
    echo "MySQL root password file not found. Exiting."
    exit 1
fi

export MYSQL_ROOT_PASSWORD=$password
rm -rf /tmp/mysql-root-password.txt
exec /entrypoint.sh mysqld


# /tmp/mysql-root-password.txt -> init container places password in this file