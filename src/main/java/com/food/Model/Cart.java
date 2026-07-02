package com.food.Model;

import java.util.HashMap;
import java.util.Map;

public class Cart {

    private Map<Integer, CartItem> items;

    public Cart() {
        items = new HashMap<>();
    }

    public Map<Integer, CartItem> getItems() {
        return items;
    }

    public void addItem(CartItem item) {

        int menuId = item.getMenuId();

        if(items.containsKey(menuId)) {

            CartItem existingItem =
                    items.get(menuId);

            existingItem.setQuantity(
                    existingItem.getQuantity() + 1);

        }
        else {

            items.put(menuId, item);
        }
    }

    public void removeItem(int menuId) {

        items.remove(menuId);
    }

    public void clearCart() {

        items.clear();
    }
    
    public void updateQuantity(int menuId, int quantity) {

        if(items.containsKey(menuId)) {

            CartItem item = items.get(menuId);

            item.setQuantity(quantity);

            if(quantity <= 0) {
                items.remove(menuId);
            }
        }
    }

    public double getTotalPrice() {

        double total = 0;

        for(CartItem item : items.values()) {

            total += item.getTotalPrice();
        }

        return total;
    }
}