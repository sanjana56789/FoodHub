package com.food.Test;

import java.util.Scanner;

import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.Model.Restaurant;

public class RestaurantTest {

    public static void main(String[] args) {

        Scanner scan = new Scanner(System.in);

        // Add Restaurant

        System.out.println("Enter Restaurant Name: ");
        String name = scan.nextLine();

        System.out.println("Enter Cuisine Type: ");
        String cuisineType = scan.nextLine();

        System.out.println("Enter Delivery Time: ");
        int deliveryTime = scan.nextInt();
        scan.nextLine();

        System.out.println("Enter Address: ");
        String address = scan.nextLine();

        System.out.println("Enter Rating: ");
        double rating = scan.nextDouble();

        System.out.println("Is Active (true/false): ");
        boolean isActive = scan.nextBoolean();
        scan.nextLine();

        System.out.println("Enter Image Path: ");
        String imagePath = scan.nextLine();
        
        System.out.println("Enter about: ");
        String about = scan.nextLine();

        Restaurant restaurant = new Restaurant(
                name,
                cuisineType,
                deliveryTime,
                address,
                rating,
                isActive,
                imagePath,
                about);

        RestaurantDAOImpl rdao = new RestaurantDAOImpl();

        rdao.addRestaurant(restaurant);

        System.out.println("Restaurant Added");



        // Get Restaurant

//        Restaurant r = rdao.getRestaurant(1);
//        System.out.println(r);



        // Get All Restaurants

//        List<Restaurant> restaurants = rdao.getAllRestaurants();
//
//        for(Restaurant r : restaurants) {
//            System.out.println(r);
//        }



        // Update Restaurant

//        System.out.println("Enter Restaurant Id: ");
//        int id = scan.nextInt();
//
//        Restaurant r = rdao.getRestaurant(id);
//
//        r.setRating(4.9);
//
//        rdao.updateRestaurant(r);
//
//        System.out.println(r);



        // Delete Restaurant

//        System.out.println("Enter Restaurant Id to Delete: ");
//        int id = scan.nextInt();
//
//        rdao.deleteRestaurant(id);
//
//        System.out.println("Restaurant Deleted");
    }
}