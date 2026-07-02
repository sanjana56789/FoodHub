# 🍔 FoodHub - Full Stack Food Ordering Web Application

<p align="center">

![Java](https://img.shields.io/badge/Java-17-orange?style=for-the-badge&logo=java)
![JSP](https://img.shields.io/badge/JSP-Servlets-blue?style=for-the-badge)
![MySQL](https://img.shields.io/badge/MySQL-Database-blue?style=for-the-badge&logo=mysql)
![Bootstrap](https://img.shields.io/badge/Bootstrap-5-purple?style=for-the-badge&logo=bootstrap)
![Tomcat](https://img.shields.io/badge/Apache-Tomcat-yellow?style=for-the-badge&logo=apache)
![License](https://img.shields.io/badge/License-Educational-green?style=for-the-badge)

</p>

## 📖 Project Overview

**FoodHub** is a Full Stack Food Ordering Web Application developed using **Java, JSP, Servlets, JDBC, MySQL, HTML, CSS, JavaScript, and Bootstrap**.

The application simulates a real-world online food delivery platform where customers can browse restaurants, order food, restaurants can manage menus and orders, delivery agents handle deliveries, and administrators monitor the complete system.

The project follows the **MVC (Model-View-Controller)** architecture and demonstrates authentication, session management, CRUD operations, role-based access control, and relational database management.

---

# ✨ Features

## 👤 Customer Module

- User Registration
- Secure Login & Logout
- Browse Restaurants
- View Restaurant Menus
- Search Food Items
- Add Items to Cart
- Update Cart Quantity
- Remove Items from Cart
- Checkout
- Place Orders
- View Order History
- Track Order Status
- Manage User Profile

---

## 🏨 Restaurant Module

- Hotel Agent Login
- Restaurant Dashboard
- View Restaurant Profile
- Add Menu Items
- Update Menu Items
- Delete Menu Items
- View Restaurant Orders
- Update Order Status
- Restaurant Reports

---

## 🚚 Delivery Agent Module

- Delivery Agent Login
- Delivery Dashboard
- View Assigned Orders
- Mark Orders as Delivered
- Delivery Reports

---

## 👨‍💼 Admin Module

- Admin Login
- Admin Dashboard
- Manage Users
- Manage Restaurants
- Manage Menus
- Manage Orders
- View Complete Order Details
- Update Order Status
- System Reports

---

# 🔄 Order Workflow

```text
Customer

     │
     ▼

Browse Restaurants

     │
     ▼

View Menu

     │
     ▼

Add Items to Cart

     │
     ▼

Checkout

     │
     ▼

Place Order

     │
     ▼

Restaurant Receives Order

     │
     ▼

Processing

     │
     ▼

Preparing

     │
     ▼

Ready

     │
     ▼

Assigned to Delivery Agent

     │
     ▼

Delivered

     │
     ▼

Customer Views Updated Order Status
```

---

# 🏗️ MVC Architecture

```text
                         +---------------------+
                         |      Browser        |
                         +---------------------+
                                   |
                                   |
                          HTTP Request
                                   |
                                   ▼
                    +---------------------------+
                    |      Servlet Layer        |
                    |      (Controllers)        |
                    +---------------------------+
                                   |
              ------------------------------------------
              |                                        |
              ▼                                        ▼
      +----------------+                     +----------------------+
      |     Models     |                     |         DAO          |
      |   Java Beans   |                     |  DAO Interfaces      |
      +----------------+                     +----------------------+
                                                      |
                                                      ▼
                                          +--------------------------+
                                          | DAO Implementations      |
                                          +--------------------------+
                                                      |
                                                      ▼
                                                  JDBC Driver
                                                      |
                                                      ▼
                                                MySQL Database
                                                      |
                                                      ▼
                                              Retrieved Data
                                                      |
                                                      ▼
                                                  Servlets
                                                      |
                                                      ▼
                                                 JSP Pages
                                                      |
                                                      ▼
                                                   Browser
```

---

# 🗄️ Database ER Diagram

```text

                               +----------------+
                               |     ADMIN      |
                               +----------------+
                               | adminId (PK)   |
                               | username       |
                               | password       |
                               +----------------+


+-------------------+          +----------------------+
|       USER        |          |     RESTAURANT       |
+-------------------+          +----------------------+
| userId (PK)       |          | restaurantId (PK)    |
| userName          |          | name                 |
| email             |          | address              |
| phone             |          | cuisine              |
| password          |          | rating               |
+-------------------+          +----------------------+
          |                               |
          |                               |
          |                               |
          |                               |
          |                               ▼
          |                     +----------------------+
          |                     |        MENU          |
          |                     +----------------------+
          |                     | menuId (PK)          |
          |                     | restaurantId (FK)    |
          |                     | itemName             |
          |                     | description          |
          |                     | price                |
          |                     | category             |
          |                     | imagePath            |
          |                     +----------------------+
          |
          |
          ▼
+----------------------+
|     ORDERTABLE       |
+----------------------+
| orderId (PK)         |
| userId (FK)          |
| restaurantId (FK)    |
| deliveryAgentId(FK)  |
| totalAmount          |
| paymentMethod        |
| status               |
| orderDate            |
+----------------------+
          |
          |
          ▼
+----------------------+
|      ORDERITEM       |
+----------------------+
| orderItemId (PK)     |
| orderId (FK)         |
| menuId (FK)          |
| quantity             |
| itemTotal            |
+----------------------+


+----------------------+
|   DELIVERY AGENT     |
+----------------------+
| agentId (PK)         |
| agentName            |
| email                |
| password             |
| phone                |
+----------------------+


+----------------------+
|     HOTEL AGENT      |
+----------------------+
| hotelAgentId (PK)    |
| restaurantId (FK)    |
| agentName            |
| email                |
| password             |
+----------------------+
```

---

# 💻 Technology Stack

## Frontend

- HTML5
- CSS3
- Bootstrap 5
- JavaScript
- JSP

## Backend

- Java
- Servlets
- JDBC

## Database

- MySQL

## Server

- Apache Tomcat 10

## IDE

- Eclipse IDE

---

# 📂 Project Structure

```text
Restaurant_App

│

├── src
│
├── com.food
│   ├── controller
│   ├── DAO
│   ├── DAOImpl
│   ├── Model
│   └── Utility
│
├── WebContent
│   ├── css
│   ├── images
│   ├── Menu_images
│   ├── Restaurant_images
│   ├── WEB-INF
│   └── JSP Pages
│
├── build
├── .classpath
└── .project
```

---

# 📊 Functional Modules

### 👤 Customer

- Registration
- Login
- Restaurant Browsing
- Menu Browsing
- Cart Management
- Checkout
- Order History

### 🏨 Restaurant

- Login
- Dashboard
- Menu Management
- Order Management
- Reports

### 🚚 Delivery

- Login
- Assigned Orders
- Update Delivery Status
- Reports

### 👨‍💼 Admin

- Dashboard
- Restaurant Management
- Menu Management
- User Management
- Order Management
- Reports

---

# ⚙️ Installation Guide

### Clone Repository

```bash
git clone https://github.com/sanjana56789/FoodHub.git
```

---

### Import Project

Import the project into **Eclipse IDE** as a Dynamic Web Project.

---

### Configure Apache Tomcat

Recommended Version

```
Apache Tomcat 10
```

---

### Configure MySQL

Create the database

```sql
CREATE DATABASE instant_food;
```

Import all required SQL tables.

---

### Configure Database Connection

Update database credentials inside

```
DBConnection.java
```

```java
URL
USERNAME
PASSWORD
```

---

### Run the Project

Start Tomcat Server

Open

```
http://localhost:8080/Restaurant_App/
```

---

# 🚀 Future Enhancements

- Online Payment Gateway
- Email Notifications
- Live Order Tracking
- Customer Reviews & Ratings
- Responsive Mobile Design
- REST API Integration
- Spring Boot Migration
- Docker Deployment

---

# 👩‍💻 Developer

## Sanjana Madi

**Bachelor of Engineering (Computer Science & Engineering)**

Alva's Institute of Engineering and Technology

GitHub Profile

https://github.com/sanjana56789

---

# 📄 License

This project is developed for **academic learning and educational purposes**.

---

# ⭐ Support

If you found this project useful, please consider giving it a ⭐ on GitHub.
