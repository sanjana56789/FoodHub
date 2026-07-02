package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.food.DAO.OrderItemDAO;
import com.food.Model.OrderItem;
import com.food.Utility.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO {
	private static final String INSERT_QUERY =
			"INSERT INTO orderitem(orderId,menuId,quantity,itemTotal) VALUES(?,?,?,?)";

	private static final String SELECT_QUERY =
			"SELECT * FROM orderitem WHERE orderItemId=?";

	private static final String SELECT_ALL_QUERY =
			"SELECT * FROM orderitem";

	private static final String UPDATE_QUERY =
			"UPDATE orderitem SET orderId=?, menuId=?, quantity=?, itemTotal=? WHERE orderItemId=?";

	private static final String DELETE_QUERY =
			"DELETE FROM orderitem WHERE orderItemId=?";


	@Override
	public void addOrderItem(OrderItem orderItem) {

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt =connection.prepareStatement(INSERT_QUERY);

			pstmt.setInt(1, orderItem.getOrderId());
			pstmt.setInt(2, orderItem.getMenuId());
			pstmt.setInt(3, orderItem.getQuantity());
			pstmt.setDouble(4, orderItem.getItemTotal());

			int i = pstmt.executeUpdate();

			System.out.println(i + " Order Item Added");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateOrderItem(OrderItem orderItem) {
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement pstmt =connection.prepareStatement(UPDATE_QUERY);

			pstmt.setInt(1, orderItem.getOrderId());
			pstmt.setInt(2, orderItem.getMenuId());
			pstmt.setInt(3, orderItem.getQuantity());
			pstmt.setDouble(4, orderItem.getItemTotal());
			pstmt.setInt(5, orderItem.getOrderItemId());

			int i = pstmt.executeUpdate();

			System.out.println(i + " Order Item Updated");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrderItem(int orderItemId) {
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement pstmt =connection.prepareStatement(DELETE_QUERY);

			pstmt.setInt(1, orderItemId);

			int i = pstmt.executeUpdate();

			System.out.println(i + " Order Item Deleted");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public OrderItem getOrderItem(int orderItemId) {
		Connection connection = DBConnection.getConnection();
		OrderItem orderItem = null;
		try {

			PreparedStatement pstmt =
					connection.prepareStatement(SELECT_QUERY);

			pstmt.setInt(1, orderItemId);

			ResultSet res = pstmt.executeQuery();

			if(res.next()) {

				orderItem = getOrderItemByResultSet(res);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return orderItem;
	}

	@Override
	public List<OrderItem> getAllOrderItems() {
		List<OrderItem> list = new ArrayList<>();
		Connection connection = DBConnection.getConnection();
		try {

			Statement stmt = connection.createStatement();

			ResultSet res = stmt.executeQuery(SELECT_ALL_QUERY);

			while(res.next()) {

				OrderItem orderItem =
						getOrderItemByResultSet(res);

				list.add(orderItem);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<OrderItem> getOrderItemsByOrderId(int orderId) {

	    List<OrderItem> list = new ArrayList<>();

	    Connection connection = DBConnection.getConnection();

	    try {

	        String sql =
	        "SELECT * FROM orderitem WHERE orderId=?";

	        PreparedStatement pstmt =
	                connection.prepareStatement(sql);

	        pstmt.setInt(1, orderId);

	        ResultSet res = pstmt.executeQuery();

	        while(res.next()) {

	            list.add(getOrderItemByResultSet(res));
	        }

	    } catch(SQLException e) {
	        e.printStackTrace();
	    }

	    return list;
	}


	private OrderItem getOrderItemByResultSet(ResultSet res)throws SQLException {

		int orderItemId = res.getInt("orderItemId");
		int orderId = res.getInt("orderId");
		int menuId = res.getInt("menuId");
		int quantity = res.getInt("quantity");
		double itemTotal = res.getDouble("itemTotal");

		return new OrderItem(
				orderItemId,
				orderId,
				menuId,
				quantity,
				itemTotal
				);
	}

}
