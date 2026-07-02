package com.food.DAOImpl;

import com.food.Utility.DBConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.Connection;
import com.food.DAO.HotelAgentDAO;
import com.food.Model.HotelAgent;


public class HotelAgentDAOImpl implements HotelAgentDAO {

    private Connection con;

    public HotelAgentDAOImpl() {
        con = DBConnection.getConnection();
    }

    @Override
    public HotelAgent getHotelAgent(String email, String password) {

        HotelAgent agent = null;

        String sql = "SELECT * FROM hotel_agent WHERE email=? AND password=?";

        try {

            PreparedStatement pstmt = con.prepareStatement(sql);

            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet res = pstmt.executeQuery();

            if (res.next()) {

                agent = new HotelAgent();

                agent.setAgentId(res.getInt("agentId"));
                agent.setRestaurantId(res.getInt("restaurantId"));
                agent.setAgentName(res.getString("agentName"));
                agent.setEmail(res.getString("email"));
                agent.setPassword(res.getString("password"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return agent;
    }
}