/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phuocbt.Mobile;

/**
 *
 * @author phuoc
 */
public class MobileDTO {
    private String mobileId;
    private String description;
    private float price;
    private String mobileName;
    private int productionYear;
    private int quantity;
    private boolean notSale;

    public MobileDTO() {
    }
    
    //For update purpose
    public MobileDTO(String mobileName, String description, float price, int quantity, boolean notSale) {
        this.mobileName = mobileName;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.notSale = notSale;
    }
           

    public MobileDTO(String mobileId, String description, float price, String mobileName, int productionYear, int quantity, boolean notSale) {
        this.mobileId = mobileId;
        this.description = description;
        this.price = price;
        this.mobileName = mobileName;
        this.productionYear = productionYear;
        this.quantity = quantity;
        this.notSale = notSale;
    }

    public String getMobileId() {
        return mobileId;
    }

    public void setMobileId(String mobileId) {
        this.mobileId = mobileId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getMobileName() {
        return mobileName;
    }

    public void setMobileName(String mobileName) {
        this.mobileName = mobileName;
    }

    public int getProductionYear() {
        return productionYear;
    }

    public void setProductionYear(int productionYear) {
        this.productionYear = productionYear;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isNotSale() {
        return notSale;
    }

    public void setNotSale(boolean notSale) {
        this.notSale = notSale;
    }
    
    
}
