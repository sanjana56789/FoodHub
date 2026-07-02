package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.food.DAO.RestaurantDAO;
import com.food.Model.Restaurant;
import com.food.Utility.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO{
	private static final String INSERT_QUERY =
		    "INSERT INTO restaurant(name,cuisineType,deliveryTime,address,rating,isActive,imagePath) VALUES(?,?,?,?,?,?,?)";

		private static final String SELECT_QUERY =
		    "SELECT * FROM restaurant WHERE restaurantId=?";

		private static final String SELECT_ALL_QUERY =
		    "SELECT * FROM restaurant";

		private static final String UPDATE_QUERY =
		    "UPDATE restaurant SET name=?, cuisineType=?, deliveryTime=?, address=?, rating=?, isActive=?, imagePath=? WHERE restaurantId=?";

		private static final String DELETE_QUERY =
		    "DELETE FROM restaurant WHERE restaurantId=?";

		@Override
		public void addRestaurant(Restaurant restaurant) {
		    Connection connection = DBConnection.getConnection();
		    try {
		        PreparedStatement pstmt =connection.prepareStatement(INSERT_QUERY);

		        pstmt.setString(1, restaurant.getName());
		        pstmt.setString(2, restaurant.getCuisineType());
		        pstmt.setInt(3, restaurant.getDeliveryTime());
		        pstmt.setString(4, restaurant.getAddress());
		        pstmt.setDouble(5, restaurant.getRating());
		        pstmt.setBoolean(6, restaurant.isActive());
		        pstmt.setString(7, restaurant.getImagePath());

		        int i = pstmt.executeUpdate();

		        System.out.println(i + " Restaurant Added");

		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		}

		@Override
		public void updateRestaurant(Restaurant restaurant) {
		    Connection connection = DBConnection.getConnection();
		    try {
		        PreparedStatement pstmt =connection.prepareStatement(UPDATE_QUERY);

		        pstmt.setString(1, restaurant.getName());
		        pstmt.setString(2, restaurant.getCuisineType());
		        pstmt.setInt(3, restaurant.getDeliveryTime());
		        pstmt.setString(4, restaurant.getAddress());
		        pstmt.setDouble(5, restaurant.getRating());
		        pstmt.setBoolean(6, restaurant.isActive());
		        pstmt.setString(7, restaurant.getImagePath());
		        pstmt.setInt(8, restaurant.getRestaurantId());

		        int i = pstmt.executeUpdate();

		        System.out.println(i + " Restaurant Updated");

		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		}

		@Override
		public void deleteRestaurant(int restaurantId) {
		    Connection connection = DBConnection.getConnection();
		    try {
		        PreparedStatement pstmt =connection.prepareStatement(DELETE_QUERY);
		        pstmt.setInt(1, restaurantId);
		        int i = pstmt.executeUpdate();
		        System.out.println(i + " Restaurant Deleted");

		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		}

		@Override
		public Restaurant getRestaurant(int restaurantId) {
		    Connection connection = DBConnection.getConnection();
		    Restaurant restaurant = null;
		    try {
		        PreparedStatement pstmt =connection.prepareStatement(SELECT_QUERY);
		        pstmt.setInt(1, restaurantId);
		        ResultSet res = pstmt.executeQuery();
		        if(res.next()) {
		            restaurant = getRestaurantByResultSet(res);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return restaurant;
		}

		@Override
		public List<Restaurant> getAllRestaurants() {
		    List<Restaurant> list = new ArrayList<>();
		    Connection connection = DBConnection.getConnection();
		    try {
		        Statement stmt = connection.createStatement();
		        ResultSet res = stmt.executeQuery(SELECT_ALL_QUERY);
		        while(res.next()) {
		            Restaurant restaurant = getRestaurantByResultSet(res);
		            list.add(restaurant);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return list;
		}
		
		
		
		private Restaurant getRestaurantByResultSet(ResultSet res)throws SQLException {

		    int restaurantId = res.getInt("restaurantId");
		    String name = res.getString("name");
		    String cuisineType = res.getString("cuisineType");
		    int deliveryTime = res.getInt("deliveryTime");
		    String address = res.getString("address");
		    double rating = res.getDouble("rating");
		    boolean isActive = res.getBoolean("isActive");
		    String imagePath = res.getString("imagePath");
		    String about = res.getString("about");

		    return new Restaurant(
		            restaurantId,
		            name,
		            cuisineType,
		            deliveryTime,
		            address,
		            rating,
		            isActive,
		            imagePath,
		            about
		    );
		}
		
		
		public List<Restaurant> searchRestaurant(String keyword) {

		    List<Restaurant> list = new ArrayList<>();

		    String sql =
		    		"SELECT * FROM restaurant WHERE name LIKE ? OR cuisineType LIKE ?";

		    try {

		    	Connection connection = DBConnection.getConnection();

		    	PreparedStatement ps =
		    	        connection.prepareStatement(sql);

		    	ps.setString(1, "%" + keyword + "%");
		    	ps.setString(2, "%" + keyword + "%");

		        ResultSet rs = ps.executeQuery();

		        while(rs.next()) {

		            Restaurant r = new Restaurant();

		            r.setRestaurantId(rs.getInt("restaurantId"));
		            r.setName(rs.getString("name"));
		            r.setCuisineType(rs.getString("cuisineType"));
		            r.setRating(rs.getDouble("rating"));
		            r.setDeliveryTime(rs.getInt("deliveryTime"));
		            r.setImagePath(rs.getString("imagePath"));

		            list.add(r);
		        }

		    } catch(Exception e) {
		        e.printStackTrace();
		    }

		    return list;
		}

}
