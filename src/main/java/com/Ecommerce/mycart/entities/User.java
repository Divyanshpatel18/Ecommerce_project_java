
package com.Ecommerce.mycart.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue; 
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class User {
 
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length = 10,name = "user_Id")
    private int userId;
    @Column(length = 100,name = "user_Name")
    private String userName;
    @Column(length = 100,name = "user_Email")
    private String userEmail;
    @Column(length = 100,name = "user_Password")
    private String userPassword;
    @Column(length = 12,name = "user_Phone")
    private String userPhone;
    @Column(length = 100,name = "user_Pic")
    private String userPic;
    @Column(length = 1500,name = "user_Address")
    private String userAddress;
  
    @Column( length = 15,name = "user_Type")
    private String userType;
   
    
    @OneToMany(mappedBy = "user")
    List<Order> orders=new ArrayList<>();

    
    
    public User( String userName, String userEmail, String userPassword, String userPhone, String userPic, String userAddress,String userType) {

        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userPic = userPic;
        this.userAddress = userAddress;
       this.userType=userType;
    }
    


    public User() {
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public void setUserPic(String userPic) {
        this.userPic = userPic;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }



    public int getUserId() {
        return userId;
    }

    public String getUserName() {
        return userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public String getUserPic() {
        return userPic;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public String getUserType() {
        return userType;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }


    
    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword=" + userPassword + ", userPhone=" + userPhone + ", userPic=" + userPic + ", userAddress=" + userAddress + '}';
    }

     
    
    
    
}
