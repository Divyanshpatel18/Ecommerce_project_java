
package com.Ecommerce.mycart.servlets;

import com.Ecommerce.mycart.dao.CategoryDao;
import com.Ecommerce.mycart.dao.ProductDao;
import com.Ecommerce.mycart.entities.Category;
import com.Ecommerce.mycart.entities.Product;
import com.Ecommerce.mycart.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet(name = "ProductionOperationServlet", urlPatterns = {"/ProductionOperationServlet"})
public class ProductionOperationServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String op=request.getParameter("operation");
            if(op.trim().equals("addcategory"))
           {
                //                FETCHING CATEGORY DATA
               
               String title = request.getParameter("catTitle");
               String description = request.getParameter("catDescription");
               Category category = new Category();
               category.setCategoryTitle(title);
               category.setCategoryDescription(description);
               
              //category database save
             CategoryDao categoryDao= new CategoryDao(FactoryProvider.getFactory());
             int catId=categoryDao.saveCategory(category);
             
               HttpSession httpSession=request.getSession();
               httpSession.setAttribute("message", "Category added sucessfuylly"+catId);
             response.sendRedirect("admin.jsp");
             return;
             
            }else if(op.trim().equals("addproduct")){
                
                
                 //      FETCHING PRODUCT DATA
               String pName = request.getParameter("productName");
               String pDescription = request.getParameter("productDescription"); 
               int pPrice = Integer.parseInt(request.getParameter("productPrice")); 
               int pDiscount = Integer.parseInt(request.getParameter("productDiscount")); 
               int pQuantity = Integer.parseInt(request.getParameter("productQuantity")); 
               int catId = Integer.parseInt(request.getParameter("catId")); 
               Part part=request.getPart("productPic");
               
                Product p = new Product();
                p.setpName(pName);
                p.setpDesc(pDescription);
                p.setpPrice(pPrice);
                p.setpDiscount(pDiscount);
                p.setpQuantity(pQuantity);
                p.setpPhoto(part.getSubmittedFileName());
                
                //get category by Id
                CategoryDao cDao=new CategoryDao(FactoryProvider.getFactory());
                Category category= cDao.getCategoryById(catId);
                 
                p.setCategory(category);
                ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
                 pdao.saveProduct(p);
//                PIC UPLOAD
//                 find out the path to upload photo
                String path = request.getRealPath("images")+File.separator+"img"+File.separator+"gadgets"+File.separator+part.getSubmittedFileName();
                System.out.println(path);
                try {
                    
//                    UPLOADING CODE
                 FileOutputStream fos=  new FileOutputStream(path);
                 InputStream is=part.getInputStream();
//                 READING DATA
                   byte []data=new byte[is.available()];
                   is.read(data);
                  // WRITING THE DATA
                  fos.write(data);
                  fos.close();
                   } catch (Exception e) {
                       e.printStackTrace();
                }
                HttpSession httpSession=request.getSession();
                 httpSession.setAttribute("message", "Product added sucessfuylly");
                 response.sendRedirect("admin.jsp");
                 return;
           }
        }catch(Exception e){
            e.printStackTrace();
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
