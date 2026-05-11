/**
 * SessionUtil: Utility class for session operations.
  * Location: src/main/java/com.hiroma.util
  * Author: M3
 */

package com.hiroma.util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class SessionUtil {

    /**
     * Adds an attribute and sets a custom session timeout.
     */
    public static void setAttribute(HttpServletRequest request, String name, Object value, int seconds) {
        HttpSession session = request.getSession(true);
        session.setAttribute(name, value);
        session.setMaxInactiveInterval(seconds);
    }

    /**
     * Reads a session attribute by name.
     */
    public static Object getAttribute(HttpServletRequest request, String name) {
        HttpSession session = request.getSession(false);
        return (session != null) ? session.getAttribute(name) : null;
    }

    /**
     * Removes a specific session attribute.
     */
    public static void removeAttribute(HttpServletRequest request, String name) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute(name);
        }
    }

    /**
     * Invalidates the entire session.
     */
    public static void invalidateSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }
}
