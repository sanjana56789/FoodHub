
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.List" %>
<%@ page import="com.food.Model.Restaurant" %>
<%@ page import="com.food.Model.Menu" %>



<%
List<Restaurant> restaurants =
        (List<Restaurant>)request.getAttribute("restaurants");

String keyword =
        (String)request.getAttribute("keyword");

List<Menu> featuredMenus =
(List<Menu>)request.getAttribute("featuredMenus");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodHub | Home</title>

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

/* HERO */

.hero{
    min-height:85vh;
    display:flex;
    align-items:center;
    justify-content:space-between;
    padding:0 8%;
}

.hero-content{
    width:50%;
}

.hero-content h1{
    font-family:'Playfair Display',serif;
    font-size:72px;
    line-height:1.1;
    margin-bottom:25px;
}

.hero-content p{
    color:#bdbdbd;
    line-height:1.8;
    margin-bottom:35px;
}

.search-box{
    display:flex;
    width:550px;
    max-width:100%;
}

.search-box input{
    flex:1;
    padding:18px;
    border:none;
    outline:none;
    background:#1b1b1b;
    color:white;
    border-radius:12px 0 0 12px;
}

.search-box button{
    padding:18px 30px;
    border:none;
    background:#ffc107;
    color:black;
    font-weight:600;
    cursor:pointer;
    border-radius:0 12px 12px 0;
}

.cta-btn{
    display:inline-block;
    margin-top:25px;
    background:#ffc107;
    color:black;
    text-decoration:none;
    padding:14px 35px;
    border-radius:35px;
    font-weight:600;
}

.hero-image{
    width:42%;
}

.hero-image img{
    width:100%;
    border-radius:20px;
    filter:drop-shadow(0 20px 50px rgba(255,193,7,.25));
}

/* RESTAURANTS */

.restaurants{
    padding:100px 8%;
}

.section-title{
    text-align:center;
    margin-bottom:60px;
}

.section-title h2{
    font-family:'Playfair Display',serif;
    font-size:52px;
    color:white;
}

.section-title p{
    color:#bdbdbd;
    margin-top:10px;
}

.restaurant-grid{
    display:grid;
    grid-template-columns:repeat(5,1fr);
    gap:20px;
}

.search-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(320px,380px));
    justify-content:center;
    gap:30px;
    max-width:900px;
    margin:0 auto;
}

.restaurant-card{
    background:#1b1b1b;
    border-radius:20px;
    overflow:hidden;
    transition:.4s;
    border:1px solid rgba(255,255,255,.05);
}

.restaurant-card:hover{
    transform:translateY(-10px);
    box-shadow:0 15px 40px rgba(255,193,7,.15);
}

.restaurant-card img{
    width:100%;
    height:180px;
    object-fit:cover;
}

.restaurant-info{
    padding:25px;
}

.restaurant-info h3{
    margin-bottom:10px;
}

.restaurant-info p{
    color:#bdbdbd;
    margin-bottom:15px;
}

.details{
    display:flex;
    justify-content:space-between;
    margin-bottom:20px;
    color:#ffc107;
    font-weight:600;
}

.restaurant-info a{
    display:inline-block;
    text-decoration:none;
    background:#ffc107;
    color:black;
    padding:10px 20px;
    border-radius:30px;
    font-weight:600;
}

.restaurant-info a:hover{
    background:white;
}

/* FOOD CATEGORIES */

.categories{
    padding:100px 8%;
}

.category-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(180px,1fr));
    gap:25px;
    margin-top:50px;
}

.category-card{
    background:#1b1b1b;
    border-radius:20px;
    padding:35px;
    text-align:center;
    transition:.3s;
    border:1px solid rgba(255,255,255,.05);
}

.category-card:hover{
    transform:translateY(-8px);
    background:#242424;
}

.category-icon{
    font-size:50px;
    margin-bottom:15px;
}

.category-card h3{
    color:white;
}

/* FEATURED MENU */

.featured-menu{
    padding:100px 8%;
}

.menu-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(300px,1fr));
    gap:30px;
    margin-top:50px;
}

.menu-card{
    background:#1b1b1b;
    border-radius:20px;
    overflow:hidden;
    transition:.4s;
}

.menu-card:hover{
    transform:translateY(-10px);
}

.menu-card img{
    width:100%;
    height:240px;
    object-fit:cover;
}

.menu-content{
    padding:25px;
}

.menu-content h3{
    margin-bottom:10px;
}

.menu-content p{
    color:#bdbdbd;
    margin-bottom:20px;
}

.price-row{
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.price{
    color:#ffc107;
    font-size:22px;
    font-weight:700;
}

.order-btn{
    background:#ffc107;
    color:black;
    text-decoration:none;
    padding:10px 18px;
    border-radius:30px;
    font-weight:600;
}



/* WHY CHOOSE US */

.why-us{
    padding:100px 8%;
}

.why-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:30px;
    margin-top:60px;
}

.why-card{
    background:#1b1b1b;
    padding:40px 25px;
    border-radius:20px;
    text-align:center;
    transition:.3s;
    border:1px solid rgba(255,255,255,.05);
}

.why-card:hover{
    transform:translateY(-10px);
    box-shadow:0 15px 40px rgba(255,193,7,.15);
}

.why-icon{
    font-size:55px;
    margin-bottom:20px;
}

.why-card h3{
    margin-bottom:15px;
}

.why-card p{
    color:#bdbdbd;
    line-height:1.7;
}


/* REVIEWS */

.reviews{
    padding:100px 8%;
}

.review-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(300px,1fr));
    gap:30px;
    margin-top:60px;
}

.review-card{
    background:#1b1b1b;
    padding:35px;
    border-radius:20px;
    border:1px solid rgba(255,255,255,.05);
}

.review-stars{
    color:#ffc107;
    font-size:22px;
    margin-bottom:15px;
}

.review-card p{
    color:#d0d0d0;
    line-height:1.8;
    margin-bottom:20px;
}

.review-user{
    color:#ffc107;
    font-weight:600;
}


/* FOOTER */

.footer{
    background:#111;
    padding:80px 8% 30px;
    margin-top:50px;
    border-top:1px solid rgba(255,255,255,.05);
}

.footer-container{
    display:grid;
    grid-template-columns:2fr 1fr 1fr;
    gap:40px;
}

.footer-logo{
    font-size:36px;
    font-weight:700;
    color:#ffc107;
    margin-bottom:20px;
}

.footer p{
    color:#bdbdbd;
    line-height:1.8;
}

.footer h3{
    margin-bottom:20px;
}

.footer ul{
    list-style:none;
}

.footer ul li{
    margin-bottom:12px;
}

.footer ul li a{
    text-decoration:none;
    color:#bdbdbd;
    transition:.3s;
}

.footer ul li a:hover{
    color:#ffc107;
}

.footer-bottom{
    text-align:center;
    margin-top:50px;
    padding-top:25px;
    border-top:1px solid rgba(255,255,255,.05);
    color:#9a9a9a;
}

@media(max-width:768px){

    .footer-container{
        grid-template-columns:1fr;
        text-align:center;
    }

}
/* RESPONSIVE */

@media(max-width:900px){

    .hero{
        flex-direction:column;
        text-align:center;
        padding-top:50px;
    }

    .hero-content,
    .hero-image{
        width:100%;
    }

    .hero-content h1{
        font-size:48px;
    }

    .search-box{
        margin:auto;
    }

    .nav-links{
        display:none;
    }
}
html{
    scroll-behavior:smooth;
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






.back-link{
    width:85%;
    margin:20px auto 10px;
}

.back-link a{
    color:#ffc107;
    text-decoration:none;
    font-size:17px;
    font-weight:600;
    transition:0.3s;
}

.back-link a:hover{
    color:white;
    padding-left:8px;
}
</style>
</head>

<body>

<!-- NAVBAR -->

<nav class="navbar">

    <div class="logo">🍔 FoodHub</div>

    <div class="nav-links">
        <a href="home">Home</a>
		<a href="#restaurants">Restaurants</a>
		<a href="orderHistory">Orders</a>
		<a href="cart.jsp">Cart 🛒</a>
		<a href="#footer">Contact</a>
    </div>
    
    <div class="nav-actions">

	    <a href="profile.jsp" class="profile-btn">
	        Profile
	    </a>
	
	    <a href="logout" class="logout-btn">
	        Logout
	    </a>

	</div>

</nav>
<%
if(keyword != null){
%>

<div style="max-width:1000px;margin:25px auto 15px;">

    <div class="back-link">
    <a href="javascript:history.back()">← Back</a>
</div>

</div>

<%
}
%>



<%
if(keyword == null){
%>
<!-- HERO SECTION -->

<section class="hero">

    <div class="hero-content">

        <h1>
            Fresh & Healthy
            Food Delivered Fast
        </h1>

        <p>
            Explore top-rated restaurants, delicious meals,
            and lightning-fast delivery at your doorstep.
        </p>

      <form action="searchRestaurant" method="get">

    <div class="search-box">

        <input type="text"
               name="keyword"
               placeholder="Search restaurants...">
		
		<button type="submit">
            Search
        </button>
        

    </div>

</form>

        <a href="#restaurants" class="cta-btn">
    		Order Now
		</a>

    </div>

    <div class="hero-image">

        <img src="https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=800"
             alt="Food">

    </div>

</section>
<%
}
%>


<!-- POPULAR RESTAURANTS -->
<div class="section-title">

<%
if(keyword != null){
%>

    

<%
}else{
%>

    <h2>Popular Restaurants</h2>

    <p>Top rated restaurants near you</p>

<%
}
%>

</div>


<section id="restaurants" class="restaurants">

    <div class="<%= keyword != null ? "search-grid" : "restaurant-grid" %>">



<%
if(restaurants != null){
	
    for(Restaurant restaurant : restaurants){
%>

    <div class="restaurant-card">

<img src="${pageContext.request.contextPath}/Restaurant_images/<%= restaurant.getImagePath() %>"
     alt="<%= restaurant.getName() %>">

        <div class="restaurant-info">

            <h3><%= restaurant.getName() %></h3>

            <p><%= restaurant.getCuisineType() %></p>

            <div class="details">
                <span>⭐ <%= restaurant.getRating() %></span>
                <span><%= restaurant.getDeliveryTime() %> mins</span>
            </div>

            <a href="restaurant?id=<%= restaurant.getRestaurantId() %>">
                View Menu
            </a>

        </div>

    </div>

<%
    }
}
%>

</div>

</section>


<%
if(keyword == null){
%>
<!-- FOOD CATEGORIES -->

<section class="categories">

    <div class="section-title">
        <h2>Food Categories</h2>
        <p>Choose your favorite food</p>
    </div>

    <div class="category-grid">

        <div class="category-card">
            <div class="category-icon">🍕</div>
            <h3>Pizza</h3>
        </div>

        <div class="category-card">
            <div class="category-icon">🍔</div>
            <h3>Burger</h3>
        </div>

        <div class="category-card">
            <div class="category-icon">🍛</div>
            <h3>Biryani</h3>
        </div>

        <div class="category-card">
            <div class="category-icon">🥡</div>
            <h3>Chinese</h3>
        </div>

    </div>

</section>

<!-- FEATURED MENU -->

<section class="featured-menu">

    <div class="section-title">
        <h2>Featured Menu</h2>
        <p>Chef's special recommendations</p>
    </div>

<div class="menu-grid">

<%
if(featuredMenus != null){

    for(Menu menu : featuredMenus){
%>

<div class="menu-card">

    <img src="${pageContext.request.contextPath}/Menu_images/<%= menu.getImagePath() %>"
         alt="<%= menu.getItemName() %>">

    <div class="menu-content">

        <h3><%= menu.getItemName() %></h3>

        <p>
            <%= menu.getDescription() %>
        </p>

        <div class="price-row">

            <span class="price">
                ₹<%= menu.getPrice() %>
            </span>

            <a href="restaurant?id=<%= menu.getRestaurantId() %>"
               class="order-btn">
                View Restaurant
            </a>

        </div>

    </div>

</div>

<%
    }
}
%>

</div>

</section>

<!-- WHY CHOOSE US -->

<section class="why-us">

    <div class="section-title">
        <h2>Why Choose FoodHub</h2>
        <p>Experience premium food delivery services</p>
    </div>

    <div class="why-grid">

        <div class="why-card">

            <div class="why-icon">⚡</div>

            <h3>Fast Delivery</h3>

            <p>
                Get your favorite meals delivered
                quickly and efficiently.
            </p>

        </div>

        <div class="why-card">

            <div class="why-icon">👨‍🍳</div>

            <h3>Expert Chefs</h3>

            <p>
                Prepared by experienced chefs
                using premium ingredients.
            </p>

        </div>

        <div class="why-card">

            <div class="why-icon">🥗</div>

            <h3>Fresh Ingredients</h3>

            <p>
                We use only fresh and quality
                ingredients in every meal.
            </p>

        </div>

        <div class="why-card">

            <div class="why-icon">💳</div>

            <h3>Secure Payment</h3>

            <p>
                Multiple payment methods
                with complete security.
            </p>

        </div>

    </div>

</section>


<!-- CUSTOMER REVIEWS -->

<section class="reviews">

    <div class="section-title">
        <h2>What Our Customers Say</h2>
        <p>Trusted by thousands of food lovers</p>
    </div>

    <div class="review-grid">

        <div class="review-card">

            <div class="review-stars">
                ⭐⭐⭐⭐⭐
            </div>

            <p>
                Amazing food quality and very fast
                delivery. The user experience is
                excellent and ordering is simple.
            </p>

            <div class="review-user">
                Rahul Sharma
            </div>

        </div>

        <div class="review-card">

            <div class="review-stars">
                ⭐⭐⭐⭐⭐
            </div>

            <p>
                One of the best food delivery
                platforms I have used. Great
                restaurants and affordable prices.
            </p>

            <div class="review-user">
                Priya Verma
            </div>

        </div>

        <div class="review-card">

            <div class="review-stars">
                ⭐⭐⭐⭐⭐
            </div>

            <p>
                Fresh food, secure payments and
                quick delivery every time.
                Highly recommended.
            </p>

            <div class="review-user">
                Arjun Patel
            </div>

        </div>

    </div>

</section>


<!-- FOOTER -->

<footer id="footer" class="footer">

    <div class="footer-container">

        <div>

            <div class="footer-logo">
                🍔 FoodHub
            </div>

            <p>
                Discover the best restaurants,
                delicious meals and lightning-fast
                delivery at your doorstep.
            </p>

        </div>

        <div>

            <h3>Quick Links</h3>

            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">Restaurants</a></li>
                <li><a href="#">Orders</a></li>
                <li><a href="#">Contact</a></li>
            </ul>

        </div>

        <div>

            <h3>Contact</h3>

            <ul>
                <li>support@foodhub.com</li>
                <li>+91 9876543210</li>
                <li>Bengaluru, India</li>
            </ul>

        </div>

    </div>

    <div class="footer-bottom">
        © 2026 FoodHub. All Rights Reserved.
    </div>

</footer>
<%
}
%>


<%
if(keyword != null){
%>

<script>

window.onload = function(){

    document.getElementById("restaurants").scrollIntoView({
        behavior:"smooth"
    });

}

</script>

<%
}
%>
</body>
</html>

