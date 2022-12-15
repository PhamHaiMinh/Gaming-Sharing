<%-- 
    Document   : list_blog__category_public
    Created on : Dec 4, 2022, 2:04:30 AM
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
        <link rel="stylesheet" href="assets/css/blog.css">
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
                String catId = (String) request.getAttribute("catId");
            ArrayList<Blog> listBlog = (ArrayList<Blog>) request.getAttribute("listBlog");
        %>
        <div id="body">

            <section class="blog_area section-padding">
                <div class="container">

                    <div class="row">

                        <div class="col-lg-8 mb-5 mb-lg-0">

                            <div class="blog_left_sidebar">
                                <%
                                String urlBlog = request.getContextPath()+"/blog-detail?id=";
                                for(Blog blog: listBlog){
                                %>
                                <%  for(BlogCategory blogCategory : listCategory){
                                if(blogCategory.getId().equals(catId)){
       
                                %>
                                <article class="blog_item">
                                    <div class="blog_item_img">
                                        <img class="card-img rounded-0" src="<%=blog.getImage() %>" alt="">
                                        <a href="#" class="blog_item_date">
                                            <h3><%=blog.getCreate_time() %></h3>

                                        </a>
                                    </div>

                                    <div class="blog_details">
                                        <a class="d-inline-block" href="<%=urlBlog+blog.getId()%>">
                                            <h2><%=blog.getTitle() %></h2>
                                        </a>
                                       
                                        <ul class="blog-info-link">

                                            <li><a><i class="fa fa-bars"></i> <%=blogCategory.getName() %></a></li>
                                                <% 
                                                    break;
                                                     }
                                                  }
                                                %>
                                            <li><a><i class="fa fa-eye"></i> <%=blog.getViewed() %></a></li>
                                        </ul>
                                    </div>
                                </article>
                                <%} %>

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
    </body>
</html>
