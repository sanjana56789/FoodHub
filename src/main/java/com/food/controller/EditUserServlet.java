package com.food.controller;

import java.io.IOException;

import com.food.DAOImpl.UserDAOImpl;
import com.food.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/editUser")
public class EditUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        int userId =
                Integer.parseInt(req.getParameter("userId"));

        UserDAOImpl dao =
                new UserDAOImpl();

        User user =
                dao.getUser(userId);

        req.setAttribute("user", user);

        req.getRequestDispatcher("edit-user.jsp")
           .forward(req, resp);
    }
}