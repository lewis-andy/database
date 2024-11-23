 -- Table Creation Scripts

-- Create Users Table
CREATE TABLE Users (
    User_id INT PRIMARY KEY AUTO_INCREMENT,
    Role ENUM('admin', 'manager', 'customer', 'rider') NOT NULL,
    Phone_Number VARCHAR(100) NOT NULL,
    Password VARCHAR(255) NOT NULL
);

-- Create Customers Table
CREATE TABLE Customers (
    Customer_id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Phone_Number VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    Location VARCHAR(100) NOT NULL
);

-- Create Menu Table
CREATE TABLE Menu (
    Menu_id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Description LONGTEXT NOT NULL
);

-- Create Restaurants Table
CREATE TABLE Restaurants (
    Restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    Menu_id INT,
    Name VARCHAR(255) NOT NULL,
    Phone_Number VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    Location VARCHAR(100) NOT NULL,
    FOREIGN KEY (Menu_id) REFERENCES Menu(Menu_id)
);

-- Create Menu_Items Table
CREATE TABLE Menu_Items (
    Item_id INT PRIMARY KEY AUTO_INCREMENT,
    Menu_id INT,
    Food_Name VARCHAR(100) NOT NULL,
    Food_Category ENUM('starter', 'main', 'dessert', 'beverage') NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (Menu_id) REFERENCES Menu(Menu_id)
);

-- Create Orders Table
CREATE TABLE Orders (
    Order_id INT PRIMARY KEY AUTO_INCREMENT,
    Customer_id INT,
    Restaurant_id INT,
    Total_Price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id),
    FOREIGN KEY (Restaurant_id) REFERENCES Restaurants(Restaurant_id)
);

-- Create Order_Items Table
CREATE TABLE Order_Items (
    Order_Item_id INT PRIMARY KEY AUTO_INCREMENT,
    Order_id INT,
    Item_id INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (Order_id) REFERENCES Orders(Order_id),
    FOREIGN KEY (Item_id) REFERENCES Menu_Items(Item_id)
);

-- Create Riders Table
CREATE TABLE Riders (
    Rider_id INT PRIMARY KEY AUTO_INCREMENT,
    User_id INT,
    Name VARCHAR(255) NOT NULL,
    Phone_Number VARCHAR(15) UNIQUE NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Vehicle_Type VARCHAR(100) NOT NULL,
    Vehicle_Registration VARCHAR(100) NOT NULL,
    Assigned_Restaurant_id INT,
    FOREIGN KEY (User_id) REFERENCES Users(User_id),
    FOREIGN KEY (Assigned_Restaurant_id) REFERENCES Restaurants(Restaurant_id)
);

-- Create Payments Table
CREATE TABLE Payments (
    Payment_id INT PRIMARY KEY AUTO_INCREMENT,
    Order_id INT,
    Payment_Method ENUM('card', 'cash', 'mpesa') NOT NULL,
    Payment_Status ENUM('Pending', 'Completed') DEFAULT 'Pending',
    FOREIGN KEY (Order_id) REFERENCES Orders(Order_id)
);
