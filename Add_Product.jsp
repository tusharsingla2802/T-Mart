<%-- 
    Document   : Add_Product
    Created on : 9 Dec, 2020, 11:58:07 AM
    Author     : tusha
--%>
<%@page import="java.sql.*" %>
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
        
        String pname=request.getParameter("pname");
        Double price=Double.parseDouble(request.getParameter("price"));
        String details=request.getParameter("details");
        String img=request.getParameter("img");
        out.print(img);
        int subcatid=Integer.parseInt(request.getParameter("subcatid"));
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            
            conn=DriverManager.getConnection(DB_URL,USER,PASS);
            
            String sql="insert into products(pname,price,details,img,subcatid) values(?,?,?,?,?)";
            stmt=conn.prepareStatement(sql);
            
            stmt.setString(1,pname);
            stmt.setDouble(2,price);
            stmt.setString(3,details);
            stmt.setString(4,img);
            stmt.setInt(5,subcatid);
            
            
            
            int rows=stmt.executeUpdate();
            
            if(rows==1)
                
                response.sendRedirect("Admin_Home.jsp");
                //out.print("Record inserted successfully.");
            
            
        }catch(Exception e)
        {
            out.print("Error: Record insertion failed." + e);
        }
       %>
    </body>
</html>
