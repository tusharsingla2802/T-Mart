<%-- 
    Document   : cart
    Created on : 27 Nov, 2020, 11:06:57 AM
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
            if(session.getAttribute("uname")!=null)
            {
                final String JDBC_DRIVER="com.mysql.jdbc.Driver";
                final String DB_URL="jdbc:mysql://localhost/tmart";

                final String USER="root";
                final String PASS="tushar";

                Connection conn=null;
                PreparedStatement stmt=null;

                int id=(Integer)session.getAttribute("uid");

                double price=Double.parseDouble(request.getParameter("price"));
                int cpid=Integer.parseInt(request.getParameter("pid"));
                int qty=1;

                try
                {
                    Class.forName("com.mysql.jdbc.Driver");

                    conn=DriverManager.getConnection(DB_URL,USER,PASS);

                    String sql="insert into cart(pid,uid,price,qty) values(?,?,?,?)";
                    stmt=conn.prepareStatement(sql);

                    stmt.setInt(1, cpid);
                    stmt.setInt(2, id);
                    stmt.setDouble(3, price);
                    stmt.setInt(4, qty);



                    int rows=stmt.executeUpdate();

                    if(rows==1)
                    {
                        response.sendRedirect("show_cart.jsp");
                        //out.print("Record inserted successfully.");
                    }

                }catch(Exception e)
                {
                    out.print("Error: Record insertion failed." + e);
                }
                
            }
            else
            {
                response.sendRedirect("Sign_In.jsp");
            }

        %>   
           
    </body>
</html>
