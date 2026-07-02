<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodHub | Register</title>

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
    url("https://images.unsplash.com/photo-1504674900247-0877df9cc836");
    background-size:cover;
    background-position:center;
    display:flex;
    justify-content:center;
    align-items:center;
    padding:50px;
}

.hero-content{
    color:white;
    max-width:500px;
}

.hero-content h1{
    font-size:54px;
    margin-bottom:20px;
    line-height:1.2;
}

.hero-content p{
    color:#d0d0d0;
    font-size:18px;
    line-height:1.8;
}

.right-panel{
    width:45%;
    background:#121212;
    display:flex;
    justify-content:center;
    align-items:center;
    padding:40px;
}

.register-card{
    width:450px;
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

.register-card h2{
    color:white;
    margin-bottom:10px;
}

.subtitle{
    color:#9c9c9c;
    margin-bottom:25px;
}

.form-group{
    margin-bottom:16px;
}

label{
    display:block;
    color:#e5e5e5;
    margin-bottom:8px;
    font-size:14px;
}

input, textarea{
    width:100%;
    padding:14px;
    border:none;
    border-radius:12px;
    background:#262626;
    color:white;
    outline:none;
}

input:focus,
textarea:focus{
    border:1px solid #ff7a30;
}

textarea{
    resize:none;
    height:80px;
}

.register-btn{
    width:100%;
    padding:15px;
    margin-top:10px;
    background:#ff7a30;
    color:white;
    border:none;
    border-radius:12px;
    font-size:16px;
    font-weight:600;
    cursor:pointer;
    transition:.3s;
}

.register-btn:hover{
    background:#ff8f4f;
}

.login-link{
    margin-top:20px;
    text-align:center;
    color:#9c9c9c;
}

.login-link a{
    color:#ff7a30;
    text-decoration:none;
    font-weight:600;
}

.error{
    color:#ff5b5b;
    text-align:center;
    margin-bottom:15px;
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

        <h1>Join FoodHub Today</h1>

        <p>
            Discover amazing restaurants,
            order your favorite meals,
            and enjoy fast doorstep delivery.
        </p>

    </div>

</div>

<div class="right-panel">

    <div class="register-card">

        <div class="logo">🍔 FoodHub</div>

        <h2>Create Account</h2>

        <p class="subtitle">
            Sign up and start ordering delicious food.
        </p>

        <%
            String error=(String)request.getAttribute("error");
            if(error!=null){
        %>
            <p class="error"><%=error%></p>
        <%
            }
        %>

        <form action="register" method="post">

            <div class="form-group">
                <label>Username</label>
                <input type="text"
                       name="username"
                       placeholder="Enter username"
                       required>
            </div>

            <div class="form-group">
                <label>Email</label>
                <input type="email"
                       name="email"
                       placeholder="Enter email"
                       required>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password"
                       name="password"
                       placeholder="Create password"
                       required>
            </div>

            <div class="form-group">
                <label>Address</label>
                <textarea
                    name="address"
                    placeholder="Enter delivery address"
                    required></textarea>
            </div>

            <button type="submit"
                    class="register-btn">
                    Create Account
            </button>

        </form>

        <div class="login-link">
            Already have an account?
            <a href="login.jsp">Login</a>
        </div>

    </div>

</div>

</body>
</html>
```
