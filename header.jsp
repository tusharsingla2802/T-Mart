<%-- 
    Document   : header.jsp
    Created on : 30 Nov, 2020, 11:33:00 AM
    Author     : tusha
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="tmartcss.css" rel="stylesheet">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
          String getSubCategoryValues(String sql,String name,int subcat_id)  
          {
            final String JDBC_DRIVER="com.mysql.jdbc.Driver";
            final String DB_URL="jdbc:mysql://localhost/tmart";

            final String USER="root";
            final String PASS="tushar";

            Connection conn=null;
            PreparedStatement stmt=null;

            String op="<select name="+name+" style=margin-top:0px;color:black;padding:0px;font-size:15px;font-weight:bold;height:33px;float:left;>";
                op+="<option value=0>All</option>";
            try
            {
                Class.forName("com.mysql.jdbc.Driver");

                conn=DriverManager.getConnection(DB_URL,USER,PASS);

                
                stmt=conn.prepareStatement(sql);

                ResultSet rs=stmt.executeQuery();
                
                while(rs.next())
                {
                    if(rs.getInt(1)==subcat_id)
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
            int subcat_id=0;
            String s="";
            if(request.getParameter("subcat_id")!=null)
                subcat_id=Integer.parseInt(request.getParameter("subcat_id"));
            //out.print(subcatid);
            if(request.getParameter("svalue")!=null)
                s=request.getParameter("svalue");
            //out.print(s);
        %>
        <div style="overflow:auto; background-color:blue;">
            <div style="margin-left: 20px;color: red;float:left;font-size: 20px;color:white;width:20%;border-right:0px solid red;"><h1>T-MART</h1></div>
            
            <div style="border:3px solid red;overflow: auto;padding:0px;text-align:center;width: 48%;float: left;margin-top: 30px;height: 33px;background-color: white;">
            <form>
            <div style="text-align:center;border:0px solid green;margin-top: 0px;height: 100%;width:100%;">
                <%=getSubCategoryValues("select subcatid,subcat_name from subcategory","subcatid",subcat_id)%>
                <input type="text" name="svalue" value="<%=s%>" style="height:29px;width:489.5px;margin-top: 1px;margin-left: 1px;border:0px solid seagreen;padding-top: 0px;text-indent: 0%;font-size: 15px;float:left;">
                    
                
                
                <a href="Products.jsp" style="float:right;height: 33px;width: 65px;font-size: 15px;"><img src="img\search.png" style="width:43px;float:right;"></a>
            </div>
            </form>
            </div>
                    <div style="width: 20%;float: right;"> 
                    <%
                        String uname = (String)session.getAttribute("uname");
                        if(uname==null)
                        {
                     %>
                            <div style="float:right;margin-right: 20px;font-size: 23px;margin-top: 35px;color: white;"><b><a href="Sign_In.jsp" style="color:white;">Sign-In</b></a></div>
                            <div style="float:right;margin-right: 20px;font-size: 23px;margin-top: 35px;"><b><a href="Sign_Up.jsp" style="color:white;">Sign-Up</b></a></div>
                    <%
                        }
                        else
                        {
                     %>
                            <div style="float:right;margin-right: 22px;font-size: 20px;margin-top: 45px;"><b><a href="Sign_Out.jsp" style="color:white;">Sign Out</b></a></div>         
                            <div style="float:right;margin-right: 20px;font-size: 20px;margin-top: 45px;"><b><a href="show_cart.jsp" style="color:white;">Cart</b></a></div>
                    <%
                       }           
                    %>
                    </div>

        </div>
        <div style="overflow:auto;background-color:yellow;height: 40px;">
            <div style="margin-left: 10%;">
        <div class="homeheader"><b><a href="Home.jsp">Home</b></a></div>
        <div class="homeheader"><b><a href="Products.jsp">Products</b></a></div>
        <div class="homeheader"><b><a href="About_Us.jsp">About Us</b></a></div>
        <div class="homeheader"><b><a href="Contact_Us.jsp">Contact Us</b></a></div>
        <%
            String gname=(String)session.getAttribute("uname");
            if(gname!=null)
                out.print("<div style=float:right;font-size:20px;margin-right:20px;><b><a href=\"profile.jsp\">Welcome " +gname+"</b></a></div>");
            else
                out.print("<div style=float:right;font-size:20px;margin-right:20px;><b>Welcome Guest</b></div>");
        %>
        </div>
        </div>
    </body>
</html>
