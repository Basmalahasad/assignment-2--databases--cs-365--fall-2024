DROP DATABASE IF EXISTS passwords;

CREATE DATABASE passwords DEFAULT CHARACTER SET utf8mb4;

USE passwords;

SET block_encryption_mode = 'aes-256-cbc';
SET @key_str = UNHEX(SHA2('assignment 2', 512));
SET @init_vector = RANDOM_BYTES(16);

source create-tables.sql;
source insert-values.sql;
