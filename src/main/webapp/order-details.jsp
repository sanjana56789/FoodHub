<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.food.Model.OrderItem" %>
<%@ page import="com.food.DAOImpl.MenuDAOImpl" %>
<%@ page import="com.food.Model.Menu" %>
<%@ page import="com.food.Model.OrderTable" %>
<%@ page import="com.food.DAOImpl.RestaurantDAOImpl" %>
<%@ page import="com.food.Model.Restaurant" %>


<%
OrderTable order =
(OrderTable)request.getAttribute("order");

List<OrderItem> items =
(List<OrderItem>)request.getAttribute("items");

MenuDAOImpl menuDAO = new MenuDAOImpl();

RestaurantDAOImpl restaurantDAO =
new RestaurantDAOImpl();

Restaurant restaurant = null;

if(order != null){
    restaurant = restaurantDAO.getRestaurant(order.getRestaurantId());
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Details</title>

<style>

body{
    background:#0d0d0d;
    color:white;
    font-family:Arial;
}

.container{
    width:80%;
    margin:40px auto;
}

.card{
    display:flex;
    gap:20px;
    background:#1b1b1b;
    padding:20px;
    border-radius:15px;
    margin-bottom:20px;
}

.card img{
    width:150px;
    height:120px;
    object-fit:cover;
    border-radius:10px;
}

.price{
    color:#ffc107;
    font-size:20px;
    font-weight:bold;
}

.back-btn{
    display:inline-block;
    margin-top:30px;
    background:#ffc107;
    color:black;
    padding:12px 24px;
    text-decoration:none;
    border-radius:30px;
}

</style>

</head>
<body>

<div class="container">

<h1>Order Details</h1>

<div class="card">

    <div>

        <h2>
			<%= (restaurant != null) ? restaurant.getName() : "Restaurant" %>
		</h2>

        <p>
            <strong>Order ID :</strong>
            #<%= order.getOrderId() %>
        </p>

        <p>
            <strong>Date :</strong>
            <%= order.getOrderDate() %>
        </p>

        <p>
            <strong>Payment :</strong>
            <%= order.getPaymentMethod() %>
        </p>

        <p>
            <strong>Status :</strong>
            <%= order.getStatus() %>
        </p>

        <p class="price">
            Total :
            ₹<%= String.format("%.2f", order.getTotalAmount()) %>
        </p>

    </div>

</div>

<hr style="margin:30px 0;border:1px solid #333;">

<h2 style="margin-bottom:20px;">
    Ordered Items
</h2>

<%
for(OrderItem item : items){

    Menu menu = menuDAO.getMenu(item.getMenuId());
%>

<div class="card">

<img src="${pageContext.request.contextPath}/Menu_images/<%= menu.getImagePath() %>">

<div>

<h2><%= menu.getItemName() %></h2>

<p>
<%= menu.getDescription() %>
</p>

<p>
Quantity :
<%= item.getQuantity() %>
</p>

<p class="price">
 ₹<%= String.format("%.2f", item.getItemTotal()) %>
</p>

</div>

</div>

<%
}
%>

<a href="orderHistory" class="back-btn">
← Back to Orders
</a>

</div>

</body>
</html>