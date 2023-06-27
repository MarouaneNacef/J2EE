<%-- 
    Document   : addLine.jsp
    Created on : Jun 9, 2023, 9:40:02 PM
    Author     : ASUS VivoBook
--%>
<%@page import="models.Article"%>
<%@page import="vendor.CSRF"%>
<%@page import="vendor.auth"%>
<%
    if(!auth.isLoged(request))
    {
        response.sendRedirect("/");
        return ;
    }
    String s = request.getParameter("id");
    if(s == null)
    {
        response.sendRedirect("/add.jsp");
        return ;
    }
    int id = Integer.parseInt(s);
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
        <form action="/addLine" method="POST" class="container" id="container">
            <input type="hidden" name="csrf" value="<%= CSRF.generate(request) %>" >
            <input type="hidden" name="bill" value="<%= id%>" >
            <div class="form__container">
                <select class="loginUser" name = "article" >
                  <option value="0"> Article</option>
                  
                  <%
                      for(Article art : Article.all())
                      {%>
                          <option value="<%= art.Ref_article %>"><%= art.nom_article %></option>
                      <%}%>
                </select>
            <input type="number" placeholder="article quentity" class="number loginPassword" name="quantity">
            <div class="btn__group">
                <button type="submit" class="addBtn">Add</button>
                <button type="button" class="cancelBtn" onclick="location.href='/add.jsp'" >Cancel</button>
            </div>
        </div>
                <img src="./assets/images/addFactor.svg" alt="" class="login__img">
        </form> 
    </div>

    <div class="sidebar sidebar__right">
        <div class="container">
            <a href="/add.html">
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