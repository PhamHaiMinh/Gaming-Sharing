
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
        <title>Category</title>
    </head>
    <body>
        <%@include file="../layout/left.jsp"%>
        <div class="container-80 py-5 d-flex justify-content-center" style="flex-direction: column;">
            <div class="text-center">
                <h1 class="title">Update Category</h1>
            </div>
            <form id="form" action="update" method="POST"  class=" card p-3  needs-validation" novalidate   
                  style="width: 30rem;
                  margin: 2rem auto;">
                <input class="text-id" type="text"  value="${category.id}" name="id" hidden>
                <div class="my-2">
                    <label  class="form-label">Name</label ><br/>
                    <input class="text-name" type="text"  required value="${category.getName()}" placeholder="Name..."  name="name"/>
                    <div class="valid-feedback">
                        Valid
                    </div>
                    <div class="invalid-feedback">
                        Please input Name
                    </div>
                </div>
                <div class="my-2" >
                    <input type="submit" class="btn btn-primary" value="Update">
                </div>
            </form>
        </div>
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
