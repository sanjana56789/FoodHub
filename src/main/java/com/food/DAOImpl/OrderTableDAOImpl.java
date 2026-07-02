package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.food.DAO.OrderTableDAO;
import com.food.Model.OrderTable;
import com.food.Utility.DBConnection;

public class OrderTableDAOImpl implements OrderTableDAO {

	private static final String INSERT_QUERY ="INSERT INTO ordertable(userId,orderDate,totalAmount,status,paymentMethod,restaurantId) VALUES(?,?,?,?,?,?)";

	private static final String SELECT_QUERY ="SELECT * FROM ordertable WHERE orderId=?";

	private static final String SELECT_ALL_QUERY ="SELECT * FROM ordertable";

	private static final String UPDATE_QUERY ="UPDATE ordertable SET userId=?, orderDate=?, totalAmount=?, status=?, paymentMethod=?, restaurantId=? WHERE orderId=?";

	private static final String DELETE_QUERY ="DELETE FROM ordertable WHERE orderId=?";


	@Override
	public int addOrder(OrderTable order) {

	    int orderId = 0;

	    Connection connection = DBConnection.getConnection();

	    try {

	        PreparedStatement pstmt =
	            connection.prepareStatement(
	                INSERT_QUERY,
	                Statement.RETURN_GENERATED_KEYS);

	        pstmt.setInt(1, order.getUserId());
	        pstmt.setTimestamp(2, order.getOrderDate());
	        pstmt.setDouble(3, order.getTotalAmount());
	        pstmt.setString(4, order.getStatus());
	        pstmt.setString(5, order.getPaymentMethod());
	        pstmt.setInt(6, order.getRestaurantId());

	        pstmt.executeUpdate();

	        ResultSet rs =
	            pstmt.getGeneratedKeys();

	        if(rs.next()) {

	            orderId = rs.getInt(1);
	        }

	    }
	    catch(Exception e) {

	        e.printStackTrace();
	    }

	    return orderId;
	}

	@Override
	public void updateOrder(OrderTable order) {
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement pstmt =connection.prepareStatement(UPDATE_QUERY);

			pstmt.setInt(1, order.getUserId());
			pstmt.setTimestamp(2, order.getOrderDate());
			pstmt.setDouble(3, order.getTotalAmount());
			pstmt.setString(4, order.getStatus());
			pstmt.setString(5, order.getPaymentMethod());
			pstmt.setInt(6, order.getRestaurantId());
			pstmt.setInt(7, order.getOrderId());

			int i = pstmt.executeUpdate();

			System.out.println(i + " Order Updated");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrder(int orderId) {
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement pstmt =connection.prepareStatement(DELETE_QUERY);

			pstmt.setInt(1, orderId);

			int i = pstmt.executeUpdate();

			System.out.println(i + " Order Deleted");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public OrderTable getOrder(int orderId) {
		Connection connection = DBConnection.getConnection();
		OrderTable order = null;
		try {
			PreparedStatement pstmt =connection.prepareStatement(SELECT_QUERY);

			pstmt.setInt(1, orderId);

			ResultSet res = pstmt.executeQuery();

			if(res.next()) {
				order = getOrderByResultSet(res);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return order;
	}

	@Override
	public List<OrderTable> getAllOrders() {
		List<OrderTable> list = new ArrayList<>();
		Connection connection = DBConnection.getConnection();
		try {
			Statement stmt = connection.createStatement();

			ResultSet res = stmt.executeQuery(SELECT_ALL_QUERY);

			while(res.next()) {

				OrderTable order =
						getOrderByResultSet(res);

				list.add(order);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	
	@Override
	public List<OrderTable> getOrdersByRestaurantId(int restaurantId) {

	    List<OrderTable> list = new ArrayList<>();

	    Connection connection = DBConnection.getConnection();

	    try {

	        String sql =
	        "SELECT * FROM ordertable WHERE restaurantId=? ORDER BY orderId DESC";

	        PreparedStatement pstmt =
	                connection.prepareStatement(sql);

	        pstmt.setInt(1, restaurantId);

	        ResultSet res = pstmt.executeQuery();

	        while(res.next()) {

	            list.add(getOrderByResultSet(res));
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	
	public List<OrderTable> getOrdersByUserId(int userId) {

	    List<OrderTable> list = new ArrayList<>();

	    Connection connection = DBConnection.getConnection();

	    try {

	        String sql =
	        "SELECT * FROM ordertable WHERE userId=? ORDER BY orderId DESC";

	        PreparedStatement pstmt =
	                connection.prepareStatement(sql);

	        pstmt.setInt(1, userId);

	        ResultSet res = pstmt.executeQuery();

	        while(res.next()) {

	            list.add(getOrderByResultSet(res));
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	
	
	@Override
	public void updateOrderStatus(int orderId, String status) {

	    Connection connection = DBConnection.getConnection();

	    try {

	        String sql =
	        "UPDATE ordertable SET status=? WHERE orderId=?";

	        PreparedStatement pstmt =
	                connection.prepareStatement(sql);

	        pstmt.setString(1, status);
	        pstmt.setInt(2, orderId);

	        int i = pstmt.executeUpdate();

	        System.out.println(i + " Order Status Updated");

	    }
	    catch (SQLException e) {

	        e.printStackTrace();

	    }
	}
	
	@Override
	public int getTotalOrders(int restaurantId) {

	    int total = 0;

	    try {

	        Connection con = DBConnection.getConnection();

	        PreparedStatement ps =
	        con.prepareStatement(
	        "SELECT COUNT(*) FROM ordertable WHERE restaurantId=?");

	        ps.setInt(1, restaurantId);

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()){

	            total = rs.getInt(1);
	        }

	    } catch(Exception e){

	        e.printStackTrace();
	    }

	    return total;
	}
	
	
	@Override
	public double getTotalRevenue(int restaurantId) {

	    double revenue = 0;

	    try {

	        Connection con = DBConnection.getConnection();

	        PreparedStatement ps =
	        con.prepareStatement(
	        "SELECT SUM(totalAmount) FROM ordertable WHERE restaurantId=?");

	        ps.setInt(1, restaurantId);

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()){

	            revenue = rs.getDouble(1);
	        }

	    } catch(Exception e){

	        e.printStackTrace();
	    }

	    return revenue;
	}
	
	
	@Override
	public int getPendingOrders(int restaurantId) {

	    int count = 0;

	    try {

	        Connection con = DBConnection.getConnection();

	        PreparedStatement ps =
	        con.prepareStatement(
	        "SELECT COUNT(*) FROM ordertable WHERE restaurantId=? AND status='Pending'");

	        ps.setInt(1, restaurantId);

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()){

	            count = rs.getInt(1);
	        }

	    } catch(Exception e){

	        e.printStackTrace();
	    }

	    return count;
	}
	
	
	@Override
	public int getDeliveredOrders(int restaurantId) {

	    int count = 0;

	    try {

	        Connection con = DBConnection.getConnection();

	        PreparedStatement ps =
	        con.prepareStatement(
	        "SELECT COUNT(*) FROM ordertable WHERE restaurantId=? AND status='Delivered'");

	        ps.setInt(1, restaurantId);

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()){

	            count = rs.getInt(1);
	        }

	    } catch(Exception e){

	        e.printStackTrace();
	    }

	    return count;
	}
	
	
	@Override
	public List<OrderTable> getOrdersByDeliveryAgentId(int deliveryAgentId) {

	    List<OrderTable> list = new ArrayList<>();

	    Connection connection = DBConnection.getConnection();

	    try {

	        String sql =
	        "SELECT * FROM ordertable WHERE deliveryAgentId=? ORDER BY orderId DESC";

	        PreparedStatement pstmt =
	                connection.prepareStatement(sql);

	        pstmt.setInt(1, deliveryAgentId);

	        ResultSet res = pstmt.executeQuery();

	        while(res.next()) {

	            list.add(getOrderByResultSet(res));
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	
	
	@Override
	public List<OrderTable> getAssignedOrders(int deliveryAgentId) {

	    List<OrderTable> list = new ArrayList<>();

	    Connection connection = DBConnection.getConnection();

	    try {

	        String sql =
	        "SELECT * FROM ordertable WHERE deliveryAgentId=? ORDER BY orderId DESC";

	        PreparedStatement pstmt =
	                connection.prepareStatement(sql);

	        pstmt.setInt(1, deliveryAgentId);

	        ResultSet res = pstmt.executeQuery();

	        while(res.next()) {

	            list.add(getOrderByResultSet(res));
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	
	



	private OrderTable getOrderByResultSet(ResultSet res)throws SQLException {

		int orderId = res.getInt("orderId");
		int userId = res.getInt("userId");
		Timestamp orderDate = res.getTimestamp("orderDate");
		double totalAmount = res.getDouble("totalAmount");
		String status = res.getString("status");
		String paymentMethod = res.getString("paymentMethod");
		int restaurantId = res.getInt("restaurantId");

		return new OrderTable(
				orderId,
				userId,
				orderDate,
				totalAmount,
				status,
				paymentMethod,
				restaurantId
				);
	}

}
