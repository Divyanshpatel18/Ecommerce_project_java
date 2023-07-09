<%-- 
    Document   : admin
    Created on : Jun 28, 2022, 2:44:53 PM
    Author     : Lenovo
--%>
<%@page import="java.util.Map"%>
<%@page import="com.Ecommerce.mycart.helper.Helpdesc"%>
<%@page import="org.hibernate.boot.model.source.internal.hbm.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.Ecommerce.mycart.entities.Category"%>
<%@page import="com.Ecommerce.mycart.helper.FactoryProvider"%>
<%@page import="com.Ecommerce.mycart.dao.CategoryDao"%>
<%@page import="com.Ecommerce.mycart.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");

    //if one is trying to directly access admin.jsp by rewriting the url 
    //http://localhost:8080/Cart/admin.jsp stop him from doing this type of access
    if (user == null) {
        session.setAttribute("message", "you are not logged in!! login first");
        response.sendRedirect("login.jsp");
        return;
        //return back
    } else {

        //if someone is logged as nomal user http://localhost:8080/Cart/normal.jsp changing to
        // http://localhost:8080/Cart/admin.jsp stop him from accessing that page and print u r not logged in Admin
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "you are not logged in Admin!!");
            response.sendRedirect("login.jsp");

            return;
        }
    }


%>


<!--creating CategoryDao object to get list of all categories stored-->
<%    CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cDao.getCategories();
    //getting Count
    //getting count by calling count method in helper class
    Map<String, Long> m = Helpdesc.getCountUsers(FactoryProvider.getFactory());

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>This is Admin panel </title>


        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css" rel="stylesheet">
        <!--          
                    TO DELETE
        -->            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
                integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"
                integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy"
        crossorigin="anonymous"></script>

        <link rel="stylesheet" href="css/cartstyle.css"> 
        <link rel="stylesheet" href="css/toastmessage.css"> 
        <link rel="stylesheet" href="css/style.css">  
    </head>


    <style>
        body{
            background-color: #333;
        }
        .common .card  h1{
            font-size: 19px;
            color: black;
        }

        .outer{
            position: relative;
            top: 100px;
        }
        .common .card{
            transition: all 500ms ease-in-out ;
        }
 
        .common .card:hover{
            color: white;
            background: rgb(240, 85, 85);
            cursor: pointer;
        }

    </style>

    <body class="cart-body">
        <header>

            <nav class="navbar navbar-expand-lg navigation ">
                <div class="container">
                    <a class="navbar-brand" href="#"><img src="download.jpg" alt="" height="50 " width="50"></a>
                    <button class="navbar-toggler text-white" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <!-- <span class="navbar-toggler-icon"></span> -->
                        <i class="fas fa-stream "></i>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="index.jsp">Back to Home</a>
                            </li>


                            <%   if (user == null) {
                            %>
                            <li class="nav-item">
                                <a class="nav-link" href="login.jsp">Login</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="register.jsp">Register</a>
                            </li>
                            <%
                            } else {

                            %>
                            <li class="nav-item">
                                <a class="nav-link" href="#"><%= user.getUserName()%></a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="LogoutServlet">Logout</a>
                            </li>
                            <%
                                }
                            %>

                        </ul>

                    </div>
                </div>
            </nav>
        </header>

        <div class="container outer  ">
            <%@include file="components/message.jsp" %>
            <div class="card ">
                <div class="row d-flex justify-content-center  p-3">
                    <div class="box1 common col-md-4 ">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="container">
                                    <img src="images/img/users.png" class="img-fluid rounded-circle" >
                                </div>
                                <!--                                //pass the key in map.get("") method-->
                                <h1><%= m.get("userCount")%></h1>
                                <h1>USERS</h1>
                            </div>
                        </div>
                    </div>
                    <div class="box2 common  col-md-4 ">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="container">
                                    <img src="images/img/list.png" class="img-fluid rounded-circle">
                                </div>
                                <h1><%= list.size()%></h1>
                                <h1>CATEGORIES</h1>
                            </div>
                        </div>
                    </div>
                    <div class="box3 common col-md-4 ">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="container">
                                    <img src="images/img/products.png" class="img-fluid rounded-circle">
                                </div>
                                <!--                            //pass the key in map.get("") method-->
                                <h1><%= m.get("productCount")%></h1>
                                <h1>PRODUCT</h1>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row d-flex justify-content-center  p-3">
                    <div class="box4 common col-md-4 ">
                        <!--                        //                                             click on this will open the modal-->
                        <div class="card" >
                            <div class="card-body text-center">
                                <div class="container">
                                    <a class="nav-link" href="categoryConfiguration.jsp"><img src="images/img/keys.png" class="img-fluid rounded-circle"></a>
                                </div>

                                <h1 class="mt-2">CATEGORY CONFIGURATION</h1>
                            </div>
                        </div>
                    </div>
                    <div class="box5 common col-md-4">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="container">
                                    <a class="nav-link" href="productConfiguration.jsp"><img src="images/img/plus.png" class="img-fluid rounded-circle"></a>                                 
                                    
                                </div>

                                <h1 class="mt-2">PRODUCT CONFIGURATION </h1>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>




    </body>
    <script src="js/main.js"></script>
</html>
