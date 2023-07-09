<%-- 
    Document   : shopcart
    Created on : Jul 5, 2022, 12:32:15 PM
    Author     : Lenovo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.Ecommerce.mycart.entities.User"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    User user = (User) session.getAttribute("current-user");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css" rel="stylesheet">

<!--        TO DELELTE-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
        integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"
        integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy"
        crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" 
                integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
        crossorigin="anonymous"></script>

        <link rel="stylesheet" href="css/cartstyle.css"> 
         <link rel="stylesheet" href="css/toastmessage.css"> 
            <link rel="stylesheet" href="css/style.css"> 
</head>
<style>
    .navigation{
        background: black;
    }

    
</style>

<body class="cart-body">
    <header>
        <nav class="navbar navbar-expand-lg navigation">
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
                                         <%     if (user == null) {
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
        
        <div class="row no-items" id="no-items-id">
            <div class="col-md-10 col-11 mx-auto mt-5 ">
                <div class="row mt-5 gx-3 outer-tab">
                    <span class="total-items"></span>
                    <div class="col-md-12 col-lg-8 col-11 mx-auto main_cart mb-lg-0 mb-5 shadow " id="scriptdiv">
                  

                    </div>
                    
<!--                     right side div -->
<!--                     <div class="col-md-12  col-11 col-lg-4 mx-auto mt-lg-0 mt-md-5 bg-light shadow"> -->
                    <div class="col-md-12 col-11 col-lg-4 mt-lg-0 mt-md-5 mx-auto bill-calculator ">
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
                                <p>$ <span id="total-cart-amount">0.00</span></p>
                            </div>
                            <button  class="btn btn-primary text-uppercase"><a href="ordering.jsp" class="nav-link">Checkout</a></button>
                        </div>
                            </div>
<!--                         discount code part -->
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
<!--                         discount code ends -->
                   

                    </div>


                </div>
            </div>
            
        </div>
    </div>
<!--         //creating a div for toast-->
    <div id="toast" class="">
       
    </div>
</body>

<script src="js/script.js"></script>
<script src="js/cartscript.js"></script>
<script src="js/main.js"></script>
</html>


<!-- <template id="template-true">
            <div>
                  <h2 class='no-cart'>Cart does not have any Item<h2> 
                  <div class='text-center mt-4'>
                       <button onclick='window.location.href="index.jsp#products"' class='btn btn-outline-primary'>Continue Shopping</button>
                 </div>
                <div class="container ">
                <img src="images/img/cart3.png" class="img-fluid " >
            </div>
            </div>
  </template>

<template id="template-false">
            <div class="col-md-10 col-11 mx-auto mt-5 ">
                <div class="row mt-5 gx-3 outer-tab">
                    <span class="total-items"></span>
                    <div class="col-md-12 col-lg-8 col-11 mx-auto main_cart mb-lg-0 mb-5 shadow " id="scriptdiv">
                  

                    </div>
                    
                     right side div 
                     <div class="col-md-12  col-11 col-lg-4 mx-auto mt-lg-0 mt-md-5 bg-light shadow"> 
                    <div class="col-md-12 col-11 col-lg-4 mt-lg-0 mt-md-5 mx-auto bill-calculator ">
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
                                <p>$ <span id="total-cart-amount">0.00</span></p>
                            </div>
                            <button  class="btn btn-primary text-uppercase"><a href="ordering.jsp" class="nav-link">Checkout</a></button>
                        </div>
                            </div>
                         discount code part 
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
                         discount code ends 
                   

                    </div>


                </div>
            </div>
 </template>-->