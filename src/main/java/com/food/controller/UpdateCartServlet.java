package com.food.controller;

import java.io.IOException;

import com.food.Model.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/updateCart")
public class UpdateCartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {
    	
    	System.out.println("UpdateCartServlet Called");

        int menuId =
                Integer.parseInt(req.getParameter("menuId"));

        String action =
                req.getParameter("action");

        HttpSession session =
                req.getSession();

        Cart cart =
                (Cart) session.getAttribute("cart");

        if(cart != null &&
           cart.getItems().containsKey(menuId)) {

            int qty =
                    cart.getItems()
                        .get(menuId)
                        .getQuantity();

            if(action.equals("increase")) {

                cart.updateQuantity(menuId,
                                    qty + 1);
            }
            else if(action.equals("decrease")) {

                cart.updateQuantity(menuId,
                                    qty - 1);
            }
        }

        resp.sendRedirect("cart.jsp");
    }
}