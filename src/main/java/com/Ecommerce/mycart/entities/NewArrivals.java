
package com.Ecommerce.mycart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class NewArrivals {
 
    @Id
    private int newArrivalSNo;
    
    private int newArrivalId;
    private String newArrivalName;
    @Column(length=3000)
    private String newArrivalDesc;
    private String newArrivalPhoto;
    private int newArrivalPrice;
    private int newArrivalDiscount;
    private int newArrivalQuantity;

    
    public NewArrivals() {
    }

    public NewArrivals(int newArrivalSNo, int newArrivalId, String newArrivalName, String newArrivalDesc, String newArrivalPhoto, int newArrivalPrice, int newArrivalDiscount, int newArrivalQuantity) {
        this.newArrivalSNo = newArrivalSNo;
        this.newArrivalId = newArrivalId;
        this.newArrivalName = newArrivalName;
        this.newArrivalDesc = newArrivalDesc;
        this.newArrivalPhoto = newArrivalPhoto;
        this.newArrivalPrice  = newArrivalPrice;
        this.newArrivalDiscount = newArrivalDiscount;
        this.newArrivalQuantity = newArrivalQuantity;
    } 

    public int getNewArrivalSNo() {
        return newArrivalSNo;
    }

    public void setNewArrivalSNo(int newArrivalSNo) {
        this.newArrivalSNo = newArrivalSNo;
    }

    public int getNewArrivalId() {
        return newArrivalId;
    }

    public void setNewArrivalId(int newArrivaId) {
        this.newArrivalId = newArrivalId;
    }

    public String getNewArrivalName() {
        return newArrivalName;
    }

    public void setNewArrivalName(String newArrivalName) {
        this.newArrivalName = newArrivalName;
    }

    public String getNewArrivalDesc() {
        return newArrivalDesc;
    }

    public void setNewArrivalDesc(String newArrivaDesc) {
        this.newArrivalDesc = newArrivalDesc;
    }

    public String getNewArrivaPhoto() {
        return newArrivalPhoto;
    }

    public void setNewArrivalPhoto(String newArrivalPhoto) {
        this.newArrivalPhoto = newArrivalPhoto;
    }

    public int getNewArrivalPrice() {
        return newArrivalPrice;
    }

    public void setNewArrivalPrice(int newArrivalPrice) {
        this.newArrivalPrice = newArrivalPrice;
    }

    public int getNewArrivalDiscount() {
        return newArrivalDiscount;
    }

    public void setNewArrivalDiscount(int newArrivalDiscount) {
        this.newArrivalDiscount = newArrivalDiscount;
    }

    public int getNewArrivalQuantity() {
        return newArrivalQuantity;
    }

    public void setNewArrivalQuantity(int newArrivalQuantity) {
        this.newArrivalQuantity = newArrivalQuantity;
    }
     

    
}
