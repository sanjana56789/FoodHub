package com.food.DAO;

import com.food.Model.HotelAgent;

public interface HotelAgentDAO {

    HotelAgent getHotelAgent(String email, String password);

}