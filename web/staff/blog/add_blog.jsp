<%-- 
    Document   : add_blog
    Created on : Dec 5, 2022, 12:09:16 PM
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
        <title>Add Blog</title>
        <link rel="stylesheet" type="text/css"
              href="<%=request.getContextPath()%>/assets/css/style.css" />
        <link rel="stylesheet" type="text/css"
              href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/check.js"></script>
        <script type="text/javascript"
        src="<%=request.getContextPath()%>/assets/js/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/jquery.validate.js"></script>
        <script type="text/javascript"
        src="<%=request.getContextPath()%>/assets/js/ckeditor/ckeditor.js"></script>
        <script type="text/javascript"
        src="<%=request.getContextPath()%>/assets/css/bootstrap.min.js"></script>
        <script src="https://cdn.ckeditor.com/ckeditor5/35.4.0/classic/ckeditor.js"></script>
    </head>

    <body>

        <%
                ArrayList<BlogCategory> listCategory = (ArrayList<BlogCategory>) request.getAttribute("listCategory");
                String error = (String)request.getAttribute("error");
        %>
        <div class="error">
            <span><%if(error!=null) out.print(error); %></span>
        </div>
        <div style="background-color: #f1f1f1;" class="p-3">
            <form action="<%= request.getContextPath()%>/staff/blog/add-blog?add=1" method="post" class="form-horizontal" enctype="multipart/form-data" onsubmit="return checkAdd()">
                <div class="form-group">
                    <label class="col-sm-2 control-label">Tiêu đề *</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="title"  required maxlength="100">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Nguồn *</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="source" placeholder="Tác giả" required maxlength="50">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Danh mục *</label>
                    <div class="col-sm-4">
                        <select class="form-control" name="category">
                            <%
                                    for(BlogCategory blogCategory: listCategory){
                            %>
                            <option value="<%=blogCategory.getId()%>"><%=blogCategory.getName()%></option>
                            <%} %>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Độ ưu tiên: *</label>
                    <div class="col-sm-4">
                        <select class="form-control" name="priority">
                            <%
		   				
                                    for(int i = 1; i<=10; i++){
                                            String priority = "";
                                            if(i==1) priority=" (Thấp nhất)";
                                            if(i==10) priority=" (Cao nhất)";
                            %>
                            <option value="<%=i%>"><%=i+priority%></option>
                            <%} %>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Hình ảnh *</label>
                    <div class="col-sm-10">
                        <label  class="form-label">Select image:</label ><br/>
                        <input type="file" required id="img" name="image" required accept="image/*"> 
                        <div class="valid-feedback">
                            Valid
                        </div>
                        <div class="invalid-feedback">
                            Please input Image
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Nội dung *</label>
                    <div class="col-sm-10">
                        <textarea id="editor" name="body" required></textarea>
                        <script>
                            ClassicEditor
                                    .create(document.querySelector('#editor'))
                                    .then(editor => {
                                        console.log(editor);
                                    })
                                    .catch(error => {
                                        console.error(error);
                                    });
                        </script>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-2">
                        <button type="submit" class="btn btn-success" name="" formnovalidate="formnovalidate">Thêm</button>
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
            function checkImage(input) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var img = document.getElementById("img");
                    img.src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
            }
            function checkAdd() {
                var image, msg = "";
                image = document.getElementsByName("image")[0];
                var txt;
                if ('files' in image) {
                    if (image.files.length == 1) {
                        var file = image.files[0];
                        if ('size' in file) {
                            var sizeFile = file.size;
                            if (sizeFile > (1024 * 1024)) {//>2MB
                                msg = "Kích thước ảnh phải <= 2MB";
                            }
                        }
                        if ('name' in file) {
                            var nameFile = file.name;
                            if (nameFile.length < 1 || nameFile.length > 50) {
                                msg = "Tên ảnh phải <=50 ký tự";
                            }
                            var typeFile = nameFile.split('.')[nameFile.split('.').length - 1].toLowerCase();
                            if (!(typeFile == "jpg" || typeFile == "jpeg" || typeFile == "gif" || typeFile == "png")) {
                                msg = "Phải chọn file hình ảnh .jpg, .jpeg, .gif, .png";
                            }
                        }
                        if (msg != "") {
                            document.getElementById("error").innerHTML = msg;
                            document.getElementsByName("image")[0].focus();
                            return false;
                        }
                    }
                }
            }

        </script>
    </body>
</html>
