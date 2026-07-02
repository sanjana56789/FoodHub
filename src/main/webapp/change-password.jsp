<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.food.Model.User"%>

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
<meta charset="UTF-8">
<title>Change Password | FoodHub</title>

<style>

body{
    background:#0d0d0d;
    color:white;
    font-family:Poppins;
}

.container{
    width:450px;
    margin:70px auto;
    background:#1b1b1b;
    padding:35px;
    border-radius:20px;
}

h1{
    margin-bottom:30px;
    text-align:center;
}

.form-group{
    margin-bottom:20px;
}

label{
    display:block;
    margin-bottom:8px;
    color:#ffc107;
}

input{
    width:100%;
    padding:12px;
    border:none;
    border-radius:10px;
    background:#262626;
    color:white;
}

button{

    width:100%;
    margin-top:20px;
    padding:12px;
    background:#ffc107;
    color:black;
    border:none;
    border-radius:10px;
    font-weight:bold;
    cursor:pointer;
}

.back{

    display:block;
    text-align:center;
    margin-top:20px;
    color:#ffc107;
    text-decoration:none;
}

.error{

    color:red;
    text-align:center;
    margin-bottom:15px;
}

.success{

    color:lightgreen;
    text-align:center;
    margin-bottom:15px;
}

</style>

</head>

<body>

<div class="container">

<h1>Change Password</h1>

<%
String error=(String)request.getAttribute("error");

if(error!=null){
%>

<p class="error"><%=error%></p>

<%
}

String success=(String)request.getAttribute("success");

if(success!=null){
%>

<p class="success"><%=success%></p>

<%
}
%>

<form action="changePassword" method="post">

<div class="form-group">

<label>Current Password</label>

<input type="password"
       name="currentPassword"
       required>

</div>

<div class="form-group">

<label>New Password</label>

<input type="password"
       name="newPassword"
       required>

</div>

<div class="form-group">

<label>Confirm New Password</label>

<input type="password"
       name="confirmPassword"
       required>

</div>

<button type="submit">
Update Password
</button>

</form>

<a href="profile.jsp" class="back">
← Back to Profile
</a>

</div>

</body>
</html>