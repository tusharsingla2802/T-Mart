<%-- 
    Document   : Gui_add_product
    Created on : 9 Dec, 2020, 12:06:16 PM
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
          String getSubCategoryValues(String sql,String name)  
          {
            final String JDBC_DRIVER="com.mysql.jdbc.Driver";
            final String DB_URL="jdbc:mysql://localhost/tmart";

            final String USER="root";
            final String PASS="tushar";

            Connection conn=null;
            PreparedStatement stmt=null;

            String op="<select name="+name+" style=color:black;padding:2px;font-size:15px;height:30px;margin-left:10px;>";
            try
            {
                Class.forName("com.mysql.jdbc.Driver");

                conn=DriverManager.getConnection(DB_URL,USER,PASS);

                
                stmt=conn.prepareStatement(sql);

                ResultSet rs=stmt.executeQuery();

                while(rs.next())
                {
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
        
        <form action="Add_Product.jsp" method="post">
        <div style="margin-top: 40px;margin-bottom: 20px;font-size: 25px;width:350px;text-align:right;"><b>Product Name : <input type="text" name="pname" style="margin-left: 10px;"></div>
        <div style="margin-bottom: 20px;font-size: 25px;width:350px;text-align:right;">Price : <input type="text" name="price" style="margin-left: 10px;"></div>
        <div style="margin-bottom: 20px;font-size: 25px;width:350px;border:0px solid red;vertical-align:text-top;text-align:right;">Details :<textarea name="details" rows="5" cols="20" style="margin-left: 15px;"> </textarea></div>
        <div style="margin-bottom: 20px;font-size: 25px;width:350px;text-align:right;">Image : <input type="text" name="img" style="margin-left: 10px;"></div>
        <div style="margin-bottom: 20px;font-size: 25px;width:340px;text-align:right;">Sub Category : <%=getSubCategoryValues("select subcatid,subcat_name from subcategory","subcatid")%></div></b>
        <div style="margin-bottom: 20px;margin-left: 100px;margin-top: 30px;"><input type="submit" value="Submit" name="submit"
        style="font-size: 20px;padding-left: 30px;text-align: center;padding-right: 30px;color: white;background: blue;font-weight: bold;">
        </div>
        </form>
    </body>
</html>
