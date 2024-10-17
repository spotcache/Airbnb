## Overview:
This SQL file, named queries.sql, provides a complete setup for creating an Airbnb-like database. It includes the creation of tables for users, rooms, and bookings, along with various SQL commands to manage data efficiently.

## Database Structure:
1. Users Table
The Users table stores user information.

```
CREATE TABLE Users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    bio TEXT,
    country VARCHAR(2)
);
```
id: Unique identifier for each user (auto-incremented).
email: User's email, must be unique.
bio: Short biography of the user.
country: User's country (2-letter code).
2. Inserting Users:
Add sample users to the Users table:

```INSERT INTO Users (email, bio, country) VALUES 
    ('helloworld@gg.com', 'i love strangers', 'US'),
    ('hello@world.com', 'woo', 'US'),
    ('dudeman@lol.com', 'baz', 'MX'),
    ('hola@yahoo.com', 'bar', 'FR');
```
3. Querying Users:
Various SQL queries to retrieve user data:
```
SELECT * FROM Users; -- Selects all users
SELECT email, id, country FROM Users; -- Selects specific columns
SELECT email, id, country FROM Users LIMIT 2; -- Limits output
SELECT email, id, country FROM Users WHERE country = 'US' ORDER BY id DESC LIMIT 2;
```
4. Rooms Table:
The Rooms table stores information about rental properties.
```
CREATE TABLE Rooms (
    id INT AUTO_INCREMENT,
    street VARCHAR(255),
    owner_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES Users(id)
);
```
id: Unique identifier for each room (auto-incremented).
street: Address of the room.
owner_id: References the user who owns the room.
5. Inserting Rooms:
Add sample rooms to the Rooms table:
```
INSERT INTO Rooms (owner_id, street) VALUES 
    (1, 'san diego boat'),
    (1, 'tucket cottage'),
    (1, 'vail cabin'),
    (1, 'cardboard box');
```
6. Joining Tables:
Retrieve data using joins:
```
SELECT * FROM Users INNER JOIN Rooms ON Rooms.owner_id = Users.id; -- Inner join
SELECT * FROM Users LEFT JOIN Rooms ON Rooms.owner_id = Users.id; -- Left join
```
7. Bookings Table:
The Bookings table manages bookings made by users.
```
CREATE TABLE Bookings (
    id INT AUTO_INCREMENT,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATETIME,
    PRIMARY KEY (id),
    FOREIGN KEY (guest_id) REFERENCES Users(id),
    FOREIGN KEY (room_id) REFERENCES Rooms(id)
);
```
id: Unique identifier for each booking (auto-incremented).
guest_id: References the user who booked.
room_id: References the booked room.
8. Querying Bookings:
Example query for retrieving bookings:
```
SELECT guest_id, street, check_in FROM Bookings INNER JOIN Rooms ON Rooms.id = Bookings.room_id WHERE guest_id = 1;
```
9. Cleanup:
Commands to drop tables and database:
```
DROP TABLE Users;
DROP TABLE Rooms;
DROP TABLE Bookings;
DROP DATABASE airbnb;
```
How to Use:
Create a Database: Run the following command in your SQL client:
```
CREATE DATABASE airbnb;
USE airbnb;
```
Run the SQL Script: Copy the contents of queries.sql into your SQL client and execute.