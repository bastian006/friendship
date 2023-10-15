SELECT * FROM friendships;
SELECT * FROM users;

SELECT u.first_name, u.last_name
FROM friendships AS f
JOIN users AS u ON f.friend_id = u.id
WHERE f.user_id = (SELECT id FROM users WHERE first_name = 'kermit');

SELECT COUNT(*) AS count_of_friendships
FROM friendships;

SELECT u.first_name, u.last_name, COUNT(f.id) AS count_of_friends
FROM friendships AS f
JOIN users AS u ON f.user_id = u.id
GROUP BY u.id
ORDER BY count_of_friends DESC
LIMIT 1;

INSERT INTO users (first_name, last_name, created_at, updated_at)
VALUES ('Nuevo', 'Usuario', NOW(), NOW());


-- Obtiene el ID del nuevo usuario
SET @new_user_id = LAST_INSERT_ID();

-- Crea amistad con Eli Byers
INSERT INTO friendships (user_id, friend_id, created_at, updated_at)
VALUES (@new_user_id, (SELECT id FROM users WHERE first_name = 'Eli' AND last_name = 'Byers'), NOW(), NOW());

-- Crea amistad con Kermit The Frog
INSERT INTO friendships (user_id, friend_id, created_at, updated_at)
VALUES (@new_user_id, (SELECT id FROM users WHERE first_name = 'Kermit' AND last_name = 'The Frog'), NOW(), NOW());

-- Crea amistad con Marky Mark
INSERT INTO friendships (user_id, friend_id, created_at, updated_at)
VALUES (@new_user_id, (SELECT id FROM users WHERE first_name = 'Marky' AND last_name = 'Mark'), NOW(), NOW());

SELECT u.first_name, u.last_name
FROM friendships AS f
JOIN users AS u ON f.friend_id = u.id
WHERE f.user_id = (SELECT id FROM users WHERE first_name = 'Eli' AND last_name = 'Byers')
ORDER BY u.last_name, u.first_name;

DELETE FROM friendships
WHERE user_id = (SELECT id FROM users WHERE first_name = 'Eli' AND last_name = 'Byers')
AND friend_id = (SELECT id FROM users WHERE first_name = 'Marky' AND last_name = 'Mark');

SELECT u1.first_name AS user_first_name, u1.last_name AS user_last_name,
       u2.first_name AS friend_first_name, u2.last_name AS friend_last_name
FROM friendships AS f
JOIN users AS u1 ON f.user_id = u1.id
JOIN users AS u2 ON f.friend_id = u2.id;


