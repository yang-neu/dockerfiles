#!/bin/sh

if [ ! -d "${DB_DATA_PATH}/mysql" ]; then
    mysql_install_db --user=mysql --datadir=${DB_DATA_PATH}
    rc-service mariadb start
    mysqladmin -u root password "${DB_ROOT_PASS}"
    echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME} DEFAULT CHARACTER SET utf8;"  >> /tmp/sql
    echo "grant all privileges on ${DB_NAME}.* to ${DB_USER}@'%' identified by '${DB_PASS}' with grant option ;" >> /tmp/sql
    echo "DELETE FROM mysql.user WHERE User='';" >> /tmp/sql
    echo "DROP DATABASE test;" >> /tmp/sql
    echo "FLUSH PRIVILEGES;" >> /tmp/sql
    cat /tmp/sql | mysql -u root --password="${DB_ROOT_PASS}"
    rm /tmp/sql
    rc-service mariadb stop
else
    rc-service mariadb status
    rc-service mariadb start
    rc-service mariadb stop
fi

mysqld --user=mysql --datadir=${DB_DATA_PATH}
