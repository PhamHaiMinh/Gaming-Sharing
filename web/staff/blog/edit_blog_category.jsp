<%-- 
    Document   : edit_blog_category
    Created on : Dec 5, 2022, 12:09:29 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Add Blog Category </title>
            <link rel="stylesheet" type="text/css"
                  href="<%=request.getContextPath()%>/assets/css/styles.css" />
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

        <body class="container-fluid">
            <div style="background-color: #f1f1f1;">
                <%
                    BlogCategory blogCategory = (blogCategory) request.getAttribute("blogCategory");
                    String error = (String) request.getAttribute("error");
                %>
                <h2>Thêm danh mục</h2>
                <div class="loi">
                    <span> <% if (error != null) out.print(error); %>
                    </span>
                </div>
                <form action="/staff/blog/edit-cat?edit=1&id=<%=blogCategory.getID() %>" method="post" class="form-horizontal" onsubmit="return checkAdd()">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Tên danh mục *</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" value="<%=blogCategory.getName() %>"
                                   name="catName" required maxlength="50">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Mô tả *</label>
                        <div class="col-sm-10">
                            <textarea rows="4" cols="50" name="description" required="required" maxlength="100"> <%=blogCategory.getDescription() %></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-2">
                            <button type="submit" class="btn btn-success" name="add">Sửa</button>
                        </div>
                        <div class="col-sm-2">
                            <button type="reset" class="btn btn-danger" onclick="resetForm();">Nhập lại</button>
                        </div>
                    </div>
                </form>
            </div>
            <script type="text/javascript">
                function resetForm() {
                    for (instance in CKEDITOR.instances) {
                        CKEDITOR.instances[instance].setData('');
                    }
                }
            </script>
        </div>
    </body>
</html>
