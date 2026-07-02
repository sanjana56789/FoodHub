<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
int totalOrders = (Integer)request.getAttribute("totalOrders");
int completed = (Integer)request.getAttribute("completed");
int pending = (Integer)request.getAttribute("pending");
double earnings = (Double)request.getAttribute("earnings");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Delivery Reports</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Poppins,sans-serif;
}

body{
background:#0f0f0f;
color:white;
padding:40px;
}

.top{
display:flex;
justify-content:space-between;
align-items:center;
margin-bottom:30px;
}

.back-btn{
text-decoration:none;
background:#777;
color:white;
padding:10px 20px;
border-radius:8px;
}

.cards{

display:grid;
grid-template-columns:repeat(2,1fr);
gap:25px;

}

.card{

background:#1b1b1b;
padding:40px;
border-radius:15px;
text-align:center;
border:1px solid #333;

}

.card h1{

color:#ffc107;
font-size:48px;
margin-bottom:15px;

}

.card p{

font-size:22px;

}

@media(max-width:768px){

.cards{

grid-template-columns:1fr;

}

}

</style>

</head>

<body>

<div class="top">

<h1>📊 Delivery Reports</h1>

<a href="delivery-dashboard.jsp"
class="back-btn">

← Back

</a>

</div>

<div class="cards">

<div class="card">

<h1><%=totalOrders%></h1>

<p>Total Assigned Orders</p>

</div>

<div class="card">

<h1><%=completed%></h1>

<p>Delivered Orders</p>

</div>

<div class="card">

<h1><%=pending%></h1>

<p>Pending Deliveries</p>

</div>

<div class="card">

<h1>₹<%=String.format("%.2f", earnings)%></h1>

<p>Total Delivered Amount</p>

</div>

</div>

</body>
</html>