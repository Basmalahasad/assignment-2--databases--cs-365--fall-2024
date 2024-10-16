INSERT INTO user
(first_name, last_name, email)
VALUES
('Margot', 'Little', 'mlittle@gmail.com'),
('Joel', 'Andrews', 'jandrews@yahoo.com'),
('Cora', 'Brock', 'cbrock@outlook.com'),
('Alexia', 'Fuller', 'afuller@outlook.com'),
('Ali', 'Underwood', 'aunderwood@gmail.com');

INSERT INTO website
(website_name, url)
VALUES
('U.S. News', 'http://www.usnews.com'),
('Github', 'https://github.com'),
('Facebook', 'https://facebook.com'),
('The New York Times', 'https://nytimes.com');

INSERT INTO credentials
(user_id, website_id, username, passphrase, created_at, comments)
VALUES (
    1,
    1,
    'mlittle',
    AES_ENCRYPT('ml_W6%272dC', @key_str, @init_vector),
    CURRENT_TIMESTAMP,
    'Reset password if login fails after three attempts'
),
(
    1,
    3,
    'm_little',
    AES_ENCRYPT('ml_z/&5D1a5', @key_str, @init_vector),
    CURRENT_TIMESTAMP,
    'First pet name is teddy'
),
(
    2,
    2,
    'jandrews',
    AES_ENCRYPT('ja_30YWx,#5', @key_str, @init_vector),
    CURRENT_TIMESTAMP,
    'Two-factor authentication enabled'
),
(
    2,
    4,
    'j_andrews',
    AES_ENCRYPT('ja_vH$47.E2', @key_str, @init_vector),
    CURRENT_TIMESTAMP,
    'Mother maiden name is smith'
),
(
    3,
    1,
    'cbrock',
    AES_ENCRYPT('cb_jS2"872/', @key_str, @init_vector),
    CURRENT_TIMESTAMP,
    'Change password every 3 months'
),
(
    3,
    2,
    'c_brock',
    AES_ENCRYPT('cb_.02Et9k8', @key_str, @init_vector),
    CURRENT_TIMESTAMP,
    NULL
),
(
    3,
    3,
    'c__brock',
    AES_ENCRYPT('cb_3t^pU4n6', @key_str, @init_vector),
    CURRENT_TIMESTAMP,
    'Personal Facebook account'
),
(
    4,
    2,
    'afuller',
    AES_ENCRYPT('af_Grl105)?', @key_str, @init_vector),
    CURRENT_TIMESTAMP,
    'First job was at Target'
),
(
    5,
    4,
    'aunderwood',
    AES_ENCRYPT('au_3121_Qbk', @key_str, @init_vector),
    CURRENT_TIMESTAMP,
    NULL
),
(
    5,
    3,
    'a_underwood',
    AES_ENCRYPT('au_P70oe[5z', @key_str, @init_vector),
    CURRENT_TIMESTAMP,
    'Inactive for now; consider reactivation'
);
