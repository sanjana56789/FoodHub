<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.Model.User"%>

<%
List<User> users =
(List<User>)request.getAttribute("users");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Management</title>

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

<h1>User Management</h1>

<table>

<tr>

<th>ID</th>
<th>Username</th>
<th>Email</th>
<th>Role</th>
<th>Address</th>
<th>Created Date</th>
<th>Last Login</th>
<th>Actions</th>

</tr>

<%
if(users != null){

for(User user : users){
%>

<tr>

<td><%= user.getUserId() %></td>

<td><%= user.getUserName() %></td>

<td><%= user.getEmail() %></td>

<td><%= user.getRole() %></td>

<td><%= user.getAddress() %></td>

<td><%= user.getCreateDate() %></td>

<td><%= user.getLastLoginDate() %></td>

<td>

<a href="editUser?userId=<%= user.getUserId() %>"
class="btn edit">

Edit

</a>

<a href="deleteUser?userId=<%= user.getUserId() %>"
class="btn delete"
onclick="return confirm('Delete this user?');">

Delete

</a>

</td>

</tr>

<%
}
}
%>

</table>

<br><br>

<a href="adminDashboard"
class="back">

← Back

</a>

</div>

</body>
</html>