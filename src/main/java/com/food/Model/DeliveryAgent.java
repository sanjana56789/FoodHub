package com.food.Model;

public class DeliveryAgent {

    private int agentId;
    private String agentName;
    private String email;
    private String password;

    public DeliveryAgent() {
    }

    public DeliveryAgent(int agentId, String agentName, String email, String password) {
        this.agentId = agentId;
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
}