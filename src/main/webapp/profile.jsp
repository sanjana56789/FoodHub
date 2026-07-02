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
<meta charset="UTF-8">
<title>Profile | FoodHub</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@600;700;800&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    background:#0d0d0d;
    color:white;
    font-family:'Poppins',sans-serif;
}

/* NAVBAR */

.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:25px 8%;
}

.logo{
    font-size:32px;
    font-weight:700;
    color:#ffc107;
}

.home-btn{
    background:#ffc107;
    color:black;
    text-decoration:none;
    padding:10px 22px;
    border-radius:30px;
    font-weight:600;
}

/* HEADER */

.profile-header{
    text-align:center;
    padding:50px 0;
}

.profile-header h1{
    font-size:60px;
    font-family:'Playfair Display',serif;
}

.profile-header p{
    color:#bdbdbd;
    margin-top:10px;
}

/* PROFILE CARD */

.profile-container{
    width:85%;
    margin:auto;
    padding-bottom:80px;
}

.profile-card{
    background:#1b1b1b;
    border-radius:25px;
    padding:50px;
    display:grid;
    grid-template-columns:300px 1fr;
    gap:50px;
    border:1px solid rgba(255,255,255,.05);
}

.profile-left{
    text-align:center;
}

.profile-image{
    width:180px;
    height:180px;
    border-radius:50%;
    margin:auto;
    object-fit:cover;
    border:4px solid #ffc107;
}

.profile-name{
    margin-top:20px;
    font-size:28px;
    font-weight:600;
}

.profile-role{
    color:#ffc107;
    margin-top:10px;
}

.profile-right{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:25px;
}

.info-box{
    background:#262626;
    padding:20px;
    border-radius:15px;
}

.info-box label{
    color:#ffc107;
    display:block;
    margin-bottom:10px;
    font-size:14px;
}

.info-box p{
    color:white;
}

.profile-actions{
    margin-top:40px;
    display:flex;
    gap:20px;
    flex-wrap:wrap;
}

.action-btn{
    text-decoration:none;
    background:#ffc107;
    color:black;
    padding:12px 25px;
    border-radius:12px;
    font-weight:600;
}

.logout-btn{
    background:#ff4d4d;
    color:white;
}

/* RESPONSIVE */

@media(max-width:900px){

    .profile-card{
        grid-template-columns:1fr;
    }

    .profile-right{
        grid-template-columns:1fr;
    }

    .profile-header h1{
        font-size:42px;
    }

}

</style>
</head>
<body>

<!-- NAVBAR -->

<nav class="navbar">

    <div class="logo">🍔 FoodHub</div>

    <a href="home" class="home-btn">
        Home
    </a>

</nav>

<!-- HEADER -->

<section class="profile-header">

    <h1>My Profile</h1>

    <p>
        Manage your account information
    </p>

</section>

<!-- PROFILE -->

<section class="profile-container">

    <div class="profile-card">

        <!-- LEFT -->

        <div class="profile-left">

            <img
            src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500"
            class="profile-image">

            <div class="profile-name">
			    <%= user.getUserName() %>
			</div>

            <div class="profile-role">
			    <%= user.getRole() %>
			</div>

        </div>

        <!-- RIGHT -->

        <div>

            <div class="profile-right">

                <div class="info-box">
                    <label>User ID</label>
                    <p><%= user.getUserId() %></p>
                </div>

                <div class="info-box">
                    <label>Username</label>
                    <p><%= user.getUserName() %></p>
                </div>

                <div class="info-box">
                    <label>Email</label>
                    <p><%= user.getEmail() %></p>
                </div>

                <div class="info-box">
                    <label>Phone</label>
                    <p>Not Available</p>
                </div>

                <div class="info-box">
                    <label>Address</label>
                    <p><%= user.getAddress() %></p>
                </div>

                <div class="info-box">
                    <label>Role</label>
                    <p><%= user.getRole() %></p>
                </div>

                <div class="info-box">
                    <label>Created Date</label>
                    <p><%= user.getCreateDate() %></p>
                </div>

                <div class="info-box">
                    <label>Last Login</label>
                    <p><%= user.getLastLoginDate() %></p>
                </div>

            </div>

            <div class="profile-actions">

                <a href="edit-profile.jsp" class="action-btn">
				    Edit Profile
				</a>

                <a href="change-password.jsp" class="action-btn">
				    Change Password
				</a>

                <a href="logout"
				   class="action-btn logout-btn">
				    Logout
				</a>

            </div>

        </div>

    </div>

</section>

</body>
</html>