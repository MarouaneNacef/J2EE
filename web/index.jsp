<%-- 
    Document   : index.jsp
    Created on : Jun 7, 2023, 10:47:00 PM
    Author     : ASUS VivoBook
--%>
<%@page import="vendor.CSRF"%>
<%@page import="vendor.STR"%>
<%
    String csrf = CSRF.generate(request);
    HttpSession ss= request.getSession();
    String msg = "";
    if(ss.getAttribute("msg") != null)
    {
        msg = "<p class='wrong'>" + ss.getAttribute("msg") + "</p>";
        ss.removeAttribute("msg");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login page</title>
    <link rel="stylesheet" href="./login.css">
    <link rel="stylesheet" href="./common.css">
    <script src="./login.js" defer></script>
    <script src="./background.js" defer></script>
</head>
<body>
    <div class="login">
        <div class="container">
            <form method="POST" action="/Login">
                <input type="hidden" name="csrf" value="<%= csrf%>">
                <input type="text" placeholder="Username" name="user" class="loginUser">
                <input type="password" placeholder="Password" name="passwd" class="loginPassword">
                <%= msg %>
                <button type="submit" class="loginBtn">Login</button>
            </form>
            <img src="./assets/images/login.svg" alt="login" class="login__img">
        </div>
        
    </div>
    <script src="./assets/gsap-member/gsap-member/minified/gsap.min.js" ></script>
</body>
</html>