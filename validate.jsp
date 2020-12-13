<%-- 
    Document   : validate
    Created on : 21 Nov, 2020, 11:51:40 AM
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
        
        String btn=request.getParameter("submit");
        try
        {
            Class.forName("com.mysql.jdbc.Driver");

            conn=DriverManager.getConnection(DB_URL,USER,PASS);
            String sql="";

            if(btn.equals("User"))
            {
                sql="Select cid,cname from customer where email=? and password=?";
            }
            else
            {
                sql="Select aid,aname from admin where email=? and password=?";
            }
            String email=request.getParameter("username");
            String password0=request.getParameter("password");
            //out.print(password); 
            char[] a=password0.toCharArray();
            for(i=0;i<a.length;i++)
            {
                a[i]=(char)((int)a[i] + 2);
            }
            String password=new String(a);
            //out.print(password); 
            stmt=conn.prepareStatement(sql);
                
            stmt.setString(1, email);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if(rs.next())
            {
                    //out.print("welcome");
                    int cid=rs.getInt(1);
                    String uname=rs.getString(2);
                    session.setAttribute("uid",cid);
                    session.setAttribute("uname",uname);
                    if(btn.equals("User"))
                        
                        response.sendRedirect("t_mart.jsp");
                    else
                        response.sendRedirect("Admin_Home.jsp");

            }
            else
            {
                //out.print(password);     
                response.sendRedirect("Sign_In.jsp?msg=Invalid username or password");
            }
        
        } 
        catch(Exception e)
        {
                out.print("failed" + e);
        }
        
        
        
      %>
    </body>
</html>
