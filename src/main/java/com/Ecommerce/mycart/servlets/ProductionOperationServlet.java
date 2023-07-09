
package com.Ecommerce.mycart.servlets;

import com.Ecommerce.mycart.dao.CarouselProductDao;
import com.Ecommerce.mycart.dao.CategoryDao;
import com.Ecommerce.mycart.dao.NewArrivalsDao;
import com.Ecommerce.mycart.dao.ProductDao;
import com.Ecommerce.mycart.entities.CarouselProduct;
import com.Ecommerce.mycart.entities.Category;
import com.Ecommerce.mycart.entities.Product;
import com.Ecommerce.mycart.helper.FactoryProvider;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;


//defining this servlet can use multipart data
@MultipartConfig
@WebServlet(name = "ProductionOperationServlet", urlPatterns = {"/ProductionOperationServlet"})
public class ProductionOperationServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            
        // operation value fetched from both addCategory and addProduct to determine whether to add catgory or add product
            String op=request.getParameter("operation");
            
      switch (op.trim()) {
    case "addcategory":{
        // FETCHING CATEGORY DATA
        String title = request.getParameter("catTitle");
        String description = request.getParameter("catDescription");

        // Adding category to database
        Category category = new Category();
        category.setCategoryTitle(title);
        category.setCategoryDescription(description);

        // To save category into database, create CategoryDao class
        CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
        int catId = categoryDao.saveCategory(category);

        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("message", "Category added successfully: " + catId);
        response.sendRedirect("admin.jsp");
        break;
    }  
    
    case "deletecategory":{
       CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
       int categoryId=Integer.parseInt(request.getParameter("categoryId"));
       List<Category> categoryList=cdao.getCategories();
       boolean categoryFound = false;
        for (Category category : categoryList) {
            if (category.getCategoryId() == categoryId) {
                categoryFound = true;
                break;
            }
        }
        if (categoryFound) {
            cdao.deleteCategoryById(categoryId);
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message", "Category deleted successfully: " + categoryId);
            response.sendRedirect("admin.jsp");
            break;
        } else {
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message", "Category not found: " + categoryId);
            response.sendRedirect("admin.jsp");
            break;
        }
    }
    case "addproduct":
    {    
        // FETCHING PRODUCT DATA
        String pName = request.getParameter("productName");
        String pDescription = request.getParameter("productDescription");
        int pPrice = Integer.parseInt(request.getParameter("productPrice"));
        int pDiscount = Integer.parseInt(request.getParameter("productDiscount"));
        int pQuantity = Integer.parseInt(request.getParameter("productQuantity"));
        int catId = Integer.parseInt(request.getParameter("catId"));

        // For storing pic using multipart
        Part part = request.getPart("productPic");

        Product p = new Product();
        p.setpName(pName);
        p.setpDesc(pDescription);
        p.setpPrice(pPrice);
        p.setpDiscount(pDiscount);
        p.setpQuantity(pQuantity);
        p.setpPhoto(part.getSubmittedFileName());

        // Get category by Id p.catId
        CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
        Category category = cDao.getCategoryById(catId);

        p.setCategory(category);

        ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
        pdao.saveProduct(p);

        // PIC UPLOAD
        // Find out the path to upload photo, i.e., product-img folder
        String path = request.getRealPath("images") + File.separator + "img" + File.separator + "gadgets" + File.separator + part.getSubmittedFileName();

        try {
            // UPLOADING CODE
            FileOutputStream fos = new FileOutputStream(path);
            InputStream is = part.getInputStream();

            // READING DATA
            byte[] data = new byte[is.available()];
            is.read(data);

            // WRITING THE DATA
            fos.write(data);
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

       HttpSession httpSession = request.getSession();
        httpSession.setAttribute("message", "Product added successfully!!!");
        response.sendRedirect("admin.jsp");
        break;
 }
    case "deleteproduct":
    { 
        
        System.out.println("Entereddddd into delete product");
        ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
        int productId = Integer.parseInt(request.getParameter("productId"));
        
        System.out.println("product to be deleted "+productId);
        List<Product> plist = pdao.getAllProducts();
        
        System.out.println("listtttt of all productsss"+plist);
        
        //Adding a functionalilty such that the Products present in the carousel cannot be deleted
        CarouselProductDao carDao=new CarouselProductDao(FactoryProvider.getFactory());
        List<CarouselProduct> carousellist=carDao.getAllProductsFromCarousel();
        List<Product> convertedfromCarousellist=carDao.getAllProductsConvertedFromCarousel(carousellist, pdao);
        System.out.println("carousell list   "+ convertedfromCarousellist);
        
        List carouselidlist=new ArrayList<>();
        for(Product product:convertedfromCarousellist){
            carouselidlist.add(product.getpId());
        }
        System.out.println(carouselidlist.contains(productId));
        if(carouselidlist.contains(productId)){
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message", "Product is present in carousel: " + productId);
            response.sendRedirect("admin.jsp");
             return; //break cannot be written here
         }
    
        //adding a fuctionality such that product present in the newarrivals cannot be deleted
        NewArrivalsDao newarrivalDao=new NewArrivalsDao(FactoryProvider.getFactory());
           List<Integer> newArrivalsIdList= newarrivalDao.getAllNewArrivalsId();
           System.out.println("new arrivals id list is "+newArrivalsIdList);
         if(newArrivalsIdList.contains(productId)){
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message", "Product is present in new Arrivals Section: "+ productId);
            response.sendRedirect("admin.jsp");
            return; //break cannot be written here
         }
//        //checking for the product in the proudct table
//        // if product present then only will get deleted
        boolean productFound = false;
        for (Product product : plist) {
            if (product.getpId() == productId) {
                productFound = true;
                break;
            }
        }
        if (productFound) {
            pdao.deleteProductById(productId);
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message", "Product removed successfully: " + productId);
            response.sendRedirect("admin.jsp");
            break;
        } else {
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message", "Product not found: " + productId);
            response.sendRedirect("admin.jsp");
            break;
        }
    }
    case "modifyproduct":
    {
        int productId = Integer.parseInt(request.getParameter("productId"));
        ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
        Product product = pdao.getProductById(productId);
        if (product != null) {
            HttpSession httpSession = request.getSession();;
            httpSession.setAttribute("modifyProduct", product);

            // Set the product image path as an attribute in the session
            String imagePath = "images/img/gadgets/" + product.getpPhoto();
            httpSession.setAttribute("productImagePath", imagePath);

            response.sendRedirect("productConfiguration.jsp");
            break;
        } else {
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message", "Product not found");
            response.sendRedirect("admin.jsp");
            break;
        }
    }
    case "addModifiedproduct":
    {
        int productId = Integer.parseInt(request.getParameter("productId"));
        String pName = request.getParameter("productName");
        String pDescription = request.getParameter("productDescription");
        int pPrice = Integer.parseInt(request.getParameter("productPrice"));
        int pDiscount = Integer.parseInt(request.getParameter("productDiscount"));
        int pQuantity = Integer.parseInt(request.getParameter("productQuantity"));
        int catId = Integer.parseInt(request.getParameter("catId"));
        Part part = request.getPart("productPic");

        Product p = new Product();
        p.setpId(productId);
        p.setpName(pName);
        p.setpDesc(pDescription);
        p.setpPrice(pPrice);
        p.setpDiscount(pDiscount);
        p.setpQuantity(pQuantity);
        p.setpPhoto(part.getSubmittedFileName());

        // Get category by Id p.catId
        CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
        Category category = cDao.getCategoryById(catId);

        p.setCategory(category);

        ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
        pdao.modifyProduct(p);

        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("message", "Product modified successfully!!!");
        response.sendRedirect("productConfiguration.jsp");
        break;
    }
    case "modifyCarousel":
    {
        ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
        List<Product> newCarProducts = new ArrayList<>();
        for (int i = 1; i <= 5; i++) {
            String newProductIdStr = request.getParameter("newProduct" + i);
            if (!newProductIdStr.isEmpty()) {
                int newProductId = Integer.parseInt(newProductIdStr);
                Product product = pdao.getProductById(newProductId);
                if(product!=null){
                newCarProducts.add(product);}
                else{
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Product to be added to carousel is not found : "+ newProductId);
                response.sendRedirect("admin.jsp");
                return; //break cannot be written here
                }
            } else {
                newCarProducts.add(null);
            }
        }
        System.out.println(newCarProducts);
        CarouselProductDao cdao = new CarouselProductDao(FactoryProvider.getFactory());
        cdao.saveProductToCarousel(newCarProducts);
        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("message", "Carousel Products added successfully!!!");
        response.sendRedirect("productConfiguration.jsp");
        break;
 }
    case "modifyNewArrivals":
    {
        ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
        List<Product> newArrProducts = new ArrayList<>();
        int count = Integer.parseInt(request.getParameter("numberArrivals"));
        if(count==0){
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message", "you have Entered zero elements !!!");
            response.sendRedirect("productConfiguration.jsp");
            break;
        }else{
            for (int i = 1; i <= count; i++) {
                String newProductIdStr = request.getParameter("newProduct" + i);
                if (!newProductIdStr.isEmpty()) {
                    
                    int newProductId = Integer.parseInt(newProductIdStr);
                    Product product = pdao.getProductById(newProductId);
                    if(product!=null){
                    newArrProducts.add(product);}
                    else{
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message", "Product is not found to be added: "+ newProductId);
                    response.sendRedirect("admin.jsp");
                    return; //break cannot be written here
                    }
                } else {
    
                    newArrProducts.add(null);
                }
            }
            System.out.println("new arr prosducts  in modify new arrivals "+newArrProducts);
            NewArrivalsDao ndao = new NewArrivalsDao(FactoryProvider.getFactory());
            ndao.saveProductToNewArrivals(newArrProducts);
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message", "New Arrivals added successfully!!!");
            response.sendRedirect("productConfiguration.jsp");
            break;
        }
}
    default:
        // Handle the case when the operation is not recognized
        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("message", "Invalid operation: "+ op);
        response.sendRedirect("admin.jsp");
        break;
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
