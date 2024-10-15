-- CREATE A NEW ENTRY
INSERT INTO user (first_name, last_name, email)
VALUES ('Jessie', 'Wilkinson', 'jwilkinson@gmail.com');

INSERT INTO credentials (user_id, website_id, username, passphrase, created_at, comments)
VALUES (
    6,
    3,
    'jwilkinson',
    AES_ENCRYPT('jw_21*3DiUd', @key_str, @init_vector),
    CURRENT_TIMESTAMP,
    'Initial password for Facebook account'
);

-- GET PASSWORDS FROM GITHUB URL
SELECT
    passphrase,
    CAST(AES_DECRYPT(passphrase, @key_str, @init_vector) AS CHAR) AS 'Plain Text Password'
FROM
    credentials
JOIN
    website ON credentials.website_id = website.website_id
WHERE
    url = 'https://github.com';
