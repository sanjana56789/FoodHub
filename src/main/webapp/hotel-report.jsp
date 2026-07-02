<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
int totalOrders = (Integer)request.getAttribute("totalOrders");
double revenue = (Double)request.getAttribute("revenue");
int pending = (Integer)request.getAttribute("pending");
int delivered = (Integer)request.getAttribute("delivered");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurant Reports</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

body{
background:#0f0f0f;
color:white;
padding:40px;
}

.header{
display:flex;
justify-content:space-between;
align-items:center;
margin-bottom:40px;
}

.back-btn{
text-decoration:none;
background:#666;
color:white;
padding:10px 20px;
border-radius:8px;
font-weight:600;
}

.back-btn:hover{
background:#555;
}

.cards{

display:grid;
grid-template-columns:repeat(2,1fr);
gap:25px;

}

.card{

background:#1b1b1b;
padding:35px;
border-radius:18px;
text-align:center;
border:1px solid rgba(255,255,255,.08);

transition:.3s;

}

.card:hover{

transform:translateY(-8px);

box-shadow:0 15px 35px rgba(255,193,7,.15);

}

.card h2{

font-size:42px;
color:#ffc107;
margin-bottom:10px;

}

.card p{

font-size:18px;
color:#ddd;

}

@media(max-width:800px){

.cards{

grid-template-columns:1fr;

}

}

</style>

</head>

<body>

<div class="header">

<h1>📊 Restaurant Reports</h1>

<a href="hotel-dashboard.jsp" class="back-btn">
← Back
</a>

</div>

<div class="cards">

<div class="card">

<h2><%=totalOrders%></h2>

<p>Total Orders</p>

</div>

<div class="card">

<h2>₹ <%=revenue%></h2>

<p>Total Revenue</p>

</div>

<div class="card">

<h2><%=pending%></h2>

<p>Pending Orders</p>

</div>

<div class="card">

<h2><%=delivered%></h2>

<p>Delivered Orders</p>

</div>

</div>

</body>
</html>