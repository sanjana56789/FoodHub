package com.food.DAO;

import java.util.List;

import com.food.Model.OrderItem;

public interface OrderItemDAO {

    void addOrderItem(OrderItem orderItem);

    void updateOrderItem(OrderItem orderItem);

    void deleteOrderItem(int orderItemId);

    OrderItem getOrderItem(int orderItemId);

    List<OrderItem> getAllOrderItems();
    
    List<OrderItem> getOrderItemsByOrderId(int orderId);
}