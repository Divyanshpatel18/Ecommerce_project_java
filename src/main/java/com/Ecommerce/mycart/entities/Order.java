
package com.Ecommerce.mycart.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="ordering_data")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length = 10,name = "order_Id")
    private int orderId;
    
    @Temporal(TemporalType.DATE)
    private java.util.Date orderDate; 
    
    @Temporal(TemporalType.DATE)
    private java.util.Date deliveryDate;
    
    @Column(length = 1000,name = "Order_Address")
    private String orderAddress;
    
     private int orderAmount;
    
    @JoinColumn(name="user_Id")
    @ManyToOne
    private User user;
    
    @Column(length = 10,name = "product_Id")
    @ManyToMany
    @JoinTable(name="order_product",
            joinColumns={@JoinColumn(name="order_id")},
            inverseJoinColumns={@JoinColumn(name="product_id")}
    )
    private List<Product> products=new ArrayList<>();
  

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public String getOrderAddress() {
        return orderAddress;
    }

    public void setOrderAddress(String orderAddress) {
        this.orderAddress = orderAddress;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }
     public void setOrderAmount(int orderAmount) {
        this.orderAmount = orderAmount;
    }

    public int getOrderAmount() {
        return orderAmount;
    }

    public Order( String orderAddress, Date orderDate, Date deliveryDate, int orderAmount) {
//        this.user = user;
        this.orderAddress = orderAddress;
        this.orderDate = orderDate;
        this.deliveryDate = deliveryDate;
        this.orderAmount = orderAmount;
    }

    public Order() {
    }

    
    

    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", products=" + products + ", orderAddress=" + orderAddress + ", orderDate=" + orderDate + ", deliveryDate=" + deliveryDate + ", orderAmount=" + orderAmount + '}';
    }

 
}
