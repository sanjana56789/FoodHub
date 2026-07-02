package com.food.controller;

import java.io.IOException;
import java.util.List;

import com.food.DAOImpl.OrderTableDAOImpl;
import com.food.Model.OrderTable;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/orderManagement")
public class OrderManagementServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        OrderTableDAOImpl dao = new OrderTableDAOImpl();

        List<OrderTable> orders = dao.getAllOrders();

        req.setAttribute("orders", orders);

        req.getRequestDispatcher("order-management.jsp")
           .forward(req, resp);
    }
}