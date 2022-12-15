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
        <link rel="stylesheet" href="assets/css/blog.css">
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
                String catId = (String) request.getAttribute("catId");
        %>
        <style>
            .news_detail img{
                width:100%;
            }
        </style>
        <div id="body">
            <section class="blog_area single-post-area section-padding">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 posts-list">
                            <div class="single-post">
                                <div class="feature-img">
                                    <img class="img-fluid" src="<%=blog.getImage()%>" alt="">
                                </div>

                                <div class="blog_details">
                                    <h2><%=blog.getTitle()%>
                                    </h2>
                                    <%  for(BlogCategory blogCategory : listCategory){
                                        if(blogCategory.getId().equals(catId)){
                                    %>
                                    <ul class="blog-info-link mt-3 mb-4">
                                        <li><a><i class="fa fa-user"></i> <%=blog.getSource()%></a></li>
                                        <li><a><i class="fa fa-eye"></i> <%=blog.getViewed()%></a></li>
                                        <li><a><i class="fa fa-bars"></i> <%=blogCategory.getName() %></a></li>
                                    </ul>
                                    <%
                                        break;
                                        }
                                      }
                                    %>
                                    <p class="excert">
                                        <%=blog.getBody()%>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="blog_right_sidebar">
                                <aside class="single_sidebar_widget post_category_widget">
                                    <h4 class="widget_title">Category</h4>
                                    <ul class="list cat-list">
                                        <%
                                            DBContext dbc = new DBContext();
                                            String urlCat = request.getContextPath()+"/list-blog-by-cat?id=";
                                            for(BlogCategory blogCategory : listCategory){
                                        %>
                                        <li>
                                            <a href="<%=urlCat + blogCategory.getId()%>" class="d-flex">
                                                <p><%=blogCategory.getName() %></p>
                                            </a>
                                        </li>
                                    </ul>
                                    <%
                                            }
                                    %>
                                    </ul>
                                </aside>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </body>
</html>
