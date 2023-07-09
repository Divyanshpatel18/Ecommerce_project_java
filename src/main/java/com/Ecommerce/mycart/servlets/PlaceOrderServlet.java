
package com.Ecommerce.mycart.servlets;

import com.Ecommerce.mycart.dao.UserDao;
import com.Ecommerce.mycart.entities.Order;
import com.Ecommerce.mycart.entities.Product;
import com.Ecommerce.mycart.entities.User;
import com.Ecommerce.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "PlaceOrderServlet", urlPatterns = {"/PlaceOrderServlet"})
public class PlaceOrderServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          
            out.println("hello\n");
            
            //FETCHING ORDER DATA            
            String orderDateString=request.getParameter("orderDate");
            String deliveryDateString=request.getParameter("orderDeliveryDate");
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
            Date orderDate=null;
            Date deliveryDate=null;
            try{
            orderDate=sdf.parse(orderDateString);
            out.println(orderDate+"\n");
            deliveryDate=sdf.parse(deliveryDateString);
            out.println(deliveryDate+"\n");
            }catch(ParseException e){
            }
            String orderAddress = request.getParameter("orderAddress");
            out.println(orderAddress+"\n");
            int orderAmount= Integer.parseInt(request.getParameter("orderAmount"));
            out.println(orderAmount+"\n");
            
            int orderUser = Integer.parseInt(request.getParameter("orderUserId"));
            out.println(orderUser+"\n");
            Order order=new Order();
            order.setOrderDate(orderDate);
            order.setDeliveryDate(deliveryDate);
            order.setOrderAddress(orderAddress);
            order.setOrderAmount(orderAmount);
            
            UserDao userDao=new UserDao(FactoryProvider.getFactory());
            User user=userDao.getUserByID(orderUser);
             out.print(user+"\n");
            order.setUser(user);
            
            String productItems=request.getParameter("cart");
            
            out.print("objects items are" +productItems);
            
            
            
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(PlaceOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(PlaceOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
