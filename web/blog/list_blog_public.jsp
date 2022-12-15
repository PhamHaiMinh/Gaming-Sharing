<%-- 
    Document   : list_blog_public
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
                
            ArrayList<ArrayList<Blog>> listBlog = (ArrayList<ArrayList<Blog>>) request.getAttribute("listBlog");
        %>
        <div id="body">

            <section class="blog_area section-padding">
                <div class="container">

                    <div class="row">
                        <div class="col-lg-8 mb-5 mb-lg-0">

                            <div class="blog_left_sidebar">
                                <%
                                String urlBlog = request.getContextPath()+"/blog-detail?id=";
                                for(int i=0; i<listBlog.size(); i++){
                                       if(listBlog.get(i).size()==0){
                                               out.print("");
                                       }else{
                                    for(int j=0; j<listBlog.get(i).size(); j++){
                                %>
                                <article class="blog_item">
                                    <div class="blog_item_img">
                                        <img class="card-img rounded-0" src="<%=listBlog.get(i).get(j).getImage() %>" alt="">
                                        <a href="#" class="blog_item_date">
                                            <h3><%=listBlog.get(i).get(j).getCreate_time() %></h3>

                                        </a>
                                    </div>

                                    <div class="blog_details">
                                        <a class="d-inline-block" href="<%=urlBlog+listBlog.get(i).get(0).getId()%>">
                                            <h2><%=listBlog.get(i).get(j).getTitle() %></h2>
                                        </a>

                                        <ul class="blog-info-link">
                                            <li><a><i class="fa fa-bars"></i> <%=listCategory.get(i).getName() %></a></li>
                                            <li><a><i class="fa fa-eye"></i> <%=listBlog.get(i).get(j).getViewed() %></a></li>
                                        </ul>
                                    </div>
                                </article>
                                <%} %>
                                <%} %>
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
