package com.food.controller;

import java.io.IOException;

import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.Model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateRestaurant")
public class UpdateRestaurantServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {
    	
    	System.out.println("UpdateRestaurantServlet Called");

        int restaurantId =
                Integer.parseInt(req.getParameter("restaurantId"));

        String name =
                req.getParameter("name");

        String cuisineType =
                req.getParameter("cuisineType");

        int deliveryTime =
                Integer.parseInt(req.getParameter("deliveryTime"));

        String address =
                req.getParameter("address");

        double rating =
                Double.parseDouble(req.getParameter("rating"));

        boolean isActive =
                Boolean.parseBoolean(req.getParameter("isActive"));

        String imagePath =
                req.getParameter("imagePath");

        String about =
                req.getParameter("about");

        Restaurant restaurant =
                new Restaurant(
                        restaurantId,
                        name,
                        cuisineType,
                        deliveryTime,
                        address,
                        rating,
                        isActive,
                        imagePath,
                        about
                );

        RestaurantDAOImpl dao =
                new RestaurantDAOImpl();

        dao.updateRestaurant(restaurant);

        resp.sendRedirect("restaurantManagement");
    }
}