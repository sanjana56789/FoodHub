package com.food.controller;

import java.io.IOException;

import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.Model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/editRestaurant")
public class EditRestaurantServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        int restaurantId =
                Integer.parseInt(req.getParameter("restaurantId"));

        RestaurantDAOImpl dao =
                new RestaurantDAOImpl();

        Restaurant restaurant =
                dao.getRestaurant(restaurantId);

        req.setAttribute("restaurant", restaurant);

        req.getRequestDispatcher("editRestaurant.jsp")
           .forward(req, resp);
    }
}