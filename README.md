# cafe-management-system-
☕ Cafe Management System
📌 Project Overview
The Cafe Management System is a simple Java-based console application connected to a MySQL database. It allows café staff to manage customer orders by displaying a live menu, accepting orders, calculating total bills, and storing transaction data in the database.

✅ Features
Displays café menu stored in a MySQL database

Accepts multiple item orders from customers

Calculates total bill based on item quantity and pricing

Records customer order details (name, items, payment method)

Supports basic CRUD structure (create/read for orders and menu)

🛠️ Technologies Used
Java (JDBC for database connection)

MySQL (Relational database)

SQL (Data definition and manipulation)

Scanner (Java.util) for console input

🗃️ Database Tables
menu – stores item details such as item name, description, price, and availability

customer_orders – stores order information including customer name, ordered items, bill amount, and payment method

🚀 How to Run
Set up MySQL and create the cafe database with the provided schema.

Update database credentials in the Java code if necessary.

Compile and run the Java program.

Use the console to interact with the system, place orders, and record transactions.

🔐 Credentials (Example)
Username: root

Password: your password

(Make sure to secure or replace credentials in production)

📚 Learning Objectives
Learn basic Java database connectivity using JDBC

Practice SQL DDL and DML commands

Understand menu-driven program development

Get introduced to transaction processing in a retail setting
