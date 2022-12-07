<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="utf-8">
        <title>Sign In</title>
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
                        <h2 class="mb-2 text-center">Edit Profile</h2>
                        <form action="<%=request.getContextPath()%>/UpdateProfile" method="POST">
                            <h4 class="font-500">Email</h4>
                            <input name="username" class="form-control form-control-lg mb-3" type="text" required readonly="" placeholder="Emaill " value="${sessionScope.account.email}" >
                            <h4 class="font-500">User Name</h4>
                            <input name="username" class="form-control form-control-lg mb-3" type="text" required readonly="" maxlength="50" placeholder="User Name" value="${sessionScope.account.username}" >
                            <h4 class="font-500">First Name</h4>
                            <input name="first_name" class="form-control form-control-lg mb-3" type="text" required maxlength="50" placeholder="Full Name" value="${user.first_name}" >
                            <h4 class="font-500">Middle Name</h4>
                            <input name="middle_name" class="form-control form-control-lg mb-3" type="text" required maxlength="50" placeholder="Full Name" value="${user.middle_name}" >
                            <h4 class="font-500">Last Name</h4>
                            <input name="last_name" class="form-control form-control-lg mb-3" type="text" required maxlength="50" placeholder="Full Name" value="${user.last_name}" >
                            <h4 class="font-500">Phone</h4>
                            <input name="phone" class="form-control form-control-lg mb-3" type="text" required maxlength="11" placeholder="Phone" value="${user.phone}" >
                            <h4 class="font-500">gender</h4>
                            <div class="input-group " style="margin-bottom: 10px;">
                                <input name="gender" type="radio" value="1" ${user.gender?"checked":""} >Male
                                <input name="gender" type="radio" value="0" ${user.gender?"":"checked"}>Female
                            </div>
                            <h4 class="font-500">Avatar</h4>
                            <img id="myAvatar" style="border-radius: 15px;" src="${user.avatar}" width="120" >
                            <input name="avt" id="sendimg" type="hidden" >
                            <input id="fileAvatar" onchange="changeAvatar()" type="file" accept=".jpg, .jpeg, .png"><!-- comment -->
                            <span style="color: red" class="mb-3">${errorPassword}</span>
                            <input class="btn btn-primary btn-lg w-100 shadow-lg"  type="submit" value="Update" />
                        </form>
                    </div>

                </div>        
            </div>

        </div>
        <script>
            //                                    ChangeAvatar
            function changeAvatar() {
                var file = document.getElementById("fileAvatar").files[0];
                if (file.name.match(/.+\.(jpg|png|jpeg)/i)) {
                    if (file.size / (1024 * 1024) < 5) {
                        var fileReader = new FileReader();
                        fileReader.readAsDataURL(file);
                        fileReader.onload = function () {
                            document.getElementById("myAvatar").src = (fileReader.result);
                            document.getElementById("sendimg").value = (fileReader.result);
                        }
                    } else {
                        uploadError();
                    }
                } else {
                    uploadError();
                }
            }
        </script>
    </body>
</html>