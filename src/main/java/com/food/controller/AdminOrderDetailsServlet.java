package com.food.controller;

import java.io.IOException;
import java.util.List;

import com.food.DAOImpl.OrderItemDAOImpl;
import com.food.DAOImpl.OrderTableDAOImpl;
import com.food.Model.OrderItem;
import com.food.Model.OrderTable;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminOrderDetails")
public class AdminOrderDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        int orderId =
                Integer.parseInt(req.getParameter("orderId"));

        OrderTableDAOImpl orderDAO =
                new OrderTableDAOImpl();

        OrderTable order =
                orderDAO.getOrder(orderId);

        OrderItemDAOImpl itemDAO =
                new OrderItemDAOImpl();

        List<OrderItem> items =
                itemDAO.getOrderItemsByOrderId(orderId);
        System.out.println("Items Size = " + items.size());

        req.setAttribute("order", order);
        req.setAttribute("items", items);

        req.getRequestDispatcher("admin-order-details.jsp")
           .forward(req, resp);
    }
}