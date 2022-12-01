<%@page import="Model.*" import="Dao.*" import="Dao.Impl.*" import="java.util.ArrayList" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
        integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
crossorigin="anonymous"></script>
<style>
    a {
        text-decoration: none;
        color: black
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
<nav class="navbar navbar-dark bg-primary">
    <div class="container-fluid">
        <div class="d-flex align-items-center">
            <a class="" href="<%=request.getContextPath()%>/staff">
                <h3 style="color: white">Admin</h3>
            </a>
        </div>
        <ul class="nav nav-pills">
            <a class="dropdown-item" href="<%= request.getContextPath()%>/logout"  style="color: white">Logout</a>

        </ul>
    </div>
</nav>

<div class="  bg-info" style="
     float: left;
     height: 1200px;
     background-color: #e3f2fd;"
     >
    <ul class=" list-group list-group-flush bg-info">
        <li class="list-group-item  bg-info">
            <a href="<%= request.getContextPath()%>/staff" class="text-light"F>
                <h4>Dashboard</h3>
            </a>
        </li>
        <li class="list-group-item  bg-info" >
            <a href="<%= request.getContextPath()%>/staff/category" class="text-light">
                <h4>Category</h3>
            </a>
        </li>
        <li class="list-group-item  bg-info">
            <a href="<%= request.getContextPath()%>/staff/product" class="text-light">
                <h4>Product</h3>
            </a>
        </li>
    </ul>
</div>