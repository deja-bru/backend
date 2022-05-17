CREATE DATABASE IF NOT EXISTS DEJA_BREW;

USE DEJA_BREW;

CREATE TABLE USERS (
Id INT NOT NULL AUTO_INCREMENT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
Mobile VARCHAR(20),
MobileConfirmed BOOLEAN,
AccountCreated DATETIME,

PRIMARY KEY (Id));

CREATE TABLE CAFES (
Id INT NOT NULL AUTO_INCREMENT, 
CafeName VARCHAR(50),
Address VARCHAR(255),
PostCode VARCHAR(10),
City VARCHAR(255),
Created DATETIME,
Latitude DECIMAL(9,6),
Longitude DECIMAL(9,6),
CafeDescription VARCHAR(500),
OpeningTimes VARCHAR(200),


PRIMARY KEY (Id));


CREATE TABLE REVIEWS (
Id INT NOT NULL AUTO_INCREMENT,
UserId INT,
CafeId INT,
Rating DECIMAL(2,1),
ReviewText VARCHAR(4000),
Created DATETIME,

PRIMARY KEY (Id),
FOREIGN KEY (UserId) REFERENCES USERS(Id),
FOREIGN KEY (CafeId) REFERENCES CAFES(Id),
CHECK (Rating BETWEEN 1.0 AND 5.0)
);

CREATE TABLE CAFE_ATTRIBUTES (
CafeId INT NOT NULL,
VeganFriendly BOOLEAN,
Accessiblity BOOLEAN, 
DogFriendly BOOLEAN,
WorkFriendly BOOLEAN,
Trendy BOOLEAN, 
Parking BOOLEAN,
DateFriendly BOOLEAN,

FOREIGN KEY (CafeId) REFERENCES CAFES(Id));
