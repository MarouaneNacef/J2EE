<%-- 
    Document   : clientList.jsp
    Created on : Jun 9, 2023, 6:47:14 AM
    Author     : ASUS VivoBook
--%>

<%@page import="models.Client"%>
<%@page import="vendor.auth"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(!auth.isLoged(request))
    {
        response.sendRedirect("/");
        return ;
    }
%>
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
    <script src="./listing.js" defer></script>

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
    <div class="section listing">
        <%
        for(Client client : Client.all())
        {%>
                 <div class="item">
            <div class="container">
                <button onclick="location.href='/deleteCleint?id=<%= client.id %>'" type="button">
                    <lord-icon
                        src="https://cdn.lordicon.com/gsqxdxog.json"
                        trigger="hover"
                        colors="primary:#fff,secondary:#00BFA6"
                        style="width:80px;height:80px">
                </lord-icon>
            </button>                
            <img src="./assets/images/cliient.svg" alt="client">
            <div class="item__container">
                <h2>name : <strong><%= client.name %></strong>  </h2>
                <h2>phone : <strong><%= client.phone %> </strong>  </h2>
                <h2>email : <strong><%= client.email %></strong>  </h2>
            </div>
            </div>
        </div>
        <%}%>
    </div>

    <div class="sidebar sidebar__right">
        <div class="container">
            <a href="/list.jsp">
                <lord-icon
                src="https://cdn.lordicon.com/nocovwne.json"
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