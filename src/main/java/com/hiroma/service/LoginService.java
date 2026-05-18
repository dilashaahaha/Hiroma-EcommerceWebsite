package com.hiroma.service;

import com.hiroma.dao.UserDAO;
import com.hiroma.model.UserModel;
import com.hiroma.util.PasswordUtil;
import com.hiroma.util.ValidationUtil;

import java.sql.SQLException;

public class LoginService {

    private UserDAO userDAO = new UserDAO();

    public UserModel loginUser(String email, String password) throws SQLException {

        if (ValidationUtil.isEmpty(email) || ValidationUtil.isEmpty(password)) {
            return null;
        }

        String encryptedPassword = PasswordUtil.encrypt(password);
        return userDAO.getUserByEmailAndPassword(email, encryptedPassword);
    }
}