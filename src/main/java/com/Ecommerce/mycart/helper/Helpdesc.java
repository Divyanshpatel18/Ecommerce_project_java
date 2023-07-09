
package com.Ecommerce.mycart.helper;

import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;


public class Helpdesc {
    //creating a method to get short description of product details
    public static String getwords(String desc){
        String[] str = desc.split(" ");
        if(str.length>4){
            String res="";
            for(int i=0;i<5;i++)
            {
                res=res+str[i]+" ";
            }
            return (res+"...");
        
    }else{
                return (desc+"...");
                }
    }
    
    //to get count of products and user
    public static Map<String,Long> getCountUsers(SessionFactory factory){
        
        Session session = factory.openSession();
        String q1="Select count(*) from User";
        String q2="Select count(*) from Product";
        Query query1=session.createQuery(q1);
        Query query2=session.createQuery(q2);
        //getting the first element of list which is count
        Long userCount  = (Long) query1.list().get(0);
        Long productCount  = (Long) query2.list().get(0);
        
        //creating a HashMap to store user and product count
        //first parameter is key i.e. userCount/productCount
        //second parameter is value i.e. userCount/productCount which we calculated by running query
        Map<String,Long> map=new HashMap<>();
        map.put("userCount", userCount);
        map.put("productCount", productCount);
        
        session.close();
        return map;
    }
}  

