<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="com.food.Model.Cart" %>
<%@ page import="com.food.Model.CartItem" %>
<%@ page import="java.util.Map" %>

<%
Cart cart = (Cart)session.getAttribute("cart");
Integer restaurantId =
(Integer)session.getAttribute("restaurantId");

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
<title>Insert title here</title>
<style>
body{
    background:#0d0d0d;
    color:white;
}
/* =========================
   CART PAGE
========================= */

.cart-container{
    padding:80px 8%;
    display:grid;
    grid-template-columns:2fr 1fr;
    gap:40px;
}

.cart-title{
    font-size:55px;
    font-family:'Playfair Display',serif;
    margin-bottom:40px;
}

.cart-items{
    display:flex;
    flex-direction:column;
    gap:25px;
}

.cart-card{
    background:#1b1b1b;
    border-radius:20px;
    padding:20px;
    display:flex;
    gap:20px;
    align-items:center;
}

.cart-card img{
    width:140px;
    height:120px;
    object-fit:cover;
    border-radius:15px;
}

.cart-info{
    flex:1;
}

.cart-info h3{
    margin-bottom:10px;
}

.cart-info p{
    color:#bdbdbd;
}

.quantity{
    display:flex;
    gap:10px;
    margin-top:15px;
}

.qty-btn{
    width:35px;
    height:35px;
    border:none;
    border-radius:50%;
    background:#ffc107;
    cursor:pointer;
    font-weight:bold;
}

.price{
    color:#ffc107;
    font-size:24px;
    font-weight:700;
}

/* SUMMARY */

.summary{
    background:#1b1b1b;
    padding:30px;
    border-radius:20px;
    height:fit-content;
}

.summary h2{
    margin-bottom:25px;
}

.summary-row{
    display:flex;
    justify-content:space-between;
    margin-bottom:15px;
    color:#d0d0d0;
}

.total{
    font-size:22px;
    font-weight:700;
    color:#ffc107;
    margin-top:20px;
    border-top:1px solid rgba(255,255,255,.08);
    padding-top:20px;
}

.checkout-btn{
    width:100%;
    margin-top:25px;
    background:#ffc107;
    color:black;
    padding:15px;
    text-align:center;
    text-decoration:none;
    display:block;
    border-radius:12px;
    font-weight:600;
}

@media(max-width:900px){

    .cart-container{
        grid-template-columns:1fr;
    }

    .cart-card{
        flex-direction:column;
        text-align:center;
    }

}


.empty-cart{
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
    min-height:60vh;
    text-align:center;
}

.empty-cart h2{
    font-size:48px;
    margin-bottom:15px;
}

.empty-cart p{
    color:#bdbdbd;
    margin-bottom:25px;
    font-size:18px;
}

.shop-btn{
    display:inline-block;
    background:#ffc107;
    color:black;
    padding:14px 28px;
    text-decoration:none;
    border-radius:30px;
    font-weight:600;
}

.cart-container.empty{
    display:block;
    position:relative;
    min-height:80vh;
}



.remove-btn{

    display:inline-block;

    margin-top:10px;

    background:#dc3545;

    color:white;

    text-decoration:none;

    padding:10px 18px;

    border-radius:25px;

    font-weight:600;

    transition:.3s;
}

.remove-btn:hover{

    background:#b02a37;
}




.back-btn{
    display:inline-block;
    margin-bottom:25px;
    background:#ffc107;
    color:black;
    text-decoration:none;
    padding:12px 25px;
    border-radius:30px;
    font-weight:600;
}

.back-btn:hover{
    background:#ffca2c;
}
</style>
</head>
<body>

<section class="cart-container <%= (items == null || items.isEmpty()) ? "empty" : "" %>">

    <!-- CART ITEMS -->

    <div>

        <%
		if(items != null && !items.isEmpty()){
		%>
		<%
if(restaurantId != null){
%>

<a href="menu?id=<%= restaurantId %>&filter=all" class="back-btn">
    ← Back to Menu
</a>

<%
}
%>

		<h1 class="cart-title">
		    Your Cart
		</h1>
		
		<%
		}
		%>

       <div class="cart-items">

<%
if(items != null && !items.isEmpty()){

    for(CartItem item : items.values()){

        subtotal += item.getTotalPrice();
%>

<div class="cart-card">

    <img src="${pageContext.request.contextPath}/Menu_images/<%= item.getImagePath() %>"
     alt="<%= item.getItemName() %>">

    <div class="cart-info">

        <h3><%= item.getItemName() %></h3>

        <p>Price: ₹<%= item.getPrice() %></p>

        <div class="quantity">

            <div class="quantity">

<a href="updateCart?menuId=<%=item.getMenuId()%>&action=decrease">

<button class="qty-btn">-</button>

</a>

<span><%= item.getQuantity() %></span>

<a href="updateCart?menuId=<%=item.getMenuId()%>&action=increase">

<button class="qty-btn">+</button>

</a>

</div>

        </div>

    </div>

    <div>

    <div class="price">
        ₹<%= item.getTotalPrice() %>
    </div>

    <br>

    <a href="removeCart?menuId=<%= item.getMenuId() %>"
       class="remove-btn">

       🗑 Remove

    </a>

</div>

</div>

<%
    }
}
else{
%>

<div class="empty-cart">

    <h2>Your Cart is Empty 🛒</h2>

    <p>Add some delicious food to get started.</p>

    <a href="home" class="shop-btn">
        Browse Restaurants
    </a>

</div>

<%
}
%>

</div>

    </div>
<%
if(items != null && !items.isEmpty()){

double deliveryFee = 25;
double gst = 18;

double total = subtotal + deliveryFee + gst;
%>

<!-- ORDER SUMMARY -->

<div class="summary">

    <h2>Order Summary</h2>

    <div class="summary-row">
        <span>Subtotal</span>
        <span>₹<%= subtotal %></span>
    </div>

    <div class="summary-row">
        <span>Delivery Fee</span>
        <span>₹<%= deliveryFee %></span>
    </div>

    <div class="summary-row">
        <span>GST</span>
        <span>₹<%= gst %></span>
    </div>

    <div class="summary-row total">
        <span>Total</span>
        <span>₹<%= total %></span>
    </div>

    <a href="checkout.jsp"
       class="checkout-btn">
        Proceed To Checkout
    </a>

</div>

<%
}
%>

</section>


</body>
</html>