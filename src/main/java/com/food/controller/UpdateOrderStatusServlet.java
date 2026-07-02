package com.food.controller;

import java.io.IOException;

import com.food.DAOImpl.OrderTableDAOImpl;
import com.food.Model.OrderTable;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateOrderStatus")
public class UpdateOrderStatusServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        int orderId =
                Integer.parseInt(req.getParameter("orderId"));

        OrderTableDAOImpl dao =
                new OrderTableDAOImpl();

        OrderTable order =
                dao.getOrder(orderId);

        String status =
                order.getStatus();

        if(status.equalsIgnoreCase("Pending")){

            status = "Preparing";

        }
        else if(status.equalsIgnoreCase("Preparing")){

            status = "Ready";

        }
        else if(status.equalsIgnoreCase("Ready")){

            status = "Delivered";

        }

        dao.updateOrderStatus(orderId, status);

        resp.sendRedirect("hotelOrders");
    }
}







//package com.food.controller;
//
//import java.io.IOException;
//
//import com.food.DAOImpl.OrderTableDAOImpl;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//@WebServlet("/updateOrderStatus")
//public class UpdateOrderStatusServlet extends HttpServlet {
//
//    @Override
//    protected void doPost(HttpServletRequest req,
//                          HttpServletResponse resp)
//            throws ServletException, IOException {
//
//        int orderId =
//                Integer.parseInt(req.getParameter("orderId"));
//
//        String status =
//                req.getParameter("status");
//
//        OrderTableDAOImpl dao =
//                new OrderTableDAOImpl();
//
//        dao.updateOrderStatus(orderId, status);
//
//        resp.sendRedirect("adminOrderDetails?orderId=" + orderId);
//    }
//}