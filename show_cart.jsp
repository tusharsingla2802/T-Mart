<%-- 
    Document   : show_cart
    Created on : 27 Nov, 2020, 11:30:52 AM
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
        <%!
          String getQtyDropDownValues(int n,String name,int s)  
          {
              String op="<select name="+name+" style=color:black;width:40px;padding:2px;font-weight:bold;font-size:15px;height:30px;>";
              for(int i=1;i<=n;i++)
              {
                  if(i==s)
                    op+="<option selected value="+i+">"+i+"</option>";
                  else
                      op+="<option value="+i+">"+i+"</option>";
              }
              return op+"</select>";
          }
        %>
        <%@include file="header.jsp" %>
        <link href="tmartcss.css" rel="stylesheet">
        
        <div style="text-align: right;padding-bottom:10px;font-size:20px;border-bottom: 2px solid blue;">
            <a href="Products.jsp" style="color:darkorange;"><b>Continue Shopping...</b></a>
        </div>
        <div>
            <div style="float:left;padding:0px;border-right: 10px solid red;overflow:auto;width:49%;height: 540px;">
                <div style="background-color: lightgreen;height: 35px;font-size: 25px;color:red;text-indent: 20px;"><b>Cart :</b></div>
        <%
            int cusid=(Integer)session.getAttribute("uid");
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
                String sql="Select p.pid,p.pname,p.img,c.cartid,c.qty,c.price from products p,cart c where p.pid=c.pid and uid=?";
                //String email=request.getParameter("username");
                //String password=request.getParameter("password");

                stmt=conn.prepareStatement(sql);
                stmt.setInt(1, cusid);
               // stmt.setString(2, password);

                ResultSet rs = stmt.executeQuery();
              
                while(rs.next())
                {
                    
                    int cartid=rs.getInt(4);
                    total_value += rs.getDouble(6)*rs.getInt(5);
                    out.print("<div id=showcart>"
                                    + "<div id=cartimg><img src="+rs.getString(3)+" width=140px height=140px></div>"
                                            
                                    +"<div id=cart_name_price>"
                                        + "<div style=\"font-size:20px;color:red;border:0px solid red;\">"+rs.getString(2)+"</div>"
                                        + "<div style=\"margin-top:10px;font-size:20px;color:darkgreen;border:0px solid black;\">Rs. "+rs.getDouble(6)+"</div>"
                                    +"</div>"
                                                
                                    +"<div id=cart_qty_upd>"
                                            +"<form action=\"updateqty.jsp\"><input type=hidden name=cartid value="+cartid+">"
                                            + "<div style=\"font-size:10px;overflow:auto;border:0px solid black;float:left;margin-right:20px;\">"
                                                + getQtyDropDownValues(5,"qty",rs.getInt(5))+"</div>"
                                            + "<div style=\"font-size:20px;border:0px solid black;overflow:auto;\"><input type=submit value=\"update quantity\" style=padding:5px;background:orange;color:darkblue;font-weight:bold;></div>"
                                       + "</form>"
                                    +"</div>"   
                                    
                                    +"<div id=cart_sfl_remove>"     
                                       +"<div style=margin-top:25px;margin-left:5px;float:left;>"
                                            + "<a href=save_for_later.jsp?pid="+rs.getInt(1)+"&cartid="+rs.getInt(4)+">Save for later</a>"
                                       +"</div>"
                                       + "<div style=\"margin-left:5px;float:left;font-size:15px;margin-top:26px;\">"
                                              + "<a href=removeproductfrom_cart.jsp?cartid="+cartid+">| Remove</a>"
                                       + "</div>"
                                    +"</div>"
                           + "</div>");
                    
                    %>
                        
            
                    <%
                    
                }
           %>
           <div>
                <div id="cart_totalvalue"><b>Total cart value = Rs. <%=total_value%></div>
                <div><b><a id="product_order" href="Buy_now.jsp?total_price=<%=total_value%>">Buy Now</a></div>
                
           </div>
           <%
            }
            catch(Exception e)
            {
                out.print("failed" + e);
            }
        %> 
            </div>
            <div style="border:0px solid green;overflow:auto;margin-left: 20px;">
                <div style="background-color: lightgreen;height: 35px;font-size: 25px;color:red;text-indent: 20px;"><b>Saved for later :</b></div>
        <%
            /*int cusid=(Integer)session.getAttribute("uid");*/
            
            try
            {
                Class.forName("com.mysql.jdbc.Driver");

                conn=DriverManager.getConnection(DB_URL,USER,PASS);
                
                String sql="Select p.pid,p.pname,p.img,p.price,s.sno from products p,saveforlater s where p.pid=s.pid and uid=?";
                
                stmt=conn.prepareStatement(sql);
                stmt.setInt(1, cusid);
               
                ResultSet rs = stmt.executeQuery(); 
                while(rs.next())
                {
                        
                    out.print("<div id=showcart>"
                                + "<div id=cartimg><img src="+rs.getString(3)+" width=140px height=140px></div>"
                                + "<div id=cart_name_price>"
                                    + "<div style=\"font-size:20px;color:red;border:0px solid red;\">"+rs.getString(2)+"</div>"
                                    + "<div style=\"margin-top:10px;font-size:20px;color:darkgreen;border:0px solid black;\">Rs. "+rs.getDouble(4)+"</div>"
                                + "</div>"
                                            
                                + "<div style=\"margin-top: 98px;margin-left:50px;font-size: 15px;float:left;\">"
                                    + "<a href=Move_to_cart.jsp?pid="+rs.getInt(1)+"&price="+ rs.getDouble(4)+"&sno="+rs.getInt(5)+">Move To Cart</a>"
                                +"</div>"
                                            
                                +"<div id=cart_sfl_remove>"     
                                    + "<div style=\"margin-left:0px;float:left;font-size:15px;margin-top:77px;\">"
                                        + "<a href=removeproductfromsfl.jsp?pid="+rs.getInt(1)+">| Remove</a>"
                                    + "</div>"
                                +"</div>"
                            + "</div>");
                }
             %>
        
             <%
               
            }
            catch(Exception e)
            {
                out.print("failed "+e);
            }
        %>    
        </div>
        </div>
    </body>
</html>
