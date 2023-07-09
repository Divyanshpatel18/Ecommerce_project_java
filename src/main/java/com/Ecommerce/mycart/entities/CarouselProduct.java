
package com.Ecommerce.mycart.entities;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class CarouselProduct {


    @Id
    private int CarouselSNo;
    
    private int carouselId;
    private String carouselName;
    @Column(length=3000)
    private String carouselDesc;
    private String carouselPhoto;
    private int carouselPrice;
    private int carouselDiscount;
    private int carouselQuantity;
    

    public CarouselProduct() {
    }

    
    public CarouselProduct(int CarouselSNo,int carouselId,String carouselName, String carouselDesc, String carouselPhoto, int carouselPrice, int carouselDiscount, int carouselQuantity) {
        this.CarouselSNo=CarouselSNo;
        this.carouselId=carouselId;
        this.carouselName = carouselName;
        this.carouselDesc = carouselDesc;
        this.carouselPhoto = carouselPhoto;
        this.carouselPrice = carouselPrice;
        this.carouselDiscount = carouselDiscount;
        this.carouselQuantity = carouselQuantity;

    }

    public int getCarouselSNo() {
        return CarouselSNo;
    }

    public void setCarouselSNo(int CarouselSNo) {
        this.CarouselSNo = CarouselSNo;
    }

    public int getCarouselId() {
        return carouselId;
    }

    public void setCarouselId(int carouselId) {
        this.carouselId = carouselId;
    }

    public String getCarouselName() {
        return carouselName;
    }

    public void setCarouselName(String carouselName) {
        this.carouselName = carouselName;
    }

    public String getCarouselDesc() {
        return carouselDesc;
    }

    public void setCarouselDesc(String carouselDesc) {
        this.carouselDesc = carouselDesc;
    }

    public String getCarouselPhoto() {
        return carouselPhoto;
    }

    public void setCarouselPhoto(String carouselPhoto) {
        this.carouselPhoto = carouselPhoto;
    }

    public int getCarouselPrice() {
        return carouselPrice;
    }

    public void setCarouselPrice(int carouselPrice) {
        this.carouselPrice = carouselPrice;
    }

    public int getCarouselDiscount() {
        return carouselDiscount;
    }

    public void setCarouselDiscount(int carouselDiscount) {
        this.carouselDiscount = carouselDiscount;
    }

    public int getCarouselQuantity() {
        return carouselQuantity;
    }

    public void setCarouselQuantity(int carouselQuantity) {
        this.carouselQuantity = carouselQuantity;
    }
    
  
}
