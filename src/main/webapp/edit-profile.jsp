<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.food.Model.User" %>

<%
User user = (User)session.getAttribute("loggedUser");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Edit Profile | FoodHub</title>
</head>

<style>
body{
    background:#0d0d0d;
    color:white;
    font-family:Poppins;
}

.container{
    width:500px;
    margin:60px auto;
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
textarea{

    width:100%;
    padding:12px;
    border:none;
    border-radius:10px;
    background:#262626;
    color:white;
}

textarea{
    height:120px;
}

button{

    margin-top:20px;
    background:#ffc107;
    color:black;
    border:none;
    padding:12px 25px;
    border-radius:10px;
    cursor:pointer;
    font-weight:bold;
}
</style>
<body>

<div class="container">

<h1>Edit Profile</h1>

<form action="updateProfile" method="post">

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

        <textarea
            name="address"
            required><%= user.getAddress() %></textarea>

    </div>

    <button type="submit">
        Update Profile
    </button>

</form>

<br>

<a href="profile.jsp">
    Back
</a>

</div>
</body>
</html>