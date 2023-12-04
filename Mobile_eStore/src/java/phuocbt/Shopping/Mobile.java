/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuocbt.Shopping;

/**
 *
 * @author phuoc
 */
public class Mobile {
    private String mobileId;
    private String mobileName;
    private String description;
    private String productionYear;
    private float price;
    private int quantity;

    public Mobile() {
    }

    public Mobile(String mobileId, String mobileName, String description, String productionYear, float price, int quantity) {
        this.mobileId = mobileId;
        this.mobileName = mobileName;
        this.description = description;
        this.productionYear = productionYear;
        this.price = price;
        this.quantity = quantity;
    }

    public String getMobileId() {
        return mobileId;
    }

    public void setMobileId(String mobileId) {
        this.mobileId = mobileId;
    }

    public String getMobileName() {
        return mobileName;
    }

    public void setMobileName(String mobileName) {
        this.mobileName = mobileName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getProductionYear() {
        return productionYear;
    }

    public void setProductionYear(String productionYear) {
        this.productionYear = productionYear;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
}
