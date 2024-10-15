-- CMD1: CREATE A NEW ENTRY
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

-- CMD2: GET PASSWORDS FROM GITHUB URL
SELECT
    passphrase,
    CAST(AES_DECRYPT(passphrase, @key_str, @init_vector) AS CHAR) AS 'Plain Text Password'
FROM
    credentials
JOIN
    website ON credentials.website_id = website.website_id
WHERE
    url = 'https://github.com';

-- CMD3: GET PASSWORD RELATED DATA
SELECT
    username,
    website.website_name,
    website.url,
    passphrase,
    CAST(AES_DECRYPT(passphrase, @key_str, @init_vector) AS CHAR) AS 'Plain Text Password',
    comments,
    created_at
FROM
    credentials
JOIN
    website ON credentials.website_id = website.website_id
WHERE
    url LIKE 'https%'
    AND website.website_id IN (
        SELECT
            website_id
        FROM
            credentials
        GROUP BY
            website_id
        HAVING
            COUNT(DISTINCT user_id) = 2
    );
