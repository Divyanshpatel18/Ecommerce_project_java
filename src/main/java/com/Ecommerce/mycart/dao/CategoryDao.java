
package com.Ecommerce.mycart.dao;

import com.Ecommerce.mycart.entities.Category;
import java.io.Serializable;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CategoryDao {
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    //creating a method for saving category into db,will return id
    public int saveCategory(Category cat){
      
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        int catId =(int) session.save(cat);
        tx.commit();
        
        session.close();
        return catId;
    }
    //To get all the categories to be chosen from Product form list options
    public List<Category> getCategories(){
        Session s = this.factory.openSession();
        Query query=s.createQuery("from Category");
        List<Category> list = query.list();
        return list;
        
    }
    public Category getCategoryById(int cid){
         Category cat=null;
        try {
            Session session = this.factory.openSession();
            //using get method to get category by id
            cat = session.get(Category.class, cid);
             session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }
     public void deleteCategoryById(int categoryId) {
        try {
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
            Query query = session.createQuery("delete from Category where categoryId = :id");
            query.setParameter("id", categoryId);
            int rowsAffected = query.executeUpdate();
            tx.commit();
            session.close();
            System.out.println(rowsAffected + " row(s) deleted.");
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
