<%-- 
    Document   : Edit_Product
    Created on : 10 Dec, 2020, 11:05:47 AM
    Author     : tusha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="tmartcss.css" rel="stylesheet">
<%@page import="java.sql.*" %>
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

            String op="<select name="+name+" style=margin-top:2px;color:black;padding:0px;font-size:15px;font-weight:bold;height:22px;margin-left:-700px;>";
                op+="<option value=0>All</option>";
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
            int subcatid=0;
            String s="";
            if(request.getParameter("subcatid")!=null)
                subcatid=Integer.parseInt(request.getParameter("subcatid"));
            //out.print(subcatid);
            if(request.getParameter("svalue")!=null)
                s=request.getParameter("svalue");
            //out.print(s);
        %>
        <div style="border-bottom:2px solid red;overflow: auto;padding:2px;text-align:center;">
            <form>
            <div style="text-align:center;border:0px solid green;margin: 10px;height: 30px;">
                <input type="text" name="svalue" value="<%=s%>" style="height:29px;width:700px;margin-left: -100px;margin-bottom: 4px;border:4px solid seagreen;padding-top: 3px;text-indent: 24%;">
                    <%=getSubCategoryValues("select subcatid,subcat_name from subcategory","subcatid",subcatid)%>
                
                
                <input type="submit" name="search" value="search" style="margin-left:456px;height: 23px;width: 70px;font-size: 15px;">
            </div>
            </form>
        </div>
            
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

                String sql="select * from products where (pname like \'%"+s+"%\' or details like \'%"+s+"%\')";
                
                if(subcatid!=0)
                    sql+=" and subcatid="+subcatid;
                stmt=conn.prepareStatement(sql);

                ResultSet rs=stmt.executeQuery();

                while(rs.next())
                {
                    %>
                    <div id=show_edit_products>
                        <a id=pimg href="proddetails.jsp?pid=<%=rs.getInt(1)%>">
                        <div id=show_edit_products_image>
                            <img src=<%=rs.getString(5)%> width="120px" height="150px">
                        </div>
                        <div id=show_edit_name_price>
                            <div style="font-size:20px;color:red;border:0px solid red;"><%=rs.getString(2)%></div>
                            <div style="margin-top:10px;font-size:20px;color:darkgreen;border:0px solid black;">Rs. <%=rs.getString(3)%></div>
                        </a>
                        
                            <div style="margin-left:160px;float:left;font-size:15px;margin-top:26px;">
                                <a href="Gui_edit_product.jsp?pid=<%=rs.getInt(1)%>">Edit</a>
                            </div>
                            <div style="margin-left:5px;float:left;font-size:15px;margin-top:26px;">
                                <a href="removeproduct_from_database.jsp?pid=<%=rs.getInt(1)%>">| Remove</a>
                            </div>
                        
                        </div>
                    </div>
                    
                    <%
                    
                }
            }
            catch(Exception e)
            {
                out.print("failed "+e);
            }
        %>
    </body>
</html>
