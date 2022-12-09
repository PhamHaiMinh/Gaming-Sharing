<%-- 
    Document   : template
    Created on : Dec 9, 2022, 10:03:42 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .all{
                display: flex;
            }
            .left{
                flex: 1;
                display: flex;
                flex-direction: column;
            }
            .right{
                width: 100%;
                flex: 6;
                display: flex;
                flex-direction: column;
            }

            .content{
                display: flex;
                flex: 1;
                flex-direction: column;
                width: 100%;
            }


            .footer{
                position: absolute;
                width: -webkit-fill-available;
                bottom: 0;
            }
        </style>
    </head>
    <body>
        <div class="all">
            <div class="left">
                <jsp:include page="../left.jsp"></jsp:include>
                </div>
                <div class="right">
                    <div class="content">
                        
                    </div>
                    <div class="footer">
                    <jsp:include page="../footer.jsp"></jsp:include>
                </div>      
            </div>
        </div>
    </body>
</html>
