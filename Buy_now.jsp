<%-- 
    Document   : product_order
    Created on : 7 Dec, 2020, 12:00:47 PM
    Author     : tusha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <link href="tmartcss.css" rel="stylesheet">
        <%
            double total_value=Double.parseDouble(request.getParameter("total_price"));
            
        %>
        <div id="buy_now">
            <div style="float:left;margin-right:40px;width:200px;">Total Price : </div>
            <div style="color:blue;"><%=total_value%></div>
        </div>
        
        <div id="buy_now">
            <div style="width:300px;">Payment Options : </div>
            <div style="margin-top: 10px;margin-left: 16%;color:red;"><input type="radio" name="pay"> Credit Card </div>
            <div style="margin-top: 15px;margin-left: 16%;color:red;"><input type="radio" name="pay"> Debit Card </div>
            <div style="margin-top: 15px;margin-left: 16%;color:red;"><input type="radio" name="pay"> Cash On Delivery </div>
            <div style="margin-top: 15px;margin-left: 16%;color:red;"><input type="radio" name="pay"> Paytm </div>
        </div>
        
        <div id="buy_now">
            <div><a href="Buy_now.jsp" style="overflow: auto;border: 2px solid black;float:left;margin-left: 80px;margin-top: 30px;background: lightcyan;color:blue;width: 135px;padding: 2px;font-size: 20px;font-weight: bold;">Proceed To Pay</a></div>
        </div>
       
        
    </body>
</html>
