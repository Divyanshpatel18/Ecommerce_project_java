<%-- 
    Document   : index
    Created on : Jun 23, 2022, 5:16:20 PM
    Author     : Lenovo
         <h5>Hello World!</h5>
         <h5>Creating session factory</h>
        <%
            out.println(FactoryProvider.getFactory()+"<br>");
            out.println(FactoryProvider.getFactory()+"<br>");
            out.println(FactoryProvider.getFactory());
         %>
--%>
<%@page import="com.Ecommerce.mycart.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
%>
<%@page import="com.Ecommerce.mycart.helper.Helpdesc"%>
<%@page import="com.Ecommerce.mycart.dao.ProductDao"%>
<%@page import="com.Ecommerce.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.Ecommerce.mycart.entities.Category"%>
<%@page import="com.Ecommerce.mycart.dao.CategoryDao"%>
<%@page import="com.Ecommerce.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Ecommerce Electronics website</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
        integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"
        integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy"
        crossorigin="anonymous"></script>
             <script src="https://code.jquery.com/jquery-3.6.0.min.js" 
                integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
        crossorigin="anonymous"></script>

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive-style.css">
    <link rel="stylesheet" href="css/toastmessage.css">  
</head>

<body data-bs-spy="scroll" data-bs-target=".navbar">
  
    <header>
        <div class="top-header">
            <div class="container d-flex justify-content-between align-items-center py-3">
                <span>Free shipping for orders over</span>
                <span>Call:8000-3999-500</span>
            </div>
        </div>
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
                            <a class="nav-link active" aria-current="page" href="#home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#new-arrivals">new Arrivals</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#products">Products</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#deal"> Deal of the day</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#blog">Blog</a>
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
                             <a class="nav-link" href="shopcart.jsp"><i class="fas fa-cart-plus" style="font-size:20px;"></i><span class="m1-0 cart-items">(0)</span></a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>
    </header>
    <!-- Section 1 top banner  -->
    
    <section id="home">
        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="bg/bg-1.jpg" class="d-block w-100" alt="img-1">
                    <div class="carousel-caption text-center">
                        <h1>upto 40% off</h1>
                        <p>This is unique jewllery handcrafted island of Nantucket using teh Silver and Semi Precious
                            stones Lorem ipsum dolor sit amet.</p>
                          

                            <a href="#" class=" main-btn">Shop now</a>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="bg/bg-2.jpg" class="d-block w-100" alt="img-2">
                    <div class="carousel-caption text-center">
                        <h1>upto 40% off</h1>
                        <p>This is unique jewllery handcrafted island of Nantucket using teh Silver and Semi Precious
                            stones</p>
                        <a href="#" class="main-btn">Shop now</a>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="bg/bg-3.jpg" class="d-block w-100" alt="img-3">
                    <div class="carousel-caption text-center">
                        <h1>upto 40% off</h1>
                        <p>This is unique jewllery handcrafted island of Nantucket using teh Silver and Semi Precious
                            stones</p>
                        <a href="#" class="main-btn">Shop now</a>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </section>

    <!-- section 2 new arrivals      > -->

    <section id="new-arrivals">
        <div class="new-arrivals wrapper">

            <div class="container ">
                <div class="row  mt-4">
                    <div class="col-12 mb-2  text-content text-center">
                        <h2>NEW ARRIVALS</h2>
                        <p>This is unique jewllery handcrafted island of Nantucket using teh Silver and Semi Precious
                            stones Lorem ipsum dolor sit amet</p>
                    </div>
                </div>
                <div class="row align-items-center">
                    <div class="col-sm-4 col-12 p-sm-0 card-banner">
                        <div class="card-banner position-relative text-center">
                            <a href="#" class="card-thumb">
                                <img src="img/img-1.jpg" class="image-fluid" alt="">
                            </a>
                            <div class="banner-info text-center">
                                <h2>BRACELETS</h2>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod eos voluptatem, rem
                                    dolorem corporis dolores amet.</p>
                                <a href="#" class="main-btn">shop now</a>

                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-12 p-sm-0 card-banner">
                        <div class="card-banner position-relative text-center">
                            <a href="#" class="card-thumb">
                                <img src="img/img-2.jpg" class="image-fluid" alt="">
                            </a>
                            <div class="banner-info text-center">
                                <h2>RINGS</h2>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod eos voluptatem, rem
                                    dolorem corporis dolores amet.</p>
                                <a href="#" class="main-btn">shop now</a>

                            </div>
                        </div>

                    </div>
                    <div class="col-sm-4 col-12 p-sm-0 card-banner">
                        <div class="card-banner position-relative text-center">
                            <a href="#" class="card-thumb">
                                <img src="img/img-3.jpg" class="image-fluid" alt="">
                            </a>
                            <div class="banner-info text-center">
                                <h2>EARRINGS</h2>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod eos voluptatem, rem
                                    dolorem corporis dolores amet.</p>
                                <a href="#" class="main-btn">shop now</a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- section 3 products -->
    <section id="products" class="products ">
        <div class="wrapper">
            <div class="container mt-4">
                <div class="row">
                    <div class="col-12 text-content text-center">
                        <h2>BEST SELLERS</h2>
                        <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Ex praesentium mollitia,
                            dignissimos excepturi corporis laudantium animi, odit iusto aliquam facilis voluptas nihil
                            qui, atque nisi totam sapiente e
                        </p>
                    </div>
                    
                         <%
                            CategoryDao dao=new CategoryDao(FactoryProvider.getFactory());
                            List<Category> list=dao.getCategories();
                              ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
                          
                            %>
                      
                    <div class="col-12">
                        <ul class="nav nav-tabs mb-3" id="myTab" role="tablist">
                               <%
                                  for(Category category:list){
                                %>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link " id="<%= category.getCategoryTitle() %>-tab" data-bs-toggle="tab"
                                    data-bs-target="#<%= category.getCategoryTitle() %>" type="button" role="tab" aria-controls="<%= category.getCategoryTitle() %>"
                                    aria-selected="true"><%= category.getCategoryTitle() %> 
                                </a>
                            
                            </li>
                            <% } %>

                        </ul>
                               
                        <div class="tab-content " id="myTabContent">
                             <%   for(Category category:list){
                                  
                                             String catTitle= category.getCategoryTitle() ;
                                             List<Product> plist=pdao.getAllProductsByCat(catTitle);
                              %>
                            <div class="tab-pane fade  " id="<%= category.getCategoryTitle() %>" role="tabpanel"
                                aria-labelledby="<%= category.getCategoryTitle() %>-tab">
                                <div class="row">
                                     <% 
                                             for(Product product:plist){
                                    %>
                                    
                                    <div class="col-md-3 col-sm-6 mb-3">
                                        
                                        <div class="item-product">
                                            <a href="#" class="product-thumb-link">
                                                <img src="images/img/gadgets/<%= product.getpPhoto() %>" alt="" class="img-fluid">
                                            </a>
                                        </div>
                                        <div class="product-info">
                                            <div class="d-flex justify-content-between py-3">
                                                <a href="#" class="cat-parent">Women</a>
                                                <a href="#" class="wishlist">
                                                    <i class="fa fa-heart"></i>
                                                </a>
                                            </div>
                                            <h4 class="product-title ">
                                                <a href="#"><%= product.getpName() %></a>
                                            </h4>
                                              <h6 class="product-title">
                                                <a href="#"><%= Helpdesc.getwords(product.getpDesc()) %></a>
                                            </h6>
                                            <div class="product-price">
                                                <ins><span class="money text-white">$<%= product.getpPrice()%>     </span><span class="discount-given "> $<%= product.getPriceAfterApplyingDiscount()%>  <%= product.getpDiscount()%>% off</span></ins>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between py-1">
                                                <div class="rating">
                                                    <i class=" far fa-star"></i>
                                                    <i class=" far fa-star"></i>
                                                    <i class=" far fa-star"></i>
                                                    <i class=" far fa-star"></i>
                                                    <i class=" far fa-star"></i>
                                                </div>
                                                <div class="basket">
                                                   
                                                    <a href="#"class="fas fa-shopping-basket" onclick="add_to_cart(<%= product.getpId() %>,'<%= product.getpName() %>',<%= product.getPriceAfterApplyingDiscount()%>,'<%= product.getpDesc()%>',<%= product.getpDiscount()%>,'images/img/gadgets/<%= product.getpPhoto() %>','<%= catTitle %>')"></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                  <% } 
                                   if(plist.size()==0){
                                  %>
                                  <span class="text-light text-center text-uppercase px-5 no-product"> No   items  in the <%= category.getCategoryTitle() %> yet</span>
                                  <%
                                        }
                                  %>
                               
                                 
                                    </div>
                                </div

                            </div>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <!-- section 4 deal of the day -->
    <section id="deal">
        <div class="wrapper">
            <div class="container mt-4">
                <div class="row">
                    <div class="col-12">
                        <div class="text-center border border-white deal-of-the-day py-5">
                            <div class="text-content py-5">
                                <h2>DEALS OF THE DAY</h2>
                                <h4>UPTO 60% OFF</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa sint sunt non ab? Ab,
                                    rem! Voluptates, nemo excepturi sint eos, consequuntur </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- section 5 blog -->
    <section id="blog">
        <div class="blog-section wrapper">
            <div class="container mt-4">
                <div class="row">
                    <div class="col-12 mb-2 text-content text-center">
                        <h2>LATEST NEWS FROM THE BLOG</h2>
                        <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Iure ipsam ad exercitationem
                            inventore tempora?</p>
                    </div>
                </div>
                <div class="row align-items-center">
                    <div class="col-md-4 col-sm-6 mb-4 mb-lg-0">
                        <div>
                            <a href="#" class="card-thumb">
                                <img src="img/b-1.jpg" alt="" class="img-fluid">
                            </a>
                            <div class=" text-center px-2 mt-2">
                                <h2>Girls wear top</h2>
                                <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Iure ipsam ad
                                    exercitationem inventore tempora?</p>
                                <a href="#" class="main-btn">Read More</a>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-4 col-sm-6 mb-4 mb-lg-0">
                        <div>
                            <a href="#" class="card-thumb">
                                <img src="img/b-2.jpg" alt="" class="img-fluid">
                            </a>
                            <div class=" text-center px-2 mt-2">
                                <h2>Girls a Necklace</h2>
                                <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Iure ipsam ad
                                    exercitationem inventore tempora?</p>
                                <a href="#" class="main-btn">Read More</a>
                            </div>
                        </div>
                        
                    </div>
                    <div class="col-md-4 col-sm-6 mb-4 mb-lg-0">
                        <div>
                            <a href="#" class="card-thumb">
                                <img src="img/b-3.jpg" alt="" class="img-fluid">
                            </a>
                            <div class=" text-center px-2 mt-2">
                                <h2>Girls Wear Ring</h2>
                                <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Iure ipsam ad
                                    exercitationem inventore tempora?</p>
                                <a href="#" class="main-btn">Read More</a>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- section6 footer -->
    <footer>
        <div class="footer py-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-6 text-md-start text-center text-lg-start">
                        <div class="footer-logo text-white-50 mb-3 mb-md-0">
                            @ 2021 DIVYANSH LTD . All Rights Reserved
                        </div>
                    </div>
                    <div class="col-md-6 text-center text-lg-end">
                        <div class="footer-social pt-1">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-dribbble"></i></a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </footer>
    
     <div id="toast" class="display">
    </div>
    <script src="js/main.js"></script>
    <script src="js/script.js"></script>
    <script src="js/cartscript.js"></script>
</body>

</html>
