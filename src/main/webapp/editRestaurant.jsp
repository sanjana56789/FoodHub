<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.food.Model.Restaurant" %>

<%
Restaurant restaurant =
(Restaurant)request.getAttribute("restaurant");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Restaurant</title>

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
    margin-bottom:20px;
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
    font-weight:bold;
    cursor:pointer;
    text-decoration:none;
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

<h1>Edit Restaurant</h1>

<form action="updateRestaurant" method="post">

<input type="hidden"
       name="restaurantId"
       value="<%= restaurant.getRestaurantId() %>">

<div class="form-group">

<label>Restaurant Name</label>

<input type="text"
       name="name"
       value="<%= restaurant.getName() %>"
       required>

</div>

<div class="form-group">

<label>Cuisine Type</label>

<input type="text"
       name="cuisineType"
       value="<%= restaurant.getCuisineType() %>"
       required>

</div>

<div class="form-group">

<label>Delivery Time</label>

<input type="number"
       name="deliveryTime"
       value="<%= restaurant.getDeliveryTime() %>"
       required>

</div>

<div class="form-group">

<label>Address</label>

<input type="text"
       name="address"
       value="<%= restaurant.getAddress() %>"
       required>

</div>

<div class="form-group">

<label>Rating</label>

<input type="number"
       step="0.1"
       name="rating"
       value="<%= restaurant.getRating() %>"
       required>

</div>

<div class="form-group">

<label>Status</label>

<select name="isActive">

<option value="true"
<%= restaurant.isActive() ? "selected" : "" %>>
Active
</option>

<option value="false"
<%= !restaurant.isActive() ? "selected" : "" %>>
Inactive
</option>

</select>

</div>

<div class="form-group">

<label>Image Path</label>

<input type="text"
       name="imagePath"
       value="<%= restaurant.getImagePath() %>"
       required>

</div>

<div class="form-group">

<label>About</label>

<textarea name="about"><%= restaurant.getAbout() %></textarea>

</div>

<div class="buttons">

<button type="submit"
        class="btn update">
Update Restaurant
</button>

<a href="restaurantManagement"
   class="btn back">
Back
</a>

</div>

</form>

</div>

</body>
</html>