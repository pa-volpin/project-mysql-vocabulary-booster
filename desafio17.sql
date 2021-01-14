USE w3schools;
DROP TRIGGER IF EXISTS insere_data;

DELIMITER $$
CREATE TRIGGER insere_data
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
  SET NEW.OrderDate = DATE(NOW());
END $$
DELIMITER ;

-- INSERT INTO orders(CustomerID, EmployeeID, ShipperID) VALUES (1, 1, 1);
