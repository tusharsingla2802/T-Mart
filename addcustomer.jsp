<%-- 
    Document   : addcustomer
    Created on : 21 Nov, 2020, 11:27:20 AM
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
            int i=0;
        final String JDBC_DRIVER="com.mysql.jdbc.Driver";
        final String DB_URL="jdbc:mysql://localhost/tmart";
        
        final String USER="root";
        final String PASS="tushar";
        
        Connection conn=null;
        PreparedStatement stmt=null;
        
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        char[] a=password.toCharArray();
        for(i=0;i<a.length;i++)
        {
            a[i]=(char)((int)a[i] + 2);
        }
        password=new String(a);
        
        String address=request.getParameter("address");
        String phone=request.getParameter("phone_no");
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            
            conn=DriverManager.getConnection(DB_URL,USER,PASS);
            
            String sql="insert into customer(cname,email,password,address,phone) values(?,?,?,?,?)";
            stmt=conn.prepareStatement(sql);
            
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.setString(4, address);
            stmt.setString(5, phone);
            
            
            int rows=stmt.executeUpdate();
            
            if(rows==1)
                
                response.sendRedirect("t_mart.jsp");
                out.print("Record inserted successfully.");
            
            
        }catch(Exception e)
        {
            out.print("Error: Record insertion failed." + e);
        }
       %>
    </body>
</html>
