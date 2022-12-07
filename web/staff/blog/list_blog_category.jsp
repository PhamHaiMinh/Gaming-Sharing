<%-- 
    Document   : list_blog_category
    Created on : Dec 5, 2022, 12:09:51 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.BlogCategory"%>
<%@page import="model.Blog"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog Category List</title>
        <link rel="stylesheet" type="text/css"
              href="<%=request.getContextPath()%>/assets/css/styles.css" />
        <link rel="stylesheet" type="text/css"
              href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/templates/admin/js/check.js"></script>
        <script type="text/javascript"
        src="<%=request.getContextPath()%>/assets/js/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/jquery.validate.js"></script>
        <script type="text/javascript"
        src="<%=request.getContextPath()%>/assets/ckeditor/ckeditor.js"></script>
        <script type="text/javascript"
        src="<%=request.getContextPath()%>/assets/css/bootstrap.min.js"></script>
    </head>

    <body class="container-fluid">
        <div style="background-color: #f1f1f1;">

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
                <form action="search-cat" method="get" name="" class="form-inline" onsubmit="return checkSearch()" accept-charset="UTF-8" >
                    <div class="form-group">
                        <label class="control-label">Tên danh mục:</label>
                        <input type="text" class="form-control" name="catName" value="<%=catSearch %>"
                               maxlength="50" title="Tên danh mục là chữ cái nhỏ hơn 50 ký tự" />
                    </div>
                    <div class="form-group">
                        <input type="submit" class="form-control btn btn-success" id="" value="Tìm kiếm" name="search" style="width: 80px" />
                    </div>
                </form>
                <br />
                <div class="error" >
                    <span id="msg"><%if(error!=null) out.print(error); %></span>
                </div>
            </div>
            <div>
                <form action="add-cat" method="post" class="form-inline">
                    <div class="form-group left" style="padding-right: 10px">
                        <button type="submit" class="btn btn-info" name="showadd" >
                            <img src="<%=request.getContextPath() %>/assets/img/add.png" alt="" width="20" height="20"> Thêm
                        </button>
                    </div>
                </form>
                <form action="delete-cat" method="post" onsubmit="return checkDelete()" class="form-inline">
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
                            <th>STT</th>
                            <th>Chọn</th>
                            <th>ID</th>
                            <th>Tên danh mục</th>
                            <th>Mô tả</th>
                            <th>Sửa</th>
                        </tr>
                        <%
                                if(listCategory!=null){
                                        for(BlogCategory blogCat:listCategory){
                        %>
                        <tr>
                            <td><%=stt++ %></td>
                            <td>
                                <input type="checkbox" name="check" value="<%=blogCat.getId() %>">
                            </td>
                            <td><%=blogCat.getId() %></td>
                            <td><%=blogCat.getName() %></td>
                            <td><%=blogCat.getDescription() %></td>
                            <td>
                                <a href="edit-cat?showedit=1&id=<%=blogCat.getId()%>">Sửa</a>
                            </td>
                        </tr>
                        <%	
                                        }
                                }
                        %>
                    </table>
                    <!-- Phân trang. -->
                    <div class="right ">
                        <nav>
                            <ul class="pagination">
                                <%	
                                        String urlPage=request.getContextPath()+"/staff/blog/list_blog_category?page=";
                                        if(request.getParameter("search")!=null){
                                                urlPage=request.getContextPath()+"/staff/blog/search-cat?catName="+catSearch+"&search=1&page=";
                                        }
                                        String active="";
                                        int pages=(Integer)(request.getAttribute("pages"));
                                        int current_page=(Integer)(request.getAttribute("current_page"));
						
                                        for(int i=1;i<=pages;i++){
                                                if(current_page==i){
                                                        active=" class= 'btn disabled'";
                                                }else{
                                                        active="";
                                                }
                                                if(i==1){
                                %>
                                <li>
                                    <a href="<%=urlPage+i %>" <%=active %>>Đầu</a>
                                </li>
                                <li>
                                    <a href="<%=urlPage+(current_page-1)%>" <%=active %>>Trước</a>
                                </li>
                                <%} %>
                                <li>		
                                    <%
                                            if(i==current_page){
                                    %>
                                    <a href="<%=urlPage+i%>" <%=active %>><%=i %></a>
                                    <%
                                            }
                                    %>	
                                </li>
                                <%if(i==pages) {%>
                                <li>
                                    <a href="<%=urlPage+(current_page+1)%>" <%=active %>>Sau</a>
                                </li>
                                <li>
                                    <a href="<%=urlPage+i%>" <%=active %>>Cuối</a>
                                </li>
                                <%	
                                                }
                                        } 
                                %>
                            </ul>
                        </nav>
                    </div>
                </form>
            </div>
        </div>
        <!-- Kiem tra du lieu tim kiem -->
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
        </script>
    </body>							
</html>
