package com.food.controller;

import java.io.IOException;
import java.util.List;

import com.food.DAOImpl.MenuDAOImpl;
import com.food.Model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int restaurantId = Integer.parseInt(req.getParameter("id"));

        String filter = req.getParameter("filter");

        MenuDAOImpl dao = new MenuDAOImpl();

        List<Menu> menuList;

        if (filter == null || filter.equals("all")) {

            menuList = dao.getMenuByRestaurantId(restaurantId);

        } 
        else if (filter.equals("veg")) {

            menuList = dao.getVegMenu(restaurantId);

        } 
        else if (filter.equals("nonveg")) {

            menuList = dao.getNonVegMenu(restaurantId);

        } 
        else if (filter.equals("low")) {

            menuList = dao.getLowPriceMenu(restaurantId);

        } 
        else {

            menuList = dao.getHighPriceMenu(restaurantId);

        }

        req.setAttribute("menuList", menuList);
        req.setAttribute("restaurantId", restaurantId);

        req.getRequestDispatcher("menu.jsp")
           .forward(req, resp);
    }
	
}





//@Override
//protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//	int restaurantId=Integer.parseInt(req.getParameter("restaurantId"));
//	MenuDAOImpl dao=new MenuDAOImpl();
//	List<Menu> allMenuByRestaurant =dao.getMenuByRestaurantId(restaurantId);
//	
//	for (Menu menu : allMenuByRestaurant) {
//		System.out.println(menu);
//	}
//	req.setAttribute("allMenuByRestaurant", allMenuByRestaurant);
//	RequestDispatcher rd=req.getRequestDispatcher("menu.jsp");
//	rd.forward(req,resp);	
//}


//@Override
//protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//	
//	MenuDAOImpl menuDAOImpl=new MenuDAOImpl();
//	int restaurantId=(Integer.parseInt(req.getParameter("restaurantId")));
//	List<Menu> allMenuByRestaurantId= menuDAOImpl.getMenuByRestaurantId(restaurantId);
//	
//	for (Menu menu : allMenuByRestaurantId) {
//		System.out.println(menu);
//	}
//	req.setAttribute("allMenuByRestaurantId", allMenuByRestaurantId);
//	RequestDispatcher rd=req.getRequestDispatcher("menu.jsp");
//	rd.forward(req, resp);
//}