package com.food.controller;

import java.io.IOException;
import java.util.List;

import com.food.DAOImpl.OrderTableDAOImpl;
import com.food.Model.HotelAgent;
import com.food.Model.OrderTable;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/hotelOrders")
public class HotelOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        HotelAgent agent =
                (HotelAgent) session.getAttribute("hotelAgent");

        if (agent == null) {

            resp.sendRedirect("hotel-login.jsp");
            return;
        }

        OrderTableDAOImpl dao = new OrderTableDAOImpl();

        List<OrderTable> orders =
                dao.getOrdersByRestaurantId(agent.getRestaurantId());

        req.setAttribute("orders", orders);

        req.getRequestDispatcher("hotel-orders.jsp")
           .forward(req, resp);
    }
}