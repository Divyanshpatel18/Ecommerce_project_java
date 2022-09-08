<%-- 
    Document   : register
    Created on : Jun 25, 2022, 3:49:27 PM
    Author     : Lenovo

 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
        integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"
        integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/registration.css">
</head>

<body>
    <div class="container">
               


        <div class="myCard">
          
            
            <div class="row">
                <div class="col-md-6">
                    <div class="myLeftCtn">

                        <form action="RegisterServlet" method="post" class="myForm text-center">
                            <header>Create New Account</header>
                            
                            <div class="form-group">
                                <i class="fas fa-user"></i>
                                <input   name="user_name"class="myInput" type="text" placeholder="Username" id="username" required>
                            </div>

                            <div class="form-group">
                                <i class="fas fa-envelope"></i>
                                <input name="user_email" class="myInput" type="text" placeholder="Email" id="email" required>
                            </div>

                            <div class="form-group">
                                <i class="fas fa-lock"></i>
                                <input name="user_password" class="myInput" type="password" placeholder="Password" id="password" required>
                            </div>
                            
                            <div class="form-group">
                                <i class="fas fa-phone"></i>
                                <input name="user_phone" class="myInput" type="number" placeholder="Phone" id="phone" required>
                            </div>

                            <div class="form-group">
                                <i class="fas fa-map-marker-alt"></i>
                                <input name="user_address" class="myInput" type="text" placeholder="Address" id="address" required>
                            </div>

                            <div class="form-group">
                                <label>
                                    <input type="checkbox" name="check1" id="check1" required>
                                    <small>I read and agree to Terms and Conditions</small>
                                    <div class="invalid-feedback">
                                        you must check the box.
                                    </div>
                                </label>
                            </div>
                            
                            <input type="submit" id="create_account" class="butt" value="CREATE ACCOUNT" >
                        </form>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="myRightCtn">
                        <div class="box">
                            <header>Hello World!</header>
                            <p>Lorem ipsum dolor sit amet consectetur 
                                adipisicing elit. 
                                Nihil accusantium quisquam et earum. 
                                Aut dicta sit neque
                                 voluptatibus l
                                 ibero perspiciatis, dolorum, aliquam 
                                 nobis est pariatur 
                                 temporibus? 
                                 Molestiae itaque eaque quo!</p>
                                 <input type="button" class="butt_out" value="Learn more">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </div>

</body>
<script>
    

</script>

</html>