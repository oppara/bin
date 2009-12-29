#!/bin/sh
/usr/local/pgsql/bin/postmaster -D /usr/local/pgsql/data >/tmp/pg_logfile 2>&1 &
