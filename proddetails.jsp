<%-- 
    Document   : proddetails
    Created on : 26 Nov, 2020, 11:17:29 AM
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
        <%@include file="header.jsp" %>
        <%
            int pid=Integer.parseInt(request.getParameter("pid"));
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
            //out.print(request.getParameter("subcatid"));
            String sql="Select * from products where pid=?";
            //String email=request.getParameter("username");
            //String password=request.getParameter("password");
            
            stmt=conn.prepareStatement(sql);
            
            stmt.setInt(1, pid);
           // stmt.setString(2, password);
            
            ResultSet rs = stmt.executeQuery();
            //boolean flag=true;
            while(rs.next())
            {
                
                String details=rs.getString(4);
                double price=rs.getDouble(3);
                String name=rs.getString(2);
                String img=rs.getString(5);
                %>
                
                <div style="overflow: auto;">
                    <div style="float:left;padding-left:60px;margin-top:100px;margin-left:30px;width: 30%;">
                        <img src=<%=img%> width=400 height=400>
                        
                    </div>
                    <div style="float: left;margin-left: 60px;margin-top: 100px;width: 50%;color: red;">
                        <div style="font-size: 30px;margin-top: 20px;">
                            <b><U><%=name%></U></b>
                        </div>
                        <div style="margin-top: 30px;font-size: 25px;">
                            <b><u>Price</u></b> 
                            <div style="font-size: 20px;margin-top: 12px;color:black;">
                                <%=price%>
                            </div>
                        </div>
                        <div style="margin-top: 30px;font-size: 25px;">
                            <b><u>Key Features</u> :</b>
                            <div style="font-size: 20px;margin-top: 12px;color: black;width:500px;">
                                <%=details%>
                            </div>
                        </div>
                        <div style="margin-top: 30px;font-size: 20px;border:2px solid red;float:left;padding:5px;background-color: yellow;">
                            <a href="cart.jsp?pid=<%=pid%>&price=<%=price%>">Add To Cart</a>
                        </div>
                    </div>
                    
                
                </div>
                 
                
            <%    
            }
        }
        catch(Exception e)
        {
            out.print("failed" + e);
        }
        %>   
    </body>
</html>
