<%-- 
    Document   : Sign_In
    Created on : 21 Nov, 2020, 11:13:12 AM
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
        <%
            String msg="Enter your login credentials .......";
            if(request.getParameter("msg")!=null)    
            {
                msg = request.getParameter("msg");
                out.print("<h2 style=color:red;>"+msg+"</h2>");

            }
            else
                out.print("<h2 style=color:green;>"+msg+"</h2>");
         %>   
        <form action="validate.jsp" method="post">
            <div style="margin-top: 30px;font-size: 25px;"><b>UserName : </b><input type="text" name="username"></div>
            <div style="margin-top: 20px;font-size: 25px;"><b>Password  : </b><input type="password" name="password" style="margin-left: 10px;"></div>
            <div style="margin-top: 30px;margin-left: 20px;">
                <input type="submit" value="User" name="submit" 
                style="font-size: 20px;padding-left: 30px;text-align: center;padding-right: 30px;color: white;background: blue;font-weight: bold;margin-right: 20px;">
                
                <input type="submit" value="Admin" name="submit" 
                style="font-size: 20px;padding-left: 30px;text-align: center;padding-right: 30px;color: white;background: blue;font-weight: bold;">
            </div>
            
            
            
        </form>
    </body>
</html>
