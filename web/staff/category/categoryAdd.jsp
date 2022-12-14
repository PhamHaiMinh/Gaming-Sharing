
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
        <div class="container-80 d-flex justify-content-center flex-column">
            <div class="text-center">
                <h1 class="title">New Category</h1>
            </div>
            <form id="form" action="create" method="POST"  class=" card p-3  needs-validation" novalidate   
                  style="width: 30rem;
                  margin: 2rem auto;" >
                <div class="my-2">
                    <label  class="form-label">Name</label ><br/>
                    <input class="text-name" type="text"  required  placeholder="Name..."  name="name"/>
                    <div class="valid-feedback">
                        Valid
                    </div>
                    <div class="invalid-feedback">
                        Please input Name
                    </div>
                </div>
                <div class="my-2" >
                    <input type="submit" class="btn btn-primary" value="Create">
                </div>
            </form>
        </div>
        <%@include file="../layout/footer.jsp"%>
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
