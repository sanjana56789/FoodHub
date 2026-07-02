package com.food.controller;

import java.io.IOException;

import com.food.DAOImpl.DeliveryAgentDAOImpl;
import com.food.Model.DeliveryAgent;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deliveryLogin")
public class DeliveryLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        DeliveryAgentDAOImpl dao = new DeliveryAgentDAOImpl();

        DeliveryAgent agent =
                dao.getDeliveryAgent(email, password);

        if(agent != null) {

            HttpSession session = req.getSession();

            session.setAttribute("deliveryAgent", agent);

            resp.sendRedirect("delivery-dashboard.jsp");

        } else {

            req.setAttribute("error",
                    "Invalid Email or Password");

            req.getRequestDispatcher("delivery-login.jsp")
               .forward(req, resp);
        }
    }
}