<%-- 
    Document   : t_mart
    Created on : 21 Nov, 2020, 10:51:49 AM
    Author     : tusha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>T-Mart</title>
        
            <script type="text/javascript">
                    var image1 = new Image();
                    image1.src = "img/homepage/home1.PNG";

                    var image2 = new Image();
                    image2.src = "img/homepage/home2.PNG";
                    
                    var image3 = new Image();
                    image3.src = "img/homepage/home3.PNG";

                    var image4 = new Image();
                    image4.src = "img/homepage/home4.PNG";
                      
                    var image5 = new Image();
                    image5.src = "img/homepage/home5.PNG";


                    var step=1;
                function slideit()
                {
                    document.slide.src = eval("image"+step+".src");
                    
                    if(step<5)
                        step++;
                    else
                        step=1;
                    setTimeout("slideit()",1300);
                }

        </script>
        
    </head>
    <body onLoad="slideit();">
        <div style="overflow:auto;">
            <%@include file="header.jsp" %>
            <div style="margin-top: 37px;border: 2px solid red;width:80%;margin-left: 10%;">
                
                <img src="" width=1200px height="500px" name="slide">
            </div>
        </div>
    </body>
</html>
