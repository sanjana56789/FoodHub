package com.food.controller;

import java.io.IOException;

import com.food.DAOImpl.HotelAgentDAOImpl;
import com.food.Model.HotelAgent;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/hotelLogin")
public class HotelLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        HotelAgentDAOImpl dao = new HotelAgentDAOImpl();

        HotelAgent agent = dao.getHotelAgent(email, password);

        if(agent != null) {

            HttpSession session = req.getSession();

            session.setAttribute("hotelAgent", agent);

            resp.sendRedirect("hotel-dashboard.jsp");

        } else {

            req.setAttribute("error",
                    "Invalid Email or Password");

            req.getRequestDispatcher("hotel-login.jsp")
               .forward(req, resp);
        }
    }
}