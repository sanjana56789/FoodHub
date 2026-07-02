package com.food.DAO;

import com.food.Model.DeliveryAgent;

public interface DeliveryAgentDAO {

    DeliveryAgent getDeliveryAgent(String email, String password);

}