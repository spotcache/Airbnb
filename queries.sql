
-- @block
CREATE TABLE Users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    bio TEXT,
    country VARCHAR(2)
);

-- @block
INSERT INTO Users (email, bio, country) -- not adding "id" cuz its auto generated
VALUES (
    'helloworld@gg.com',
    'i lov strangers',
    'US'
);

-- @block
INSERT INTO Users (email, bio, country)
VALUES 
    ('hello@world.com','woo','US'),
    ('dudeman@lol.com','baz','MX'),
    ('hola@yahoo.com','bar','FR');

-- @block
SELECT * FROM Users; -- selects everything in the table

-- @block
SELECT email, id, country FROM Users; -- selects specific columns

-- @block
SELECT email, id, country FROM Users
LIMIT 2; -- limiting the output

-- @block
SELECT email, id, country FROM Users
ORDER BY id DESC -- filtering the output by id
LIMIT 2; 

-- @block
SELECT email, id, country FROM Users
WHERE country = 'US' -- running conditional logic
ORDER BY id DESC
LIMIT 2;

-- @block
SELECT email, id, country FROM Users
WHERE country = 'US'
AND id > 1 -- additional condition statements
ORDER BY id DESC
LIMIT 2;

-- @block
SELECT email, id, country FROM Users
WHERE country = 'US'
AND email LIKE 'h%' -- starting with letter H // '%h' for ending with H
ORDER BY id DESC
LIMIT 2;

-- @block
CREATE INDEX email_index ON Users(email);
-- just for better search results dont worry skip it

-- @block
CREATE TABLE Rooms(
    id INT AUTO_INCREMENT,
    street VARCHAR(255),
    owner_id INT NOT NULL,
    PRIMARY KEY (id), -- when having both primary and foreign keys its to better reference it in the end
    FOREIGN KEY (owner_id) REFERENCES Users(id)
); -- here the foreign key is 'owner_id' which is referencing the 'id' column of the Users table
-- and we are doing all this so theres no duplicated data (remember all the ids are the same [0,1,2,etc])

-- @block
INSERT INTO Rooms (owner_id, Street)
VALUES 
    (1, 'san diego boat'),
    (1, 'tuccket cottage'),
    (1, 'vail cabin'),
    (1, 'cardboard box');

-- @block
SELECT * FROM Users
INNER JOIN rooms
ON Rooms.owner_id = Users.id;

-- @block
SELECT * FROM Users
LEFT JOIN rooms
ON Rooms.owner_id = Users.id;

-- @block
CREATE TABLE Bookings(
    id INT AUTO_INCREMENT,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATETIME,
    PRIMARY KEY (id),
    FOREIGN KEY (guest_id) REFERENCES Users(id), -- here the foreign key is 'guest_id' which is referencing the 'id' column of the Users table
    FOREIGN KEY (room_id) REFERENCES Rooms(id)  -- here the foreign key is 'room_id' which is referencing the 'id' column of the Rooms table
);

-- @block
SELECT
    guest_id,
    street,
    check_in
FROM Bookings
INNER JOIN Rooms ON Rooms.owner_id = guest_id
WHERE guest_id = 1;

-- @block
DROP TABLE Users;
DROP DATABASE airbnb;

