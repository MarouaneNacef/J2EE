<%-- 
    Document   : articles.jsp
    Created on : Jun 9, 2023, 7:34:36 AM
    Author     : ASUS VivoBook
--%>

<%@page import="models.Article"%>
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
            for(Article article : Article.all())
            {%>
                <div class="item">
                    <div class="container">
                        <button onclick="location.href='/deleteArticle?id=<%= article.Ref_article %>'" type="button" >
                            <lord-icon
                                src="https://cdn.lordicon.com/gsqxdxog.json"
                                trigger="hover"
                                colors="primary:#fff,secondary:#00BFA6"
                                style="width:80px;height:80px">
                            </lord-icon>
                        </button>                
                        <img src="./assets/images/article.svg" alt="client">
                        <div class="item__container">
                            <h2>name : <strong><%= article.nom_article %></strong>  </h2>
                            <h2>price : <strong><%= article.prix_vente %></strong>  </h2>
                            <h2>Quentity : <strong><%= article.quantity %></strong>  </h2>
                        </div>
                    </div>
                </div>
        <%}%>
        
        
        <!--<div class="item">
            <div class="container">
                <button>
                    <lord-icon
                        src="https://cdn.lordicon.com/gsqxdxog.json"
                        trigger="hover"
                        colors="primary:#fff,secondary:#00BFA6"
                        style="width:80px;height:80px">
                </lord-icon>
            </button>                
            <img src="./assets/images/article.svg" alt="client">
            <div class="item__container">
                <h2>name : <strong>PC</strong>  </h2>
                <h2>price : <strong>1500000 DA</strong>  </h2>
                <h2>Quentity : <strong>10</strong>  </h2>
            </div>
            </div>
        </div>
        <div class="item">
            <div class="container">
                <button>
                    <lord-icon
                        src="https://cdn.lordicon.com/gsqxdxog.json"
                        trigger="hover"
                        colors="primary:#fff,secondary:#00BFA6"
                        style="width:80px;height:80px">
                </lord-icon>
            </button>                
            <img src="./assets/images/article.svg" alt="client">
            <div class="item__container">
                <h2>name : <strong>PC</strong>  </h2>
                <h2>price : <strong>1500000 DA</strong>  </h2>
                <h2>Quentity : <strong>10</strong>  </h2>
            </div>
            </div>
        </div>
        <div class="item">
            <div class="container">
                <button>
                    <lord-icon
                        src="https://cdn.lordicon.com/gsqxdxog.json"
                        trigger="hover"
                        colors="primary:#fff,secondary:#00BFA6"
                        style="width:80px;height:80px">
                </lord-icon>
            </button>                
            <img src="./assets/images/article.svg" alt="client">
            <div class="item__container">
                <h2>name : <strong>PC</strong>  </h2>
                <h2>price : <strong>1500000 DA</strong>  </h2>
                <h2>Quentity : <strong>10</strong>  </h2>
            </div>
            </div>
        </div>
        <div class="item">
            <div class="container">
                <button>
                    <lord-icon
                        src="https://cdn.lordicon.com/gsqxdxog.json"
                        trigger="hover"
                        colors="primary:#fff,secondary:#00BFA6"
                        style="width:80px;height:80px">
                </lord-icon>
            </button>                
            <img src="./assets/images/article.svg" alt="client">
            <div class="item__container">
                <h2>name : <strong>PC</strong>  </h2>
                <h2>price : <strong>1500000 DA</strong>  </h2>
                <h2>Quentity : <strong>10</strong>  </h2>
            </div>
            </div>
        </div>-->
    </div>

    <div class="sidebar sidebar__right">
        <div class="container">
            <a href="/list.html">
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
