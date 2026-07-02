package com.food.controller;

import java.io.IOException;
import java.util.List;

import com.food.DAOImpl.UserDAOImpl;
import com.food.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/userManagement")
public class UserManagementServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        UserDAOImpl dao = new UserDAOImpl();

        List<User> users = dao.getAllUser();

        req.setAttribute("users", users);

        req.getRequestDispatcher("user-management.jsp")
           .forward(req, resp);
    }
}