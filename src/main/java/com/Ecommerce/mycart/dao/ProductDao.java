package com.Ecommerce.mycart.dao;

import com.Ecommerce.mycart.entities.CarouselProduct;
import com.Ecommerce.mycart.entities.Category;
import com.Ecommerce.mycart.entities.Product;
import com.Ecommerce.mycart.helper.FactoryProvider;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ProductDao {

    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    //saving the product and return true
    public boolean saveProduct(Product product) {
        boolean f = false;
        try {

            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();

            session.save(product);

            tx.commit();
            session.close();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
            f = false;
        }
        return f;
    }

    //get all products
    public List<Product> getAllProducts() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product");
        List<Product> list = query.list();
        return list;
    }
    //get all products by category title

    public List<Product> getAllProductsByCat(String CatTitle) {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product where category.categoryTitle=: title");
        query.setParameter("title", CatTitle);
        List<Product> list = query.list();
        return list;
    }

    //get all products by category Id
    public List<Product> getAllProductsByCatId(int cId) {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product where category.categoryId=: id");
        query.setParameter("id", cId);
        List<Product> list = query.list();
        return list;
    }
    public Product getProductById(int productId){
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product where pId=: id");
        query.setParameter("id", productId);
        Product product  = (Product)query.uniqueResult();
        return product;
    }
    public void deleteProductById(int productId) {
        try {
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
            Query query = session.createQuery("delete from Product where pId = :id");
            query.setParameter("id", productId);
            int rowsAffected = query.executeUpdate();
            tx.commit();
            session.close();
            System.out.println(rowsAffected + " row(s) deleted.");
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public boolean modifyProduct(Product product) {
    boolean f = false;
    try {
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();

        // Get the product by its ID
          int productId=product.getpId();
          System.out.println("Product ID is ldjl "+productId);
          Query query = session.createQuery("FROM Product WHERE pId = :productId");
          query.setParameter("productId", productId);
            // Execute the query and get the single result
           Product productDB = (Product) query.uniqueResult();
           System.out.println("product Database ekldls "+productDB);
        if (product != null) {
            // Update the product details
            productDB.setpName(product.getpName());
            productDB.setpDesc(product.getpDesc());
            productDB.setpPrice(product.getpPrice());
            productDB.setpDiscount(product.getpDiscount());
            productDB.setpQuantity(product.getpQuantity());
            productDB.setCategory(product.getCategory());
            productDB.setpPhoto(product.getpPhoto());
            }

            // Save the updated product
            session.update(productDB);

            tx.commit();
            session.close();
            f = true;
        }
         catch (Exception e) {
                e.printStackTrace();
                f = false;
            }
            return f;
        }
     


}
