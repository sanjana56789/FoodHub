package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.food.DAO.MenuDAO;
import com.food.Model.Menu;
import com.food.Utility.DBConnection;

public class MenuDAOImpl implements MenuDAO{

	private static final String INSERT_QUERY =
			"INSERT INTO menu(restaurantId,itemName,description,price,isAvailable,imagePath,category) VALUES(?,?,?,?,?,?,?)";

	private static final String SELECT_QUERY =
			"SELECT * FROM menu WHERE menuId=?";

	private static final String SELECT_ALL_QUERY =
			"SELECT * FROM menu";
	
	private static final String SELECT_BY_RESTAURANT_QUERY =
	        "SELECT * FROM menu WHERE restaurantId=?";

	private static final String UPDATE_QUERY =
			"UPDATE menu SET restaurantId=?, itemName=?, description=?, price=?, isAvailable=?, imagePath=?, category=? WHERE menuId=?";

	private static final String DELETE_QUERY =
			"DELETE FROM menu WHERE menuId=?";
	
	private static final String SELECT_FEATURED_QUERY =
	        "SELECT * FROM menu WHERE isFeatured = TRUE";
	
	

	@Override
	public void addMenu(Menu menu) {
		Connection connection = DBConnection.getConnection();
		try {

			PreparedStatement pstmt =connection.prepareStatement(INSERT_QUERY);

			pstmt.setInt(1, menu.getRestaurantId());
			pstmt.setString(2, menu.getItemName());
			pstmt.setString(3, menu.getDescription());
			pstmt.setDouble(4, menu.getPrice());
			pstmt.setBoolean(5, menu.isAvailable());
			pstmt.setString(6, menu.getImagePath());
			pstmt.setString(7, menu.getCategory());

			int i = pstmt.executeUpdate();

			System.out.println(i + " Menu Item Added");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateMenu(Menu menu) {
		Connection connection = DBConnection.getConnection();
		try {

			PreparedStatement pstmt =connection.prepareStatement(UPDATE_QUERY);

			pstmt.setInt(1, menu.getRestaurantId());
			pstmt.setString(2, menu.getItemName());
			pstmt.setString(3, menu.getDescription());
			pstmt.setDouble(4, menu.getPrice());
			pstmt.setBoolean(5, menu.isAvailable());
			pstmt.setString(6, menu.getImagePath());
			pstmt.setString(7, menu.getCategory());
			pstmt.setInt(8, menu.getMenuId());

			int i = pstmt.executeUpdate();

			System.out.println(i + " Menu Item Updated");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteMenu(int menuId) {
		Connection connection = DBConnection.getConnection();
		try {

			PreparedStatement pstmt =connection.prepareStatement(DELETE_QUERY);

			pstmt.setInt(1, menuId);

			int i = pstmt.executeUpdate();

			System.out.println(i + " Menu Item Deleted");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Menu getMenu(int menuId) {
		Connection connection = DBConnection.getConnection();
		Menu menu = null;
		try {

			PreparedStatement pstmt =connection.prepareStatement(SELECT_QUERY);

			pstmt.setInt(1, menuId);

			ResultSet res = pstmt.executeQuery();

			if(res.next()) {

				menu = getMenuByResultSet(res);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return menu;
	}

	@Override
	public List<Menu> getAllMenus() {
		List<Menu> list = new ArrayList<>();
		Connection connection = DBConnection.getConnection();
		try {

			Statement stmt = connection.createStatement();

			ResultSet res = stmt.executeQuery(SELECT_ALL_QUERY);

			while(res.next()) {

				Menu menu = getMenuByResultSet(res);

				list.add(menu);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	
	@Override
	public List<Menu> getFeaturedMenus() {

	    List<Menu> list = new ArrayList<>();

	    Connection connection = DBConnection.getConnection();

	    try {

	        Statement stmt = connection.createStatement();

	        ResultSet res = stmt.executeQuery(SELECT_FEATURED_QUERY);

	        while(res.next()) {

	            Menu menu = getMenuByResultSet(res);

	            list.add(menu);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return list;
	}

	private Menu getMenuByResultSet(ResultSet res)throws SQLException {

		int menuId = res.getInt("menuId");
		int restaurantId = res.getInt("restaurantId");
		String itemName = res.getString("itemName");
		String description = res.getString("description");
		double price = res.getDouble("price");
		boolean isAvailable = res.getBoolean("isAvailable");
		String imagePath = res.getString("imagePath");
		String category = res.getString("category");

		return new Menu(
				menuId,
				restaurantId,
				itemName,
				description,
				price,
				isAvailable,
				imagePath,
				category
				);
	}
	@Override
	public List<Menu> getMenuByRestaurantId(int restaurantId) {

	    List<Menu> list = new ArrayList<>();

	    Connection connection = DBConnection.getConnection();

	    try {

	        PreparedStatement pstmt =
	                connection.prepareStatement(
	                        SELECT_BY_RESTAURANT_QUERY);

	        pstmt.setInt(1, restaurantId);

	        ResultSet res = pstmt.executeQuery();

	        while(res.next()) {

	            Menu menu = getMenuByResultSet(res);

	            list.add(menu);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	
	@Override
	public List<Menu> getVegMenu(int restaurantId) {

	    List<Menu> list = new ArrayList<>();

	    Connection connection = DBConnection.getConnection();

	    try {

	        String sql = "SELECT * FROM menu WHERE restaurantId=? AND category=?";

	        PreparedStatement pstmt = connection.prepareStatement(sql);

	        pstmt.setInt(1, restaurantId);
	        pstmt.setString(2, "Veg");

	        ResultSet res = pstmt.executeQuery();

	        while (res.next()) {

	            Menu menu = getMenuByResultSet(res);
	            list.add(menu);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	
	@Override
	public List<Menu> getNonVegMenu(int restaurantId) {

	    List<Menu> list = new ArrayList<>();

	    Connection connection = DBConnection.getConnection();

	    try {

	        String sql = "SELECT * FROM menu WHERE restaurantId=? AND category=?";

	        PreparedStatement pstmt = connection.prepareStatement(sql);

	        pstmt.setInt(1, restaurantId);
	        pstmt.setString(2, "Non Veg");

	        ResultSet res = pstmt.executeQuery();

	        while (res.next()) {

	            Menu menu = getMenuByResultSet(res);
	            list.add(menu);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	
	@Override
	public List<Menu> getLowPriceMenu(int restaurantId) {

	    List<Menu> list = new ArrayList<>();

	    Connection connection = DBConnection.getConnection();

	    try {

	        String sql =
	        "SELECT * FROM menu WHERE restaurantId=? ORDER BY price ASC";

	        PreparedStatement pstmt = connection.prepareStatement(sql);

	        pstmt.setInt(1, restaurantId);

	        ResultSet res = pstmt.executeQuery();

	        while (res.next()) {

	            Menu menu = getMenuByResultSet(res);
	            list.add(menu);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	
	@Override
	public List<Menu> getHighPriceMenu(int restaurantId) {

	    List<Menu> list = new ArrayList<>();

	    Connection connection = DBConnection.getConnection();

	    try {

	        String sql =
	        "SELECT * FROM menu WHERE restaurantId=? ORDER BY price DESC";

	        PreparedStatement pstmt = connection.prepareStatement(sql);

	        pstmt.setInt(1, restaurantId);

	        ResultSet res = pstmt.executeQuery();

	        while (res.next()) {

	            Menu menu = getMenuByResultSet(res);
	            list.add(menu);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return list;
	}

}
