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

@WebServlet("/addMenu")
public class AddMenuServlet extends HttpServlet {

//    @Override
//    protected void doPost(HttpServletRequest req,
//                          HttpServletResponse resp)
//            throws ServletException, IOException {
//
//        int restaurantId =
//                Integer.parseInt(req.getParameter("restaurantId"));
//
//        String itemName =
//                req.getParameter("itemName");
//
//        String description =
//                req.getParameter("description");
//
//        double price =
//                Double.parseDouble(req.getParameter("price"));
//
//        boolean isAvailable =
//                Boolean.parseBoolean(req.getParameter("isAvailable"));
//
//        String imagePath =
//                req.getParameter("imagePath");
//
//        String category =
//                req.getParameter("category");
//
//        Menu menu = new Menu();
//
//        menu.setRestaurantId(restaurantId);
//        menu.setItemName(itemName);
//        menu.setDescription(description);
//        menu.setPrice(price);
//        menu.setAvailable(isAvailable);
//        menu.setImagePath(imagePath);
//        menu.setCategory(category);
//
//        MenuDAOImpl dao = new MenuDAOImpl();
//
//        dao.addMenu(menu);
//
//        resp.sendRedirect("menuManagement");
//    }
	
	
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest req,
	                      HttpServletResponse resp)
	        throws ServletException, IOException {

	    int restaurantId;

	    // Check if Hotel Agent is logged in
	    HttpSession session = req.getSession();

	    HotelAgent agent =
	            (HotelAgent) session.getAttribute("hotelAgent");

	    if(agent != null) {

	        // Hotel Agent -> Restaurant ID comes from session
	        restaurantId = agent.getRestaurantId();

	    } else {

	        // Super Admin -> Restaurant ID comes from form
	        restaurantId =
	                Integer.parseInt(req.getParameter("restaurantId"));
	    }

	    String itemName = req.getParameter("itemName");

	    String description = req.getParameter("description");

	    double price =
	            Double.parseDouble(req.getParameter("price"));

	    boolean isAvailable =
	            Boolean.parseBoolean(req.getParameter("isAvailable"));

	    String imagePath =
	            req.getParameter("imagePath");

	    String category =
	            req.getParameter("category");

	    Menu menu = new Menu();

	    menu.setRestaurantId(restaurantId);
	    menu.setItemName(itemName);
	    menu.setDescription(description);
	    menu.setPrice(price);
	    menu.setAvailable(isAvailable);
	    menu.setImagePath(imagePath);
	    menu.setCategory(category);

	    MenuDAOImpl dao = new MenuDAOImpl();

	    dao.addMenu(menu);

	    // Redirect based on who added the menu
	    if(agent != null) {
	        resp.sendRedirect("hotelMenu");
	    } else {
	        resp.sendRedirect("menuManagement");
	    }
	}
}