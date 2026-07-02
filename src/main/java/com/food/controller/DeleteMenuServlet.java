package com.food.controller;

import java.io.IOException;

import com.food.DAOImpl.MenuDAOImpl;
import com.food.Model.HotelAgent;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteMenu")
public class DeleteMenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        int menuId =
                Integer.parseInt(req.getParameter("menuId"));

        MenuDAOImpl dao = new MenuDAOImpl();

        dao.deleteMenu(menuId);

        HttpSession session = req.getSession();

        HotelAgent agent =
                (HotelAgent) session.getAttribute("hotelAgent");

        if(agent != null){

            // Hotel Agent
            resp.sendRedirect("hotelMenu");

        }else{

            // Super Admin
            resp.sendRedirect("menuManagement");

        }
    }
}














//package com.food.controller;
//
//import java.io.IOException;
//
//import com.food.DAOImpl.MenuDAOImpl;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//@WebServlet("/deleteMenu")
//public class DeleteMenuServlet extends HttpServlet {
//
//    @Override
//    protected void doGet(HttpServletRequest req,
//                         HttpServletResponse resp)
//            throws ServletException, IOException {
//
//        int menuId =
//                Integer.parseInt(req.getParameter("menuId"));
//
//        MenuDAOImpl dao =
//                new MenuDAOImpl();
//
//        dao.deleteMenu(menuId);
//
//        resp.sendRedirect("menuManagement");
//    }
//}