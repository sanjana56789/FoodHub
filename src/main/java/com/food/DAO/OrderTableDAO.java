package com.food.DAO;

import java.util.List;

import com.food.Model.OrderTable;

public interface OrderTableDAO {

    int addOrder(OrderTable order);

    void updateOrder(OrderTable order);

    void deleteOrder(int orderId);

    OrderTable getOrder(int orderId);

    List<OrderTable> getAllOrders();
    List<OrderTable> getOrdersByUserId(int userId);
    List<OrderTable> getOrdersByRestaurantId(int restaurantId);
    
    void updateOrderStatus(int orderId, String status);
    
    
    int getTotalOrders(int restaurantId);

    double getTotalRevenue(int restaurantId);

    int getPendingOrders(int restaurantId);

    int getDeliveredOrders(int restaurantId);
    
    List<OrderTable> getOrdersByDeliveryAgentId(int deliveryAgentId);
    
    List<OrderTable> getAssignedOrders(int deliveryAgentId);
}