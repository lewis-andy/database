-- Updates the payment status based on the payment_id
UPDATE Payments
SET Payment_Status = 'Completed'
WHERE Payment_id = 10;

-- Updates the Orders table based on the order_id
UPDATE Orders
SET Rider_ID = 8
WHERE Order_id = 202;
