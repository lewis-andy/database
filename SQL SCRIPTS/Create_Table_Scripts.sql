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
    Description VARCHAR(255) 
);

-- Create Menu_Items Table 
CREATE TABLE Menu_Items (
    Item_id INT PRIMARY KEY AUTO_INCREMENT,
    Menu_id INT,
    Food_Name VARCHAR(100) NOT NULL,
    Food_Category ENUM('starter', 'main', 'dessert', 'beverage') NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (Menu_id) REFERENCES Menu(Menu_id) ON DELETE CASCADE
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

-- Create Orders Table
CREATE TABLE Orders (
    Order_id INT PRIMARY KEY AUTO_INCREMENT,
    Customer_id INT,
    Restaurant_id INT,
    Total_Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id),
    FOREIGN KEY (Restaurant_id) REFERENCES Restaurants(Restaurant_id)
);

-- Create Riders Table
CREATE TABLE Riders (
    Rider_id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Phone_Number VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    Vehicle_Type VARCHAR(100) NOT NULL,
    Vehicle_Registration VARCHAR(100) NOT NULL,
    Restaurant_id INT,
    FOREIGN KEY (Restaurant_id) REFERENCES Restaurants(Restaurant_id)
);

-- Create Payments Table
CREATE TABLE Payments (
    Payment_id INT PRIMARY KEY AUTO_INCREMENT,
    Order_id INT,
    Payment_Method ENUM('card', 'cash', 'mpesa') NOT NULL,
    Payment_Status ENUM('Pending', 'Completed') DEFAULT 'Pending',
    FOREIGN KEY (Order_id) REFERENCES Orders(Order_id)
);
