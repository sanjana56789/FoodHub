<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.Model.OrderTable"%>
<%@ page import="com.food.Model.User"%>
<%@ page import="com.food.Model.Restaurant"%>
<%@ page import="com.food.DAOImpl.UserDAOImpl"%>
<%@ page import="com.food.DAOImpl.RestaurantDAOImpl"%>

<%
List<OrderTable> orders =
(List<OrderTable>)request.getAttribute("orders");

UserDAOImpl userDAO = new UserDAOImpl();
RestaurantDAOImpl restaurantDAO = new RestaurantDAOImpl();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Management</title>

<style>

body{
    margin:0;
    background:#0d0d0d;
    color:white;
    font-family:Poppins,sans-serif;
}

.container{
    width:95%;
    margin:40px auto;
}

h1{
    margin-bottom:30px;
}

table{
    width:100%;
    border-collapse:collapse;
    background:#1f1f1f;
}

th,td{
    padding:15px;
    text-align:center;
}

th{
    background:#ffc107;
    color:black;
}

tr:nth-child(even){
    background:#2b2b2b;
}

.btn{
    text-decoration:none;
    padding:8px 18px;
    border-radius:8px;
    color:white;
}

.view{
    background:#007bff;
}

.back{
    background:#777;
    color:white;
    padding:12px 20px;
    border-radius:8px;
    text-decoration:none;
}

</style>

</head>

<body>

<div class="container">

<h1>Order Management</h1>

<table>

<tr>

<th>Order ID</th>
<th>Customer</th>
<th>Restaurant</th>
<th>Date</th>
<th>Total</th>
<th>Status</th>
<th>Action</th>

</tr>

<%
if(orders != null){

for(OrderTable order : orders){

User user =
userDAO.getUser(order.getUserId());

Restaurant restaurant =
restaurantDAO.getRestaurant(order.getRestaurantId());
%>

<tr>

<td><%= order.getOrderId() %></td>

<td><%= user.getUserName() %></td>

<td><%= restaurant.getName() %></td>

<td><%= order.getOrderDate() %></td>

<td>₹<%= order.getTotalAmount() %></td>

<td><%= order.getStatus() %></td>

<td>

<a href="adminOrderDetails?orderId=<%= order.getOrderId() %>"
class="btn view">

View

</a>

</td>

</tr>

<%
}
}
%>

</table>

<br><br>

<a href="adminDashboard"
class="back">

← Back

</a>

</div>

</body>
</html>