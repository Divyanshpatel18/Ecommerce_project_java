
package com.Ecommerce.mycart.dao;

import com.Ecommerce.mycart.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;


public class UserDao {
    
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    //get user by email and password
    
    public User getUserByEmailAndPassword(String email,String password){
        //creating a user object to get user data and initializing it to null
        User user=null;
        try {
            //HQL query      same Attribute userEmail and  userPassword stored in User class
            String query="from User where userEmail=: e and userPassword=: p ";
            Session session=this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e",email);
            q.setParameter("p",password);
            user =(User) q.uniqueResult();
                    
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        //if user is present in database it  will return user object
        //otherwise null
          return user;
    }
    
    public User getUserByID(int userId){
       
        User user=null; 
        try{
           String query="from User where userId=:uId"; 
           Session session=this.factory.openSession();
           Query q = session.createQuery(query);
           q.setParameter("uId",userId);
           user =(User) q.uniqueResult();
        }catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
  
}
