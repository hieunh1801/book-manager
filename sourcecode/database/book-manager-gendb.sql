
CREATE DATABASE book_management;
USE book_management;

CREATE TABLE category(
    id INT PRIMARY KEY AUTO_INCREMENT ,
    code NVARCHAR(10),
    name NVARCHAR(200),
    note TEXT
);

CREATE TABLE book(
    id INT PRIMARY KEY AUTO_INCREMENT ,
    code NVARCHAR(10),
    name NVARCHAR(200),
    description TEXT,
    image_url TEXT,
    author NVARCHAR(200),
    publisher NVARCHAR(200),
    amount INT,

    category_id INT NOT NULL
);

CREATE TABLE system_param (
    id INT PRIMARY KEY AUTO_INCREMENT ,
    code NVARCHAR(10),
    name NVARCHAR(200),
    skey NVARCHAR(200),
    svalue NVARCHAR(200)
);

CREATE TABLE member (
    id INT PRIMARY KEY AUTO_INCREMENT ,
    code NVARCHAR(10),
    full_name NVARCHAR(200),
    date_of_birth DATE,
    address NVARCHAR(2000),
    phone_number VARCHAR(15),
    email VARCHAR(200),
    gender INT,
    avatar_ulr TEXT
);

CREATE TABLE role(
    id INT PRIMARY KEY AUTO_INCREMENT ,
    code NVARCHAR(10),
    name NVARCHAR(200)
);

CREATE TABLE user(
    id INT PRIMARY KEY AUTO_INCREMENT,
    code NVARCHAR(10),
    account NVARCHAR(200),
    full_name NVARCHAR(200),
    date_of_bird DATE,
    address NVARCHAR(200),
    password NVARCHAR(200),
    phone_number VARCHAR(20),
    email NVARCHAR(2000),
    gender INT,
    avatar_url TEXT,

    role_id INT NOT NULL
);

CREATE TABLE borrow(
    id INT PRIMARY KEY AUTO_INCREMENT ,
    code NVARCHAR(10),

    from_date DATE,
    to_date DATE,
    status SMALLINT,

    book_id INT NOT NULL,
    member_id INT NOT NULL
)


