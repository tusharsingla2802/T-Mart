<%-- 
    Document   : Sign_Up
    Created on : 21 Nov, 2020, 11:21:19 AM
    Author     : tusha
--%>
<link href="tmartcss.css" rel="stylesheet">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <form action="addcustomer.jsp" method="post">
        <div style="margin-bottom: 20px;font-size: 25px;"><b>Name : <input type="text" name="name" style="margin-left: 45px;"></div>
        <div style="margin-bottom: 20px;font-size: 25px;">Email-Id : <input type="text" name="email" style="margin-left: 12px;"></div>
        <div style="margin-bottom: 20px;font-size: 25px;">password : <input type="text" name="password" style="margin-left: 8px;"></div>
        <div style="margin-bottom: 20px;font-size: 25px;">Address : <input type="text" name="address" style="margin-left: 22px;"></div>
        <div style="margin-bottom: 20px;font-size: 25px;">Phone No. : <input type="text" name="phone_no"></div></b>
        <div style="margin-bottom: 20px;margin-left: 70px;margin-top: 30px;"><input type="submit" value="Submit" name="submit"
        style="font-size: 20px;padding-left: 30px;text-align: center;padding-right: 30px;color: white;background: blue;font-weight: bold;">
        </div>
        </form>
    </body>
</html>
