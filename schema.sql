DROP DATABASE IF EXISTS gocial CASCADE;
CREATE DATABASE IF NOT EXISTS gocial;
SET DATABASE = gocial;

CREATE TABLE IF NOT EXISTS users
(
    id              SERIAL  NOT NULL PRIMARY KEY,
    email           VARCHAR NOT NULL UNIQUE,
    username        VARCHAR NOT NULL UNIQUE,
    followers_count INT     NOT NULL DEFAULT 0 CHECK ( followers_count >= 0 ),
    followees_count INT     NOT NULL DEFAULT 0 CHECK ( followees_count >= 0 )
);

CREATE TABLE IF NOT EXISTS follows
(
    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    PRIMARY KEY (follower_id, followee_id)
);

INSERT INTO users (id, email, username)
VALUES (1, 'john@example.org', 'john'),
       (2, 'jane@example.org', 'jane');
