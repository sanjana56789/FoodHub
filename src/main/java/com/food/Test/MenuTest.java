package com.food.Test;

import java.util.Scanner;

import com.food.DAOImpl.MenuDAOImpl;
import com.food.Model.Menu;

public class MenuTest {

    public static void main(String[] args) {

        Scanner scan = new Scanner(System.in);

        // Add Menu

        System.out.println("Enter Restaurant ID: ");
        int restaurantId = scan.nextInt();
        scan.nextLine();

        System.out.println("Enter Item Name: ");
        String itemName = scan.nextLine();

        System.out.println("Enter Description: ");
        String description = scan.nextLine();

        System.out.println("Enter Price: ");
        double price = scan.nextDouble();

        System.out.println("Is Available (true/false): ");
        boolean isAvailable = scan.nextBoolean();
        scan.nextLine();

        System.out.println("Enter Image Path: ");
        String imagePath = scan.nextLine();

        Menu menu = new Menu(
                restaurantId,
                itemName,
                description,
                price,
                isAvailable,
                imagePath
        );

        MenuDAOImpl mdao = new MenuDAOImpl();

        mdao.addMenu(menu);

        System.out.println("Menu Added");


        // Get Menu

//        Menu menu = mdao.getMenu(1);
//        System.out.println(menu);


        // Get All Menus

//        List<Menu> menus = mdao.getAllMenus();
//
//        for(Menu m : menus) {
//            System.out.println(m);
//        }


        // Update Menu

//        System.out.println("Enter Menu ID: ");
//        int id = scan.nextInt();
//
//        Menu menu = mdao.getMenu(id);
//
//        menu.setPrice(120);
//
//        mdao.updateMenu(menu);
//
//        System.out.println(menu);


        // Delete Menu

//        System.out.println("Enter Menu ID to Delete: ");
//        int id = scan.nextInt();
//
//        mdao.deleteMenu(id);
//
//        System.out.println("Menu Deleted");
    }
}