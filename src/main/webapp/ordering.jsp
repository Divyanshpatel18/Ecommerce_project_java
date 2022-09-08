<%-- 
    Document   : ordering
    Created on : Jul 8, 2022, 2:17:24 PM
    Author     : Lenovo
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%-- 
    Document   : shopcart
    Created on : Jul 5, 2022, 12:32:15 PM
    Author     : Lenovo
--%>
<%@page import="com.Ecommerce.mycart.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "you are not logged in!! login first");
        response.sendRedirect("login.jsp");
        return;
    }%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
                integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"
                integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy"
        ;   crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" 
                integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/cartstyle.css"> 
        <link rel="stylesheet" href="css/toastmessage.css"> 
        <link rel="stylesheet" href="css/style.css"> 
    </head>
    <style>

    </style>
    <body class="cart-body">
        <header>
            <nav class="navbar navbar-expand-lg navigation">
                <div class="container">
                    <a class="navbar-brand" href="#"><img src="download.jpg" alt="" height="50 " width="50"></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <!-- <span class="navbar-toggler-icon"></span> -->
                        <i class="fas fa-stream "></i>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp#new-arrivals">new Arrivals</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp#products">Products</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp#deal"> Deal of the day</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp#blog">Blog</a>
                            </li>

                            <%                            if (user == null) {
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

                            <li class="nav-item">
                                <a class="nav-link" href="shopcart.jsp"><i class="fas fa-cart-plus" style="font-size:20px;"></i><span class="m1-0 cart-items">()</span></a>
                            </li>
                        </ul>

                    </div>
                </div>
            </nav>
        </header>
        <div class="container-fluid">

            <div class="row ">
                <div class="col-md-10 col-11 mx-auto allitembody ">
                    <div class="row mt-5 gx-3 outer-tab">
                        <div class="formtab px-2">
                            <span class="total-items"></span>


                            <form class="  form-control mb-2 px-5 form1" action="PlaceOrder" method="post">
                                <h3 class="detailtop ">Your Order Details</h3>
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-label">Email Address</label>
                                    <input value="<%= user.getUserEmail()%>" name="customer_Email"  type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email address">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>

                                <div class="form-group mt-2">
                                    <label for="name" class="form-label">Your Name</label>
                                    <input value="<%= user.getUserName()%>"type="text" name="customer_Name" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter your Name">

                                </div>
                                <div class="form-group mt-2">
                                    <label for="Textarea" class="form-label">Your Shipping Address</label>
                                    <textarea value="<%= user.getUserAddress()%>" name="customer_Address" id="form-control" class="form-control" rows="2" placeholder="Enter your address"></textarea>

                                </div>
                                <div class="form-group my-2 ">
                                    <label for="name" class="form-label">Phone Number</label>
                                    <input value="<%= user.getUserPhone()%>" name="customer_Phone" type="text" class="form-control " id="name" aria-describedby="emailHelp" placeholder="Enter your Phone">

                                </div>
                            </form>

                        </div>
                        <div class="col-md-12 col-lg-8 col-11 mx-auto main_cart mb-lg-0 mb-5 shadow scriptdiv">

                        </div>

                        <!-- right side div -->
                        <!-- <div class="col-md-12  col-11 col-lg-4 mx-auto mt-lg-0 mt-md-5 bg-light shadow"> -->
                        <div class="col-md-12 col-11 col-lg-4 mt-lg-0 mt-md-5 mx-auto ">
                            <div class="card checkout-side">
                                <div class=" card right-side p-3 shadow">
                                    <h2 class="product_name">The Total Amount</h2>
                                    <div class="price-indivi d-flex justify-content-between">
                                        <p>Product Amount</p>
                                        <p>$ <span id="total-product-amt">0.00</span></p>
                                    </div>
                                    <div class="price-indivi d-flex justify-content-between">
                                        <p>Shipping Charge</p>
                                        <p>$ <span id="shipping-charge">50.00</span></p>
                                    </div>
                                    <hr>
                                    <div class="total-amt d-flex justify-content-between font-weight-bold">
                                        <p>Total amount is </p>
                                        <p>$ <span id="total-cart-amount" >0.00</span></p>
                                    </div>
                                    <button  class="btn btn-primary text-uppercase"><a href="" class="nav-link">PlACE ORDER</a></button>
                                </div>
                            </div>
                            <!-- discount code part -->
                            <div class="discount-code mt-2 shadow">
                                <div class="card">
                                    <div class="card-body">
                                        <a class="d-flex justify-content-between nav-link" data-bs-toggle="collapse"
                                           href="#collapseExampke" aria-expanded="false " aria-controls="collapseExampke">
                                            Add Discount(optional)
                                            <span><i class="fas fa-chevron-down pt-1"></i></span>
                                        </a>
                                        <div class="collapse" id="collapseExampke">
                                            <div class="mt-3">
                                                <input type="text" name="" id="discountcode1" class="form-control font-weight-bold" placeholder="Enter the discount code">
                                                <small id="error" class="text-dark mt-3"> code is valid</small>
                                            </div>
                                            <button class="btn btn-primary btn-sm mt-3 " onclick="discountcode()">Apply</button>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!-- discount code ends -->
                            <div class=" delivery my-3 shadow p-2 bg-light card" >
                                <div class="  delivery pt-2">
                                    <h3 class="  delivery ">Expected Delivery Date</h3>

                                    <p class=" delivery ">
                                        <%

                                            SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
                                            Calendar cal = Calendar.getInstance();
                                            cal.add(Calendar.DAY_OF_MONTH, 7);
                                            String newDate = sdf.format(cal.getTime());
                                            out.println(newDate);
//                                         %>
                                    </p>
                                </div>
                            </div>

                        </div>


                    </div>
                </div>

            </div>
        </form>
    </div>
    <div id="toast" class="">

    </div>
</body>
<script src="js/script.js"></script>
<script src="js/cartscript.js"></script>
</html>
