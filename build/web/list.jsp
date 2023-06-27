<%-- 
    Document   : list
    Created on : Jun 8, 2023, 4:34:32 PM
    Author     : ASUS VivoBook
--%>

<%@page import="vendor.auth"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(!auth.isLoged(request))
    {
        response.sendRedirect("/");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>adding page</title>
    <link rel="stylesheet" href="./common.css">
    <link rel="stylesheet" href="./add.css">
    <script src="./assets/gsap-member/gsap-member/minified/gsap.min.js"></script>
    <script src="./background.js" defer></script>
    <script src="./add.js" defer></script>
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
    <div class="section">
        <a href="/clientList.jsp" class="add__container add__client">
            <div class="container">
                <img src="./assets/images/clientsList.svg" alt="adding">
                <h1>Clients list</h1>
            </div>
        </a>
        <a href="/articles.jsp" class="add__container add__article">
            <div class="container">
                <img src="./assets/images/arcticleList.svg" alt="adding">
                <h1> Articles list</h1>

            </div>
        </a>
        <a href="/bill.jsp" class="add__container add__bill">
            <div class="container">
                <img src="./assets/images/factorList.svg" alt="adding">
                <h1>Bills list</h1>
            </div>
        </a>
    </div>
    <div class="sidebar sidebar__right">
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
    <script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
</body>
</html>
