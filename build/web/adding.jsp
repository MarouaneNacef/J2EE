<%-- 
    Document   : adding
    Created on : Jun 8, 2023, 5:15:38 PM
    Author     : ASUS VivoBook
--%>
<%@page import="vendor.auth"%>
<%
    if(!auth.isLoged(request))
    {
        response.sendRedirect("/");
        return;
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
    <link rel="stylesheet" href="./common.css">
    <style>
        iframe{
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
    <iframe  frameborder="0"></iframe>
    <script>
        // Extract the parameter from the URL
        const urlParams = new URLSearchParams(window.location.search);
        const documentParam = urlParams.get('document');
    
        // Determine which document to embed based on the parameter
        let documentSrc;
        if (documentParam === 'bill') {
          documentSrc = './addBill.jsp';
        } else if (documentParam === 'client') {
          documentSrc = './addClient.jsp';
        } else if (documentParam === 'article') {
          documentSrc = './addArticle.jsp';
        } else {
          // Handle invalid or missing parameter here (e.g., display a default document)
          documentSrc = '';
        }
    
        // Embed the chosen document within an iframe
        const iframe = document.querySelector('iframe');
        iframe.src = documentSrc;
        document.body.appendChild(iframe);
      </script>
</body>
</html>
