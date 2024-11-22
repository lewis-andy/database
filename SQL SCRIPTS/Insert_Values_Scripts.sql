-- Insert Sample Data into Users Table
INSERT INTO Users (Role, Phone_Number, Password) VALUES
('admin', '0723123456', 'adminpassword'),
('manager', '0712345678', 'managerpassword'),
('customer', '0703456789', 'customerpassword'),
('rider', '0798765432', 'riderpassword');

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
(1, 'The Rusty Spoon', '+254704567890', 'therustyspoon@ke.co', 'Kisumu CBD, Kisumu');