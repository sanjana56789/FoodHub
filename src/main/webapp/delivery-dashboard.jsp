<%@ page import="com.food.Model.DeliveryAgent" %>

<%
DeliveryAgent agent =
(DeliveryAgent)session.getAttribute("deliveryAgent");

if(agent == null){
    response.sendRedirect("delivery-login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delivery Dashboard | FoodHub</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:#0f0f0f;
    color:white;
}

/* Navbar */

.navbar{

    width:100%;
    padding:20px 60px;
    display:flex;
    justify-content:space-between;
    align-items:center;

    background:#111;
    border-bottom:1px solid rgba(255,255,255,.08);

    position:sticky;
    top:0;
    z-index:100;
}

.logo{

    font-size:34px;
    font-weight:700;
    color:#ffc107;
}

.nav-right{

    display:flex;
    align-items:center;
    gap:20px;
}

.nav-right span{

    color:#ddd;
    font-weight:500;
}

.logout{

    text-decoration:none;
    background:#ff4d4d;
    color:white;
    padding:10px 22px;
    border-radius:30px;
    font-weight:600;
    transition:.3s;
}

.logout:hover{

    background:#ff2f2f;
}

/* Dashboard */

.dashboard{
    width:88%;
    max-width:1400px;
    margin:30px auto;
}

.dashboard h1{

    font-size:42px;
    margin-bottom:10px;
}

.dashboard p{

    color:#bdbdbd;
    margin-bottom:35px;
}

/* Profile Card */

.profile-card{
    width:650px;
    background:#1b1b1b;
    border-radius:18px;
    padding:22px 30px;
    border:1px solid rgba(255,255,255,.08);
    margin-bottom:30px;
}

.profile-card h2{

    color:#ffc107;
    margin-bottom:20px;
}

.profile-card p{

    margin:12px 0;
    color:#ddd;
}

/* Statistics */

.stats{

    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:25px;
    margin-bottom:45px;
}

.card{

    background:#1b1b1b;
    padding:30px;
    border-radius:18px;
    text-align:center;

    border:1px solid rgba(255,255,255,.06);

    transition:.3s;
}
.card{
    text-decoration:none;
    color:white;
}
.card:hover{

    transform:translateY(-8px);

    box-shadow:0 15px 35px rgba(255,193,7,.15);
}

.card h2{

    color:#ffc107;
    font-size:34px;
}

.card p{

    margin-top:10px;
    color:#ccc;
}

/* Quick Actions */

.actions{

    display:flex;
    justify-content:center;
    gap:30px;
}

.actions a{

    text-decoration:none;

    background:#ffc107;
    color:black;

    padding:15px 35px;

    border-radius:40px;

    font-weight:600;

    transition:.3s;
}

.actions a:hover{

    background:#ffb300;

    transform:translateY(-5px);
}

/* Responsive */

@media(max-width:1000px){

.stats{

grid-template-columns:repeat(2,1fr);

}

}

@media(max-width:700px){

.navbar{

flex-direction:column;

gap:20px;

padding:20px;

}

.stats{

grid-template-columns:1fr;

}

.actions{

flex-direction:column;

}

.actions a{

text-align:center;

}

}

</style>

</head>

<body>

<!-- Navbar -->

<div class="navbar">

    <div class="logo">

		<i class="fa-solid fa-motorcycle"></i>
		
		FoodHub
		
	</div>

    <div class="nav-right">

        <span>

		 <%=agent.getAgentName()%>
		
		</span>

        <a href="logout" class="logout">
            Logout
        </a>

    </div>

</div>


<!-- Dashboard -->

<div class="dashboard">

    <h1>
	    <i class="fa-solid fa-truck"></i> Delivery Dashboard
	</h1>

    <p>
        Manage your assigned deliveries efficiently with FoodHub.
    </p>


    <!-- Profile -->

    <div class="profile-card">

        <h2>Delivery Agent Details</h2>

		<p><strong>Name :</strong> <%=agent.getAgentName()%></p>
		
		<p><strong>Agent ID :</strong> <%=agent.getAgentId()%></p>
		
		<p><strong>Email :</strong> <%=agent.getEmail()%></p>

    </div>


    <!-- Statistics -->

    <div class="stats">

    <div class="card">

        <h2>15</h2>

        <p>Assigned Orders</p>

    </div>

    <div class="card">

        <h2>4</h2>

        <p>Pending Deliveries</p>

    </div>

    <div class="card">

        <h2>11</h2>

        <p>Completed Deliveries</p>

    </div>

    <div class="card">

        <h2>6</h2>

        <p>Today's Deliveries</p>

    </div>

</div>


    <!-- Quick Actions -->

   <div class="actions">

    <a href="deliveryOrders">
        <i class="fa-solid fa-box"></i>
        Assigned Orders
    </a>

    <a href="deliveryReport">
        <i class="fa-solid fa-chart-line"></i>
        Reports
    </a>

</div>

</div>

</body>
</html>