<%-- 
    Document   : register
    Created on : Nov 29, 2022, 1:11:34 AM
    Author     : hami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login Form</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/register.css">
        <style>
            .navbar {
                padding: 0;
            }
            .navbar ul {
                margin: 0;
                padding: 0;
                display: flex;
                list-style: none;
                align-items: center;
            }

            .navbar li {
                position: relative;
            }

            .navbar>ul>li {
                margin-left: 5px;
            }

            .navbar li {
                position: relative;
            }
            .navbar>ul>li {
                margin-left: 5px;
            }
            .navbar a,
            .navbar a:focus {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 25px 15px 24px 15px;
                font-size: 14px;
                color: #fff;
                white-space: nowrap;
                transition: 0.3s;
            }
            .navbar a i,
            .navbar a:focus i {
                font-size: 12px;
                line-height: 0;
                margin-left: 5px;
            }

            .navbar a:hover,
            .navbar .active,
            .navbar .active:focus,
            .navbar li:hover>a {
                background: #cc1616;
            }

            .navbar .dropdown ul {
                display: block;
                position: absolute;
                left: 0;
                top: calc(100% + 30px);
                margin: 0;
                padding: 10px 0;
                z-index: 99;
                opacity: 0;
                visibility: hidden;
                background: #fff;
                box-shadow: 0px 0px 30px rgba(127, 137, 161, 0.25);
                transition: 0.3s;
            }
            .navbar .dropdown ul li {
                min-width: 200px;
            }

            .navbar .dropdown ul li {
                min-width: 200px;
            }
            .navbar .dropdown ul a {
                padding: 10px 20px;
                color: #191919;
            }

            .navbar .dropdown ul a i {
                font-size: 12px;
            }

            .navbar .dropdown ul a i {
                font-size: 12px;
            }
            .navbar .dropdown ul a:hover,
            .navbar .dropdown ul .active:hover,
            .navbar .dropdown ul li:hover>a {
                color: #fff;
            }

            .navbar .dropdown:hover>ul {
                opacity: 1;
                top: 100%;
                visibility: visible;
            }

            .navbar .dropdown .dropdown ul {
                top: 0;
                left: calc(100% - 30px);
                visibility: hidden;
            }

            .navbar .dropdown .dropdown:hover>ul {
                opacity: 1;
                top: 0;
                left: 100%;
                visibility: visible;
            }

            @media (max-width: 1366px) {
                .navbar .dropdown .dropdown ul {
                    left: -90%;
                }

                .navbar .dropdown .dropdown:hover>ul {
                    left: -100%;
                }
            }
            #this:hover{
                /*pointer-events: none;*/
                background: none;
            }
            #header{
                background: #191919;
            }
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
    </head>
    <body class="img js-fullheight" style="background-image: url(assets/img/bg.jpg); background-repeat: no-repeat; background-size: cover">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Login</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">

                            <form action="login" class="signin-form needs-validation" novalidate method="post">
                                <div class="form-group">
                                    <input id="username" type="text" class="form-control" placeholder="Username" required value="${username}" name="username"/>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>  
                                    <div class="invalid-feedback">
                                        Please input username.
                                    </div> 
                                </div>
                                <div class="input-group">

                                    <input id="password" type="password" class="form-control"   
                                           pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,16}$"
                                           placeholder="Password" required value="${password}" name="password" />
                                    <span class="input-group-text" style="border-radius: 0 40px 40px 0;">
                                        <i class="fa fa-eye-slash" id="togglePassword" 
                                           style="cursor: pointer"></i>
                                    </span>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                    <div class="invalid-feedback">
                                        Must contain at least one number and one uppercase and lowercase letter and special characters, the length is 8-16 characters
                                    </div> 
                                </div>
                                <div class="d-flex my-3  justify-content-between">
                                    <div class="form-check">
                                        <input
                                            type="checkbox"
                                            class="form-check-input uf-form-check-input"
                                            id="remember"
                                            name="remember"
                                            />
                                        <label for="remember">
                                            Remember Me
                                        </label>
                                    </div>
                                    <a href="<%=request.getContextPath()%>/reset_password">Forgot password?</a>
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary btn-block btn-lg" name="btn-register" value="Login">
                                </div>

                            </form>
                            <div class="text-center pt-4">
                                <p class="m-0 ">Do not have an account? <a href="<%=request.getContextPath()%>/register" class="text-black">Sign Up</a></p>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
            <div class="position-fixed w-100">
                <c:if test="${login == 'false'}">
                    <button class="alert alert-danger d-flex align-items-center position-absolute ms-3 pe-auto" id="alert" role="alert" onclick="closeAlertModal()">
                        <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                        <div>
                            Your email or password is incorrect!
                        </div>
                    </button>
                </c:if>
            </div>
        </section>

        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/popper.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/main.js"></script>
        <script>
                        (() => {
                            'use strict'
                            const forms = document.querySelectorAll('.needs-validation')
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
                        const togglePassword = document.querySelector("#togglePassword");
                        const password = document.querySelector("#password");
                        togglePassword.addEventListener("click", function () {
                            const type = password.getAttribute("type") === "password" ? "text" : "password";
                            password.setAttribute("type", type);
                            this.classList.toggle('fa-eye');
                            this.classList.toggle('fa-eye-slash');
                        });
                        setTimeout(closeAlertModal, 2000)
                        function closeAlertModal() {
                            let modal = document.getElementById("alert");
                            modal.classList.add("fadeOutLeft");
                        }
        </script>
    </body>
</html>

