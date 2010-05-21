#!/bin/sh
/usr/local/postgresql/bin/postmaster -D /usr/local/postgresql/data >/tmp/pg_logfile 2>&1 &
