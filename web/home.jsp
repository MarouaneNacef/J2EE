<%-- 
    Document   : home
    Created on : Jun 7, 2023, 11:31:33 PM
    Author     : ASUS VivoBook
--%>

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
    <title>Home page</title>
    <link rel="stylesheet" href="./common.css">
    <link rel="stylesheet" href="./home.css">
    <script src="./assets/gsap-member/gsap-member/minified/gsap.min.js"></script>
    <script src="./background.js" defer></script>
    <script src="./home.js"  defer></script>

</head>
<body>
    <div class="home">
        <a class="home__add" href="add.jsp">
            <div class="container">
                <img src="./assets/images/adding.svg" alt="adding">
                <h1>add</h1>
            </div>
        </a>
        <a href="/logout" class="home__logout">
            <lord-icon
                src="./assets/icons.json"
                trigger="hover"
                colors="primary:#fff,secondary:#00BFA6"
                stroke="15"
                style="width:200px;height:200px">
             </lord-icon>
             <h1>logout</h1> 
            </a>
        <a class="home__list" href="/list.jsp">
            <div class="container">
                <img src="./assets/images/list.svg" alt="list">
                <h1>lists</h1>

            </div>
        </a>

    </div>
    <script src="https://cdn.lordicon.com/bhenfmcm.js"></script>

</body>
</html>
