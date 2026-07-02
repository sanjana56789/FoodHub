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

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        User user = (User) session.getAttribute("loggedUser");

        if(user == null){
            resp.sendRedirect("login.jsp");
            return;
        }

        String userName = req.getParameter("userName");
        String email = req.getParameter("email");
        String address = req.getParameter("address");

        user.setUserName(userName);
        user.setEmail(email);
        user.setAddress(address);

        UserDAOImpl dao = new UserDAOImpl();

        dao.updateUser(user);

        session.setAttribute("loggedUser", user);

        resp.sendRedirect("profile.jsp");
    }
}