package com.food.controller;

import java.util.List;
import com.food.DAOImpl.MenuDAOImpl;
import com.food.Model.Menu;
import java.io.IOException;

import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.Model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/restaurant")
public class RestaurantServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req,HttpServletResponse resp)
            throws ServletException, IOException {

    	int restaurantId = Integer.parseInt(req.getParameter("id"));
    	req.getSession().setAttribute("restaurantId", restaurantId);

    	RestaurantDAOImpl restaurantDAO = new RestaurantDAOImpl();
    	Restaurant restaurant = restaurantDAO.getRestaurant(restaurantId);

    	MenuDAOImpl menuDAO = new MenuDAOImpl();
    	List<Menu> menuList = menuDAO.getMenuByRestaurantId(restaurantId);

    	req.setAttribute("restaurant", restaurant);
    	req.setAttribute("menuList", menuList);

    	req.getRequestDispatcher("restaurant-details.jsp")
    	   .forward(req, resp);
    }
}