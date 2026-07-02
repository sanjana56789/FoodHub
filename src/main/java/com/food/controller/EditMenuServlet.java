package com.food.controller;

import java.io.IOException;

import com.food.DAOImpl.MenuDAOImpl;
import com.food.Model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/editMenu")
public class EditMenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        int menuId =
                Integer.parseInt(req.getParameter("menuId"));

        MenuDAOImpl dao = new MenuDAOImpl();

        Menu menu = dao.getMenu(menuId);

        req.setAttribute("menu", menu);

        req.getRequestDispatcher("editMenu.jsp")
           .forward(req, resp);
    }
}