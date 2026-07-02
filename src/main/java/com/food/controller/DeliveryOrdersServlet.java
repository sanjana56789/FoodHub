package com.food.controller;

import java.io.IOException;
import java.util.List;

import com.food.DAOImpl.OrderTableDAOImpl;
import com.food.Model.DeliveryAgent;
import com.food.Model.OrderTable;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deliveryOrders")
public class DeliveryOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        DeliveryAgent agent =
                (DeliveryAgent) session.getAttribute("deliveryAgent");

        if(agent == null) {

            resp.sendRedirect("delivery-login.jsp");
            return;
        }

        int deliveryAgentId = agent.getAgentId();

        OrderTableDAOImpl dao = new OrderTableDAOImpl();

        List<OrderTable> orders =
                dao.getAssignedOrders(deliveryAgentId);

        req.setAttribute("orders", orders);

        req.getRequestDispatcher("delivery-orders.jsp")
           .forward(req, resp);
    }
}