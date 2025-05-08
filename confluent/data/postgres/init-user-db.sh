#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER kafka WITH PASSWORD 'kafka@2025';
	CREATE DATABASE kafkadb;
	GRANT ALL PRIVILEGES ON DATABASE kafkadb TO kafka;
    \c kafkadb;
    CREATE TABLE client (
        id int PRIMARY KEY,
        name VARCHAR(100) NOT NULL
    );
    GRANT ALL PRIVILEGES ON TABLE client TO kafka;
EOSQL
