<%-- 
    Document   : delete_blog
    Created on : Dec 15, 2022, 9:48:31 PM
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
        <title>Delete Blog </title>
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
                <form action="<%= request.getContextPath()%>/staff/blog/delete-blog" method="post" onsubmit="return checkDelete()" class="form-inline">
                    <div>
                        <div class="form-group left">
                            <button type="submit" class="btn btn-danger" name="delete" >
                                <img src="<%=request.getContextPath() %>/assets/img/del-icon.png" alt="" width="20" height="20"> Xóa
                            </button>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <table class="table table-bordered table-hover">
                        <tr>
                            <th><input type="checkbox" name="checkAll" onclick="toggle(this)"></th>
                            <th>STT</th>                         
                            <th>ID</th>
                            <th>Tiêu đề</th>
                            <th>Danh mục</th>
                            <th>Thời gian đăng</th>
                            <th>Luợt xem</th>
                            <th>Hình ảnh</th>
                        </tr>
                        <%
                                if(listBlog!=null){
                                        for(Blog blog:listBlog){
                        %>
                        <tr>
                            <td>
                                <input type="checkbox" name="check" value="<%=blog.getId() %>">
                            </td>
                            <td><%=stt++ %></td>
                            <td><%=blog.getId() %></td>
                            <td><%=blog.getTitle() %></td>
                            <td><%=blog.getCategory() %></td>
                            <td><%=blog.getCreate_time() %></td>
                            <td><%=blog.getViewed() %></td>
                            <td><img src="<%=blog.getImage() %> " width="150px" height="120px"></td>
                        </tr>
                        <%	
                                        }
                                }
                        %>
                    </table>
                </form>
            </div>
        </div>
        <script type="text/javascript">
            function setActive(id) {
                //alert(0);
                $.ajax({
                    url: '<%=request.getContextPath()%>/admin/active-news',
                    type: 'POST',
                    cache: false,
                    data: {
                        id: id,
                    },
                    success: function (data) {
                        $('#setactive-' + id).html(data);
                    },
                    error: function () {
                        alert('Có lỗi xảy ra');
                    }
                });
                return false;
            }
            function checkDelete() {
                var check = document.getElementsByName("check");
                for (var i = 0; i < check.length; i++) {
                    if (check[i].checked) {
                        return true;
                    }
                }
                document.getElementById("msg").innerHTML = "Chưa chọn mục để xóa";
                return false;
            }
            function toggle(source) {
                checkboxes = document.getElementsByName('check');
                for (var i = 0, n = checkboxes.length; i < n; i++) {
                    checkboxes[i].checked = source.checked;
                }
            }
        </script>
    </body>
</html>
