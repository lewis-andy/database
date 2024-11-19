
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

## Features

- User roles: Admin, Manager, Customer, Rider.
- Manage restaurants and order made by customers.
- Process Orders and Payments
- Manage restaurant riders.

## Prerequisites

Before you begin, ensure you have the following installed:
1. MySQL Server
2. MYSQL Workbench

## Setup Instructions

Follow these steps to set up the database:

1. Clone the Repository

- Clone the project repository to yor local machine:

```bash
git clone <repository-url>
cd <repository-folder>
```

2. Open MySQL Workbench

- Launch MySQL Workbench.
- Connect to your MySQL Server byu creating or selecting an existing connection.

3. Create the Database

- Open the **_FoodDelivery.sql_** file included in this repository.
- Execute the following commmand to create the database:

```sql
CREATE DATABASE Delivery;
USE Delivery;
```

4. Import the Schema

- Copy the SQL script for creating the tabls from the provided file (**__Create_Table_Scripts.sql__**)
-Paste it into the SQL editor in Workbench.
-Run the script to create all tables.

5. Insert Values in to the tables

To test the database with populated data:
- Execute the SQL script with sample data included in the file. (**__Insert_Values_Scripts.sql__**)
- The execution will populate data for all the tables created previously.

6. Backup and Export 

To back up your database:

- In MySQL Workbench, navigate to **__Server > Data Export__**


## Considerations

- If you have another MySQL version running, such as XAMPP, you may encounter port conflicts. By default:

  - MySQL Workbench uses port **__3306__**.
  - XAMPP also uses port 3306 for its MySQL server.

  ### To resolve this:
  1. Modify the XAMPP MySQL configuration to use port 3307 instead:
    - Open the **_my.ini_** file located in the XAMPP installation folder (**__\xampp\mysql\bin\my.ini__**).
    - Update the port configuration:
    ```ini
    port = 3307
    ```
    - Restart the XAMPP MySQL service.

  2. Ensure Workbench remains on port **_3306_** for compatibiility.
