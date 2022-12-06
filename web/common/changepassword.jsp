<%-- 
    Document   : changepassword
    Created on : 01-Dec-2022, 11:26:05
    Author     : Windows 10-DPC
--%>

<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="utf-8">
        <title>Change Password</title>
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
                        <h2 class="mb-2 text-center">Change password</h2>
                        
                        <form action="ChangePassword" method="POST">
                            <input type="hidden" name="user" value="${sessionScope.account.username}"
                            <h4 class="font-500">Old password</h4>
                            <input name="opass" class="form-control form-control-lg mb-3" type="password" required  placeholder="Enter old password" >
                            <h4 class="font-500">New Password</h4>
                            <div class="input-group ">
                                <input class="form-control form-control-lg" id="password" name="npass" type="password" placeholder="Enter new password" >
                            </div>
                            <h4 class="font-500">Re-enter New Password</h4>
                            <div class="input-group ">
                                <input class="form-control form-control-lg" id="password" name="renpass" type="password" placeholder="Enter new password" >
                                
                            </div>
                            <span style="color: red" class="mb-3">${errorPassword}</span>
                            <div class="d-flex my-3  justify-content-between">
                                <div class="form-check">
                                    <input
                                        type="checkbox"
                                        class="form-check-input uf-form-check-input"
                                        id="remember"
                                        style="margin-top: 0.65rem;"
                                        />
                                </div>
                            </div>
                            <input class="btn btn-primary btn-lg w-100 shadow-lg"  type="submit" value="Confirm" />
                        </form>
                    </div>
                </div>        
            </div>

        </div>
        
    </body>
    
    
    <style>
        .fadeOutLeft{
            animation: fadeOutLeft 0.3s ease-in;
            animation-fill-mode: forwards;
        }
        @keyframes fadeOutLeft {
            0% {
                opacity: 1;
                transform: translateX(0);
            }
            50%{
                opacity: 1;
                transform: skewX(-5deg);
            }
            75%{
                opacity: 1;
                transform: skewX(5deg);
            }
            100% {
                opacity: 0;
                transform: translateX(-100%);
            }
        }
    </style>
</html>
