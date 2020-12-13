<%-- 
    Document   : save_for_later
    Created on : 4 Dec, 2020, 11:40:23 AM
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
            int pid=Integer.parseInt(request.getParameter("pid"));
            int cusid=(Integer)session.getAttribute("uid");
            int cartid=Integer.parseInt(request.getParameter("cartid"));
            
            final String JDBC_DRIVER="com.mysql.jdbc.Driver";
            final String DB_URL="jdbc:mysql://localhost/tmart";

            final String USER="root";
            final String PASS="tushar";

            Connection conn=null;
            PreparedStatement stmt=null;
            int total_value=0;
            try
            {
                Class.forName("com.mysql.jdbc.Driver");

                conn=DriverManager.getConnection(DB_URL,USER,PASS);
                //out.print(request.getParameter("subcatid"));
                String sql="insert into saveforlater(uid,pid) values(?,?)";
                //String email=request.getParameter("username");
                //String password=request.getParameter("password");

                stmt=conn.prepareStatement(sql);
                stmt.setInt(1, cusid);
                stmt.setInt(2, pid);

                int row = stmt.executeUpdate();
                
                //removing item from cart
                String sql1="delete from cart where cartid=?";
                stmt=conn.prepareStatement(sql1);
                stmt.setInt(1, cartid);
                
                int row1 = stmt.executeUpdate();
                
                if(row==1)
                {
                    response.sendRedirect("show_cart.jsp");
                }
                
                
            }
            catch(Exception e)
            {
                out.print("failed "+ e);
            }
        %>
    </body>
</html>
