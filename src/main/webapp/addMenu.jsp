<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.food.Model.HotelAgent" %>

<%
HotelAgent agent =
(HotelAgent)session.getAttribute("hotelAgent");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Menu</title>

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

    margin-top:30px;
    display:flex;
    justify-content:space-between;
}

.btn{

    padding:12px 25px;
    border:none;
    border-radius:8px;
    text-decoration:none;
    font-weight:bold;
}

.save{

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

<h1>Add Menu Item</h1>

<form action="addMenu" method="post">

<%
if(agent == null){
%>

<div class="form-group">

<label>Restaurant ID</label>

<input type="number"
       name="restaurantId"
       required>

</div>

<%
}
%>

<div class="form-group">
<label>Item Name</label>
<input type="text" name="itemName" required>
</div>

<div class="form-group">
<label>Description</label>
<textarea name="description" required></textarea>
</div>

<div class="form-group">
<label>Price</label>
<input type="number" step="0.01" name="price" required>
</div>

<div class="form-group">
<label>Category</label>

<select name="category">

<option>Veg</option>
<option>Non Veg</option>

</select>

</div>

<div class="form-group">
<label>Available</label>

<select name="isAvailable">

<option value="true">Yes</option>

<option value="false">No</option>

</select>

</div>

<div class="form-group">
<label>Image Path</label>
<input type="text" name="imagePath" required>
</div>

<div class="buttons">

<button type="submit"
class="btn save">

Save Menu

</button>

<a href="menuManagement"
class="btn back">

Back

</a>

</div>

</form>

</div>

</body>
</html>