<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.food.Model.User"%>

<%
User admin=(User)session.getAttribute("admin");

if(admin==null){
    response.sendRedirect("admin-login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard | FoodHub</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Poppins,sans-serif;
}

body{
background:#0d0d0d;
color:white;
}

.header{

display:flex;
justify-content:space-between;
align-items:center;
padding:25px 8%;
background:#171717;
}

.logo{

font-size:32px;
font-weight:bold;
color:#ffc107;
}

.logout{

text-decoration:none;
background:#ff5252;
color:white;
padding:12px 25px;
border-radius:10px;
}

.container{

width:90%;
margin:50px auto;
}

h1{

margin-bottom:40px;
}

.cards{

display:grid;
grid-template-columns:repeat(2,1fr);
gap:30px;
}

.card{

background:#1f1f1f;
padding:40px;
border-radius:20px;
text-align:center;
transition:.3s;
}

.card:hover{

transform:translateY(-8px);
}

.card h2{

color:#ffc107;
margin-bottom:20px;
}

.card a{

display:inline-block;
margin-top:20px;
text-decoration:none;
background:#ffc107;
color:black;
padding:12px 25px;
border-radius:10px;
font-weight:bold;
}

</style>

</head>
<body>

<div class="header">

<div class="logo">
🍔 FoodHub Admin
</div>

<a href="logout" class="logout">
Logout
</a>

</div>

<div class="container">

<h1>
Welcome,
<%=admin.getUserName()%>
</h1>

<div class="cards">

<div class="card">

<h2>Restaurants</h2>

<p>
Manage Restaurants
</p>

<a href="restaurantManagement">
    Open
</a>

</div>

<div class="card">

<h2>Menus</h2>

<p>
Manage Menu Items
</p>

<a href="menuManagement">
    Open
</a>

</div>

<div class="card">

<h2>Orders</h2>

<p>
View Customer Orders
</p>

<a href="orderManagement">
    Open
</a>

</div>

<div class="card">

<h2>Users</h2>

<p>
Manage Users
</p>

<a href="userManagement">
    Open
</a>

</div>

</div>

</div>

</body>
</html>