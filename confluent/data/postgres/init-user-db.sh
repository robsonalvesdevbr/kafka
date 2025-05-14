#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER kafka WITH PASSWORD 'kafka@2025';
	CREATE DATABASE kafkadb;
	GRANT ALL PRIVILEGES ON DATABASE kafkadb TO kafka;
    \c kafkadb;
    CREATE TABLE client (
        id SERIAL PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        hour_test varchar(5) default '00:00' not null
    );
    GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO kafka;
    GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO kafka;
    INSERT INTO client (name, hour_test) values ('Robson Candido dos Santos Alves', TO_CHAR(NOW(), 'HH24:MI'));
EOSQL
