<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.Model.OrderTable"%>
<%@ page import="com.food.Model.OrderItem"%>
<%@ page import="com.food.Model.User"%>
<%@ page import="com.food.Model.Restaurant"%>
<%@ page import="com.food.Model.Menu"%>

<%@ page import="com.food.DAOImpl.UserDAOImpl"%>
<%@ page import="com.food.DAOImpl.RestaurantDAOImpl"%>
<%@ page import="com.food.DAOImpl.MenuDAOImpl"%>

<%
OrderTable order =
(OrderTable)request.getAttribute("order");

List<OrderItem> items =
(List<OrderItem>)request.getAttribute("items");

UserDAOImpl userDAO = new UserDAOImpl();
RestaurantDAOImpl restaurantDAO = new RestaurantDAOImpl();
MenuDAOImpl menuDAO = new MenuDAOImpl();

User user = userDAO.getUser(order.getUserId());

Restaurant restaurant =
restaurantDAO.getRestaurant(order.getRestaurantId());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Order Details</title>

<style>

body{
    margin:0;
    background:#0d0d0d;
    color:white;
    font-family:Poppins,sans-serif;
}

.container{
    width:90%;
    margin:40px auto;
}

h1{
    color:#ffc107;
    margin-bottom:30px;
}

.info-card{

    background:#1f1f1f;
    padding:25px;
    border-radius:12px;
    margin-bottom:30px;
}

.info-card p{
    margin:12px 0;
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

.back{

    display:inline-block;
    margin-top:30px;
    text-decoration:none;
    background:#777;
    color:white;
    padding:12px 25px;
    border-radius:8px;
}

</style>

</head>

<body>

<div class="container">

<h1>Order Details</h1>

<div class="info-card">

<p>
<strong>Order ID :</strong>
<%= order.getOrderId() %>
</p>

<p>
<strong>Customer :</strong>
<%= user.getUserName() %>
</p>

<p>
<strong>Email :</strong>
<%= user.getEmail() %>
</p>

<p>
<strong>Restaurant :</strong>
<%= restaurant.getName() %>
</p>

<p>
<strong>Order Date :</strong>
<%= order.getOrderDate() %>
</p>

<p>
<strong>Payment :</strong>
<%= order.getPaymentMethod() %>
</p>

<form action="updateOrderStatus" method="post">

<input type="hidden"
       name="orderId"
       value="<%= order.getOrderId() %>">

<p>

<strong>Status :</strong>

<select name="status">

<option value="Processing"
<%= order.getStatus().equals("Processing") ? "selected" : "" %>>
Processing
</option>

<option value="Preparing"
<%= order.getStatus().equals("Preparing") ? "selected" : "" %>>
Preparing
</option>

<option value="Out For Delivery"
<%= order.getStatus().equals("Out For Delivery") ? "selected" : "" %>>
Out For Delivery
</option>

<option value="Delivered"
<%= order.getStatus().equals("Delivered") ? "selected" : "" %>>
Delivered
</option>

<option value="Cancelled"
<%= order.getStatus().equals("Cancelled") ? "selected" : "" %>>
Cancelled
</option>

</select>

</p>

<button
style="margin-top:20px;
padding:10px 20px;
background:#28a745;
color:white;
border:none;
border-radius:8px;
cursor:pointer;">

Update Status

</button>

</form>

<p>
<strong>Total Amount :</strong>
₹<%= order.getTotalAmount() %>
</p>

</div>

<h2>Ordered Items</h2>

<table>

<tr>

<th>Image</th>
<th>Item</th>
<th>Category</th>
<th>Quantity</th>
<th>Price</th>

</tr>

<%
for(OrderItem item : items){

Menu menu =
menuDAO.getMenu(item.getMenuId());
%>

<tr>

<td>

<img src="${pageContext.request.contextPath}/Menu_images/<%= menu.getImagePath() %>"
     width="80"
     height="70">

</td>

<td>

<%= menu.getItemName() %>

</td>

<td>

<%= menu.getCategory() %>

</td>

<td>

<%= item.getQuantity() %>

</td>

<td>

₹<%= item.getItemTotal() %>

</td>

</tr>

<%
}
%>

</table>

<a href="orderManagement"
class="back">

← Back to Orders

</a>

</div>

</body>
</html>