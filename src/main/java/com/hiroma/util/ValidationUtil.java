package com.hiroma.util;

public class ValidationUtil {

    // Check if a string is null or empty
    public static boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }

    // Name should only contain letters and spaces
    public static boolean isValidName(String name) {
        return name != null && name.matches("[a-zA-Z ]+");
    }

    // Basic email format check
    public static boolean isValidEmail(String email) {
        return email != null && email.matches("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$");
    }

    // Phone must be exactly 10 digits
    public static boolean isValidPhone(String phone) {
        return phone != null && phone.matches("\\d{10}");
    }

    // Password must be at least 6 characters
    public static boolean isValidPassword(String password) {
        return password != null && password.length() >= 6;
    }

    // Price must be a positive number
    public static boolean isValidPrice(String price) {
        try {
            return Double.parseDouble(price) > 0;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    // Stock must be a non-negative integer
    public static boolean isValidStock(String stock) {
        try {
            return Integer.parseInt(stock) >= 0;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}