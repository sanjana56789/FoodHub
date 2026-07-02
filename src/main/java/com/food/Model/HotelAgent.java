package com.food.Model;

public class HotelAgent {

    private int agentId;
    private int restaurantId;
    private String agentName;
    private String email;
    private String password;

    public HotelAgent() {

    }

    public HotelAgent(int agentId, int restaurantId, String agentName, String email, String password) {
        this.agentId = agentId;
        this.restaurantId = restaurantId;
        this.agentName = agentName;
        this.email = email;
        this.password = password;
    }

    public HotelAgent(int restaurantId, String agentName, String email, String password) {
        this.restaurantId = restaurantId;
        this.agentName = agentName;
        this.email = email;
        this.password = password;
    }

    public int getAgentId() {
        return agentId;
    }

    public void setAgentId(int agentId) {
        this.agentId = agentId;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getAgentName() {
        return agentName;
    }

    public void setAgentName(String agentName) {
        this.agentName = agentName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "HotelAgent [agentId=" + agentId +
                ", restaurantId=" + restaurantId +
                ", agentName=" + agentName +
                ", email=" + email +
                ", password=" + password + "]";
    }
}