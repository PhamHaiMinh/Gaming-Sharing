<%-- 
    Document   : delete_blog_category
    Created on : Dec 15, 2022, 9:16:25 PM
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
        <title>Blog Category List</title>
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
        <div class="container-80 pb-5 d-flex justify-content-center p-3" style="flex-direction: column;">

            <%
                    ArrayList<BlogCategory> listCategory = (ArrayList<BlogCategory>) request.getAttribute("listCategory");
                    int stt=1;
                    String error = (String)request.getAttribute("error");
                    String catSearch="";
                    if(request.getParameter("search")!=null){
                            catSearch = new String(request.getParameter("catName").getBytes("ISO-8859-1"),"UTF-8");
                    }
		
            %>
            <div>

                <br />
                <div class="error" >
                    <span id="msg"><%if(error!=null) out.print(error); %></span>
                </div>
            </div>
            <div>
                <form action="<%= request.getContextPath()%>/staff/blog/delete-cat" method="post" onsubmit="return checkDelete()" class="form-inline">
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
                            <th>Tên danh mục</th>
                            <th>Mô tả</th>
                        </tr>
                        <%
                                if(listCategory!=null){
                                        for(BlogCategory blogCat:listCategory){
                        %>
                        <tr>
                            <td>
                                <input type="checkbox" name="check" value="<%=blogCat.getId() %>">
                            </td>
                            <td><%=stt++ %></td>   
                            <td><%=blogCat.getId() %></td>
                            <td><%=blogCat.getName() %></td>
                            <td><%=blogCat.getDescription() %></td>
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
            //kiem tra xoa
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
