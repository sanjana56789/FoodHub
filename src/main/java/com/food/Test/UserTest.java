package com.food.Test;

import java.util.Scanner;

import com.food.DAOImpl.UserDAOImpl;
import com.food.Model.User;

public class UserTest {

	public static void main(String[] args) {
//		Connection connection = DBConnection.getConnection();
//		System.out.println("Connection Established");
		
//		add user
		Scanner scan = new Scanner(System.in);
		System.out.println("Enter name: ");
		String userName = scan.next();
		System.out.println("Enter password: ");
		String password = scan.next();
		System.out.println("Enter email: ");
		String email = scan.next();
		System.out.println("Enter address: ");
		String address = scan.next();
		System.out.println("Enter role: ");
		String role = scan.next();
		
		User u=new User(userName, password, email, address, role);
		
		UserDAOImpl udao = new UserDAOImpl();
		udao.addUser(u);
		System.out.println("User added");
		
		
//		getuser
//		UserDAOImpl udao=new UserDAOImpl();
//		User u=udao.getUser(1);
//		System.out.println(u);
		
		
//		getalluser
		
//		UserDAOImpl udao=new UserDAOImpl();
//		List<User> allUser=udao.getAllUser();
//		for(User user : allUser) {
//			System.out.println(user);
//		}
		
		
//		updateuser
//		UserDAOImpl udao=new UserDAOImpl();
//		System.out.println("enter userid: ");
//		int id=scan.nextInt();
//		User u=udao.getUser(id);
//		System.out.println(u);
//		
//		u.setAddress("anashree");
//		udao.updateUser(u);
//		System.out.println(u);
		
//deleteuser
		
//		UserDAOImpl udao = new UserDAOImpl();
//
//	    udao.deleteUser(1);
	}

}
