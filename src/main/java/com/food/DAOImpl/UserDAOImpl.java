package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.food.DAO.UserDAO;
import com.food.Model.User;
import com.food.Utility.DBConnection;

public class UserDAOImpl implements UserDAO {

	private static final String INSERT_QUERY = "INSERT INTO user(userName,password,email,address,"
			+"role, lastLoginDate)VALUES(?,?,?,?,?,?)";
	
	private static final String SELECT_QUERY = "SELECT * FROM user WHERE userId=?";
	
	private static final String SELECT_QUERY2 = "SELECT * FROM user";
	
	private static final String UPDATE_QUERY =
			"UPDATE user SET userName=?, password=?, email=?, address=?, role=?, lastLoginDate=? WHERE userId=?";
	
	private static final String DELETE_QUERY ="DELETE FROM user WHERE userId=?";
	
	private static final String SELECT_BY_EMAIL =
	        "SELECT * FROM user WHERE email=?";
	
	private static final String UPDATE_PASSWORD =
			"UPDATE user SET password=? WHERE userId=?";
	
	
	@Override
	public void addUser(User u) {
		Connection connection=DBConnection.getConnection();
		try {
			PreparedStatement pstmt = connection.prepareStatement(INSERT_QUERY);
			pstmt.setString(1, u.getUserName());
			pstmt.setString(2, u.getPassword());
			pstmt.setString(3, u.getEmail());
			pstmt.setString(4, u.getAddress());
			pstmt.setString(5, u.getRole());
			pstmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
			
			
			int i=pstmt.executeUpdate();
			System.out.println(i);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateUser(User u) {

	    Connection connection = DBConnection.getConnection();

	    try {

	        PreparedStatement pstmt =
	                connection.prepareStatement(UPDATE_QUERY);

	        pstmt.setString(1, u.getUserName());
	        pstmt.setString(2, u.getPassword());
	        pstmt.setString(3, u.getEmail());
	        pstmt.setString(4, u.getAddress());
	        pstmt.setString(5, u.getRole());   // <-- Missing in your code
	        pstmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
	        pstmt.setInt(7, u.getUserId());

	        int i = pstmt.executeUpdate();

	        System.out.println(i + " User Updated");

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	@Override
	public void deleteUser(int user_id) {
		Connection connection=DBConnection.getConnection();
		try {

	        PreparedStatement pstmt =
	                connection.prepareStatement(DELETE_QUERY);

	        pstmt.setInt(1, user_id);

	        int i = pstmt.executeUpdate();

	        System.out.println(i + " row(s) deleted");

	    }
	    catch (SQLException e) {

	        e.printStackTrace();
	    }
		
	}

	@Override
	public User getUser(int user_id) {
		Connection connection=DBConnection.getConnection();
		User u=null;
		try {
			PreparedStatement pstmt=connection.prepareStatement(SELECT_QUERY);
			pstmt.setInt(1, user_id);
			ResultSet res=pstmt.executeQuery();
			
			while(res.next()) {
				u=getUserByResultSet(res);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u;
		
	}

	@Override
	public List<User> getAllUser() {
		List<User> list=new ArrayList<User>();
		Connection connection=DBConnection.getConnection();
		
			try {
				Statement stmt=connection.createStatement();
				ResultSet res=stmt.executeQuery(SELECT_QUERY2);
				
				while(res.next()) {
					User u=getUserByResultSet(res);
					list.add(u);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
	}
	
	private static User getUserByResultSet(ResultSet res) throws SQLException {
		int userId=res.getInt("userId");
		String userName=res.getString("userName");
		String password=res.getString("password");
		String email=res.getString("email");
		String address=res.getString("address");
		String role=res.getString("role");
		Timestamp createDate=res.getTimestamp("createDate");
		Timestamp lastLoginDate=res.getTimestamp("lastLoginDate");
		
		User u=new User(userId, userName, password, email, address, role, createDate, lastLoginDate);
		return u;
	}

	@Override
	public User getUserByEmail(String email) {

	    Connection connection = DBConnection.getConnection();

	    User user = null;

	    try {

	        PreparedStatement pstmt =
	                connection.prepareStatement(SELECT_BY_EMAIL);

	        pstmt.setString(1, email);

	        ResultSet res = pstmt.executeQuery();

	        if(res.next()) {

	            user = getUserByResultSet(res);

	        }

	    }
	    catch(SQLException e) {

	        e.printStackTrace();

	    }

	    return user;
	}
	
	@Override
	public void updatePassword(int userId, String password) {

	    Connection connection = DBConnection.getConnection();

	    try {

	        PreparedStatement pstmt =
	                connection.prepareStatement(UPDATE_PASSWORD);

	        pstmt.setString(1, password);
	        pstmt.setInt(2, userId);

	        int i = pstmt.executeUpdate();

	        System.out.println(i + " Password Updated");

	    }
	    catch(SQLException e) {

	        e.printStackTrace();
	    }
	}

   
}