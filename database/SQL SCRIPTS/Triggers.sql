
-- TRIGGERS

-- update_menu_quantity - used to update the quantity of the menu item after it has been added to an order.
DELIMITER //
CREATE TRIGGER update_menu_quantity
AFTER INSERT ON Order_Items
FOR EACH ROW
BEGIN
  UPDATE Menu_Items
  SET Quantity = Quantity - NEW.Quantity
  WHERE Item_id = NEW.Item_id;
END;
//
DELIMITER ;


-- CalculateTotalPrice - Used to calculate the total price of an order.
DELIMITER $$
CREATE TRIGGER CalculateTotalPrice
AFTER INSERT ON Order_Items
FOR EACH ROW
BEGIN
    DECLARE total_price DECIMAL(10, 2);
    SELECT SUM(Menu_Items.Price * Order_Items.Quantity)
    INTO total_price
    FROM Order_Items
    JOIN Menu_Items ON Order_Items.Item_id = Menu_Items.Item_id
    WHERE Order_Items.Order_id = NEW.Order_id;

    UPDATE Orders
    SET Total_Price = total_price
    WHERE Order_id = NEW.Order_id;
END$$
DELIMITER ;
 
-- UpdatePaymentStatus - Used to update the total price of an order once the order_id is update as completed.
DELIMITER $$
CREATE TRIGGER UpdatePaymentStatus
AFTER INSERT ON Payments
FOR EACH ROW
BEGIN
    IF NEW.Payment_Status = 'Completed' THEN
        UPDATE Orders
        SET Total_Price = 0
        WHERE Order_id = NEW.Order_id;
    END IF;
END$$
DELIMITER ;


-- CreateOrderIfNotExists - Used to create an Order_id if an Order_Item is added to the table.
DELIMITER $$
CREATE TRIGGER CreateOrderIfNotExists
BEFORE INSERT ON Order_Items
FOR EACH ROW
BEGIN
    DECLARE temp_customer_id INT;
    DECLARE temp_restaurant_id INT;

    -- Check if the associated order already exists
    IF NOT EXISTS (
        SELECT 1 
        FROM Orders 
        WHERE Order_id = NEW.Order_id
    ) THEN
        -- Set default or placeholder values for Customer_id and Restaurant_id
        SET temp_customer_id = 1; -- Replace with your default customer ID or logic to determine it
        SET temp_restaurant_id = 1; -- Replace with your default restaurant ID or logic to determine it

        -- Create a new order with default values
        INSERT INTO Orders (Order_id, Customer_id, Restaurant_id, Total_Price)
        VALUES (
            NEW.Order_id, 
            temp_customer_id, 
            temp_restaurant_id, 
            0 -- Initial Total_Price, will be updated later
        );
    END IF;
END$$

DELIMITER ;
