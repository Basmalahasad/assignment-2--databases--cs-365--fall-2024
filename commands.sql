-- CMD1: CREATE A NEW ENTRY
INSERT INTO user
(first_name, last_name, email)
VALUES
('Jessie', 'Wilkinson', 'jwilkinson@gmail.com');

INSERT INTO credentials
(user_id, website_id, username, passphrase, created_at, comments)
VALUES (
    6,
    3,
    'jwilkinson',
    AES_ENCRYPT('jw_21*3DiUd', @key_str, @init_vector),
    CURRENT_TIMESTAMP,
    'Initial password for Facebook account'
);

-- CMD2: GET PASSWORDS FROM GITHUB URL
SELECT CAST(AES_DECRYPT(passphrase, @key_str, @init_vector) AS CHAR) AS 'Plain Text Password'
FROM credentials INNER JOIN website
    ON credentials.website_id = website.website_id
WHERE url = 'https://github.com';

-- CMD3: GET PASSWORD RELATED DATA FROM 2 URLs THAT HAVE HTTPS
SELECT
    user.email,
    website.website_name,
    website.url,
    username,
    passphrase,
    CAST(AES_DECRYPT(passphrase, @key_str, @init_vector) AS CHAR) AS 'Plain Text Password',
    created_at,
    comments
FROM
    credentials
INNER JOIN
    user ON credentials.user_id = user.user_id
INNER JOIN
    website ON credentials.website_id = website.website_id
INNER JOIN (
    SELECT url
    FROM website
    WHERE url LIKE 'https%'
    LIMIT 2
)
    AS selected_urls
    ON website.url = selected_urls.url;

-- CMD 4: UPDATE URL OF GITHUB TO NEWGITHUB
UPDATE
    website
SET
    url = 'https://newgithub.com'
WHERE
    website_name = 'Github';

-- CMD 5: UPDATE PASSWORD
UPDATE
    credentials
SET
    passphrase = AES_ENCRYPT('newpassword', @key_str, @init_vector)
WHERE
    password_id = 3;

-- CMD 6: DELETE CREDENTIALS BASED ON URL & DELETE THE WEBSITE
DELETE FROM
    credentials
WHERE
    website_id = (
        SELECT website_id
        FROM website
        WHERE url = 'https://github.com'
    );

DELETE FROM
    website
WHERE
    url = 'https://github.com';

-- CMD 7: DELETE ONLY CREDENTIALS BASED ON PASSWORD
DELETE FROM
    credentials
WHERE
    passphrase = AES_ENCRYPT('ml_W6%272dC', @key_str, @init_vector);
