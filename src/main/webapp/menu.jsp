<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.List" %>
<%@ page import="com.food.Model.Menu" %>

<%
List<Menu> menuList =
(List<Menu>)request.getAttribute("menuList");
%>

<%
Integer restaurantId = (Integer) request.getAttribute("restaurantId");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu | FoodHub</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    background:#0d0d0d !important;
    color:white;
    font-family:'Poppins',sans-serif;
}
/* =========================
   MENU HEADER
========================= */
.header-top{
    width:100%;
    display:flex;
    justify-content:flex-start;
    margin-bottom:30px;
}

.menu-header{
    text-align:center;
    padding:80px 8% 50px;
}

.menu-header h1{
    font-size:65px;
    font-family:'Playfair Display',serif;
}

.menu-header p{
    color:#bdbdbd;
    margin-top:15px;
}


/* =========================
   MENU FILTERS
========================= */

.menu-filters{
    display:flex;
    justify-content:center;
    gap:15px;
    flex-wrap:wrap;
    margin-bottom:60px;
}

.menu-filters a{
    text-decoration:none;
    background:rgba(255,255,255,0.05);
    border:1px solid rgba(255,255,255,0.08);
    color:white;
    padding:12px 24px;
    border-radius:50px;
    transition:0.3s;
}

.menu-filters a:hover{
    background:#ffc107;
    color:black;
}



/*
back button
*/

.top-bar{
    width:84%;
    margin:30px auto 0;
}

.back-btn{
    display:inline-block;
    background:#ffc107;
    color:#000;
    text-decoration:none;
    padding:10px 22px;
    border-radius:30px;
    font-weight:600;
    transition:.3s;
}

.back-btn:hover{
    background:#ffca2c;
}

/* =========================
   MENU GRID
========================= */

.menu-section{
    padding:0 8% 100px;
}

.menu-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(300px,320px));
    justify-content:center;
    gap:30px;
}

.menu-card{
    width:320px;
    background:#1b1b1b;
    border-radius:20px;
    overflow:hidden;
    transition:.3s;
}

.menu-card:hover{
    transform:translateY(-10px);
}

.menu-card img{
    width:100%;
    height:250px;
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
    margin-bottom:15px;
}

.menu-bottom{
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.price{
    color:#ffc107;
    font-size:24px;
    font-weight:700;
}

.add-btn{
    background:#ffc107;
    color:black;
    padding:10px 20px;
    border-radius:30px;
    text-decoration:none;
    font-weight:600;
}

</style>

</head>
<body>

<!-- MENU HEADER -->

<section class="menu-header">

    <div class="header-top">
        <a href="restaurant?id=<%= request.getAttribute("restaurantId") %>"
           class="back-btn">
           ← Back
        </a>
    </div>

    <h1>Our Delicious Menu</h1>

    <p>Handcrafted meals prepared with premium ingredients</p>

</section>


<!-- FILTERS -->
<div class="menu-filters">

<a href="menu?id=<%= restaurantId %>&filter=all">All</a>

<a href="menu?id=<%= restaurantId %>&filter=veg">🥗 Veg</a>

<a href="menu?id=<%= restaurantId %>&filter=nonveg">🍗 Non Veg</a>

<a href="menu?id=<%= restaurantId %>&filter=low">↑ Price Low</a>

<a href="menu?id=<%= restaurantId %>&filter=high">↓ Price High</a>

</div>



<!-- MENU ITEMS -->

<section class="menu-section">
<div class="menu-grid">

<%
if(menuList != null && !menuList.isEmpty()){

    for(Menu menu : menuList){
%>

    <div class="menu-card">

        <img src="${pageContext.request.contextPath}/Menu_images/<%= menu.getImagePath() %>"
             alt="<%= menu.getItemName() %>">

        <div class="menu-content">

            <h3><%= menu.getItemName() %></h3>

            <p><%= menu.getDescription() %></p>

            <div class="menu-bottom">

                <span class="price">
                    ₹<%= menu.getPrice() %>
                </span>

                <a href="addToCart?menuId=<%= menu.getMenuId() %>"
                   class="add-btn">
                    Add Cart
                </a>

            </div>

        </div>

    </div>

<%
    }

}else{
%>

    <h2 style="width:100%; text-align:center; color:#ffc107;">
        No menu items found.
    </h2>

<%
}
%>

</div>
</section>


</body>
</html>