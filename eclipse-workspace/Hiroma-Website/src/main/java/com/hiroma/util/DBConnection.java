package com.hiroma.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * DBConnection
 * Provides a MySQL connection to hiroma_db.
 * Used by all DAO classes.
 */
public class DBConnection {

    // ── Change these to match your MySQL setup ────────────────────────────
    private static final String URL      = "jdbc:mysql://localhost:3306/hiroma_db"
                                         + "?useSSL=false&allowPublicKeyRetrieval=true"
                                         + "&serverTimezone=UTC";
    private static final String USERNAME = "root";   // your MySQL username
    private static final String PASSWORD = "";        // your MySQL password
    // ─────────────────────────────────────────────────────────────────────

    static {
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC Driver not found! "
                + "Add mysql-connector-j to your pom.xml", e);
        }
    }

    /**
     * Returns a new connection to hiroma_db.
     * Always use try-with-resources so the connection is closed automatically.
     *
     * Usage:
     *   try (Connection conn = DBConnection.getConnection()) { ... }
     */
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }
}
