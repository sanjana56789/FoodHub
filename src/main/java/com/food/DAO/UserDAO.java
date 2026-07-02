package com.food.DAO;

import java.util.List;

import com.food.Model.User;

public interface UserDAO {
	
	void addUser(User u);
	
	void updateUser(User u);
	
	void deleteUser(int user_id);
	
	User getUser(int user_id);
	
	List<User> getAllUser();
	
	User getUserByEmail(String email);
	
	void updatePassword(int userId, String password);
	
}
