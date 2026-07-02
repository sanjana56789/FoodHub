package com.food.controller;

import java.io.IOException;

import com.food.Model.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/removeCart")
public class RemoveCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        int menuId =
                Integer.parseInt(req.getParameter("menuId"));

        HttpSession session = req.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        if(cart != null){
            cart.removeItem(menuId);
        }

        resp.sendRedirect("cart.jsp");
    }
}