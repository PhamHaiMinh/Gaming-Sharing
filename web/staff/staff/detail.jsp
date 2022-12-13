Document   : newjsp
Created on : 29-11-2022, 22:19:47
Author     : haimi
--%>

<%@include file="../layout/index.jsp" %>
<div class=" container m-3 d-flex justify-content-center" style="flex-direction: column;">
    <div class="container mt-5">
        <div class="row">
            <div class="col-lg-6 col-12 mx-auto">
                <div class="p-5 bg-white rounded shadow-lg">
                        <h2 class="mb-2 text-center">Profile</h2>
                        <img style="margin-left: 40%" width="90px" height="90px" src="${user.avt}">
                        <h4 class="font-500">Email</h4>
                        <input name="username" class="form-control form-control-lg mb-3" type="text" required readonly placeholder="Emaill " value="${user.account.email}" >
                        <h4 class="font-500">User Name</h4>
                        <input name="username" class="form-control form-control-lg mb-3" type="text" required readonly maxlength="50" placeholder="User Name" value="${user.account.username}" >
                        <h4 class="font-500">First Name</h4>
                        <input name="first_name" class="form-control form-control-lg mb-3" type="text" required readonly maxlength="50" placeholder="Full Name" value="${user.first_name}" >
                        <h4 class="font-500">Middle Name</h4>
                        <input name="middle_name" class="form-control form-control-lg mb-3" type="text" required readonly maxlength="50" placeholder="Full Name" value="${user.middle_name}" >
                        <h4 class="font-500">Last Name</h4>
                        <input name="last_name" class="form-control form-control-lg mb-3" type="text" required readonly maxlength="50" placeholder="Full Name" value="${user.last_name}" >
                        <h4 class="font-500">Phone</h4> 
                        <input name="phone" class="form-control form-control-lg mb-3" type="text" required readonly maxlength="11" placeholder="Phone" value="${user.phone}" >
                        <h4 class="font-500">Gender</h4>
                        <div class="input-group " style="margin-bottom: 10px;">
                            <input name="gender" type="radio" value="1" disabled ${user.gender?"checked":""} >Male
                            <input name="gender" type="radio" value="0" disabled ${user.gender?"":"checked"}>Female
                        </div>
                        <h4 class="font-500">Status</h4>
                        <div class="input-group " style="margin-bottom: 10px;">
                            <input name="status" type="radio" value="1" disabled ${user.account.active?"checked":""} >Active
                            <input name="status" type="radio" value="0" disabled ${user.account.active?"":"checked"}>Inactive
                        </div>
                        <h4 class="font-500">Role</h4> 
                        <select name="role" class="form-select">
                            <c:forEach var="r" items="${listRole}">
                                <option value="${r.getRid()}" ${r.getRid() == user.account.getRole()?"selected":"" } disabled="">${r.getName()}</option>
                            </c:forEach>
                        </select>
                        <a class="btn btn-primary btn-lg w-100 shadow-lg"  href="UpdateStaff?sid=${param.sid}">
                            Update </a>
                    
                </div>

            </div>        
        </div>
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
