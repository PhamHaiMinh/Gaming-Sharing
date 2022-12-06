<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="utf-8">
        <title>Reset password</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
                integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
                integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
        crossorigin="anonymous"></script>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    </head>
    <body>

        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-6 col-12 mx-auto">
                    <div class="p-5 bg-white rounded shadow-lg">
                        <h2 class="mb-2 text-center">Reset password</h2>
                        <form action="<%=request.getContextPath()%>/ConfirmResetPass" method="POST">
                            <input name="email" class="form-control form-control-lg mb-3" type="text" readonly="" value="${param.email}" >
                            <h4 class="font-500">New Password</h4>
                            <input name="newpass" class="form-control form-control-lg mb-3" type="password" required  placeholder="newpass" >
                            <h4 class="font-500">Confirm Password</h4>
                            <input name="cfpass" class="form-control form-control-lg mb-3" type="password" required  placeholder="cfpass"  >
                            <span style="color: red" class="mb-3">${mess}</span>
                            <input class="btn btn-primary btn-lg w-100 shadow-lg"  type="submit" value="Login" />
                        </form>
                    </div>
                </div>        
            </div>
        </div>

    </body>
</html>