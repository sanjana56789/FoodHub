<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="com.food.Model.Cart" %>
<%@ page import="com.food.Model.CartItem" %>
<%@ page import="java.util.Map" %>

<%
Cart cart = (Cart)session.getAttribute("cart");

double subtotal = 0;

Map<Integer, CartItem> items = null;

if(cart != null){
    items = cart.getItems();
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout | FoodHub</title>

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
    font-family:'Poppins',sans-serif;
    background:#0d0d0d;
    color:white;
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

.profile-btn{
    background:#ffc107;
    color:black;
    text-decoration:none;
    padding:10px 22px;
    border-radius:30px;
    font-weight:600;
}

/* PAGE */

.checkout-title{
    text-align:center;
    padding:50px 0;
}

.checkout-title h1{
    font-size:60px;
    font-family:'Playfair Display',serif;
}

.checkout-title p{
    color:#bdbdbd;
    margin-top:10px;
}

.checkout-container{
    width:85%;
    margin:auto;
    display:grid;
    grid-template-columns:2fr 1fr;
    gap:40px;
    padding-bottom:80px;
}

/* FORM */

.checkout-form{
    background:#1b1b1b;
    padding:40px;
    border-radius:25px;
}

.checkout-form h2{
    margin-bottom:25px;
    color:#ffc107;
}

.form-group{
    margin-bottom:20px;
}

.form-group label{
    display:block;
    margin-bottom:8px;
}

.form-group input,
.form-group textarea{
    width:100%;
    padding:15px;
    border:none;
    outline:none;
    background:#2a2a2a;
    color:white;
    border-radius:12px;
}

.form-group textarea{
    resize:none;
    height:120px;
}

/* PAYMENT */

.payment-methods{
    margin-top:40px;
}

.payment-methods h2{
    margin-bottom:20px;
    color:#ffc107;
}

.payment-option{
    background:#2a2a2a;
    padding:15px;
    border-radius:12px;
    margin-bottom:15px;
}

/* SUMMARY */

.order-summary{
    background:#1b1b1b;
    padding:35px;
    border-radius:25px;
    height:fit-content;
}

.order-summary h2{
    margin-bottom:25px;
}

.summary-row{
    display:flex;
    justify-content:space-between;
    margin-bottom:15px;
    color:#d0d0d0;
}

.total{
    margin-top:20px;
    padding-top:20px;
    border-top:1px solid rgba(255,255,255,.08);
    color:#ffc107;
    font-size:24px;
    font-weight:700;
}

.place-order{
    width:100%;
    margin-top:25px;
    border:none;
    background:#ffc107;
    color:black;
    padding:16px;
    border-radius:12px;
    font-weight:600;
    cursor:pointer;
    font-size:16px;
}

.place-order:hover{
    opacity:.9;
}

/* RESPONSIVE */

@media(max-width:900px){

    .checkout-container{
        grid-template-columns:1fr;
    }

    .checkout-title h1{
        font-size:42px;
    }

}

</style>
</head>
<body>

<!-- NAVBAR -->

<nav class="navbar">

    <div class="logo">🍔 FoodHub</div>

    <a href="logout" class="profile-btn">
	    Logout
	</a>

</nav>

<!-- TITLE -->

<section class="checkout-title">

    <h1>Checkout</h1>

    <p>
        Complete your order and enjoy your meal
    </p>

</section>

<!-- CHECKOUT -->

<div class="checkout-container">

    <!-- LEFT -->

    <div class="checkout-form">

        <h2>Delivery Details</h2>

        <form action="placeOrder" method="post">

            <div class="form-group">
                <label>Full Name</label>
                <input type="text" placeholder="Enter Full Name">
            </div>

            <div class="form-group">
                <label>Phone Number</label>
                <input type="text" placeholder="Enter Phone Number">
            </div>

            <div class="form-group">
                <label>Address</label>
                <textarea placeholder="Enter Delivery Address"></textarea>
            </div>

            <div class="form-group">
                <label>City</label>
                <input type="text" placeholder="Enter City">
            </div>

            <div class="form-group">
                <label>Pincode</label>
                <input type="text" placeholder="Enter Pincode">
            </div>

        

        <!-- PAYMENT -->

<div class="payment-methods">

    <h2>Payment Method</h2>

    <div class="payment-option">
        <input type="radio"
               name="paymentMethod"
               value="Cash On Delivery"
               required>
        Cash On Delivery
    </div>

    <div class="payment-option">
        <input type="radio"
               name="paymentMethod"
               value="UPI">
        UPI
    </div>

    <div class="payment-option">
        <input type="radio"
               name="paymentMethod"
               value="Credit Card">
        Credit Card
    </div>

    <div class="payment-option">
        <input type="radio"
               name="paymentMethod"
               value="Debit Card">
        Debit Card
    </div>

</div>

<button type="submit" class="place-order">
    Place Order
</button>

</form>

</div>   <!-- checkout-form ends -->

<!-- RIGHT -->

<div class="order-summary">

     


<h2>Order Summary</h2>

<%
if(items != null){

    for(CartItem item : items.values()){

        subtotal += item.getTotalPrice();
%>

<div class="summary-row">

    <span>
        <%= item.getItemName() %> x<%= item.getQuantity() %>
    </span>

    <span>
        ₹<%= item.getTotalPrice() %>
    </span>

</div>

<%
    }
}

double deliveryFee = 40;
double gst = subtotal * 0.05;
double total = subtotal + deliveryFee + gst;
%>

<div class="summary-row">
    <span>Delivery Fee</span>
    <span>₹<%= deliveryFee %></span>
</div>

<div class="summary-row">
    <span>GST</span>
    <span>₹<%= String.format("%.2f", gst) %></span>
</div>

<div class="summary-row total">
    <span>Total</span>
    <span>₹<%= String.format("%.2f", total) %></span>
</div>


</div>
       

</div>

</body>
</html>