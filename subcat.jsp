<%-- 
    Document   : subcat
    Created on : 24 Nov, 2020, 12:45:25 PM
    Author     : tusha
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="tmartcss.css" rel="stylesheet">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%@include file="header.jsp" %>
         
        <%
       final String JDBC_DRIVER="com.mysql.jdbc.Driver";
        final String DB_URL="jdbc:mysql://localhost/tmart";
        
        final String USER="root";
        final String PASS="tushar";
        
        int subcatid=0;
        Connection conn=null;
        PreparedStatement stmt=null;
        %>
        
        <div style="overflow: auto">
            
        <div style="width:15%;border-right:10px solid red;padding:5px;float:left;height: 555px;">
        <%
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            
            conn=DriverManager.getConnection(DB_URL,USER,PASS);
            
            int cat_id=Integer.parseInt(request.getParameter("catid"));
            String sql="Select * from subcategory where catid=?";
            //String email=request.getParameter("username");
            //String password=request.getParameter("password");
            
            stmt=conn.prepareStatement(sql);
            
            stmt.setInt(1, cat_id);
           // stmt.setString(2, password);
            
            ResultSet rs = stmt.executeQuery();
            boolean flag=true;
            while(rs.next())
            {
              
                int subcid=rs.getInt(1);
                if(flag)
                {
                    subcatid=subcid;
                    flag=false;
                }
                String subcatname=rs.getString(2);
                out.print("<div id=subcatlabel ><b>"
                            + "<a id=\"a1\" href=subcat.jsp?catid="+cat_id+"&subcatid="+subcid+">"+subcatname+"</b></a>"
                        + "</div>");
                
            }
        }
        catch(Exception e)
        {
            out.print("failed" + e);
        }
      %>
        </div>
        <div style="padding:5px;float:left;width:80%;margin:15px;">
        <%
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            
            conn=DriverManager.getConnection(DB_URL,USER,PASS);
            //out.print(request.getParameter("subcatid"));
            if(request.getParameter("subcatid")!=null)
                subcatid=Integer.parseInt(request.getParameter("subcatid"));
            String sql="Select pid, img, price from products where subcatid=?";
            //String email=request.getParameter("username");
            //String password=request.getParameter("password");
            
            stmt=conn.prepareStatement(sql);
            
            stmt.setInt(1, subcatid);
           // stmt.setString(2, password);
            
            ResultSet rs = stmt.executeQuery();
            //boolean flag=true;
            while(rs.next())
            {
              
                int pid=rs.getInt(1);
                String img=rs.getString(2);
                double price=rs.getDouble(3);
               //img="img/electronics/31.jpg";
                out.print("<div id=subcatimg style=\"border:0px solid red;\">"
                            + "<a id=pimg href=proddetails.jsp?pid="+pid+"><img src="+img+" width=200 height=200>"
                                + "<div id=imgprice><b>"+price+"</b></div>"
                            + "</a>"
                        + "</div>");
                
            }
        }
        catch(Exception e)
        {
            out.print("failed" + e);
        }
      %>
            
        </div>
        </div>
    </body>
</html>
