package com.food.controller;

import java.io.IOException;

import com.food.DAOImpl.UserDAOImpl;
import com.food.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserDAOImpl dao = new UserDAOImpl();

        User user = dao.getUserByEmail(email);

        if(user != null &&
        		   user.getPassword().equals(password) &&
        		   user.getRole().equalsIgnoreCase("superAdmin")) {

        		    HttpSession session = req.getSession();

        		    session.setAttribute("admin", user);

        		    resp.sendRedirect("adminDashboard");

        		} else {

        		    req.setAttribute("error", "Invalid Admin Credentials");

        		    req.getRequestDispatcher("admin-login.jsp")
        		       .forward(req, resp);
        		}
    }
}