//
//package com.Ecommerce.mycart.entities;
//
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.ManyToMany;
//import javax.persistence.ManyToOne;
//import javax.persistence.OneToMany;
//import javax.persistence.Temporal;
//import javax.persistence.TemporalType;
//
//@Entity
//public class Order {
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Column(length = 10,name = "order_Id")
//    private int orderId;
//    
//    
//    @ManyToOne
//    private User user;
//    
//    @Column(length = 10,name = "product_Id")
//    @ManyToMany
//    private List<Product> products=new ArrayList<>();
//    
//    @Column(length = 1000,name = "Order_Address")
//    private String orderAddress;
//    @Temporal(TemporalType.DATE)
//    private java.util.Date orderDate;
//    
//    private String deliveryDate;
//    private int orderAmount;
//
//    public void setOrderId(int orderId) {
//        this.orderId = orderId;
//    }
//
//    public void setUser(User user) {
//        this.user = user;
//    }
//
//    public void setProducts(List<Product> products) {
//        this.products = products;
//    }
//
//    public void setOrderAddress(String orderAddress) {
//        this.orderAddress = orderAddress;
//    }
//
//    public void setOrderDate(Date orderDate) {
//        this.orderDate = orderDate;
//    }
//
//    public void setDeliveryDate(String deliveryDate) {
//        this.deliveryDate = deliveryDate;
//    }
//
//    public void setOrderAmount(int orderAmount) {
//        this.orderAmount = orderAmount;
//    }
//
//
//    public int getOrderId() {
//        return orderId;
//    }
//
//    public User getUser() {
//        return user;
//    }
//
//    public List<Product> getProducts() {
//        return products;
//    }
//
//    public String getOrderAddress() {
//        return orderAddress;
//    }
//
//    public Date getOrderDate() {
//        return orderDate;
//    }
//
//    public String getDeliveryDate() {
//        return deliveryDate;
//    }
//
//    public int getOrderAmount() {
//        return orderAmount;
//    }
//   
//   
// 
//
//    public Order() {
//        this.products = new ArrayList<>();
//    }
//
//    public Order( User user, String orderAddress, Date orderDate, String deliveryDate, int orderAmount) {
//        this.orderId = orderId;
//        this.user = user;
//        this.orderAddress = orderAddress;
//        this.orderDate = orderDate;
//        this.deliveryDate = deliveryDate;
//        this.orderAmount = orderAmount;
//    }
//
//    @Override
//    public String toString() {
//        return "Order{" + "orderId=" + orderId + ", user=" + user + ", products=" + products + ", orderAddress=" + orderAddress + ", orderDate=" + orderDate + ", deliveryDate=" + deliveryDate + ", orderAmount=" + orderAmount + '}';
//    }
//
//
//
//  
//
//  
//
//
//
//   
//    
//    
//}
