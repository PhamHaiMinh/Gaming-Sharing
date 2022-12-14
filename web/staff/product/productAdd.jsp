
<%-- 
   Document   : newjsp
   Created on : 29-11-2022, 22:19:47
   Author     : haimi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
    </head>
    <body>
        <%@include file="../layout/left.jsp"%>
        <div class="container-80 pb-5 d-flex justify-content-center " style="flex-direction: column;">
            <div class="text-center py-3">
                <h1 class="title">New Product</h1>
            </div>
            <form id="form" action="create" method="POST"  class=" card p-3 needs-validation mx-3" novalidate   enctype="multipart/form-data">
                <div class="row my-2" >
                    <div class="col">
                        <label  class="form-label">Name</label ><br/>
                        <input class="text-name" type="text"  required  placeholder="Name..."  name="name"/>
                        <div class="valid-feedback">
                            Valid
                        </div>
                        <div class="invalid-feedback">
                            Please input Name
                        </div>
                    </div>

                </div>
                <div class="row my-2">
                    <div class="col-6" >
                        <label  class="form-label">Category:</label ><br/>
                        <select class="form-select form-select-sm" required aria-label=".form-select-sm example"  name="categoryId">
                            <c:forEach items="${requestScope.categories}" var="o">
                                <option value="${o.id}">${o.name}</option>     
                            </c:forEach>
                        </select>
                        <div class="valid-feedback">
                            Valid
                        </div>
                        <div class="invalid-feedback">
                            Please input Category
                        </div>
                    </div>
                </div>
                <div class="row my-2">
                    <div class="col">
                        <label  class="form-label">Quantity</label ><br/>
                        <input class="text-name" type="number" required  placeholder="Quantity..." name="quantity" id="category-input"/>
                        <div class="valid-feedback">
                            Valid
                        </div>
                        <div class="invalid-feedback">
                            Please input Quantity
                        </div>
                    </div>
                    <div class="col">
                        <label  class="form-label">Price</label ><br/>
                        <input class="text-name" type="number" required  placeholder="Price..." name="price" id="category-input"/>
                        <div class="valid-feedback">
                            Valid
                        </div>
                        <div class="invalid-feedback">
                            Please input Price
                        </div>     
                    </div>
                    <div class="col" >
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

                <div class="my-2" >
                    <label  class="form-label">Description</label ><br/>
                    <textarea id="id" name="description" rows="5" required class="editor" cols="10"></textarea>
                    <div class="valid-feedback">
                        Valid
                    </div>
                    <div class="invalid-feedback">
                        Please input Description
                    </div>  
                </div>
                <div class="my-2" >
                    <input type="submit" class="btn btn-primary" value="Create">
                </div>
            </form>
        </div>
        <script src="<%=request.getContextPath()%>/assets/ckeditor/ckeditor.js"></script>		<script>
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
        <%@include file="../layout/footer.jsp"%> 
    </body>
</html>
