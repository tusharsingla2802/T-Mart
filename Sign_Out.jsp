<%-- 
    Document   : Sign_Out
    Created on : 21 Nov, 2020, 12:22:01 PM
    Author     : tusha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.invalidate();
    response.sendRedirect("t_mart.jsp");
    out.print("You Have Logged Out Successfully");
    
%>
<div style="margin-top: 20px;font-size: 18px;"><a href="t_mart.jsp">Go to home page..</a></div>
    