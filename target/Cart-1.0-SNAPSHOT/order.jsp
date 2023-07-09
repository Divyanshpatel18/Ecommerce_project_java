<%-- 
    Document   : order
    Created on : Jul 7, 2022, 1:28:09 PM
    Author     : Lenovo
--%>
<%--<%@page import="com.Ecommerce.mycart.entities.User"%>--%>

<!--  User user= (User)session.getAttribute("current-user");
  if(user==null){
      session.setAttribute("message", "you are not logged in!! login first");
      response.sendRedirect("login.jsp");
      return;
  }-->
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!--<!DOCTYPE html>
<html>
    <head>
          <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>order html</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
        integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"
        integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/cartstyle.css">
    </head>
    <style>
.card-body .form-group{
  margin-top: 12px;
}
</style>

    <body>
        <div class="container d-flex justify-content-center">


            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center">your order details</h3>
                        <form>

                            <div class="form-group">
                                <label for="exampleInputEmail1" class="form-label">Email address</label>
                                <input value="%= user.getUserEmail()%" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email address">
                                <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                            </div>

                            <div class="form-group">
                                <label for="name" class="form-label">Your Name</label>
                                <input value="%= user.getUserName()%>"type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter your Name">

                            </div>
                                   <div class="form-group">
                                <label for="name" class="form-label">phone number</label>
                                <input value="%= user.getUserPhone()%>"type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter your Name">

                            </div>

                            <div class="form-group">
                                <label for="Textarea" class="form-label">your Shipping Address</label>
                                <textarea value="%= user.getUserAddress()%>" id="form-control" class="form-control" rows="3" placeholder="Enter your address"></textarea>

                            </div>
                            <div class="container text-center mt-3">
                                <button class="btn btn-outline-success">Order Now</button>
                                <button class="btn btn-outline-primary">Continue Shopping</button>
                            </div>


                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>-->
