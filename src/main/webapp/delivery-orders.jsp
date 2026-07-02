<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.food.Model.OrderTable"%>

<%
List<OrderTable> orders =
(List<OrderTable>)request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Assigned Orders</title>

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
margin-bottom:20px;
}

.back-btn{
text-decoration:none;
background:#777;
color:white;
padding:10px 20px;
border-radius:8px;
}

table{
width:100%;
border-collapse:collapse;
background:#1b1b1b;
}

th{
background:#ffc107;
color:black;
padding:14px;
}

td{
padding:14px;
text-align:center;
border-bottom:1px solid #333;
}

tr:hover{
background:#262626;
}

.action-btn{
background:#28a745;
color:white;
padding:8px 16px;
border-radius:8px;
text-decoration:none;
font-weight:600;
}

.action-btn:hover{
background:#218838;
}

</style>

</head>

<body>

<div class="top">

<h1>🚚 Assigned Orders</h1>

<a href="delivery-dashboard.jsp" class="back-btn">
← Back
</a>

</div>

<table>

<tr>

<th>Order ID</th>
<th>User ID</th>
<th>Order Date</th>
<th>Total</th>
<th>Payment</th>
<th>Status</th>
<th>Action</th>

</tr>

<%
if(orders != null){

for(OrderTable order : orders){
%>

<tr>

<td><%=order.getOrderId()%></td>

<td><%=order.getUserId()%></td>

<td><%=order.getOrderDate()%></td>

<td>₹<%=order.getTotalAmount()%></td>

<td><%=order.getPaymentMethod()%></td>

<td><%=order.getStatus()%></td>

<td>

<a href="deliverOrder?orderId=<%=order.getOrderId()%>"
class="action-btn">

Delivered

</a>

</td>

</tr>

<%
}
}
%>

</table>

</body>
</html>