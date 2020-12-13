<%-- 
    Document   : Products
    Created on : 24 Nov, 2020, 12:32:24 PM
    Author     : tusha
--%>

<%@page import="java.util.*"%>

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
            
            
            String sql="Select * from category";
            //String email=request.getParameter("username");
            //String password=request.getParameter("password");
            
            stmt=conn.prepareStatement(sql);
            
            //stmt.setString(1, email);
           // stmt.setString(2, password);
            
            ResultSet rs = stmt.executeQuery();
            int cid=0;
            HashMap<Integer,String> hm=new HashMap<Integer,String>();
            while(rs.next())
            {
              
                cid=rs.getInt(1);
                String catname=rs.getString(2);
                
                hm.put(cid,catname);
                
                
                
            }
            
            Set<Map.Entry<Integer, String>> set = hm.entrySet();
            %>
            <div style="font-size: 25px;margin:10px;color:blueviolet;"><b> Trending now... </b></div>
            <div style="margin:20px;font-size:20px;border:0px solid black;overflow:auto;">
            <%
                for(Map.Entry<Integer,String> me : set) 
                {
                    cid=me.getKey();
                %>
                <div style="border:0px solid red;width:48%;float:left;text-align:center;padding:10px;">
                    <div style="background-color: lightgreen;padding: 10px;">
                        <b><a href="subcat.jsp?catid=<%=cid%>" style="color:red;font-size:22px;"><%=me.getValue().replace("_"," ")%></b></a>
                    </div>
                    <div style="margin: auto;border:2px solid green;overflow:auto;">
                      
                    <%
                        try
                        {
                            Class.forName("com.mysql.jdbc.Driver");
                            conn=DriverManager.getConnection(DB_URL,USER,PASS);
                            
                            String sql2="Select img,p.pid,p.price from trending_items t,products p where t.catid=? and t.pid=p.pid";

                            stmt=conn.prepareStatement(sql2);

                            stmt.setInt(1, cid);
                           // stmt.setString(2, password);

                            ResultSet rs1 = stmt.executeQuery();
                            //boolean flag=true;
                            while(rs1.next())
                            {
                                String img=rs1.getString(1);
                                int pid=rs1.getInt(2);
                                double price=rs1.getDouble(3);
                                out.print("<div id=subcatimg style=\"border:0px solid red;\">"
                                            + "<a id=pimg href=proddetails.jsp?pid="+pid+"><img src="+img+" width=100 height=100>"
                                                + "<div id=imgprice><b>"+price+"</b></div>"
                                            + "</a>"
                                        + "</div>");
                            }
                            conn.close();
                        }
                        catch(Exception e)
                        {
                            out.print("failed"+e);
                        }
                    %> 
                  
                    </div>
                </div>
                <%        
                }
             %>
             </div>   
        <%
        }
        catch(Exception e)
        {
            out.print("failed" + e);
        }
      %>
    </body>
</html>
