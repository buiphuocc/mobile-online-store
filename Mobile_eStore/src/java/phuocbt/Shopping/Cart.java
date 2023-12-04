/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuocbt.Shopping;

import java.util.HashMap;
import java.util.Map;
import phuocbt.Mobile.MobileDTO;

/**
 *
 * @author phuoc
 */
public class Cart {
    private Map<String, Mobile> cart;

    public Cart() {
    }

    public Cart(Map<String, Mobile> cart) {
        this.cart = cart;
    }

    public Map<String, Mobile> getCart() {
        return cart;
    }

    public void setCart(Map<String, Mobile> cart) {
        this.cart = cart;
    }
    public void add(Mobile mobile){
        if(this.cart==null){
            this.cart = new HashMap<>();
        }
        if(this.cart.containsKey(mobile.getMobileId())){
            int currentQuantity = this.cart.get(mobile.getMobileId()).getQuantity();
            mobile.setQuantity(currentQuantity + mobile.getQuantity());
        }
        cart.put(mobile.getMobileId(), mobile);
    }
    public void delete(String id){
        if(this.cart == null){
            return;
        }
        if(this.cart.containsKey(id)){
            this.cart.remove(id);
        }
    }
    public void update(String id, Mobile newMobile){
        if(this.cart == null){
            return;
        }
        if(this.cart.containsKey(id)){
            this.cart.replace(id, newMobile);
        }
    }
}
