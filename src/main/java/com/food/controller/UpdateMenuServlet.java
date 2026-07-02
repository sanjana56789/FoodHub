package com.food.controller;

import java.io.IOException;

import com.food.DAOImpl.MenuDAOImpl;
import com.food.Model.HotelAgent;
import com.food.Model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateMenu")
public class UpdateMenuServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

    	HttpSession session = req.getSession();

    	System.out.println("Session ID: " + session.getId());

    	HotelAgent agent =
    	        (HotelAgent) session.getAttribute("hotelAgent");

    	System.out.println("Hotel Agent = " + agent);

    	System.out.println("RestaurantId Parameter = "
    	        + req.getParameter("restaurantId"));

        int restaurantId;

        if (agent != null) {

            // Hotel Agent
            restaurantId = agent.getRestaurantId();

        } else {

            // Super Admin
            restaurantId =
                    Integer.parseInt(req.getParameter("restaurantId"));

        }

        int menuId =
                Integer.parseInt(req.getParameter("menuId"));

        String itemName =
                req.getParameter("itemName");

        String description =
                req.getParameter("description");

        double price =
                Double.parseDouble(req.getParameter("price"));

        String category =
                req.getParameter("category");

        boolean isAvailable =
                Boolean.parseBoolean(req.getParameter("isAvailable"));

        String imagePath =
                req.getParameter("imagePath");

        Menu menu = new Menu(
                menuId,
                restaurantId,
                itemName,
                description,
                price,
                isAvailable,
                imagePath,
                category
        );

        MenuDAOImpl dao = new MenuDAOImpl();

        dao.updateMenu(menu);

        // Redirect based on login type
        if (agent != null) {
            resp.sendRedirect("hotelMenu");
        } else {
            resp.sendRedirect("menuManagement");
        }
    }
}

















//package com.food.controller;
//
//import java.io.IOException;
//
//import com.food.DAOImpl.MenuDAOImpl;
//import com.food.Model.Menu;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//@WebServlet("/updateMenu")
//public class UpdateMenuServlet extends HttpServlet {
//
//    @Override
//    protected void doPost(HttpServletRequest req,
//                          HttpServletResponse resp)
//            throws ServletException, IOException {
//
//        int menuId = Integer.parseInt(req.getParameter("menuId"));
//        int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
//        String itemName = req.getParameter("itemName");
//        String description = req.getParameter("description");
//        double price = Double.parseDouble(req.getParameter("price"));
//        String category = req.getParameter("category");
//        boolean isAvailable = Boolean.parseBoolean(req.getParameter("isAvailable"));
//        String imagePath = req.getParameter("imagePath");
//
//        Menu menu = new Menu(
//                menuId,
//                restaurantId,
//                itemName,
//                description,
//                price,
//                isAvailable,
//                imagePath,
//                category
//        );
//
//        MenuDAOImpl dao = new MenuDAOImpl();
//
//        dao.updateMenu(menu);
//
//        resp.sendRedirect("menuManagement");
//    }
//}

