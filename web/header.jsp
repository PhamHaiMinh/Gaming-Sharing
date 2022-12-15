<%-- 
    Document   : header
    Created on : Dec 5, 2022, 10:15:42 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta charset="utf-8">
    <title>GSharing</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page import="Model.*" import="Dao.*"  import="Dao.Impl.*" import="java.util.List" %>
    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <!-- Libraries Stylesheet -->
    <link href="<%=request.getContextPath()%>/assets/lib/animate/animate.min.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/assets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Navbar Start -->
    <div class="container-fluid bg-dark mb-30">
        <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0 ">
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a href="<%=request.getContextPath()%>/home" class="text-decoration-none my-2 d-flex flex-column">
                <span class="h6 text-uppercase text-primary bg-dark px-2">Gaming</span>
                <span class="h6 text-uppercase text-dark bg-primary px-2">Sharing</span>
            </a> 
            <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                <div class="navbar-nav mr-auto py-0">
                    
                    <a href="<%=request.getContextPath()%>/home" class="nav-item nav-link <%=request.getServletPath().startsWith("/home")?"active":""%>">Trang chủ</a>
                    <a href="<%=request.getContextPath()%>/product" class="nav-item nav-link <%=request.getServletPath().startsWith("/product")?"active":""%>">Sản phẩm</a>
                    <a href="<%=request.getContextPath()%>/list-blog" class="nav-item nav-link <%=request.getServletPath().startsWith("/blog")?"active":""%>">Blog</a>
                    <div class="d-block">
                        <a class="nav-item nav-link" data-toggle="collapse"
                           href="#navbar-vertical">
                            Danh mục
                        </a>
                        <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light"
                             id="navbar-vertical" style="z-index: 999;">
                            <div class="navbar-nav w-100" style="flex-direction: column;">
                                <c:forEach items="${categories}" var="c">
                                    <a href="<%=request.getContextPath()%>/product?categoryId=${c.id}" class="nav-item nav-link text-black-50">${c.name}</a>
                                </c:forEach>
                            </div>
                        </nav>
                    </div>
                </div>
                <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                    <a href="" class="btn px-0">
                        <i class="fas fa-heart text-primary"></i>
                        <span class="badge text-secondary border border-secondary rounded-circle"
                              style="padding-bottom: 2px;">0</span>
                    </a>
                    <a href="<%=request.getContextPath()%>/cart" class="btn px-0 ml-3">
                        <i class="fas fa-shopping-cart text-primary"></i>
                        <span class="badge text-secondary border border-secondary rounded-circle"
                              style="padding-bottom: 2px;">0</span>
                    </a>
                    <%
                         Account account = (Account) request.getSession().getAttribute("account");
                         if(account == null){
                    %>
                    <a href="<%=request.getContextPath()%>/login" class="btn px-0 ml-3">Đăng nhập</a>
                    <%
                    }else{
                    %>
                    <div class="btn-group">
                        <a  class="nav-item nav-link ml-3"  data-toggle="dropdown">${account.username}</a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <button class="dropdown-item" type="button" onclick="window.location.href = '<%=request.getContextPath()%>/profile'">Thông tin tài khoản</button>
                            <button class="dropdown-item" type="button" onclick="window.location.href = '<%=request.getContextPath()%>/logout'">Đăng xuất</button>
                        </div>
                    </div>
                    <%}%>
                </div>     
            </div>
        </nav>
    </div>

<!-- Navbar End -->    