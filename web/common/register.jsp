<%-- 
    Document   : register
    Created on : Nov 29, 2022, 1:11:34 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Register Form</title>
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
        </style>
    </head>
    <body style="height: 100vh">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Register</h2>

                        <p style="color:green">${success}</p>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">

                            <form action="register" class="signin-form" method="post">

                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Email" required name="email">
                                    <p style="color:red">${emailError}</p>
                                </div>
                                <div class="form-group">
                                    <input id="username" type="text" class="form-control" placeholder="Username" required name="username">
                                    <p style="color:red">${userError}</p>
                                    <p style="color:white">${example}</p>
                                </div>
                                <div class="form-group">
                                    <input id="password" type="password" class="form-control" placeholder="Password" required name="password"   pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,16}$"
                                           title="Must contain at least one number and one uppercase and lowercase letter special characters, the length is 8-16 characters">
                                    <span toggle="#password" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary btn-block btn-lg" name="btn-register" value="Register">
                                </div>
                            </form>
                            <div id="message">
                                <h3>Password must contain:</h3>
                                <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
                                <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
                                <p id="number" class="invalid">A <b>number</b></p>
                                <p id="spchar" class="invalid">A <b>special character</b></p>
                                <p id="length" class="invalid"> <b>8-16 characters</b></p>
                            </div>
                            <p style='color:red'>${requestScope.message}</p>
                            <p class="w-100 text-center">&mdash; Already have an account &mdash;</p>
                            <div class="social d-flex text-center">
                                <a href="login" class="btn btn-secondary btn-block btn-lg"> Login</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/popper.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/main.js"></script>
        <script>

            var myInput = document.getElementById("password");
            var letter = document.getElementById("letter");
            var capital = document.getElementById("capital");
            var number = document.getElementById("number");
            var length = document.getElementById("length");
            var spchar = document.getElementById("spchar");
            myInput.onfocus = function () {
                document.getElementById("message").style.display = "block";
            };

            myInput.onblur = function () {
                document.getElementById("message").style.display = "none";
            };

            myInput.onkeyup = function () {
                // Validate lowercase letters
                var lowerCaseLetters = /[a-z]/g;
                if (myInput.value.match(lowerCaseLetters)) {
                    letter.classList.remove("invalid");
                    letter.classList.add("valid");
                } else {
                    letter.classList.remove("valid");
                    letter.classList.add("invalid");
                }

                var upperCaseLetters = /[A-Z]/g;
                if (myInput.value.match(upperCaseLetters)) {
                    capital.classList.remove("invalid");
                    capital.classList.add("valid");
                } else {
                    capital.classList.remove("valid");
                    capital.classList.add("invalid");
                }

                var numbers = /[0-9]/g;
                if (myInput.value.match(numbers)) {
                    number.classList.remove("invalid");
                    number.classList.add("valid");
                } else {
                    number.classList.remove("valid");
                    number.classList.add("invalid");
                }

                if (myInput.value.length >= 8 && myInput.value.length <= 16) {
                    length.classList.remove("invalid");
                    length.classList.add("valid");
                } else {
                    length.classList.remove("valid");
                    length.classList.add("invalid");
                }
                var spChar = /[!@#$&*]/g;
                if (myInput.value.match(spChar)) {
                    spchar.classList.remove("invalid");
                    spchar.classList.add("valid");
                } else {
                    spchar.classList.remove("valid");
                    spchar.classList.add("invalid");
                }
            };
        </script>
    </body>
</html>
