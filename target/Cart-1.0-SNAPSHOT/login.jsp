<%-- 
    Document   : login
    Created on : Jun 28, 2022, 12:31:13 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registration</title>


        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css" rel="stylesheet">


        <!--     TO DELETE IT LATER-->
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
        integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"
        integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/login.css">
        <link rel="stylesheet" href="css/responsive-style.css">
    </head>
     <style>
        /* Custom CSS for responsive layout */
        @media (max-width: 576px) {
            .container {
                max-width: 100%; /* Set the maximum width to 100% for small screens */
                margin: 0; /* Remove margin for small screens */
                padding: 10px; /* Reduce padding for small screens */
            }
        }
    </style>
    <body>
        <div class="container">
            <div class="myCard d-flex justify-content-center">
                <div class=" ">
                     <div class="myCtn">
                        <div class="form-group">
                         <!-- for printing invalid details  message-->
                            <%@include file="components/message.jsp" %>
                        </div>
                        <!-- div  class="mb-0"style="height:3rem ; width:auto; background-color:black;">
                                                        
                        </div>-->
                        <form action="LoginServlet" class="myForm text-center" method="post">
                            <header>Login Here</header>
                            <div class="form-group">
                                <i class="fas fa-envelope"></i>
                                <input name="email" class="myInput" type="text" placeholder="Email" id="email" required>
                            </div>
                            <div class="form-group">
                                <i class="fas fa-lock"></i>
                                <input name="password" class="myInput" type="password" placeholder="Password" id="password" required>
                            </div>
                            <div>
                                <a href="register.jsp" class="nav-link"> if not registered Click here</a>
                            </div>
                            <input type="submit" id="login" class="butt"  value="LOGIN">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>