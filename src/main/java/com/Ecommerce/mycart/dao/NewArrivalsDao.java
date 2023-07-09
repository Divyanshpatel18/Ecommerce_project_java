
package com.Ecommerce.mycart.dao;

import com.Ecommerce.mycart.entities.CarouselProduct;
import com.Ecommerce.mycart.entities.NewArrivals;
import com.Ecommerce.mycart.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


public class NewArrivalsDao {
      private SessionFactory factory;

    public NewArrivalsDao(SessionFactory factory) {
        this.factory = factory;
    } 
    //saving the product to NewArrivals and return true
    public boolean saveProductToNewArrivals(List<Product> products) {
    boolean f = false;
    try {
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        
        // Delete all existing NewArrivals objects
        Query deleteQuery = session.createQuery("DELETE FROM NewArrivals");
        deleteQuery.executeUpdate();
        System.out.println("newArrivalsss");
        int i=1;
        for (Product product : products) {
            NewArrivals newArrival = new NewArrivals(
                        i,
                    product.getpId(),
                    product.getpName(),
                    product.getpDesc(),
                    product.getpPhoto(),
                    product.getpPrice(),
                    product.getpDiscount(),
                    product.getpQuantity()
                    
            );
            i++;
            session.save(newArrival);
        }

        tx.commit();
        session.close();
        f = true;
    } catch (Exception e) {
        e.printStackTrace();
        f = false;
    }
    return f;
}
     //get all products from carousel
    public List<NewArrivals> getAllProductsFromNewArrivals() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from NewArrivals");
        List<NewArrivals> list = query.list();
        s.close();
        return list;
    }
        public NewArrivals getNewArrivalsById(int productId){
        Session s = this.factory.openSession();
        Query query = s.createQuery("from NewArrivals where pId=: id");
        query.setParameter("id", productId);
        NewArrivals newArrival = (NewArrivals)query.uniqueResult();
        s.close();
        return newArrival;
    }
        public List getAllNewArrivalsId(){
        Session s = this.factory.openSession();
         Query query = s.createQuery("select newArrivalId from NewArrivals");
         List<Integer> newArrivalsIdList = query.list();
         s.close();
        return newArrivalsIdList;
            
        }
}
