<%-- 
    Document   : updateqty
    Created on : 30 Nov, 2020, 12:45:00 PM
    Author     : tusha
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        final String JDBC_DRIVER="com.mysql.jdbc.Driver";
        final String DB_URL="jdbc:mysql://localhost/tmart";
        
        final String USER="root";
        final String PASS="tushar";
        
        Connection conn=null;
        PreparedStatement stmt=null;
        
        int cid=Integer.parseInt(request.getParameter("cartid"));
        int quantity = Integer.parseInt(request.getParameter("qty"));
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            
            conn=DriverManager.getConnection(DB_URL,USER,PASS);
            
            String sql="update cart set qty=? where cartid=?";
            
            stmt=conn.prepareStatement(sql);
            
            stmt.setInt(1, quantity);
            stmt.setInt(2, cid);
            
            int rows=stmt.executeUpdate();
            
            if(rows==1)
                
                //out.print("Record inserted successfully.");
                response.sendRedirect("show_cart.jsp");
            
        }catch(Exception e)
        {
            out.print("Error: Record insertion failed." + e);
        }
       %>
    </body>
</html>
