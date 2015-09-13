#!/usr/bin/env bash

createdb --username "$POSTGRES_USER" tz

psql  --username "$POSTGRES_USER" tz <<END_OF_SQL
	CREATE EXTENSION postgis;
END_OF_SQL

gzip -c -d /tz.sql.gz | psql --username "$POSTGRES_USER" tz 2> /dev/null 
