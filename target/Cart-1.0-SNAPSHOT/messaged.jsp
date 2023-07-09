<%-- 
    Document   : message
    Created on : Jun 26, 2022, 1:37:00 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
<% 
        String message=(String)session.getAttribute("message");
        if(message!= null){
           
 %>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong><%= message%> </strong> 
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
 <%
       session.removeAttribute("message");
       }
%>

--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>message</title>

          <%@include file="components/common_css_js.jsp" %>
          
          <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css" rel="stylesheet">

          
<!--          TO remove it later-->
<!--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
        integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"
        integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy"
        crossorigin="anonymous"></script>-->
</head>
<style>
    body {
        background: #333;
     
    }
    .pbox{
        position: absolute;
       
        left: 50%;
        width: 350px;
        height: 300px;
        border-radius: 20px;
        background: #f5f5f5;
        box-sizing: border-box;
        z-index: 12;
        transform: translate(-50%,-50%);
        -webkit-box-shadow: 0px 10px 40px -10px rgba(0, 0, 0, 0.7);
        -moz-box-shadow: 0px 10px 40px -10px rgba(0, 0, 0, 0.7);
        box-shadow: 0px 10px 30px -10px rgba(0, 0, 0, 0.993);
        opacity:1;
        top:50%; 
        transform: translate(-50%,-50%) scale(1);
        transition: opacity 1000ms ease-in-out,
                    top 1000ms ease-in-out,
                    transform 1000ms ease-in-out;
    }
        .pbox.active{
            opacity:0;
            top: -200%;
            transform: translate(-50%,-50%) scale(0.5);
            transition:transform 1000ms cubic-bezier(0.18,0.89, 0.43, 1.19);
        }
    
    .pbox i{
        margin: 5px 0;
        border: 2px solid #34f234;
        width: 50px;
        height: 50px;
        text-align: center;
        display: inline-block;
        border-radius: 50%;
        line-height: 50px;
        font-size:25px;
        color: #34f234;

        
    }
    .title{
        margin:5px 0;
        font-size: 30px;
        font-weight: 600;
    }
    
    .description{
        color: #222;
        font-size: 15px;
        padding: 5px;
    }
    .dismiss-btn{
        margin:15px;
    }
    .dismiss-btn button{
        padding: 10px 20px;
        background-image: linear-gradient(45deg,#e91e63,#f44336);
        color: #f5f5f5;
        border: 2px solid #f5f5f5;
        font-size: 17px;
        font-weight: 600;
        outline:none;
        border-radius: 10px;
        cursor: pointer;
        transition: all 300ms ease-in-out;
    }
    .dismiss-btn button:hover{
         color:#f44336;
        background: #f5f5f5;
        border: 2px solid #f44336;
  
    }

</style>

<body>
    
        <div class=" pbox  card justify-content-center align-items-center  p-3 ">
            <div class="mt-3">
                <i class="fas fa-check"></i>
            </div>
            <div class="title">
                <P>Success!</P>
            </div>
            <div class="description text-center">
                <% 
                    
                    //getting the message attribute from RegisterServlet and login servlet
                        String message=(String)session.getAttribute("message");
                        if(message!= null){

                 %>
             
                <strong><%= message%> </strong> 
               
                <%
                    
//                    removing the value of message after printing
                      session.removeAttribute("message");
                      }
               %>
            </div>
            <div class=" dismiss-btn">
                 <a class="nav-link" href="index.jsp"><button id="dismiss-popup-btn"  >Dismiss</button></a>

            </div>
            
        </div>
    

</body>
<script>
    
//        document.getElementById("dismiss-popup-btn").addEventListener("click",function(){
//            document.getElementsByClassName("pbox")[0].classList.add("active");
//            
//        });
        
    </script>

</html>

