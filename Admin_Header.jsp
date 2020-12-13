<%-- 
    Document   : Admin_Header
    Created on : 9 Dec, 2020, 11:16:04 AM
    Author     : tusha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="tmartcss.css" rel="stylesheet">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="overflow:auto; background-color:blue;">
            <div style="margin-left: 20px;color: red;float:left;font-size: 20px;color:white;"><h1>T-MART</h1></div>
            
            <div style="float:right;margin-right: 22px;font-size: 20px;margin-top: 30px;"><b>
                    <a href="Sign_Out.jsp" style="color:white;">Sign Out</b></a>
            </div>
            </div>
        <div style="overflow:auto;background-color:yellow;height: 40px;">
            <div style="margin-left: 10%;">
                <div class="Admin_header"><b><a href="Gui_add_product.jsp">Add-product</b></a></div>
                <div class="Admin_header"><b><a href="Edit_Product.jsp">Edit-Product</b></a></div>
            <% String gname=(String)session.getAttribute("uname");
                out.print("<div style=float:right;font-size:20px;margin-right:20px;><b><a href=\"profile.jsp\">Welcome " +gname+"</b></a></div>");
            %>
            </div>
            
        </div>
            
            
            
    </body>
</html>
