<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.Model.Menu"%>

<%
List<Menu> menuList =
(List<Menu>)request.getAttribute("menuList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu Management</title>

<style>

body{
    margin:0;
    background:#0d0d0d;
    color:white;
    font-family:Poppins,sans-serif;
}

.container{
    width:95%;
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
    padding:8px 18px;
    border-radius:8px;
    text-decoration:none;
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
    border-radius:8px;
    text-decoration:none;
    font-weight:bold;
}

.back{
    background:#777;
    color:white;
    padding:12px 20px;
    border-radius:8px;
    text-decoration:none;
}

</style>

</head>

<body>

<div class="container">

<h1>Menu Management</h1>

<a href="addMenu.jsp" class="add">
+ Add Menu
</a>

<br><br>

<table>

<tr>

<th>ID</th>
<th>Restaurant ID</th>
<th>Item</th>
<th>Price</th>
<th>Category</th>
<th>Available</th>
<th>Actions</th>

</tr>

<%
for(Menu m : menuList){
%>

<tr>

<td><%=m.getMenuId()%></td>

<td><%=m.getRestaurantId()%></td>

<td><%=m.getItemName()%></td>

<td>₹<%=m.getPrice()%></td>

<td><%=m.getCategory()%></td>

<td><%=m.isAvailable()?"Yes":"No"%></td>

<td>

<a href="editMenu?menuId=<%=m.getMenuId()%>"
class="btn edit">
Edit
</a>

<a href="deleteMenu?menuId=<%=m.getMenuId()%>"
class="btn delete"
onclick="return confirm('Delete this menu item?');">
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
← Back
</a>

</div>

</body>
</html>