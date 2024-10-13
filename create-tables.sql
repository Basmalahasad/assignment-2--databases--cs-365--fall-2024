CREATE TABLE IF NOT EXISTS user (
    user_id SMALLINT(5) NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(128) NOT NULL,
    last_name VARCHAR(128) NOT NULL,
    username VARCHAR(128) NOT NULL UNIQUE,
    email VARCHAR(128) NOT NULL UNIQUE,
    PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS website (
    website_id SMALLINT(5) NOT NULL AUTO_INCREMENT,
    website_name VARCHAR(128) NOT NULL,
    url VARCHAR(128) NOT NULL UNIQUE,
    PRIMARY KEY (website_id)
);