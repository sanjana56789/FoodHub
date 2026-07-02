<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.Model.Menu"%>



<%
List<Menu> menuList =
(List<Menu>)request.getAttribute("menuList");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Manage Menu</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

body{
background:#111;
color:white;
padding:40px;
}

h1{
margin-bottom:30px;
}

table{

width:100%;
border-collapse:collapse;
background:#1b1b1b;

}

th{

background:#ffc107;
color:black;
padding:15px;

}

td{

padding:15px;
text-align:center;
border-bottom:1px solid #333;

}

img{

width:90px;
height:70px;
object-fit:cover;
border-radius:10px;

}

.action{

padding:8px 15px;
border-radius:8px;
text-decoration:none;
font-weight:bold;
}

.edit{

background:#28a745;
color:white;

}

.delete{

background:#dc3545;
color:white;

}

.add-btn{

display:inline-block;
margin-bottom:20px;

background:#ffc107;
color:black;

padding:12px 20px;

text-decoration:none;
border-radius:10px;
font-weight:bold;

}


.back-btn{
    display:inline-block;
    padding:10px 22px;
    background:#666;
    color:white;
    text-decoration:none;
    border-radius:8px;
    font-weight:600;
    transition:.3s;
    margin-left:10px;
}

.back-btn:hover{
    background:#555;
}
</style>

</head>

<body>

<h1>🍽 Manage Menu</h1>

<div class="top-buttons">

	<a href="hotel-dashboard.jsp" class="back-btn">
        ← Back
    </a>
    
    <a href="addMenu.jsp" class="add-btn">
        + Add Menu Item
    </a>

    

</div>

<table>

<tr>

<th>Image</th>

<th>Name</th>

<th>Category</th>

<th>Price</th>

<th>Availability</th>

<th>Action</th>

</tr>

<%
if(menuList!=null){

for(Menu menu:menuList){
%>

<tr>

<td>

<img src="Menu_images/<%=menu.getImagePath()%>">

</td>

<td>

<%=menu.getItemName()%>

</td>

<td>

<%=menu.getCategory()%>

</td>

<td>

₹<%=menu.getPrice()%>

</td>

<td>

<%=menu.isAvailable()?"Available":"Unavailable"%>

</td>

<td>

<a href="editMenu?menuId=<%=menu.getMenuId()%>" class="action edit">
    Edit
</a>

<a href="deleteMenu?menuId=<%=menu.getMenuId()%>"
   class="action delete"
   onclick="return confirm('Are you sure you want to delete this menu item?');">
    Delete
</a>

</td>

</tr>

<%
}
}
%>

</table>

</body>
</html>