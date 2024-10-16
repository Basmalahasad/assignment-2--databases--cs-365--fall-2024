CREATE TABLE IF NOT EXISTS user (
    user_id SMALLINT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(128) NOT NULL,
    last_name VARCHAR(128) NOT NULL,
    email VARCHAR(128) NOT NULL UNIQUE,

    PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS website (
    website_id SMALLINT NOT NULL AUTO_INCREMENT,
    website_name VARCHAR(128) NOT NULL,
    url VARCHAR(128) NOT NULL UNIQUE,

    PRIMARY KEY (website_id)
);

CREATE TABLE IF NOT EXISTS credentials (
    password_id SMALLINT NOT NULL AUTO_INCREMENT,
    user_id SMALLINT NOT NULL,
    website_id SMALLINT NOT NULL,
    username VARCHAR(128) NOT NULL UNIQUE,
    passphrase VARBINARY(512) NOT NULL,
    created_at TIMESTAMP,
    comments TEXT,

    PRIMARY KEY (password_id),
    FOREIGN KEY (user_id) REFERENCES user (user_id) ON DELETE CASCADE,
    FOREIGN KEY (website_id) REFERENCES website (website_id) ON DELETE CASCADE
);
