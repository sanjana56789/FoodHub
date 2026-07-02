package com.food.controller;

import java.io.IOException;
import java.util.List;

import com.food.DAOImpl.MenuDAOImpl;
import com.food.Model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menuManagement")
public class MenuManagementServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        MenuDAOImpl dao = new MenuDAOImpl();

        List<Menu> menuList = dao.getAllMenus();

        req.setAttribute("menuList", menuList);

        req.getRequestDispatcher("menu-management.jsp")
           .forward(req, resp);
    }
}