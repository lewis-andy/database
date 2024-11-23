-- Table population with data

-- Insert Sample Data into Users Table
INSERT INTO Users (Role, Phone_Number, Password) VALUES
('admin', '0723123456', 'adminpassword'),
('manager', '0712345678', 'managerpassword'),
('customer', '0703456789', 'customerpassword'),
('rider', '0798765432', 'riderpassword');

-- Insert Sample Data into Customers Table
INSERT INTO Customers (Name, Phone_Number, Email, Location) VALUES
('John Mwangi', '0703456789', 'johnmwangi@email.com', 'Nairobi, Kenyatta Avenue'),
('Mary Wambui', '0721234567', 'marywambui@email.com', 'Nakuru, Kenyatta Street'),
('Peter Njoroge', '0732123456', 'peternjoroge@email.com', 'Mombasa, Moi Avenue');

-- Insert Sample Data into Menu Table
INSERT INTO Menu (Name, Description) VALUES
('Kenyan Delights', 'A variety of local Kenyan dishes including Nyama Choma, Ugali, Sukuma, and more.'),
('Fast Food', 'A menu of quick and tasty options including Burgers, Fries, and Soft Drinks.');

-- Insert Sample Data into Restaurants Table
INSERT INTO Restaurants (Menu_id, Name, Phone_Number, Email, Location) VALUES
(1, 'Mama Njoki’s Kitchen', '0701234567', 'mamanjoki@email.com', 'Nairobi, Kenyatta Avenue'),
(2, 'Quick Bites', '0731234567', 'quickbites@email.com', 'Mombasa, Moi Avenue');

-- Insert Sample Data into Menu_Items Table (Corrected)
INSERT INTO Menu_Items (Menu_id, Food_Name, Food_Category, Price, Quantity) VALUES
(1, 'Nyama Choma', 'main', 800.00, 50),
(1, 'Ugali', 'main', 100.00, 100),  -- 'main' is appropriate for Ugali
(1, 'Sukuma Wiki', 'main', 50.00, 100),  -- 'main' is appropriate for Sukuma Wiki
(2, 'Cheese Burger', 'main', 500.00, 30),
(2, 'French Fries', 'starter', 200.00, 50),  -- Changed to 'starter'
(2, 'Coca Cola', 'beverage', 150.00, 100);  -- 'beverage' is appropriate for Coca Cola


-- Insert Sample Data into Orders Table
INSERT INTO Orders (Customer_id, Restaurant_id, Total_Price) VALUES
(1, 1, 1000.00),
(2, 2, 850.00),
(3, 1, 950.00);

-- Insert Sample Data into Order_Items Table
INSERT INTO Order_Items (Order_id, Item_id, Quantity) VALUES
(1, 1, 1), -- Nyama Choma
(1, 2, 2), -- Ugali
(2, 3, 1), -- Sukuma
(2, 4, 1), -- Cheese Burger
(2, 5, 2), -- French Fries
(3, 6, 1), -- Nyama Choma
(3, 1, 1); -- Coca Cola



-- Insert Sample Data into Riders Table
INSERT INTO Riders (User_id, Name, Phone_Number, Email, Vehicle_Type, Vehicle_Registration, Assigned_Restaurant_id) VALUES
(4, 'James Kariuki', '0798765432', 'jameskariuki@email.com', 'Motorbike', 'KBD123L', 1),
(4, 'Wanjiru Mwangi', '0787654321', 'wanjirumwangi@email.com', 'Car', 'KBB234M', 2);

-- Insert Sample Data into Payments Table
INSERT INTO Payments (Order_id, Payment_Method, Payment_Status) VALUES
(1, 'cash', 'Completed'),
(2, 'mpesa', 'Pending'),
(3, 'card', 'Completed');
