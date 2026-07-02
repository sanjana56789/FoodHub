package com.food.Test;

import java.util.Scanner;

import com.food.DAOImpl.OrderItemDAOImpl;
import com.food.Model.OrderItem;

public class OrderItemTest {

    public static void main(String[] args) {

        Scanner scan = new Scanner(System.in);

        // Add Order Item

        System.out.println("Enter Order ID: ");
        int orderId = scan.nextInt();

        System.out.println("Enter Menu ID: ");
        int menuId = scan.nextInt();

        System.out.println("Enter Quantity: ");
        int quantity = scan.nextInt();

        System.out.println("Enter Item Total: ");
        double itemTotal = scan.nextDouble();

        OrderItem orderItem = new OrderItem(
                orderId,
                menuId,
                quantity,
                itemTotal
        );

        OrderItemDAOImpl oidao = new OrderItemDAOImpl();

        oidao.addOrderItem(orderItem);

        System.out.println("Order Item Added");


        // Get Order Item

//        OrderItem item = oidao.getOrderItem(1);
//        System.out.println(item);


        // Get All Order Items

//        List<OrderItem> items = oidao.getAllOrderItems();
//
//        for(OrderItem item : items) {
//            System.out.println(item);
//        }


        // Update Order Item

//        System.out.println("Enter Order Item ID: ");
//        int id = scan.nextInt();
//
//        OrderItem item = oidao.getOrderItem(id);
//
//        item.setQuantity(5);
//
//        oidao.updateOrderItem(item);
//
//        System.out.println(item);


        // Delete Order Item

//        System.out.println("Enter Order Item ID to Delete: ");
//        int id = scan.nextInt();
//
//        oidao.deleteOrderItem(id);
//
//        System.out.println("Order Item Deleted");
    }
}