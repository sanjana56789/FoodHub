package com.food.DAO;

import java.util.List;

import com.food.Model.Menu;

public interface MenuDAO {

    void addMenu(Menu menu);

    void updateMenu(Menu menu);

    void deleteMenu(int menuId);

    Menu getMenu(int menuId);

    List<Menu> getAllMenus();
    
    List<Menu> getMenuByRestaurantId(int restaurantId);
    
    List<Menu> getVegMenu(int restaurantId);

    List<Menu> getNonVegMenu(int restaurantId);

    List<Menu> getLowPriceMenu(int restaurantId);

    List<Menu> getHighPriceMenu(int restaurantId);
    
    List<Menu> getFeaturedMenus();
}