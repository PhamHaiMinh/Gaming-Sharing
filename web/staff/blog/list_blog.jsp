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
        <div style="background-color: #f1f1f1;" class="p-3">
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
                            <th></th>
                            <th>STT</th>                         
                            <th>Hiển thị</th>
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
                            <td>
                                <input type="checkbox" name="check" value="<%=blog.getId() %>">
                            </td>
                            <td><%=stt++ %></td>

                            <td align="center" id="setactive-<%=blog.getCatId()%>">
                                <a href="javascript:void(0)" onclick="return setActive('<%=blog.getId()%>')" title="">
                                    <%if (blog.getBrowser() == 1){%>
                                    <img alt="" src="<%=request.getContextPath()%>/assets/img/tick-circle.gif">
                                    <%} else {%>
                                    <img alt="" src="<%=request.getContextPath()%>/assets/img/minus-circle.gif">
                                    <%}%>
                                </a>
                            </td>
                            <td><%=blog.getId() %></td>
                            <td><%=blog.getTitle() %></td>
                            <td><%=blog.getCategory() %></td>
                            <td><%=blog.getCreate_time() %></td>
                            <td><%=blog.getViewed() %></td>
                            <td><img src="<%=request.getContextPath() %>/files/<%=blog.getImage() %> " width="150px" height="120px"></td>
                            <td>
                                <a href="edit-news?showedit=1&id=<%=blog.getId()%>" style="color: blue">Sửa</a>
                            </td>
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
        </script>
    </body>
</html>
