# cafe-management-system-
package sanjana;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class CafeManagementSystem {

    // MySQL database credentials
    private static final String URL = "jdbc:mysql://localhost:3306/cafe";
    private static final String USER = "root";  
    private static final String PASSWORD = "kathyaeini@1706";  

    // Method to establish the connection
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // Method to fetch and display the cafe menu from the database
    public static Map<Integer, MenuItem> displayCafeMenu() {
        Map<Integer, MenuItem> menuItems = new HashMap<>();
        String query = "SELECT item_id, item_name, description, price, available FROM menu";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            System.out.println("Cafe Menu:");
            System.out.println("------------------------------------------------");
            while (rs.next()) {
                int itemId = rs.getInt("item_id");
                String itemName = rs.getString("item_name");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                boolean available = rs.getBoolean("available");

                if (available) {
                    // Store menu item in the map
                    menuItems.put(itemId, new MenuItem(itemId, itemName, description, price));
                    System.out.printf("Item ID: %d | Name: %s | Description: %s | Price: %.2f%n", 
                            itemId, itemName, description, price);
                }
            }

        } catch (SQLException e) {
            System.out.println("Error while fetching the cafe menu: " + e.getMessage());
        }
        return menuItems;
    }

    // Method to take orders from the customer
    public static double takeOrder(Map<Integer, MenuItem> menuItems) {
        Scanner scanner = new Scanner(System.in);
        double totalPrice = 0.0;

        while (true) {
            System.out.print("Enter the Item ID to order (or 0 to finish): ");
            int itemId = scanner.nextInt();
            if (itemId == 0) {
                break;  // Exit the loop if the customer is finished
            }
            if (menuItems.containsKey(itemId)) {
                System.out.print("Enter the quantity: ");
                int quantity = scanner.nextInt();
                MenuItem item = menuItems.get(itemId);
                double priceForThisItem = item.getPrice() * quantity;
                totalPrice += priceForThisItem;
                System.out.printf("Added %d x %s to your order. Price: %.2f%n", quantity, item.getItemName(), priceForThisItem);
            } else {
                System.out.println("Invalid Item ID. Please try again.");
            }
        }

        return totalPrice;
    }

    public static void main(String[] args) {
        // Display the cafe menu
        Map<Integer, MenuItem> menuItems = displayCafeMenu();
        
        // Take the customer's order
        double totalPrice = takeOrder(menuItems);
        
        // Print the total price
        System.out.printf("Total Price of your order: %.2f%n", totalPrice);
    }
}

// MenuItem class to represent an item in the cafe menu
class MenuItem {
    private int itemId;
    private String itemName;
    private String description;
    private double price;

    public MenuItem(int itemId, String itemName, String description, double price) {
        this.itemId = itemId;
        this.itemName = itemName;
        this.description = description;
        this.price = price;
    }

    public int getItemId() {
        return itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public double getPrice() {
        return price;
    }
}
