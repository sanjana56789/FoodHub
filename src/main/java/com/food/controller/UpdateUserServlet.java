package com.food.controller;

import java.io.IOException;

import com.food.DAOImpl.UserDAOImpl;
import com.food.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        int userId = Integer.parseInt(req.getParameter("userId"));

        UserDAOImpl dao = new UserDAOImpl();

        User user = dao.getUser(userId);

        user.setUserName(req.getParameter("userName"));
        user.setEmail(req.getParameter("email"));
        user.setAddress(req.getParameter("address"));
        user.setRole(req.getParameter("role"));
        
        System.out.println("UpdateUserServlet Called");

        System.out.println(user);
        dao.updateUser(user);

        resp.sendRedirect("userManagement");
    }
}