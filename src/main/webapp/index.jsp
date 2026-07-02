<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodHub</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{

    height:100vh;

    background:
    linear-gradient(rgba(0,0,0,.65),
    rgba(0,0,0,.65)),
    url("https://images.unsplash.com/photo-1504674900247-0877df9cc836");

    background-size:cover;
    background-position:center;

    display:flex;
    justify-content:center;
    align-items:center;
}

.container{

    width:500px;

    background:rgba(255,255,255,.08);

    backdrop-filter:blur(12px);

    padding:50px;

    border-radius:20px;

    text-align:center;

    color:white;
}

h1{

    color:#ffc107;

    font-size:48px;

    margin-bottom:10px;
}

p{

    color:#ddd;

    margin-bottom:35px;
}

.btn{

    display:block;

    text-decoration:none;

    background:#ffc107;

    color:black;

    margin:15px 0;

    padding:15px;

    border-radius:12px;

    font-size:18px;

    font-weight:bold;

    transition:.3s;
}

.btn:hover{

    transform:scale(1.04);

    background:#ffca2c;
}

.footer{

    margin-top:35px;

    color:#bbb;

    font-size:14px;
}

</style>

</head>

<body>

<div class="container">

<h1>🍔 FoodHub</h1>

<p>
Delicious Food Delivered To Your Doorstep
</p>

<a href="login.jsp" class="btn">
👤 Customer Login
</a>

<a href="admin-login.jsp" class="btn">
🛠 Super Admin Login
</a>

<a href="hotel-login.jsp" class="btn">
🏨 Hotel Agent Login
</a>

<a href="delivery-login.jsp" class="btn">
🚚 Delivery Agent Login
</a>

<div class="footer">

© 2026 FoodHub

</div>

</div>

</body>
</html>