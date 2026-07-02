<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.food.Model.User"%>

<%
User user = (User)request.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit User</title>

<style>

body{
    background:#0d0d0d;
    color:white;
    font-family:Poppins,sans-serif;
}

.container{
    width:600px;
    margin:40px auto;
    background:#1f1f1f;
    padding:35px;
    border-radius:12px;
}

h1{
    text-align:center;
    color:#ffc107;
    margin-bottom:30px;
}

.form-group{
    margin-bottom:20px;
}

label{
    display:block;
    margin-bottom:8px;
    color:#ffc107;
}

input,
select{

    width:100%;
    padding:12px;
    border:none;
    border-radius:8px;
    background:#2c2c2c;
    color:white;
}

.buttons{

    display:flex;
    justify-content:space-between;
    margin-top:30px;
}

.btn{

    padding:12px 22px;
    border:none;
    border-radius:8px;
    text-decoration:none;
    font-weight:bold;
    cursor:pointer;
}

.update{

    background:#28a745;
    color:white;
}

.back{

    background:#777;
    color:white;
}

</style>

</head>

<body>

<div class="container">

<h1>Edit User</h1>

<form action="updateUser" method="post">

<input type="hidden"
name="userId"
value="<%= user.getUserId() %>">

<div class="form-group">

<label>Username</label>

<input type="text"
name="userName"
value="<%= user.getUserName() %>"
required>

</div>

<div class="form-group">

<label>Email</label>

<input type="email"
name="email"
value="<%= user.getEmail() %>"
required>

</div>

<div class="form-group">

<label>Address</label>

<input type="text"
name="address"
value="<%= user.getAddress() %>"
required>

</div>

<div class="form-group">

<label>Role</label>

<select name="role">

<option value="customer"
<%= user.getRole().equals("customer") ? "selected" : "" %>>
Customer
</option>

<option value="hotelAgent"
<%= user.getRole().equals("hotelAgent") ? "selected" : "" %>>
Hotel Agent
</option>

<option value="deliveryAgent"
<%= user.getRole().equals("deliveryAgent") ? "selected" : "" %>>
Delivery Agent
</option>

<option value="superAdmin"
<%= user.getRole().equals("superAdmin") ? "selected" : "" %>>
Super Admin
</option>

</select>

</div>

<div class="buttons">

<button type="submit"
class="btn update">

Update User

</button>

<a href="userManagement"
class="btn back">

Back

</a>

</div>

</form>

</div>

</body>
</html>