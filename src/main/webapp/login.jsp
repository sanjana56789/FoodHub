
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodHub | Login</title>

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
    min-height:100vh;
    background:#0f0f0f;
    display:flex;
}

.left-panel{
    width:55%;
    background:linear-gradient(
    rgba(0,0,0,0.55),
    rgba(0,0,0,0.55)),
    url("https://images.unsplash.com/photo-1513104890138-7c749659a591");
    background-size:cover;
    background-position:center;
    display:flex;
    align-items:center;
    justify-content:center;
    padding:50px;
}

.hero-content{
    color:white;
    max-width:500px;
}

.hero-content h1{
    font-size:56px;
    line-height:1.2;
    margin-bottom:20px;
}

.hero-content p{
    color:#d0d0d0;
    font-size:18px;
    line-height:1.8;
}

.right-panel{
    width:45%;
    display:flex;
    justify-content:center;
    align-items:center;
    padding:40px;
    background:#121212;
}

.login-card{
    width:420px;
    background:#1a1a1a;
    padding:40px;
    border-radius:24px;
    border:1px solid rgba(255,255,255,0.08);
    box-shadow:0 20px 40px rgba(0,0,0,0.4);
}

.logo{
    color:#ff7a30;
    font-size:30px;
    font-weight:700;
    margin-bottom:20px;
}

.login-card h2{
    color:white;
    margin-bottom:10px;
}

.subtitle{
    color:#9c9c9c;
    margin-bottom:30px;
}

.form-group{
    margin-bottom:20px;
}

label{
    display:block;
    color:#e5e5e5;
    margin-bottom:8px;
    font-size:14px;
}

input{
    width:100%;
    padding:15px;
    background:#262626;
    border:none;
    border-radius:12px;
    color:white;
    outline:none;
}

input:focus{
    border:1px solid #ff7a30;
}

.login-btn{
    width:100%;
    padding:15px;
    background:#ff7a30;
    border:none;
    border-radius:12px;
    color:white;
    font-size:16px;
    font-weight:600;
    cursor:pointer;
    transition:.3s;
}

.login-btn:hover{
    background:#ff8f4f;
}

.register-text{
    text-align:center;
    margin-top:25px;
    color:#a0a0a0;
}

.register-text a{
    color:#ff7a30;
    text-decoration:none;
    font-weight:600;
}

.error{
    color:#ff5b5b;
    margin-bottom:15px;
    text-align:center;
}

@media(max-width:900px){

    .left-panel{
        display:none;
    }

    .right-panel{
        width:100%;
    }
}
</style>

</head>
<body>

<div class="left-panel">

    <div class="hero-content">
        <h1>Fresh Food Delivered To Your Door</h1>

        <p>
            Discover top restaurants, delicious meals,
            and lightning-fast delivery with FoodHub.
        </p>
    </div>

</div>

<div class="right-panel">

    <div class="login-card">

        <div class="logo">🍔 FoodHub</div>

        <h2>Welcome Back</h2>

        <p class="subtitle">
            Sign in to continue your food journey.
        </p>

        <%
            String error=(String)request.getAttribute("error");
            if(error!=null){
        %>
            <p class="error"><%=error%></p>
        <%
            }
        %>

        <form action="login" method="post">

            <div class="form-group">
                <label>Email Address</label>
                <input type="email"
                       name="email"
                       placeholder="Enter your email"
                       required>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password"
                       name="password"
                       placeholder="Enter your password"
                       required>
            </div>

            <button class="login-btn" type="submit">
                Sign In
            </button>

        </form>

        <div class="register-text">
            Don't have an account?
            <a href="register.jsp">Register</a>
        </div>

    </div>

</div>

</body>
</html>

