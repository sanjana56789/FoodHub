package com.food.controller;

import java.io.IOException;
import java.util.List;

import com.food.DAOImpl.OrderTableDAOImpl;
import com.food.Model.OrderTable;
import com.food.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/orderHistory")
public class OrderHistoryServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

    	HttpSession session = req.getSession();

    	User user = (User) session.getAttribute("loggedUser");

    	if(user == null){
    	    resp.sendRedirect("login.jsp");
    	    return;
    	}

    	OrderTableDAOImpl dao = new OrderTableDAOImpl();

    	List<OrderTable> orders =
    	        dao.getOrdersByUserId(user.getUserId());

    	req.setAttribute("orders", orders);

    	req.getRequestDispatcher("order-history.jsp").forward(req, resp);
    }
}