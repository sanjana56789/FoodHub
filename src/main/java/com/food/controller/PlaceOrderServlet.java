package com.food.controller;

import java.io.IOException;
import java.sql.Timestamp;

import com.food.DAOImpl.OrderItemDAOImpl;
import com.food.DAOImpl.OrderTableDAOImpl;
import com.food.Model.Cart;
import com.food.Model.CartItem;
import com.food.Model.OrderItem;
import com.food.Model.OrderTable;
import com.food.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        
        System.out.println("Session ID : " + session.getId());

        User user = (User) session.getAttribute("loggedUser");

        System.out.println("User : " + user);

        Cart cart = (Cart) session.getAttribute("cart");

        System.out.println("Cart : " + cart);

        

        if(user == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        if(cart == null || cart.getItems().isEmpty()) {

            resp.sendRedirect("cart.jsp");
            return;
        }

        double totalAmount = 0;

        for(CartItem item : cart.getItems().values()) {

            totalAmount += item.getTotalPrice();
        }

        String paymentMethod =
                req.getParameter("paymentMethod");

        OrderTable order = new OrderTable();

        order.setUserId(user.getUserId());

        order.setOrderDate(
                new Timestamp(System.currentTimeMillis()));

        order.setTotalAmount(totalAmount);

        order.setStatus("Processing");

        order.setPaymentMethod(paymentMethod);

        Integer restaurantId = (Integer) session.getAttribute("restaurantId");
        System.out.println("Restaurant ID from session: " + restaurantId);
        order.setRestaurantId(restaurantId);

        OrderTableDAOImpl orderDAO =
                new OrderTableDAOImpl();

        int orderId =
                orderDAO.addOrder(order);

        OrderItemDAOImpl orderItemDAO =
                new OrderItemDAOImpl();

        for(CartItem item : cart.getItems().values()) {

            OrderItem orderItem =
                    new OrderItem(
                            orderId,
                            item.getMenuId(),
                            item.getQuantity(),
                            item.getTotalPrice());

            orderItemDAO.addOrderItem(orderItem);
        }

        cart.clearCart();

        session.setAttribute("cart", cart);

        resp.sendRedirect("orderHistory");
    }
}