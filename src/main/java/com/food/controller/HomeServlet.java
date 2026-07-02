package com.food.controller;

import java.io.IOException;
import java.util.List;

import com.food.DAOImpl.MenuDAOImpl;
import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.Model.Menu;
import com.food.Model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        System.out.println("HomeServlet Called");

        RestaurantDAOImpl restaurantDAO = new RestaurantDAOImpl();
        List<Restaurant> restaurants = restaurantDAO.getAllRestaurants();

        MenuDAOImpl menuDAO = new MenuDAOImpl();
        List<Menu> featuredMenus = menuDAO.getFeaturedMenus();

        req.setAttribute("restaurants", restaurants);
        req.setAttribute("featuredMenus", featuredMenus);

        req.getRequestDispatcher("home.jsp").forward(req, resp);
    }
}