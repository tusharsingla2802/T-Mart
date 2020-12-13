<%-- 
    Document   : Gui_edit_product
    Created on : 11 Dec, 2020, 10:52:23 AM
    Author     : tusha
--%>
<link href="tmartcss.css" rel="stylesheet">
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="Admin_Header.jsp" %>
        <%!
          String getSubCategoryValues(String sql,String name,int subcatid)  
          {
            final String JDBC_DRIVER="com.mysql.jdbc.Driver";
            final String DB_URL="jdbc:mysql://localhost/tmart";

            final String USER="root";
            final String PASS="tushar";

            Connection conn=null;
            PreparedStatement stmt=null;

            String op="<select name="+name+" style=color:black;padding:2px;font-size:15px;height:30px;margin-left:50px;>";
            try
            {
                Class.forName("com.mysql.jdbc.Driver");

                conn=DriverManager.getConnection(DB_URL,USER,PASS);

                
                stmt=conn.prepareStatement(sql);

                ResultSet rs=stmt.executeQuery();

                while(rs.next())
                {
                        if(rs.getInt(1)==subcatid)
                            op+="<option selected value="+rs.getInt(1)+">"+rs.getString(2)+"</option>";
                        else
                            op+="<option value="+rs.getInt(1)+">"+rs.getString(2)+"</option>";
                }
            }
            catch(Exception e)
            {
                System.out.print("failed "+e);
            }

              
              
              
              return op+"</select>";
          }
        %>
        
        <%
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

                String sql="select p.pname,p.price,p.details,p.img,p.subcatid,p.pid from products p where p.pid=?";
                stmt=conn.prepareStatement(sql);
                
                stmt.setInt(1,pid);
                ResultSet rs=stmt.executeQuery();

                if(rs.next())
                {
                    //out.print(rs.getString(1));
                    %>
                    <form action="Edit_Product.jsp" method="post">
                        <div style="margin-top: 40px;margin-bottom: 20px;font-size: 25px;width:700px;"><b>Product Name : <input type="text" name="pname" value='<%=rs.getString(1)%>' style="margin-left: 40px;"></div>
                        <div style="margin-bottom: 20px;font-size: 25px;width:500px;">Price : <input type="text" name="price" value='<%=rs.getDouble(2)%>' style="margin-left: 140px;"></div>
                        <div style="margin-bottom: 20px;font-size: 25px;width:500px;">Details : <textArea rows=7 cols=30 name="details" style="margin-left: 122px;"><%=rs.getString(3)%></textarea></div>
                        <div style="margin-bottom: 20px;font-size: 25px;width:500px;">Image : <input type="text" name="img" value='<%=rs.getString(4)%>' style="margin-left: 130px;"></div>
                        <div style="margin-bottom: 20px;font-size: 25px;width:700px;">Sub Category : 
                            <%out.print(getSubCategoryValues("select subcatid,subcat_name from subcategory","subcatid",rs.getInt(5)));%></div></b>
                        <div style="margin-bottom: 20px;margin-left: 100px;margin-top: 30px;"><input type="submit" value="Submit" name="submit"
                        style="font-size: 20px;padding-left: 30px;text-align: center;padding-right: 30px;color: white;background: blue;font-weight: bold;">
                        </div>
                        <input type="hidden" name="pid" value='<%=pid%>'>
                    </form>
                    <%
                }
            }
            catch(Exception e)
            {
                System.out.print("failed "+e);
            }

            
            
        %>
        
        
        
    </body>
</html>
