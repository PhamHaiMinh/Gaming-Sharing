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
            <div id="header">
                <div class="header-menu">
                    <div>
                        <ul class="nav nav-pills">

                            <%
                                    DBContext dbc = new DBContext();
                                    String urlCat = request.getContextPath()+"/list_blog_category_public?id=";
                                    for(BlogCategory blogCategory : listCategory){
                            %>
                            <li role="presentation" >
                                <a href=<%=urlCat + blogCategory.getId()%>>
                                    <%=blogCategory.getName() %>
                                </a>
                            </li>
                            <%
                                    }
                            %>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="section">

                <%
                        String urlBlog = request.getContextPath()+"/blog-detail?id=";
                        for(int i=0; i<listBlog.size(); i++){
                %>
                <!-- begin block -->
                <div class="project-wrap">

                    <div class="error">
                        <%
                                if(listBlog.get(i).size()==0){
                                        out.print("");
                                }else{
                        %>
                    </div>
                </div>
            </div>
            <ul class="article">
                <%
                        for(int j=0; j<listBlog.get(i).size(); j++){
                %>
                <li>
                    <img src="<%=listBlog.get(i).get(j).getImage() %>">
                    <b><a href="<%=urlBlog+listBlog.get(i).get(0).getId()%>"><%=listBlog.get(i).get(j).getTitle() %></a></b> 
                    <small>Ngày đăng: <%=listBlog.get(i).get(j).getCreate_time() %></small>
                </li>
                <%} %>
            </ul>
            <div class="clr"></div>
            <%} %>
        </div> <!-- end block -->
        <%} %>

    </div>
</div>
</body>
</html>
