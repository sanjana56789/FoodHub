<%@ page import="com.food.Model.Restaurant" %>
<%@ page import="java.util.List" %>
<%@ page import="com.food.Model.Menu" %>
<%
Restaurant restaurant =
        (Restaurant) request.getAttribute("restaurant");
%>

<%
List<Menu> menuList =
(List<Menu>)request.getAttribute("menuList");
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurant Details | FoodHub</title>

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
    font-family:'Poppins',sans-serif;
    background:#0d0d0d;
    color:white;
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

.nav-links{
    display:flex;
    gap:35px;
}

.nav-links a{
    color:white;
    text-decoration:none;
    transition:.3s;
}

.nav-links a:hover{
    color:#ffc107;
}

.profile-btn{
    padding:10px 22px;
    background:#ffc107;
    color:black;
    border-radius:30px;
    text-decoration:none;
    font-weight:600;
}

/* BANNER */

.restaurant-banner{
    padding:60px 8%;
    display:flex;
    align-items:center;
    gap:60px;
}

.restaurant-banner img{
    width:500px;
    border-radius:25px;
    box-shadow:0 15px 50px rgba(255,193,7,.15);
}

.restaurant-info{
    flex:1;
}

.restaurant-info h1{
    font-size:65px;
    font-family:'Playfair Display',serif;
    margin-bottom:20px;
}

.restaurant-info p{
    color:#bdbdbd;
    line-height:1.8;
}

.restaurant-meta{
    display:flex;
    gap:20px;
    margin:30px 0;
    flex-wrap:wrap;
}

.restaurant-meta span{
    background:#1b1b1b;
    padding:12px 20px;
    border-radius:12px;
    border:1px solid rgba(255,255,255,.05);
}

.menu-btn{
    display:inline-block;
    background:#ffc107;
    color:black;
    text-decoration:none;
    padding:15px 35px;
    border-radius:30px;
    font-weight:600;
}

/* SECTION TITLE */

.section-title{
    text-align:center;
    margin-bottom:50px;
}

.section-title h2{
    font-size:52px;
    font-family:'Playfair Display',serif;
}

.section-title p{
    color:#bdbdbd;
    margin-top:10px;
}

/* ABOUT */

.about{
    padding:80px 8%;
}

.about h2{
    font-size:50px;
    margin-bottom:20px;
    font-family:'Playfair Display',serif;
}

.about p{
    color:#bdbdbd;
    line-height:2;
}

/* DISHES */

.popular-dishes{
    padding:80px 8%;
}

.dish-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(280px,1fr));
    gap:30px;
}

.dish-card{
    background:#1b1b1b;
    border-radius:20px;
    overflow:hidden;
    transition:.3s;
}

.dish-card:hover{
    transform:translateY(-10px);
}

.dish-card img{
    width:100%;
    height:250px;
    object-fit:cover;
}

.dish-content{
    padding:20px;
}

.dish-content h3{
    margin-bottom:10px;
}

.dish-content p{
    color:#bdbdbd;
    margin-bottom:15px;
}

.price{
    color:#ffc107;
    font-size:22px;
    font-weight:700;
}

/* STATS */

.restaurant-stats{
    padding:80px 8%;
}

.stats-grid{
    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:25px;
}

.stat-card{
    background:#1b1b1b;
    text-align:center;
    padding:40px;
    border-radius:20px;
}

.stat-card h2{
    color:#ffc107;
    margin-bottom:10px;
}

.stat-card p{
    color:#bdbdbd;
}

/* FOOTER */

.footer{
    text-align:center;
    padding:60px;
    color:#888;
    border-top:1px solid rgba(255,255,255,.08);
    margin-top:80px;
}

/* RESPONSIVE */

@media(max-width:900px){

    .restaurant-banner{
        flex-direction:column;
        text-align:center;
    }

    .restaurant-banner img{
        width:100%;
    }

    .restaurant-info h1{
        font-size:48px;
    }

    .restaurant-meta{
        justify-content:center;
    }

    .stats-grid{
        grid-template-columns:1fr 1fr;
    }

    .nav-links{
        display:none;
    }
}

</style>

</head>
<body>

<!-- NAVBAR -->

<nav class="navbar">

    <div class="logo">🍔 FoodHub</div>

    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/home">Home</a>
        <a href="menu?id=<%= restaurant.getRestaurantId() %>&filter=all">Menu</a>
        <a href="cart.jsp">Cart</a>
        <a href="order-history.jsp">Orders</a>
    </div>

    <a href="logout" class="profile-btn">
	    Logout
	</a>

</nav>

<!-- RESTAURANT BANNER -->

<section class="restaurant-banner">

   <img src="${pageContext.request.contextPath}/Restaurant_images/<%= restaurant.getImagePath() %>"
     alt="<%= restaurant.getName() %>">

    <div class="restaurant-info">

        <h1><%= restaurant.getName() %></h1>

        <p>
Welcome to <%= restaurant.getName() %>.
Enjoy delicious food and premium dining experience.
</p>

        <div class="restaurant-meta">

           <span>⭐ <%= restaurant.getRating() %> Rating</span>

            <span>🚚 <%= restaurant.getDeliveryTime() %> Mins</span>

            <span>🍔 <%= restaurant.getCuisineType() %></span>

            <span>📍 <%= restaurant.getAddress() %></span>

        </div>

<a href="menu?id=<%= restaurant.getRestaurantId() %>&filter=all"
   class="menu-btn">
    View Full Menu
</a>

    </div>

</section>

<!-- ABOUT -->

<section class="about">

    <h2>About Restaurant</h2>

    <p>
		<%= restaurant.getAbout() %>
	</p>

</section>

<!-- POPULAR DISHES -->

<section class="popular-dishes">

    <div class="section-title">

        <h2>Popular Dishes</h2>

        <p>Customer favourites</p>

    </div>

    <div class="dish-grid">

<%
for(Menu menu : menuList){
%>

<div class="dish-card">

    <img src="${pageContext.request.contextPath}/Menu_images/<%= menu.getImagePath() %>"
         alt="<%= menu.getItemName() %>">

    <div class="dish-content">

        <h3><%= menu.getItemName() %></h3>

        <p><%= menu.getDescription() %></p>

        <div class="price">
            ₹<%= menu.getPrice() %>
        </div>

    </div>

</div>

<%
}
%>

</div>

       

       

   

</section>

<!-- STATS -->

<section class="restaurant-stats">

    <div class="stats-grid">

        <div class="stat-card">

            <h2>500+</h2>

            <p>Orders Daily</p>

        </div>

        <div class="stat-card">

            <h2>4.8</h2>

            <p>Average Rating</p>

        </div>

        <div class="stat-card">

            <h2>25 Min</h2>

            <p>Delivery Time</p>

        </div>

        <div class="stat-card">

            <h2>50+</h2>

            <p>Menu Items</p>

        </div>

    </div>

</section>

<!-- FOOTER -->

<footer class="footer">

    © 2026 FoodHub. All Rights Reserved.

</footer>

</body>
</html>