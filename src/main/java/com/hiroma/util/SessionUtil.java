package com.hiroma.util;

import jakarta.servlet.http.HttpSession;

public class SessionUtil {

    public static void setUser(HttpSession session, Object user) {
        session.setAttribute("loggedInUser", user);
    }

    public static Object getUser(HttpSession session) {
        return session.getAttribute("loggedInUser");
    }

    public static String getRole(HttpSession session) {
        String role = (String) session.getAttribute("role");
        return role != null ? role : "";
    }

    public static void setRole(HttpSession session, String role) {
        session.setAttribute("role", role);
    }

    public static boolean isLoggedIn(HttpSession session) {
        return session.getAttribute("loggedInUser") != null;
    }

    public static void logout(HttpSession session) {
        session.invalidate();
    }
}