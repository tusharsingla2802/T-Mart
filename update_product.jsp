<%-- 
    Document   : update_product
    Created on : 11 Dec, 2020, 11:42:18 AM
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
            String pname=request.getParameter("pname");
            Double price=Double.parseDouble(request.getParameter("price"));
            String details=request.getParameter("details");
            String img=request.getParameter("img");
            int subcatid=Integer.parseInt(request.getParameter("subcatid"));
            int pid=Integer.parseInt(request.getParameter("pid"));
            //out.print(pid);
            
            final String JDBC_DRIVER="com.mysql.jdbc.Driver";
            final String DB_URL="jdbc:mysql://localhost/tmart";

            final String USER="root";
            final String PASS="tushar";

            Connection conn=null;
            PreparedStatement stmt=null;
            
            try
            {
                Class.forName("com.mysql.jdbc.Driver");

                conn=DriverManager.getConnection(DB_URL,USER,PASS);

                String sql="update products set pname=?,price=?,details=?,img=?,subcatid=? where pid=?";
                stmt=conn.prepareStatement(sql);
                
                stmt.setString(1,pname);
                stmt.setDouble(2,price);
                stmt.setString(3,details);
                stmt.setString(4,img);
                stmt.setInt(5,subcatid);              
                stmt.setInt(6,pid);
                
                stmt.executeUpdate();
                
                //out.print(price);
                response.sendRedirect("Edit_Product.jsp");
            }
            catch(Exception e)
            {
                out.print("failed "+e);
            }
        %>
    </body>
</html>
