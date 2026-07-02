<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.food.Model.Menu"%>

<%@ page import="com.food.Model.HotelAgent" %>

<%
HotelAgent agent =
(HotelAgent)session.getAttribute("hotelAgent");
%>

<%
Menu menu = (Menu)request.getAttribute("menu");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Menu</title>

<style>

body{
    background:#0d0d0d;
    color:white;
    font-family:Poppins,sans-serif;
}

.container{
    width:600px;
    margin:40px auto;
    background:#1b1b1b;
    padding:35px;
    border-radius:15px;
}

h1{
    text-align:center;
    color:#ffc107;
    margin-bottom:30px;
}

.form-group{
    margin-bottom:18px;
}

label{
    display:block;
    margin-bottom:8px;
    color:#ffc107;
}

input,
textarea,
select{

    width:100%;
    padding:12px;
    border:none;
    border-radius:8px;
    background:#2c2c2c;
    color:white;
}

textarea{
    resize:none;
    height:120px;
}

.buttons{

    display:flex;
    justify-content:space-between;
    margin-top:25px;
}

.btn{

    padding:12px 25px;
    border:none;
    border-radius:8px;
    text-decoration:none;
    font-weight:bold;
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

<h1>Edit Menu</h1>

<form action="updateMenu" method="post">

<input type="hidden"
       name="menuId"
       value="<%= menu.getMenuId() %>">

<%
if(agent == null){
%>

<div class="form-group">

<label>Restaurant ID</label>

<input type="number"
       name="restaurantId"
       value="<%= menu.getRestaurantId() %>"
       required>

</div>

<%
}
%>

<div class="form-group">

<label>Item Name</label>

<input type="text"
       name="itemName"
       value="<%= menu.getItemName() %>"
       required>

</div>

<div class="form-group">

<label>Description</label>

<textarea
name="description"><%= menu.getDescription() %></textarea>

</div>

<div class="form-group">

<label>Price</label>

<input type="number"
       step="0.01"
       name="price"
       value="<%= menu.getPrice() %>"
       required>

</div>

<div class="form-group">

<label>Category</label>

<select name="category">

<option value="Veg"
<%= menu.getCategory().equals("Veg") ? "selected" : "" %>>
Veg
</option>

<option value="Non Veg"
<%= menu.getCategory().equals("Non Veg") ? "selected" : "" %>>
Non Veg
</option>

</select>

</div>

<div class="form-group">

<label>Available</label>

<select name="isAvailable">

<option value="true"
<%= menu.isAvailable() ? "selected" : "" %>>
Yes
</option>

<option value="false"
<%= !menu.isAvailable() ? "selected" : "" %>>
No
</option>

</select>

</div>

<div class="form-group">

<label>Image Path</label>

<input type="text"
       name="imagePath"
       value="<%= menu.getImagePath() %>"
       required>

</div>

<div class="buttons">

<button type="submit"
class="btn update">
Update Menu
</button>

<%
if(agent != null){
%>

<a href="hotelMenu" class="btn back">
Back
</a>

<%
}else{
%>

<a href="menuManagement" class="btn back">
Back
</a>

<%
}
%>

</div>

</form>

</div>

</body>
</html>