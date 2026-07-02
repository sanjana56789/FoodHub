<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.List" %>
<%@ page import="com.food.Model.OrderTable" %>
<%@ page import="com.food.DAOImpl.RestaurantDAOImpl" %>
<%@ page import="com.food.Model.Restaurant" %>
<%
List<OrderTable> orders =
(List<OrderTable>)request.getAttribute("orders");

RestaurantDAOImpl restaurantDAO =
        new RestaurantDAOImpl();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order History | FoodHub</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@600;700;800&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    background:#0d0d0d;
    color:white;
    font-family:'Poppins',sans-serif;
}

/* NAVBAR */

.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:25px 8%;
}

.logo{
    font-size:32px;
    font-weight:700;
    color:#ffc107;
}

.profile-btn{
    background:#ffc107;
    color:black;
    text-decoration:none;
    padding:10px 22px;
    border-radius:30px;
    font-weight:600;
}

/* TITLE */

.page-header{
    text-align:center;
    padding:50px 0;
}

.page-header h1{
    font-size:60px;
    font-family:'Playfair Display',serif;
}

.page-header p{
    color:#bdbdbd;
    margin-top:10px;
}

/* ORDERS */

.orders-container{
    width:85%;
    margin:auto;
    padding-bottom:80px;
}

.order-card{
    background:#1b1b1b;
    border-radius:20px;
    padding:30px;
    margin-bottom:25px;
    border:1px solid rgba(255,255,255,.05);
}

.order-top{
    display:flex;
    justify-content:space-between;
    margin-bottom:20px;
    flex-wrap:wrap;
}

.order-id{
    color:#ffc107;
    font-weight:600;
}

.order-status{
    padding:8px 18px;
    border-radius:20px;
    font-size:14px;
}

.delivered{
    background:#1e4620;
    color:#7CFC00;
}

.processing{
    background:#4a3900;
    color:#ffc107;
}

.cancelled{
    background:#4a1010;
    color:#ff6b6b;
}

.order-details{
    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:20px;
}

.order-details div{
    color:#d0d0d0;
}

.order-details strong{
    display:block;
    color:white;
    margin-bottom:5px;
}

.view-btn{
    margin-top:25px;
    display:inline-block;
    text-decoration:none;
    background:#ffc107;
    color:black;
    padding:10px 20px;
    border-radius:10px;
    font-weight:600;
}

@media(max-width:900px){

    .order-details{
        grid-template-columns:1fr 1fr;
    }

    .page-header h1{
        font-size:42px;
    }

}




.back-link{
    width:85%;
    margin:25px auto 10px;
}

.back-link a{
    color:#ffc107;
    text-decoration:none;
    font-size:17px;
    font-weight:600;
    transition:.3s;
}

.back-link a:hover{
    color:white;
    padding-left:8px;
}






.nav-actions{
    display:flex;
    align-items:center;
    gap:15px;
}

.profile-btn,
.logout-btn{
    text-decoration:none;
    padding:10px 22px;
    border-radius:30px;
    font-weight:600;
}

.profile-btn{
    background:#ffc107;
    color:black;
}

.logout-btn{
    background:#ff4d4d;
    color:white;
}
</style>

</head>
<body>

<!-- NAVBAR -->

<nav class="navbar">

    <div class="logo">🍔 FoodHub</div>

    <div class="nav-actions">

        <a href="profile.jsp" class="profile-btn">
            Profile
        </a>

        <a href="logout" class="logout-btn">
            Logout
        </a>

    </div>

</nav>

<div class="back-link">
    <a href="home">← Home</a>
</div>

<!-- HEADER -->

<section class="page-header">

    <h1>Order History</h1>

    <p>
        Track all your previous food orders
    </p>

</section>

<!-- ORDERS -->

<section class="orders-container">

<%
if(orders != null && !orders.isEmpty()){

	for(OrderTable order : orders){
Restaurant restaurant = restaurantDAO.getRestaurant(order.getRestaurantId());
%>

<div class="order-card">

    <div class="order-top">

        <div class="order-id">
            Order #<%= order.getOrderId() %>
        </div>

        <div class="order-status processing">
            <%= order.getStatus() %>
        </div>

    </div>

    <div class="order-details">

        <div>
            <strong>Date</strong>
            <%= order.getOrderDate() %>
        </div>

        <div>
		    <strong>Restaurant</strong>
		    <%= restaurant.getName() %>
		</div>

        <div>
            <strong>Payment</strong>
            <%= order.getPaymentMethod() %>
        </div>

        <div>
            <strong>Total</strong>
            ₹<%= order.getTotalAmount() %>
        </div>

    </div>

    <a href="orderDetails?orderId=<%= order.getOrderId() %>"
   class="view-btn">
    View Details
</a>

</div>

<%
    }
}
else{
%>

<h2>No Orders Found</h2>

<%
}
%>

</section>

</body>
</html>