<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.Model.Restaurant"%>

<%
List<Restaurant> restaurants =
(List<Restaurant>)request.getAttribute("restaurants");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurant Management</title>

<style>

body{
    margin:0;
    background:#0d0d0d;
    color:white;
    font-family:Poppins,sans-serif;
}

.container{
    width:90%;
    margin:40px auto;
}

h1{
    margin-bottom:30px;
}

table{
    width:100%;
    border-collapse:collapse;
    background:#1f1f1f;
}

th,td{
    padding:15px;
    text-align:center;
}

th{
    background:#ffc107;
    color:black;
}

tr:nth-child(even){
    background:#2b2b2b;
}

.btn{
    text-decoration:none;
    padding:8px 18px;
    border-radius:8px;
    color:white;
}

.edit{
    background:#28a745;
}

.delete{
    background:#dc3545;
}

.add{
    background:#ffc107;
    color:black;
    padding:12px 20px;
    border-radius:10px;
    text-decoration:none;
    margin-bottom:20px;
    display:inline-block;
}

.back{
    background:#777;
    color:white;
    padding:12px 20px;
    border-radius:10px;
    text-decoration:none;
}

</style>

</head>
<body>

<div class="container">

<h1>Restaurant Management</h1>

<a href="addRestaurant.jsp"
   style="background:#ffc107;
          color:black;
          text-decoration:none;
          padding:12px 20px;
          border-radius:8px;
          font-weight:bold;">
    + Add Restaurant
</a>

<table>

<tr>

<th>ID</th>
<th>Name</th>
<th>Cuisine</th>
<th>Rating</th>
<th>Status</th>
<th>Actions</th>

</tr>

<%
for(Restaurant r : restaurants){
%>

<tr>

<td><%=r.getRestaurantId()%></td>

<td><%=r.getName()%></td>

<td><%=r.getCuisineType()%></td>

<td><%=r.getRating()%></td>

<td>
<%=r.isActive()?"Active":"Inactive"%>
</td>

<td>

<a href="editRestaurant?restaurantId=<%= r.getRestaurantId() %>"
   class="btn edit">
    Edit
</a>

<a href="deleteRestaurant?restaurantId=<%= r.getRestaurantId() %>"
   class="btn delete"
   onclick="return confirm('Are you sure you want to delete this restaurant?');">
    Delete
</a>

</td>

</tr>

<%
}
%>

</table>

<br><br>

<a href="adminDashboard" class="back">
← Back to Dashboard
</a>

</div>

</body>
</html>