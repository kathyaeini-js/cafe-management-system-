- Drop the database if it already exists (optional, use with caution) 
DROP DATABASE IF EXISTS cafe; -- Create the database 
CREATE DATABASE cafe; -- Use the created database 
USE cafe; -- Create the menu table 
CREATE TABLE menu ( 
    item_id INT AUTO_INCREMENT PRIMARY KEY, 
    item_name VARCHAR(100) NOT NULL, 
    description TEXT, 
    price DECIMAL(10, 2) NOT NULL, 
    available BOOLEAN DEFAULT TRUE 
); -- Insert sample data into the menu table 
INSERT INTO menu (item_name, description, price, available) VALUES 
('Coffee', 'Hot brewed coffee', 100.00, TRUE), 
('Cappuccino', 'Espresso-based coffee drink', 150.00, TRUE), 
                                                                                                                                                
                                                                                                                                                                              
('Tea', 'Hot brewed tea', 80.00, TRUE), 
('Sandwich', 'Grilled cheese sandwich', 120.00, TRUE), 
('Pastry', 'Fresh baked pastry', 60.00, TRUE); -- Check the inserted data 
SELECT * FROM menu;
