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

@WebServlet("/changePassword")
public class ChangePasswordServlet extends HttpServlet {

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

        String currentPassword = req.getParameter("currentPassword");
        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");

        // Check current password
        if(!user.getPassword().equals(currentPassword)){

            req.setAttribute("error", "Current password is incorrect");

            req.getRequestDispatcher("change-password.jsp")
               .forward(req, resp);

            return;
        }

        // Check new password and confirm password
        if(!newPassword.equals(confirmPassword)){

            req.setAttribute("error", "Passwords do not match");

            req.getRequestDispatcher("change-password.jsp")
               .forward(req, resp);

            return;
        }

        // Update password in User object
        UserDAOImpl dao = new UserDAOImpl();

        dao.updatePassword(user.getUserId(), newPassword);

        user.setPassword(newPassword);

        // Update session
        session.setAttribute("loggedUser", user);

        req.setAttribute("success", "Password changed successfully");

        req.getRequestDispatcher("change-password.jsp")
           .forward(req, resp);
    }
}