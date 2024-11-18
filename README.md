
# Food Delivery Management System (FDMS)




## Table of Contents


- [Project Overview](#project-overview)
- [Objectives](#objectives)
  - [General Objectives](#general-objectives)
  - [Specific Objectives](#specific-objectives)
- [Scope](#scope)
  - [Customer View](#customer-view)
  - [Restaurant View](#restaurant-view)
  - [Riders View](#riders-view)
  - [Administrator View](#administrator-view)
- [Requirements Analysis](#requirements-analysis)
  - [Functional Requirements](#functional-requirements)
  - [Non-Functional Requirements](#non-functional-requirements)
- [Database Design](#database-design)
  - [ER Diagram](#er-diagram)
  - [Schema Diagram](#schema-diagram)
  - [Data Dictionary](#data-dictionary)
  - [Table Scripts](#table-scripts)
- [Security Measures](#security-measures)
- [Conclusion and Future Enhancements](#conclusion-and-future-enhancements)
- [Appendix](#appendix)


## Project Overview


Food Delivery Management System (FDMS) is a database solution designed to optimize and manage the operations of food delivery services. It addresses the challenges of order placement, restaurant inventories, menu availability and delivery rider records. Over the years the food & restaurant industries have grown at rapid rates. The demand for food delivery systems has been on a rampant rise as the current system relies on manual and inefficient record keeping methods. The FDMS enhances order accuracy, ensures seamless communication between restaurants, customers and riders. Through this system we aim to reduce errors by a significant percentage and maximize operational efficiency.
## Objectives

### General Objectives

To develop a database system that helps to manage Food delivery operations such as restaurant details order placement, payment details, menu options and rider details.


### Specific Objectives

- Allow customers to efficiently track orders from placement to delivery.
-  Allow restaurants to manage orders, menus and their delivery riders
-  Allow rider management to easily allocate and deallocate deliveries based on workload.

## Scope

### Customer View

- User registration and user profile management
- Browser restaurants and menus
- Place and manage orders
- Secure online payment integration

### Registration View

- Create, update and delete menu
- Customer order management

### Riders View

- Rider registration and profile management
- Rider assigned orders

### Administrator View

- Manage customers, restaurants  and riders
- Generate performance reports





## Requirements Analysis

### Functional Requirements

CRUD Operations:

- **Customer Operations**:
  1. Browse menus
  2. Place orders 
  3. Cancel orders

- **Restaurant**: 
  1. Add, update  and delete menu items
  2. Set item availability and pricing
  3. Set received orders as 'In progress' or 'Delivery in Progress'
  4. Assign rider order for delivery


- **Administrator**:

  1. Add,update or remove customers, restaurants and riders
  2. Generate reports on sales

### Non-Functional Requirements

  -  The system should be scalable to allow for growth in customers, riders and restaurants
  -  Implement role based access to protect sensitive data.
  -  Ensure minimal latency.



  


## Database Design

### ER Diagram

Show entities, attributes, and relationships between entities.



### Schema Diagram



### Data Dictionary

#### Users


| Column Name   | Data Type     | Constraints                               |
|---------------|---------------|------------------------------------------|
| User_id       | INT           | PRIMARY KEY, AUTO_INCREMENT              |
| Role          | ENUM          | NOT NULL (admin/ manager/ customer/ rider) |
| Phone_Number  | VARCHAR(100)  | NOT NULL                                 |
| Password       | VARCHAR(100)           | NOT NULL              |


#### Customers


| Column Name   | Data Type     | Constraints                              |
|---------------|---------------|------------------------------------------|
| Customer_id   | INT           | PRIMARY KEY, AUTO_INCREMENT |
| Name          | VARCHAR(255)| NOT NULL|
| Phone_Number   | VARCHAR(100)| NOT NULL|
| Email| VARCHAR(255)  | UNIQUE|
| Location| VARCHAR(100)  | NOT NULL|


#### Restaurants


| Column Name   | Data Type     | Constraints                               |
|---------------|---------------|------------------------------------------|
| Restaurant_id | INT | PRIMARY KEY, AUTO_INCREMENT|
| Menu_id          | INT | FOREIGN KEY REFERENCES Menu(Menu_id)|
| Name          | VARCHAR(255)  | NOT NULL  |
| Phone_Number  | VARCHAR(100)  | NOT NULL|
| Email       | VARCHAR(255)| UNIQUE|
| Location | VARCHAR(100)  | NOT NULL|


#### Menu


| Column Name   | Data Type     | Constraints                               |
|---------------|---------------|------------------------------------------|
| Menu_id       | INT           | PRIMARY KEY, AUTO_INCREMENT              |
| Name          | VARCHAR(100)  | NOT NULL|
| Description | LONG TEXT| NOT NULL |




#### Menu_items

| Column Name   | Data Type     | Constraints                               |
|---------------|---------------|------------------------------------------|
| Item_id       | INT           | PRIMARY KEY, AUTO_INCREMENT              |
| Menu_id          | INT          | FOREIGN KEY REFERENCES Menu(Menu_id) |
| Food_Name   | VARCHAR(100)           | NOT NULL              |
| Food_Category          | ENUM  | NOT NULL(starter/main/dessert/beverage)                                |
| Price  | Decimal(10,2)  | NOT NULL                                 |
| Quantity       | INT           | NOT NULL              |


#### Order


| Column Name   | Data Type     | Constraints                               |
|---------------|---------------|------------------------------------------|
| Order_id       | INT           | PRIMARY KEY, AUTO_INCREMENT|
| Customer_id   | INT| FOREIGN KEY REFERENCES Customers(Customer_id)|
| Restaurant_id| INT| FOREIGN KEY REFERENCES Customers(Customer_id)|
| Total_Price| Decimal(10,2) | NOT NULL |


#### Riders


| Column Name   | Data Type     | Constraints                               |
|---------------|---------------|------------------------------------------|
| Rider_id       | INT           | PRIMARY KEY, AUTO_INCREMENT|
| Name| INT | FOREIGN KEY REFERENCES Customers(Customer_id)|
| Phone_Number   | INT           | FOREIGN KEY REFERENCES Restaurants(Restaurant_id)|
| Email | VARCHAR(255) | NOT NULL                                 |
| Vehicle_Type| VARCHAR(100)  | NOT NULL                                 |
| Vehicle_Registration| VARCHAR(100)| NOT NULL|
| Restaurant_id     | INT| FOREIGN KEY REFERENCES Restaurant(Restaurant_id)|

#### Riders


| Column Name   | Data Type     | Constraints                               |
|---------------|---------------|------------------------------------------|
| Payment_id       | INT| PRIMARY KEY, AUTO_INCREMENT|
| Order_id   | INT           | FOREIGN KEY REFERENCES Orders(Order_id)|
| Payment_Method  | ENUM| NOT NULL (card/cash/mpesa)|
| Payment_Status| ENUM | DEFAULT 'Pending' |


### Table Scripts

**Table Creation Scripts:**

-- Create Customers Table
CREATE TABLE Customers (
    Customer_id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Phone_Number VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    Location VARCHAR(100) NOT NULL
);

-- Create Menu Table (Categorization Table)
CREATE TABLE Menu (
    Menu_id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL, -- Name of the menu (e.g., "Breakfast Menu", "Dinner Menu")
    Description VARCHAR(255) -- Optional description of the menu
);

-- Create Menu_Items Table (Specific Items for Each Menu)
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

** Sample Data Scripts: **

-- Insert Customers
INSERT INTO Customers (Customer_id, Name, Phone_Number, Email, Location) VALUES
(1, 'Wanjiru', '0701-123-456', 'wanjiru@gmail.com', 'Nairobi CBD'),
(2, 'Otieno', '0722-234-567', 'otieno@yahoo.com', 'Kisumu West'),
(3, 'Mwangi', '0733-345-678', 'mwangi@outlook.com', 'Thika Town'),
(4, 'Achieng', '0744-456-789', 'achieng@hotmail.com', 'Mombasa Old Town'),
(5, 'Mutua', '0755-567-890', 'mutua@kenya.com', 'Machakos Center'),
(6, 'Njenga', '0766-678-901', 'njenga@africaonline.co.ke', 'Karen Estate'),
(7, 'Wambui', '0777-789-012', 'wambui@kmail.co.ke', 'Westlands, Nairobi'),
(8, 'Omwoyo', '0788-890-123', 'omwoyo@kenyamail.com', 'Kisii Town'),
(9, 'Kibet', '0799-901-234', 'kibet@rmail.co.ke', 'Eldoret Central'),
(10, 'Njeri', '0708-012-345', 'njeri@kenyalink.com', 'Nyeri Town');

-- Insert menu values
INSERT INTO Menu (Menu_id, Name, Description)
VALUES
(1, 'The Hungry Bear Breakfast Menu', 'A delicious breakfast menu with international and local options.'),
(2, 'Pasta Palace Lunch Menu', 'A selection of fresh pastas and sauces for a perfect midday meal.'),
(3, 'Sizzling Grill BBQ Menu', 'A selection of meats and BBQ items grilled to perfection.');

-- Insert restaurant values
INSERT INTO Restaurants (Menu_id, Name, Phone_Number, Email, Location)
VALUES
(2, 'The Hungry Bear', '123-456-7890', 'contact@hungrybear.com', 'Nairobi, Kenya'),
(3, 'Pasta Palace', '321-654-9870', 'contact@pastapalace.com', 'Mombasa, Kenya'),
(4, 'Sizzling Grill', '456-789-1230', 'contact@sizzlinggrill.com', 'Kisumu, Kenya');

-- Insert sample menu items
INSERT INTO Menu_Items (Menu_id, Food_Name, Food_Category, Price, Quantity)
VALUES
(1, 'Nyama Choma', 'main', 800.00, 100), 
(1, 'Sukuma', 'main', 150.00, 150),
(1, 'Chapati', 'main', 120.00, 200); 

INSERT INTO Restaurants (Menu_id, Name, Phone_Number, Email, Location) VALUES
(1, 'The Hungry Bear', '+254701234567', 'info@hungrybear.co.ke', 'Westlands, Nairobi'),
(2, 'Pasta Palace', '+254702345678', 'contact@pastapalace.co.ke', 'Karen, Nairobi'),
(1, 'Sizzling Grill', '+254703456789', 'support@sizzlinggrill.co.ke', 'Nyali, Mombasa'),
(1, 'The Rusty Spoon', '+254704567890', 'therustyspoon@ke.co', 'Kisumu CBD, Kisumu'),
(1, 'Mama's Kitchen', '+254705678901', 'hello@mamas.co.ke', 'Thika Road, Nairobi'),
(2, 'Lakeview Lounge', '+254706789012', 'reservations@lakeview.co.ke', 'Naivasha Town, Naivasha'),
(1, 'Coastal Delights', '+254707890123', 'coastaldelights@ke.co', 'Diani Beach, Kwale'),
(1, 'Savanna Bites', '+254708901234', 'info@savannabites.co.ke', 'Eldoret CBD, Eldoret'),
(1, 'Urban Spice', '+254709012345', 'urban@spice.ke', 'Langata, Nairobi'),
(1, 'The Garden Grill', '+254701987654', 'grill@garden.co.ke', 'Ruiru, Kiambu');





## Security Measures

- Authentication:Users log in with a unique username and a strong password that meets security standards i.e minimum length and inclusion of special characters.
- Authorization: Implementing a role based access control to ensure only authorized parties access certain parts of the database.
- Admin: Full access to all tables and actions (CRUD operations, adding/removing users, and backups).
- Manager: Limited access to data related to their responsibility (e.g., viewing/editing records but not deleting).
- Customer/Rider: Restricted to their personal data, such as viewing their orders or profiles.
- Encryption: Sensitive and personal data is encrypted using secure algorithms.
- Passwords: Stored using a secure hashing algorithm like bcrypt or Argon2. 
- Personal Information: Personal fields like email, phone numbers, and addresses are encrypted using SHA-256 encryption.
- Backup and Recovery: Regular backups to be carried incase system crashes ensuring easy recovery.