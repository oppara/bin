#!/bin/sh

sudo echo
sudo /usr/local/mysql/bin/mysqld_safe \
--defaults-file=/usr/local/mysql/my.cnf \
--log-slow-queries=/tmp/mysql_slow.log \
--log=/tmp/mysql_query.log \
--datadir=/usr/local/mysql/var  2>&1 &
