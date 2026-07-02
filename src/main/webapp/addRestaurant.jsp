<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Restaurant | FoodHub Admin</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:#0d0d0d;
    color:white;
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
    margin-bottom:30px;
    color:#ffc107;
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
    font-size:15px;
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

    text-decoration:none;
    padding:12px 25px;
    border-radius:8px;
    font-weight:bold;
}

.save{

    background:#28a745;
    color:white;
    border:none;
    cursor:pointer;
}

.back{

    background:#6c757d;
    color:white;
}

</style>

</head>
<body>

<div class="container">

<h1>Add Restaurant</h1>

<form action="addRestaurant" method="post">

<div class="form-group">
<label>Restaurant Name</label>
<input type="text" name="name" required>
</div>

<div class="form-group">
<label>Cuisine Type</label>
<input type="text" name="cuisineType" required>
</div>

<div class="form-group">
<label>Delivery Time (Minutes)</label>
<input type="number" name="deliveryTime" required>
</div>

<div class="form-group">
<label>Address</label>
<input type="text" name="address" required>
</div>

<div class="form-group">
<label>Rating</label>
<input type="number" step="0.1" min="0" max="5" name="rating" required>
</div>

<div class="form-group">
<label>Status</label>

<select name="isActive">

<option value="true">Active</option>

<option value="false">Inactive</option>

</select>

</div>

<div class="form-group">
<label>Image Path</label>
<input type="text" name="imagePath"
placeholder="example.jpg" required>
</div>

<div class="form-group">
<label>About Restaurant</label>

<textarea name="about" required></textarea>

</div>

<div class="buttons">

<button type="submit" class="btn save">
Save Restaurant
</button>

<a href="restaurantManagement" class="btn back">
Back
</a>

</div>

</form>

</div>

</body>
</html>