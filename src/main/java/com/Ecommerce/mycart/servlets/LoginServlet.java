
package com.Ecommerce.mycart.servlets;

import com.Ecommerce.mycart.dao.UserDao;
import com.Ecommerce.mycart.entities.User;
import com.Ecommerce.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //getting email and password from login page
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            //AUTHENTICATION USER
            UserDao userDao=new UserDao(FactoryProvider.getFactory());
            
            //calling userDao class method to get user from database if it is present otherwise null
           User user= userDao.getUserByEmailAndPassword(email, password);
           
           
           //sending the message through session
            HttpSession httpSession = request.getSession();
        
          if(user==null){
            httpSession.setAttribute("message", "Invalid Details! ");
            response.sendRedirect("login.jsp");
            return;
        }
          else{
//             out.println("<h1> Welcome"+user.getUserName()+"</h1>");
             //login
             //setting the current-user key with value=user which we got in user object by calling getUserByEmailAndPassword
             httpSession.setAttribute("current-user", user);
             
             if(user.getUserType().equals("admin"))
             {
                 response.sendRedirect("admin.jsp");
             }else if(user.getUserType().equals("normal")){
                 response.sendRedirect("shopcart.jsp");

             }else{
                 out.println("we have not identified user type");
             }

          }
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
