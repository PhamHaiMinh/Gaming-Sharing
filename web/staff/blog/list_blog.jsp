<%-- 
    Document   : list_blog
    Created on : Dec 5, 2022, 12:10:01 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.BlogCategory"%>
<%@page import="Model.Blog"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog List</title>
        <link rel="stylesheet" type="text/css"
              href="<%=request.getContextPath()%>/assets/css/style.css" />
        <link rel="stylesheet" type="text/css"
              href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/check.js"></script>
        <script type="text/javascript"
        src="<%=request.getContextPath()%>/assets/js/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/jquery.validate.js"></script>
        <script type="text/javascript"
        src="<%=request.getContextPath()%>/assets/ckeditor/ckeditor.js"></script>
        <script type="text/javascript"
        src="<%=request.getContextPath()%>/assets/css/bootstrap.min.js"></script>
    </head>

    <body>
        <%@include file="../layout/left.jsp"%>
        <%
                ArrayList<Blog> listBlog = (ArrayList<Blog>) request.getAttribute("listBlog");
                ArrayList<BlogCategory> listCategory = (ArrayList<BlogCategory>) request.getAttribute("listCategory");
                int stt=1;
                String msg = (String)request.getAttribute("msg");
        %>
        <div class="container-80 pb-5 d-flex justify-content-center p-3" style="flex-direction: column;">
            <div>            
                <br />
                <div class="error" id="msg">
                    <span><%if(msg!=null) out.print(msg); %></span>
                </div>
            </div>
            <div>
                <form action="<%= request.getContextPath()%>/staff/blog/add-blog" method="post" class="form-inline">
                    <div class="form-group left" style="padding-right: 10px">
                        <button type="submit" class="btn btn-info" name="showadd" >
                            <img src="<%=request.getContextPath() %>/assets/img/add.png" alt="" width="20" height="20"> Thêm
                        </button>
                    </div>
                </form>

                <table class="table table-bordered table-hover">
                    <tr>
                        <th>STT</th>                         
                        <th>ID</th>
                        <th>Tiêu đề</th>
                        <th>Danh mục</th>
                        <th>Thời gian đăng</th>
                        <th>Luợt xem</th>
                        <th>Hình ảnh</th>
                        <th>Sửa</th>
                    </tr>
                    <%
                            if(listBlog!=null){
                                    for(Blog blog:listBlog){
                    %>
                    <tr>
                        <td><%=stt++ %></td>
                        <td><%=blog.getId() %></td>
                        <td><%=blog.getTitle() %></td>
                        <td><%=blog.getCategory() %></td>
                        <td><%=blog.getCreate_time() %></td>
                        <td><%=blog.getViewed() %></td>
                        <td><img src="<%=blog.getImage() %> " width="150px" height="120px"></td>
                        <td>
                            <a href="edit-blog?showedit=1&id=<%=blog.getId()%>" style="color: blue"><img src="<%=request.getContextPath() %>/assets/img/edit-icon.png" alt="" width="20" height="20">Sửa</a>
                        </td>
                    </tr>
                    <%	
                                    }
                            }
                    %>
                </table>
                <form action="<%= request.getContextPath()%>/staff/blog/delete-blog" method="post" class="form-inline">
                    <div>
                        <div class="form-group left">
                            <button type="submit" class="btn btn-danger" name="showdelete" >
                                <img src="<%=request.getContextPath() %>/assets/img/del-icon.png" alt="" width="20" height="20"> Xóa
                            </button>
                        </div>
                        <div class="clear"></div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
