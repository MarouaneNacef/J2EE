<%-- 
    Document   : addBill
    Created on : Jun 9, 2023, 6:34:14 AM
    Author     : ASUS VivoBook
--%>
<%@page import="vendor.CSRF"%>
<%@page import="models.Client"%>
<%@page import="vendor.auth"%>
<%
    if(!auth.isLoged(request))
    {
        response.sendRedirect("/");
        return ;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="./assets/gsap-member/gsap-member/minified/gsap.min.js"></script>
    <script src="./background.js" defer></script>
    <link rel="stylesheet" href="./common.css">
    <link rel="stylesheet" href="adding.css">
    <script src="./addBill.js" defer></script>
    <script src="./adding.js" defer></script>
</head>
<body>
    <div class="sidebar sidebar__left">
        <div class="container">
            <a href="/home.jsp">
                <lord-icon
                src="https://cdn.lordicon.com/gmzxduhd.json"
                trigger="hover"
                colors="primary:#fff,secondary:#00BFA6"
                style="width:80px;height:80px">
                 </lord-icon>
            </a>
         </div>
    </div>
    <div class="section first show" >
        <form action="/addBill" method="POST" class="container" id="container">
            <input type="hidden" name="csrf" value="<%= CSRF.generate(request) %>">
                <div class="form__container">
                    <div class="select loginUser" >
                        <select name="client">
                          <option value="0"> Client</option>
                          <%
                              for(Client client : Client.all())
                              {%>
                                <option value="<%= client.id %>"><%= client.name %></option>
                              <%}%>
                        </select>
                      </div>   
                        <input type="date" placeholder="Bill Date" class="number loginPassword" name="date">
                    <div class="select loginNext" >
                        <select name="method">
                          <option value="0"> Payment method</option>
                          <option value="cash">Cash</option>
                          <option value="CCP">Ccp</option>
                          <option value="VISA">Visa</option>
                        </select>
                      </div>              
                      <button type="submit" class="NextBtn loginBtn">Next</button>
                </div>
                <img src="./assets/images/addFactor.svg" alt="" class="login__img">
        </form> 
    </div>

    <div class="sidebar sidebar__right">
        <div class="container">
            <a href="/add.jsp">
                <lord-icon
                    src="https://cdn.lordicon.com/mecwbjnp.json"
                    trigger="hover"
                    colors="primary:#fff,secondary:#00BFA6"
                    style="width:80px;height:80px">
                </lord-icon>
                
            </a>
            
         </div>
    </div>
    <script src="https://cdn.lordicon.com/bhenfmcm.js"></script>

</body>
</html>