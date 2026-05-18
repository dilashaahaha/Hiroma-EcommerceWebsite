package com.hiroma.service;

import com.hiroma.dao.UserDAO;
import com.hiroma.model.UserModel;

import java.sql.SQLException;
import java.util.List;

public class UserService {

    private UserDAO userDAO = new UserDAO();

    public List<UserModel> getAllUsers() throws SQLException {
        return userDAO.getAllUsers();
    }

    public boolean approveUser(int userId) throws SQLException {
        return userDAO.updateStatus(userId, "approved");
    }

    public boolean rejectUser(int userId) throws SQLException {
        return userDAO.updateStatus(userId, "rejected");
    }

    public boolean deleteUser(int userId) throws SQLException {
        return userDAO.deleteUser(userId);
    }

    public UserModel getUserById(int userId) throws SQLException {
        return userDAO.getUserById(userId);
    }
}