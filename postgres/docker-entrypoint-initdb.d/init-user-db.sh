#!/bin/bash
set -e

echo "Creating databases"
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER sleepingpill WITH PASSWORD 'sleepingpill';
    CREATE DATABASE sleepingpill;
    GRANT ALL PRIVILEGES ON DATABASE sleepingpill TO sleepingpill;

    CREATE USER devnull WITH PASSWORD 'devnull';
    CREATE DATABASE devnull;
    GRANT ALL PRIVILEGES ON DATABASE devnull TO devnull;
    
    CREATE USER submit WITH PASSWORD 'submit';
    CREATE DATABASE submit;
    GRANT ALL PRIVILEGES ON DATABASE submit TO submit;
EOSQL
