package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.food.DAO.DeliveryAgentDAO;
import com.food.Model.DeliveryAgent;
import com.food.Utility.DBConnection;

public class DeliveryAgentDAOImpl implements DeliveryAgentDAO {

    private Connection con;

    public DeliveryAgentDAOImpl() {

        con = DBConnection.getConnection();

    }

    @Override
    public DeliveryAgent getDeliveryAgent(String email, String password) {

        DeliveryAgent agent = null;

        String sql =
        "SELECT * FROM delivery_agent WHERE email=? AND password=?";

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet res = pstmt.executeQuery();

            if(res.next()){

                agent = new DeliveryAgent();

                agent.setAgentId(res.getInt("agentId"));
                agent.setAgentName(res.getString("agentName"));
                agent.setEmail(res.getString("email"));
                agent.setPassword(res.getString("password"));

            }

        }
        catch(Exception e){

            e.printStackTrace();

        }

        return agent;
    }
}