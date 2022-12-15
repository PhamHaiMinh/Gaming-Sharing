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
        src="<%=request.getContextPath()%>/assets/css/bootstrap.min.js"></script>

    </head>

    <body>
        <%@include file="../layout/left.jsp"%>
        <%
                ArrayList<BlogCategory> listCategory = (ArrayList<BlogCategory>) request.getAttribute("listCategory");
                String error = (String)request.getAttribute("error");
        %>
        <div class="error">
            <span><%if(error!=null) out.print(error); %></span>
        </div>
        <div class="container-80 pb-5 d-flex justify-content-center p-3" style="flex-direction: column;">
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
                        <textarea id="editor" class="editor" name="body" required></textarea>
                    </div>
                </div>
                <style>
                    .ck-editor__editable {
                        min-height: 200px !important;
                    }
                </style>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-2">
                        <button type="submit" class="btn btn-success">Thêm</button>
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
        <script src="<%=request.getContextPath()%>/assets/ckeditor/ckeditor.js"></script>		
        <script>
            const watchdog = new CKSource.EditorWatchdog();
            window.watchdog = watchdog;
            watchdog.setCreator((element, config) => {
                return CKSource.Editor
                        .create(element, config)
                        .then(editor => {
                            return editor;
                        })
            });
            watchdog.setDestructor(editor => {
                return editor.destroy();
            });
            watchdog.on('error', handleError);
            watchdog
                    .create(document.querySelector('.editor'), {
                        licenseKey: '',
                    })
                    .catch(handleError);
            function handleError(error) {
                console.error('Oops, something went wrong!');
                console.error('Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:');
                console.warn('Build id: 2ycx6bilba5o-l3dah0kel02');
                console.error(error);
            }

        </script>
        <script >
            (() => {
                'use strict'
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                const forms = document.querySelectorAll('.needs-validation')

                // Loop over them and prevent submission
                Array.from(forms).forEach(form => {
                    form.addEventListener('submit', event => {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }

                        form.classList.add('was-validated')
                    }, false)
                })
            })()
        </script> 
    </body>
</html>
