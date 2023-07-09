
package com.Ecommerce.mycart.dao;

import com.Ecommerce.mycart.entities.CarouselProduct;
import com.Ecommerce.mycart.entities.Product;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CarouselProductDao {
    
      private SessionFactory factory;

    public CarouselProductDao(SessionFactory factory) {
        this.factory = factory;
    }
    //saving the product to carousel and return true
    public boolean saveProductToCarousel(List<Product> products) {
    boolean f = false;
    try {
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        
        // Delete all existing CarouselProduct objects
        Query deleteQuery = session.createQuery("DELETE FROM CarouselProduct");
        deleteQuery.executeUpdate();
        System.out.println("jglgjlsjdlaaaaaaaaaaaaaaa");
        int i=1;
        for (Product product : products) {
            CarouselProduct carouselProduct = new CarouselProduct(
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
            session.save(carouselProduct);
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
     
    public List<Product> getAllProductsConvertedFromCarousel(List<CarouselProduct> carouselProductList,ProductDao pdao){
    List<Product> convertedToProductList=new ArrayList<>();
     try {
        for (CarouselProduct carouselproduct : carouselProductList) {
                  int carId=carouselproduct.getCarouselId();
                  Product product=pdao.getProductById(carId);
                  convertedToProductList.add(product);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return convertedToProductList;
    }
    
     //get all products from carousel
    public List<CarouselProduct> getAllProductsFromCarousel() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from CarouselProduct");
        List<CarouselProduct> list = query.list();
        return list;
    }
    
    public CarouselProduct getCarouselProductById(int productId){
        Session s = this.factory.openSession();
        Query query = s.createQuery("from CarouselProduct where pId=: id");
        query.setParameter("id", productId);
        CarouselProduct carouselproduct  = (CarouselProduct)query.uniqueResult();
        return carouselproduct;
    }
}
