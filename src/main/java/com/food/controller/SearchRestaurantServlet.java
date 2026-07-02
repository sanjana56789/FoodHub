package com.food.controller;

import java.io.IOException;
import java.util.List;

import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.Model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/searchRestaurant")
public class SearchRestaurantServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        String keyword = req.getParameter("keyword");
        System.out.println("Keyword = " + keyword);

        RestaurantDAOImpl dao = new RestaurantDAOImpl();

        List<Restaurant> restaurants;

        if(keyword == null || keyword.trim().isEmpty()){

            restaurants = dao.getAllRestaurants();

        }
        else{

            restaurants = dao.searchRestaurant(keyword);

        }
        System.out.println("Total Restaurants = " + restaurants.size());

        req.setAttribute("restaurants", restaurants);
        req.setAttribute("keyword", keyword);

        req.getRequestDispatcher("home.jsp")
        .forward(req, resp);
    }
}