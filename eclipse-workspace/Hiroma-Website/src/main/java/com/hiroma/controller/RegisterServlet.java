package com.hiroma.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	    
	    String firstName    = request.getParameter("firstName");
	    String lastName     = request.getParameter("lastName");
	    String email        = request.getParameter("email");
	    String phone        = request.getParameter("phone");
	    String role         = request.getParameter("role");
	    String password     = request.getParameter("password");
	    String confirmPassword = request.getParameter("confirmPassword");

	    // Basic validation
	    if (firstName == null || email == null || password == null ||
	        !password.equals(confirmPassword)) {
	        request.setAttribute("error", "Please check your details and try again.");
	        request.getRequestDispatcher("register.jsp").forward(request, response);
	        return;
	    }
	    
	    response.sendRedirect(request.getContextPath() + "/authentication/login.jsp");
	}
}