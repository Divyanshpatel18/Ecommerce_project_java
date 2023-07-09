<%-- 
    Document   : productConfiguration.
    Created on : Jun 30, 2023, 12:16:24 PM
    Author     : ASUS
--%>

<%@page import="com.Ecommerce.mycart.entities.Product"%>
<%@page import="java.util.Map"%>
<%@page import="com.Ecommerce.mycart.helper.Helpdesc"%>
<%@page import="org.hibernate.boot.model.source.internal.hbm.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.Ecommerce.mycart.entities.Category"%>
<%@page import="com.Ecommerce.mycart.helper.FactoryProvider"%>
<%@page import="com.Ecommerce.mycart.dao.CategoryDao"%>
<%@page import="com.Ecommerce.mycart.dao.ProductDao"%>
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
        <title>Product Configuration </title>


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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                    <div class="box5 common col-md-3 ">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="container">
                                    <img src="images/img/products.png" class="img-fluid rounded-circle">
                                </div>
                                <!--                            //pass the key in map.get("") method-->
                                <h1><%= m.get("productCount")%></h1>
                                <h1> TOTAL PRODUCTS </h1>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row d-flex justify-content-center  p-3">

                    <div class="box5 common col-md-3">
                        <div class="card" data-bs-toggle="modal" data-bs-target="#add-product-modal">
                            <div class="card-body text-center">
                                <div class="container">
                                    <img src="images/img/plus.png" class="img-fluid rounded-circle">
                                </div>

                                <h1 class="mt-2">ADD PRODUCT</h1>
                            </div>
                        </div>
                    </div>
                    <div class="box5 common col-md-3">
                        <div class="card" data-bs-toggle="modal" data-bs-target="#delete-product-modal">
                            <div class="card-body text-center">
                                <div class="container">
                                    <img src="images/img/plus.png" class="img-fluid rounded-circle">
                                </div>

                                <h1 class="mt-2">REMOVE PRODUCT</h1>
                            </div>
                        </div>
                    </div>
                    <div class="box5 common col-md-3">
                        <div class="card" data-bs-toggle="modal" data-bs-target="#modify-product-modal">
                            <div class="card-body text-center">
                                <div class="container">
                                    <img src="images/img/plus.png" class="img-fluid rounded-circle">
                                </div>

                                <h1 class="mt-2">MODIFY PRODUCT</h1>
                            </div>
                        </div>


                    </div>
                    
                </div>
                <div class="row d-flex justify-content-center  p-3">
                    <div class="box5 common col-md-3">
                        <div class="card" data-bs-toggle="modal" data-bs-target="#set-carousel">
                            <div class="card-body text-center">
                                <div class="container">
                                    <img src="images/img/plus.png" class="img-fluid rounded-circle">
                                </div>

                                <h1 class="mt-2">Configure Home Carousel</h1>
                            </div>
                        </div>
                    </div>
                    <div class="box5 common col-md-3">
                        <div class="card" data-bs-toggle="modal" data-bs-target="#set-newArrivals">
                            <div class="card-body text-center">
                                <div class="container">
                                    <img src="images/img/plus.png" class="img-fluid rounded-circle">
                                </div>

                                <h1 class="mt-2">Configure New Arrivals</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!--        add product modal-->
            <div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header bg-danger text-white" >
                            <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <div class="modal-body">
                            <form action="ProductionOperationServlet" method="post" enctype="multipart/form-data">
                                <!--                           // the operation value here defines that it is adding product operation-->
                                <input type="hidden" name="operation" value="addproduct">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="productName" placeholder="Enter Product Name" required>
                                </div>

                                <div class="form-group mt-2">
                                    <textarea  class="form-control" placeholder="Enter Product Description" name="productDescription"   style="height: 90px;" required></textarea>
                                </div>

                                <div class="form-group mt-2">
                                    <input type="number" class="form-control" name="productPrice" placeholder="Enter Product Price" required>
                                </div>

                                <div class="form-group mt-2">
                                    <input type="number" class="form-control" name="productDiscount" placeholder="Enter Product Discount" required>
                                </div>
                                <div class="form-group mt-2">
                                    <input type="number" class="form-control" name="productQuantity" placeholder="Enter Product Quantity" required>
                                </div>



                                <div class="form-group mt-2">
                                    <select name="catId" class="form-select" aria-label="Default select example">
                                        <option selected>select the category</option>

                                        <!--              making for-each loop to print list of categories obtained from -->
                                        <%
                                            for (Category c : list) {
                                        %>
                                        <!--                                    value given here will be saved in db-->
                                        <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>

                                        <%}%>

                                    </select>
                                </div>

                                <div class="form-group mt-2 mb-3 ">
                                    <label for="productPic" class="form-label">Add Product image</label>
                                    <br>
                                    <input type="file" class="form-control" name="productPic" required>
                                </div>



                                <div class="container text-center mt-2 mb-3">
                                    <button type="submit" class="btn btn-outline-success">Add Product</button>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                                </div>

                            </form>
                        </div>

                    </div>
                </div>
            </div>
            <!--   remove product modal-->
            <div class="modal fade" id="delete-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header bg-danger text-white" >
                            <h5 class="modal-title" id="exampleModalLabel">Delete a Product</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <div class="modal-body">
                            <form action="ProductionOperationServlet" method="post" enctype="multipart/form-data">
                                <!--                           // the operation value here defines that it is adding product operation-->
                                <input type="hidden" name="operation" value="deleteproduct">
                                <div class="form-group ">
                                    <input type="text" class="form-control" name="productId" placeholder="Enter Product Id" required>
                                </div>


                                <div class="container text-center mt-2 mb-3">
                                    <button type="submit" class="btn btn-outline-success">Remove Product</button>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                                </div>

                            </form>
                        </div>

                    </div>
                </div>
            </div>
<!--            modify product modal-->
            <%
               Product product=(Product)session.getAttribute("modifyProduct");
               System.out.println("modify product,product is  "+product);
           %>
            <% if(product==null){%>
             <div class="modal fade" id="modify-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header bg-danger text-white" >
                            <h5 class="modal-title" id="exampleModalLabel">Modify Product Details</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <div class="modal-body">
                            <form action="ProductionOperationServlet" method="post" enctype="multipart/form-data">
                                <!--                           // the operation value here defines that it is adding product operation-->
                                <input type="hidden" name="operation" value="modifyproduct">
                                <div class="form-group ">
                                    <input type="text" class="form-control" name="productId" placeholder="Enter Product Id" required>
                                </div>


                                <div class="container text-center mt-2 mb-3">
                                    <button type="submit" class="btn btn-outline-success">submit</button>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                                </div>

                            </form>
                        </div>

                    </div>
                </div>
            </div>  
            <% }else if(product!=null){%>
            <div><%= product%></div>
            <div><%= product.getpPhoto() %></div>
            <div class="modal" id="modify-product-details" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="display:block"; >
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header bg-danger text-white" >
                            <h5 class="modal-title" id="exampleModalLabel">Modify Product Details</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <div class="modal-body">
                            <form action="ProductionOperationServlet" method="post" enctype="multipart/form-data">
                                <!--                           // the operation value here defines that it is adding product operation-->
                                <input type="hidden" name="operation" value="addModifiedproduct">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="productId" value="<%= product.getpId() %>" placeholder="Enter Product Name" required>
                                </div>
                                <div class="form-group mt-2">
                                    <input type="text" class="form-control" name="productName" value="<%= product.getpName()%>" placeholder="Enter Product Name" required>
                                </div>

                                <div class="form-group mt-2">
                                    <textarea  class="form-control" placeholder="Enter Product Description" name="productDescription"    style="height: 90px;" required><%= product.getpDesc() %></textarea>
                                </div>

                                <div class="form-group mt-2">
                                    <input type="number" class="form-control" name="productPrice"   placeholder="Enter Product Price" value="<%= product.getpPrice() %>" required>
                                </div>

                                <div class="form-group mt-2">
                                    <input type="number" class="form-control" name="productDiscount" value="<%= product.getpDiscount() %>" placeholder="Enter Product Discount" required>
                                </div>
                                <div class="form-group mt-2">
                                    <input type="number" class="form-control" name="productQuantity" value="<%= product.getpQuantity() %>" placeholder="Enter Product Quantity" required>
                                </div>



                                <div class="form-group mt-2">
                                    <select name="catId" class="form-select" aria-label="Default select example">
                                        <option selected value="<%= product.getCategory().getCategoryId()%>" ><%= product.getCategory().getCategoryTitle() %></option>

                                        <!--              making for-each loop to print list of categories obtained from -->
                                        <%
                                            for (Category c : list) {
                                        %>
                                        <!--                                    value given here will be saved in db-->
                                        <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>


                                        <%}%>

                                    </select>
                                </div>

                                <div class="form-group mt-2 mb-3 ">
                                    <label for="productPic" class="form-label">Add Product image</label>
                                    <br>
                                    <input type="file" class="form-control" id="productPic" name="productPic" accept="image/*" required/>
                                  <script> 
                                          // Get the product image path from the session
                                            var productImagePath = "${productImagePath}";

                                            // Check if the product image path is not empty
                                            if (productImagePath) {
                                                // Get the "choose file" input field
                                                var productPicInput = document.getElementById("productPic");

                                                // Extract the file name from the path
                                                var fileName = productImagePath.substring(productImagePath.lastIndexOf('/') + 1);

                                                // Create a new File object with the extracted file name
                                                var file = new File([fileName], fileName);

                                                // Create a new DataTransfer object
                                                var dataTransfer = new DataTransfer();

                                                // Add the file to the DataTransfer object's items
                                                dataTransfer.items.add(file);

                                                // Set the DataTransfer object as the value of the "choose file" input field
                                                productPicInput.files = dataTransfer.files;
                                            }
                                    </script>
                                   
                                </div>


                                    <%  session.removeAttribute("productImagePath");
                                        session.removeAttribute("modifyProduct"); %>
                                <div class="container text-center mt-2 mb-3">
                                    <button type="submit" class="btn btn-outline-success">Modify Product</button>
                                    <a href="productConfiguration.jsp"> <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"  onclick="closeModal()">Close</button></a>

                                </div>

                            </form>
                        </div>

                    </div>
                </div>
            </div>
                 
            <%}%>
            
<!--            configure Carousel-->
            <div class="modal fade" id="set-carousel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header bg-danger text-white" >
                            <h5 class="modal-title" id="exampleModalLabel">Configure the Home Carousel</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <div class="modal-body">
                            <form action="ProductionOperationServlet" method="post" enctype="multipart/form-data">
                                <!--                           // the operation value here defines that it is adding product operation-->
                                <input type="hidden" name="operation" value="modifyCarousel">
                                <div class="form-group ">
                                    <label for="newProduct1" class="form-label">Enter the first product</label>
                                    <br>
                                    <input type="text" class="form-control" name="newProduct1" placeholder="Enter Product Id" required>
                                </div>
                                 <div class="form-group mt-1 ">
                                    <label for="newProduct2" class="form-label">Enter the second product</label>
                                    <br>
                                    <input type="text" class="form-control" name="newProduct2" placeholder="Enter Product Id" required>
                                </div>
                                 <div class="form-group mt-1 ">
                                    <label for="newProduct3" class="form-label">Enter the third product</label>
                                    <br>
                                    <input type="text" class="form-control" name="newProduct3" placeholder="Enter Product Id" required>
                                </div>
                                 <div class="form-group mt-1 ">
                                    <label for="newProduct4" class="form-label">Enter the fourth product</label>
                                    <br>
                                    <input type="text" class="form-control" name="newProduct4" placeholder="Enter Product Id" >
                                </div>
                                 <div class="form-group mt-1">
                                    <label for="newProduct5" class="form-label">Enter the fifth product</label>
                                    <br>
                                    <input type="text" class="form-control" name="newProduct5" placeholder="Enter Product Id" >
                                </div>


                                <div class="container text-center mt-2 mb-3">
                                    <button type="submit" class="btn btn-outline-success">Set Home Carousel </button>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                                </div>

                            </form>
                        </div>

                    </div>
                </div>
            </div>


<!--            configure New Arrivals-->
            <div class="modal fade" id="set-newArrivals" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header bg-danger text-white" >
                            <h5 class="modal-title" id="exampleModalLabel">Configure the New Arrivals </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <div class="modal-body">
                            <form action="ProductionOperationServlet" method="post" >
                                <!--                           // the operation value here defines that it is adding product operation-->
                                <input type="hidden" name="operation" value="modifyNewArrivals">
                                
                                <div class="form-group ">
                                    <label for="numberArrivals" class="form-label">Number of new Products to Add</label>
                                    <br>
                                    <input type="number" class="form-control" id="numberArrivals" name="numberArrivals"  placeholder="Enter Number" required>
                                </div>
                                 <div id="dynamicFieldsContainer" class="form-group mt-2">

                                </div>
                                <div class="container text-center mt-2 mb-3">
                                    <button type="submit" class="btn btn-outline-success">Set New Arrivals  </button>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                                </div>

                            </form>
                        </div>

                    </div>
                </div>
            </div>
    </body>
    <script>
    function closeModal() {
        var modal = document.getElementById('modify-product-details');
         modal.style.display = 'none';}


  var numberInput = document.getElementById('numberArrivals');
  var dynamicFieldsContainer = document.getElementById('dynamicFieldsContainer');

  numberInput.addEventListener('input', handleNumberChange);

  function handleNumberChange() {
    dynamicFieldsContainer.innerHTML = '';

    var selectedNumber = numberInput.value;

    for (var i = 1; i <= selectedNumber; i++) {
      var textField = document.createElement('input');
      textField.setAttribute('type', 'text');
      textField.setAttribute('class', 'form-control');
      textField.setAttribute('name', 'newProduct' + i);
      textField.setAttribute('placeholder', 'Enter Product Id');
      textField.setAttribute('required', 'true');
      dynamicFieldsContainer.appendChild(textField);
      dynamicFieldsContainer.appendChild(document.createElement('br'));
    }
  }
</script>
 <script src="js/main.js"></script>
</html>

