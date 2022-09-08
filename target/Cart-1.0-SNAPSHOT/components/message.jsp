<%-- 
    Document   : message
    Created on : Jun 26, 2022, 1:37:00 PM
    Author     : Lenovo
--%>



<% 
        String message=(String)session.getAttribute("message");
        if(message!= null){
           
 %>
 
        <div class="alert alert-danger d-flex align-items-center" role="alert">
            <i class="fas-solid fas-triangle-exclamation"></i>
            <div>
                <strong><%= message%> </strong> 
            </div>
       </div>
            

 <%
       session.removeAttribute("message");
       }
%>


