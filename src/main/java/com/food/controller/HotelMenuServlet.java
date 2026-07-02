package com.food.controller;

import java.io.IOException;
import java.util.List;

import com.food.DAOImpl.MenuDAOImpl;
import com.food.Model.HotelAgent;
import com.food.Model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/hotelMenu")
public class HotelMenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        HotelAgent agent =
                (HotelAgent) session.getAttribute("hotelAgent");

        if(agent == null) {

            response.sendRedirect("hotel-login.jsp");
            return;
        }

        MenuDAOImpl menuDAO = new MenuDAOImpl();

        List<Menu> menuList =
                menuDAO.getMenuByRestaurantId(
                        agent.getRestaurantId());

        request.setAttribute("menuList", menuList);

        request.getRequestDispatcher("hotel-menu.jsp")
                .forward(request, response);
    }
}