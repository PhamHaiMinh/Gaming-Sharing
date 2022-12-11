
<%@include file="../layout/index.jsp" %>
<div class=" container m-3 d-flex justify-content-center" style="flex-direction: column;">
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
