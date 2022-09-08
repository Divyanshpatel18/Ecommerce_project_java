//
//package com.Ecommerce.mycart.servlets;
//
//import com.Ecommerce.mycart.entities.Order;
//import java.io.IOException;
//import java.io.PrintWriter;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//
//@WebServlet(name = "PlaceOrder", urlPatterns = {"/PlaceOrder"})
//public class PlaceOrder extends HttpServlet {
//
//   
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//                String customerName = request.getParameter("customer_Name");
//                String customerEmail = request.getParameter("customer_Email");
//                String customerAddress= request.getParameter("customer_Address");
//                String customerPhone = request.getParameter("customer_Phone");
//              //creating order object to create data
//              Order odr=new Order();
//              odr.setOrderAddress(customerAddress);
//              
////              User user=new User
//              
////              User user=new 
////              
//      
//        }
//    }
//
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
// 
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
