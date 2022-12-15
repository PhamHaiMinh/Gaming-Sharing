<%-- 
    Document   : view_blog
    Created on : Dec 5, 2022, 12:11:21 PM
    Author     : Admin
--%>

<%@page import="Dao.DBContext"%>
<%@page import="Model.BlogCategory"%>
<%@page import="Model.Blog"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>GSharing</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <style>
            .content{
                display: none;
            }
        </style>
    </head>
    <body>
        <%@include file="../header.jsp"  %>
        <%
            ArrayList<BlogCategory> listCategory = (ArrayList<BlogCategory>) request.getAttribute("listCategory");
                String title = request.getParameter("title");
            Blog blog = (Blog) request.getAttribute("blog");
                ArrayList<Blog> listBlog = (ArrayList<Blog>) request.getAttribute("listBlog");
                DBContext dbc = new DBContext();
        %>
        <style>
            .news_detail img{
                width:100%;
            }
        </style>
        <div id="body">
            
            <div id="fb-root"></div>

            <div class="content">
                <div id="blog">
                    <div class="news_detail">
                        <h1><%=blog.getTitle() %></h1>
                        <p class="date">Ngày đăng: <%=blog.getCreate_time() %> - Lượt xem: <%=blog.getViewed() %></p>
                        <div class="news_content">
                            <%=blog.getBody() %>
                        </div>
                        <p class="author">Nguồn: <%=blog.getSource() %></p>
                    </div>

                    <h2>Tin tức liên quan</h2>
                    <ul>
                        <%
                                
                                String urlDetail = request.getContextPath()+"/blog-detail?id=";
                                for(Blog oBlog: listBlog){
                        %>
                        <li>
                            <div class="article">
                                <h3>
                                    <a href="<%=urlDetail+dbc.createSlug(oBlog.getTitle())+"_"+oBlog.getId()+".html"%>"><%=oBlog.getId()%></a></h3>
                                <small>Ngày đăng: <%=oBlog.getCreate_time() %></small>
                                <small>Lượt xem: <%=oBlog.getViewed()%></small>
                               
                            </div>
                            
                        </li>
                        <%} %>
                    </ul>
                </div>
                
            </div>
        </div>
    </body>
</html>
