-- Views 
--  CustomerOrder View helps show all the orders a customer has made.

CREATE VIEW CustomerOrders AS
SELECT o.Order_id, o.Total_Price, c.Name, c.Email
FROM Orders o
JOIN Customers c ON o.Customer_id = c.Customer_id;

-- RestaurantOrdersWithCustomers View helps show a restaurants orders alognside the customers who made the orders.

CREATE VIEW RestaurantOrdersWithCustomers AS
SELECT 
    o.Order_id,
    r.Name AS NameRes,
    r.Location,
    c.Name,
    o.Total_Price
FROM 
    Orders o
JOIN 
    Restaurants r ON o.Restaurant_id = r.Restaurant_id
JOIN 
    Customers c ON o.Customer_id = c.Customer_id;
    

-- RiderDeliveries View helps show the delivery details such as rider details, customer details and the restaurant details.

CREATE VIEW RiderDeliveries AS
SELECT 
    r.Rider_id,
    r.Name AS NameRider,
    r.Phone_Number AS Phone,
    r.Vehicle_Type,
    r.Vehicle_Registration,
    o.Order_id,
    c.Name AS Name,
    c.Phone_Number AS CustomerPhone,
    c.Location AS CustomerLocation,
    res.Name AS RestaurantName,
    res.Location AS RestaurantLocation,
    o.Total_Price AS OrderTotal
FROM 
    Riders r
JOIN 
    Orders o ON r.Assigned_Restaurant_id = o.Restaurant_id
JOIN 
    Customers c ON o.Customer_id = c.Customer_id
JOIN 
    Restaurants res ON o.Restaurant_id = res.Restaurant_id; 
    
    -- Creates a view with customer order details including the order items 
CREATE VIEW CustomerOrderDetails AS
SELECT 
    c.Name AS CustomerName,
    c.Email AS CustomerEmail,
    mi.Food_Name,
	COUNT(DISTINCT o.Order_id) AS TotalOrders,
    oi.Quantity * mi.Price AS Subtotal

FROM 
    Customers c
JOIN 
    Orders o ON c.Customer_id = o.Customer_id
JOIN 
    Order_Items oi ON o.Order_id = oi.Order_id
JOIN 
    Menu_Items mi ON oi.Item_id = mi.Item_id
GROUP BY
	c.Customer_id, c.Name, c.Email
ORDER BY 
    c.Name, o.Order_id;
