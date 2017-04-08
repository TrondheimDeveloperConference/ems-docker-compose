#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER ems WITH PASSWORD 'ems';
    CREATE DATABASE ems;
    GRANT ALL PRIVILEGES ON DATABASE ems TO ems;

    CREATE USER devnull WITH PASSWORD 'devnull';
    CREATE DATABASE devnull;
    GRANT ALL PRIVILEGES ON DATABASE devnull TO devnull;
EOSQL
