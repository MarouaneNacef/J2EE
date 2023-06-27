<%-- 
    Document   : bill
    Created on : Jun 9, 2023, 11:00:13 PM
    Author     : ASUS VivoBook
--%>
<%@page import="models.Article"%>
<%@page import="models.LigneFacture"%>
<%@page import="models.Client"%>
<%@page import="models.Facture"%>
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
    <script src="./listing.js" defer></script>
    <style>
        dialog{
            top: 50%;
            left: 50%;
            transform: translate(-50% , -50%);
            z-index: 100;
        }
        dialog::backdrop{
            background: rgba(0, 0, 0, .7) !important;
        }
    </style>
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
        <!-- add id  -->
    <%
        int i = 0;
        for(Facture f : Facture.all())
        {%>
            <div class="item" id="java<%= i %>">
            <div class="container">
                <button onclick="location.href='/deleteFactt?id=<%= f.N_facture %>'" type="button">
                    <lord-icon
                        src="https://cdn.lordicon.com/gsqxdxog.json"
                        trigger="hover"
                        colors="primary:#fff,secondary:#00BFA6"
                        style="width:80px;height:80px">
                </lord-icon>
            </button>                
            <img src="./assets/images/bill.svg" alt="client">
            <div class="item__container">
                <h2>client : <strong><%= Client.find(f.Client_id).name %></strong>  </h2>
                <h2>date : <strong><%= f.date_facture %> </strong>  </h2>
                <h2>Payment method : <strong> <%= f.mode_paiment %></strong>  </h2>
            </div>
            </div>
        </div>
        <%i++;}%>
        
    </div>
    <dialog  id="di">
        <div class="container">

        </div>
    </dialog>
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
    <script>
        const dial = document.querySelector('#di .container');
        <%
            int j = 0;
            float price = 0;
            
            for(Facture f : Facture.all())
            {System.out.println(j);%>
            
            const item<%=j%> = document.querySelector('#java<%= j %>');
        
            item<%=j%>.addEventListener('click',()=>{
            dial.innerHTML = `<button onClick="di.close()">
                <i class="fa-solid fa-xmark fa-bounce" style="color: #00bfac;"></i>
            </button> `
            const img = document.createElement('img');
            img.src = "./assets/images/shop.svg";
            img.alt = "";
            dial.appendChild(img);
            <% int k =0;%>
            <% float total =0;%>        
            <%for(LigneFacture lf : f.ligneFacture){%>
                <%  total = lf.quantity * Article.find(lf.ref_article).prix_vente ;%>
                const articleDiv<%=j%><%=k%> = document.createElement('div');
                articleDiv<%=j%><%=k%>.classList.add('article');
                
                const lordIcon<%=j%><%=k%> = document.createElement('lord-icon');
                lordIcon<%=j%><%=k%>.src = "https://cdn.lordicon.com/qhviklyi.json";
                lordIcon<%=j%><%=k%>.setAttribute('trigger', 'hover');
                lordIcon<%=j%><%=k%>.setAttribute('colors', 'primary:#fff,secondary:#00BFA6');
                lordIcon<%=j%><%=k%>.style.width = '80px';
                lordIcon<%=j%><%=k%>.style.height = '80px';
                articleDiv<%=j%><%=k%>.appendChild(lordIcon<%=j%><%=k%>);
                
                const articleTitle<%=j%><%=k%> = document.createElement('h2');
                articleTitle<%=j%><%=k%>.innerHTML = 'article : <span><%= Article.find(lf.ref_article).nom_article %></span>';
                articleDiv<%=j%><%=k%>.appendChild(articleTitle<%=j%><%=k%>);
                
                const quantity<%=j%><%=k%> = document.createElement('h2');
                quantity<%=j%><%=k%>.innerHTML = 'Quantity :<span><%= lf.quantity %></span>';
                articleDiv<%=j%><%=k%>.appendChild(quantity<%=j%><%=k%>);
                
                const price<%=j%><%=k%> = document.createElement('h2');
                price<%=j%><%=k%>.innerHTML = 'Price :<span><%= Article.find(lf.ref_article).prix_vente %></span>';
                articleDiv<%=j%><%=k%>.appendChild(price<%=j%><%=k%>);
                
                const total<%=j%><%=k%> = document.createElement('h2');
                total<%=j%><%=k%>.innerHTML = 'Total :<span><%=total%>DA</span>';
                articleDiv<%=j%><%=k%>.appendChild(total<%=j%><%=k%>);
                
                dial.appendChild(articleDiv<%=j%><%=k%>);
                            <%price+=total;%>
            <%k++;}%>
        
        const totalAmount = document.createElement('h2');
        totalAmount.innerHTML = 'Total : <strong><%=price%>DA</strong>';
        dial.appendChild(totalAmount);     
        dial.parentNode.showModal()});
    <%j++;}%>
        
        
        /*const items = document.querySelectorAll('.item')
        items.forEach((item,index)=>{
            item.addEventListener('click',()=>{
                console.log(index)
                dial.innerHTML = `<button onClick="di.close()">
                    <i class="fa-solid fa-xmark fa-bounce" style="color: #00bfac;"></i>
                </button> `
                const img = document.createElement('img');
                img.src = "./assets/images/shop.svg";
                img.alt = "";
                dial.appendChild(img);
                //loop
                const articleDiv = document.createElement('div');
                articleDiv.classList.add('article');
                
                const lordIcon = document.createElement('lord-icon');
                lordIcon.src = "https://cdn.lordicon.com/qhviklyi.json";
                lordIcon.setAttribute('trigger', 'hover');
                lordIcon.setAttribute('colors', 'primary:#fff,secondary:#00BFA6');
                lordIcon.style.width = '80px';
                lordIcon.style.height = '80px';
                articleDiv.appendChild(lordIcon);
                
                const articleTitle = document.createElement('h2');
                articleTitle.innerHTML = 'article : <span>PC</span>';
                articleDiv.appendChild(articleTitle);
                
                const quantity = document.createElement('h2');
                quantity.innerHTML = 'Quantity :<span>2</span>';
                articleDiv.appendChild(quantity);
                
                const price = document.createElement('h2');
                price.innerHTML = 'Price :<span>10000DA</span>';
                articleDiv.appendChild(price);
                
                const total = document.createElement('h2');
                total.innerHTML = 'Total :<span>20000DA</span>';
                articleDiv.appendChild(total);
                
                dial.appendChild(articleDiv);
                //end
                const totalAmount = document.createElement('h2');
                totalAmount.innerHTML = 'Total : <strong>600000DA</strong>';
                dial.appendChild(totalAmount);     
                dial.parentNode.showModal()
            })
        })*/
    </script>
    <script src="https://kit.fontawesome.com/17e53c03d5.js" crossorigin="anonymous"></script>
    <script src="https://cdn.lordicon.com/bhenfmcm.js"></script>
</body>
</html>
