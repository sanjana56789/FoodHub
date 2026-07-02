package com.food.controller;

import java.io.IOException;

import com.food.DAOImpl.OrderTableDAOImpl;
import com.food.Model.HotelAgent;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/hotelReport")
public class HotelReportServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        HotelAgent agent =
                (HotelAgent) session.getAttribute("hotelAgent");

        if(agent == null){

            resp.sendRedirect("hotel-login.jsp");
            return;
        }

        int restaurantId = agent.getRestaurantId();

        OrderTableDAOImpl dao = new OrderTableDAOImpl();

        int totalOrders =
                dao.getTotalOrders(restaurantId);

        double revenue =
                dao.getTotalRevenue(restaurantId);

        int pending =
                dao.getPendingOrders(restaurantId);

        int delivered =
                dao.getDeliveredOrders(restaurantId);

        req.setAttribute("totalOrders", totalOrders);
        req.setAttribute("revenue", revenue);
        req.setAttribute("pending", pending);
        req.setAttribute("delivered", delivered);

        req.getRequestDispatcher("hotel-report.jsp")
           .forward(req, resp);
    }
}