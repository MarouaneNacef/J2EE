<%-- 
    Document   : addClient
    Created on : Jun 8, 2023, 10:42:45 AM
    Author     : ASUS VivoBook
--%>
<%@page import="vendor.CSRF"%>
<%@page import="vendor.auth"%>
<%
    if(!auth.isLoged(request))
    {
        response.sendRedirect("/");
        return ;
    }
    String csrf = CSRF.generate(request);
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
    <script src="./adding.js" defer></script>
</head>
<body>
    <div class="sidebar sidebar__left">
        <div class="container">
            <a href="/home.jsp">
                <lord-icon
                src="https://cdn.lordicon.com/gmzxduhd.json"
                trigger="hover"
                colors="primary:#121331,secondary:#08a88a"
                style="width:80px;height:80px">
                 </lord-icon>
            </a>
         </div>
    </div>
    <div class="section show">
        <form action="/addClient" method="POST" class="container" id="container">
            <div class="form__container">
                <input type="hidden" name="csrf" value="<%= csrf%>"> 
                <input type="text" placeholder="Your name" class="loginUser" name="name">
                <input type="tel" placeholder="Your phone number" class="loginPassword" name="phone">
                <input type="email" placeholder="Your Email" class="loginNext" name="email">   
                <button type="submit" class="loginBtn">Submit</button>
            </div>
            <img src="./assets/images/addClient.svg" alt="" class="login__img">
        </form>
    </div>
    <div class="sidebar sidebar__right">
        <div class="container">
            <a href="/add.jsp">
                <lord-icon
                    src="https://cdn.lordicon.com/mecwbjnp.json"
                    trigger="hover"
                    colors="primary:#121331,secondary:#08a88a"
                    style="width:80px;height:80px">
                </lord-icon>
            </a>
            
         </div>
    </div>
    <script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
</body>
</html>