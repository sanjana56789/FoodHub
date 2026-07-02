package com.food.Test;

import java.sql.Timestamp;
import java.util.Scanner;

import com.food.DAOImpl.OrderTableDAOImpl;
import com.food.Model.OrderTable;

public class OrderTableTest {

    public static void main(String[] args) {

        Scanner scan = new Scanner(System.in);

        // Add Order

        System.out.println("Enter User ID: ");
        int userId = scan.nextInt();

        System.out.println("Enter Total Amount: ");
        double totalAmount = scan.nextDouble();
        scan.nextLine();

        System.out.println("Enter Status: ");
        String status = scan.nextLine();

        System.out.println("Enter Payment Method: ");
        String paymentMethod = scan.nextLine();

        System.out.println("Enter Restaurant ID: ");
        int restaurantId = scan.nextInt();

        OrderTable order = new OrderTable(
                userId,
                new Timestamp(System.currentTimeMillis()),
                totalAmount,
                status,
                paymentMethod,
                restaurantId
        );

        OrderTableDAOImpl odao = new OrderTableDAOImpl();

        odao.addOrder(order);

        System.out.println("Order Added");


        // Get Order

//        OrderTable order = odao.getOrder(1);
//        System.out.println(order);


        // Get All Orders

//        List<OrderTable> orders = odao.getAllOrders();
//
//        for(OrderTable o : orders) {
//            System.out.println(o);
//        }


        // Update Order

//        System.out.println("Enter Order ID: ");
//        int id = scan.nextInt();
//
//        OrderTable order = odao.getOrder(id);
//
//        order.setStatus("Delivered");
//
//        odao.updateOrder(order);
//
//        System.out.println(order);


        // Delete Order

//        System.out.println("Enter Order ID to Delete: ");
//        int id = scan.nextInt();
//
//        odao.deleteOrder(id);
//
//        System.out.println("Order Deleted");
    }
}