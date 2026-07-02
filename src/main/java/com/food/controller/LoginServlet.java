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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        
        System.out.println("Entered Email : " + email);
        System.out.println("Entered Password : " + password);

        UserDAOImpl dao = new UserDAOImpl();

        User user = dao.getUserByEmail(email);
        
        System.out.println("User from DB : " + user);

        if(user != null &&
           user.getPassword().equals(password)) {
        	System.out.println("Login Success");

            HttpSession session =
                    req.getSession();

            session.setAttribute("loggedUser",
                                 user);

            resp.sendRedirect("home");
        }
        else {
        	 System.out.println("Login Failed");
            req.setAttribute("error",
                    "Invalid Email or Password");

            req.getRequestDispatcher("login.jsp")
               .forward(req, resp);
        }
    }
}