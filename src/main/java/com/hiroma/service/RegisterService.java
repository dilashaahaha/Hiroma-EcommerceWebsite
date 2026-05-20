package com.hiroma.service;

import com.hiroma.dao.UserDAO;
import com.hiroma.model.UserModel;
import com.hiroma.util.PasswordUtil;
import com.hiroma.util.ValidationUtil;

import java.sql.Date;
import java.sql.SQLException;

public class RegisterService {

    private UserDAO userDAO = new UserDAO();

    public String registerUser(String fullName, String email, String phone,
                                String password, String confirmPassword, String dob) {

        // Validation checks
        if (ValidationUtil.isEmpty(fullName) || ValidationUtil.isEmpty(email) ||
            ValidationUtil.isEmpty(phone) || ValidationUtil.isEmpty(password) ||
            ValidationUtil.isEmpty(dob)) {
            return "All fields are required.";
        }

        if (!ValidationUtil.isValidName(fullName)) {
            return "Full name must contain letters only.";
        }

        if (!ValidationUtil.isValidEmail(email)) {
            return "Please enter a valid email address.";
        }

        if (!ValidationUtil.isValidPhone(phone)) {
            return "Phone number must be exactly 10 digits.";
        }

        if (!ValidationUtil.isValidPassword(password)) {
            return "Password must be at least 6 characters.";
        }

        if (!password.equals(confirmPassword)) {
            return "Passwords do not match.";
        }

        try {
            if (userDAO.emailExists(email)) {
                return "An account with this email already exists.";
            }

            if (userDAO.phoneExists(phone)) {
                return "An account with this phone number already exists.";
            }

            UserModel user = new UserModel();
            user.setFullName(fullName);
            user.setEmail(email);
            user.setPhone(phone);
            user.setPassword(PasswordUtil.encrypt(password));
            user.setDob(Date.valueOf(dob));

            boolean success = userDAO.registerUser(user);
            return success ? "success" : "Registration failed. Please try again.";

        } catch (SQLException e) {
            e.printStackTrace();
            return "Database error. Please try again.";
        }
    }
}