package com.food.controller;

import java.io.IOException;

import com.food.DAOImpl.UserDAOImpl;
import com.food.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        String userName = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String address = req.getParameter("address");

        try {

            User user = new User();

            user.setUserName(userName);
            user.setEmail(email);
            user.setPassword(password);
            user.setAddress(address);

            // Must match your DB enum value
            user.setRole("customer");

            UserDAOImpl userDAO = new UserDAOImpl();

            userDAO.addUser(user);

            resp.sendRedirect("login.jsp");

        }
        catch (Exception e) {

            e.printStackTrace();

            req.setAttribute("error",
                    "Registration Failed. Please try again.");

            req.getRequestDispatcher("register.jsp")
               .forward(req, resp);
        }
    }
}