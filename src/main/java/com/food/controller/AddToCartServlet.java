package com.food.controller;

import java.io.IOException;

import com.food.DAOImpl.MenuDAOImpl;
import com.food.Model.Cart;
import com.food.Model.CartItem;
import com.food.Model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        int menuId =
                Integer.parseInt(
                        req.getParameter("menuId"));

        MenuDAOImpl menuDAO =
                new MenuDAOImpl();

        Menu menu = menuDAO.getMenu(menuId);
        int restaurantId = menu.getRestaurantId();

        HttpSession session = req.getSession();
        session.setAttribute("restaurantId", restaurantId);
        System.out.println("Restaurant ID stored in session: " + restaurantId);

        Cart cart =
                (Cart) session.getAttribute("cart");

        if(cart == null) {

            cart = new Cart();

            session.setAttribute(
                    "cart",
                    cart);
        }

        CartItem item = new CartItem(
                menu.getMenuId(),
                menu.getItemName(),
                menu.getPrice(),
                1,
                menu.getImagePath()
        );

        cart.addItem(item);

        resp.sendRedirect("cart.jsp");
    }
}