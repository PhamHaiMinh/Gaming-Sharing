<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html lang="en">
    <head>
        <title>GSharing</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    </head>


    <%@include file="../header.jsp"  %>
    <!-- Shop Detail Start -->
    <div class="container-fluid pb-5">
        <div class="row px-xl-5">
            <div class="col-lg-5 mb-30">
                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-item active" style="text-align:center">
                        <img style="width: 70%; height: 70%;" 
                             src="${product.image}"
                             alt="${product.name}">
                    </div>
                </div>
            </div>

            <div class="col-lg-7 h-auto mb-30">
                <div class="h-100 bg-light p-30">
                    <h3>${product.name}</h3>
                    <div class="d-flex mb-3">
                        <small class="pt-1">${product.viewed} người xem</small>
                    </div>
                    <h3 class="font-weight-semi-bold mb-4 text-success">
                        <script type="text/javascript">
                            var str = parseInt(${product.getPrice()})
                            document.write(str.toLocaleString('vi', {style: 'currency', currency: 'VND'}));
                        </script>
                    </h3>
                    <div class="d-flex mb-3">
                        <strong class="text-dark mr-3">Danh mục:</strong>
                        ${product.category.name}
                    </div>
                    <div class="d-flex mb-4">
                        <strong class="text-dark mr-3">Số lượng:</strong>
                        ${product.quantity}
                    </div>
                    <div class="d-flex align-items-center mb-4 pt-2">
                        <div class="input-group quantity mr-3" style="width: 170px;">
                            <div class="input-group-btn">
                                <button class="btn btn-primary btn-minus">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                            <input type="number" class="form-control bg-secondary border-0 text-center" value="1" min="1" max="${product.quantity}">
                            <div class="input-group-btn">
                                <button class="btn btn-primary btn-plus">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>
                        <button class="btn btn-primary px-3"><i class="fa fa-shopping-cart mr-1"></i> Thêm vào giỏ hàng</button>
                        <%
                           if (account != null && account.getRole()== 2) {
                        %>
                        <a class="btn btn-info mx-3" href="<%=request.getContextPath()%>/staff/product/update?id=${product.id}">
                            <i class="fa fa-tools">
                            </i> Chỉnh sửa</a>
                            <%}%>
                    </div>
                </div>
            </div>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="bg-light p-30">
                    <div class="nav nav-tabs mb-4">
                        <a class="nav-item nav-link text-dark active" data-toggle="tab" href="#tab-pane-1">Mô tả</a>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="tab-pane-1">
                            ${product.description}          
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Shop Detail End -->


    <!-- Products Start -->
    <div class="container-fluid py-5">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Có thể bạn sẽ thích</span></h2>
        <div class="row px-xl-5">
            <div class="col">
                <div class="owl-carousel related-carousel">
                    <c:forEach items="${products}" var="p">
                        <div class="product-item bg-light">
                            <div class="product-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="${p.image}" alt="">
                                <div class="product-action">
                                    <a class="btn btn-outline-dark btn-square" href="#"><i class="fa fa-shopping-cart"></i></a>
                                    <a class="btn btn-outline-dark btn-square" href="<%=request.getContextPath()%>/product/detail?id=${p.id}"><i class="fa fa-search"></i></a>
                                    <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                                </div>
                            </div>
                            <div class="text-center py-4">
                                <a class="h6 text-decoration-none text-truncate" href="<%=request.getContextPath()%>/product?categoryId=${p.categoryId}">${p.getCategory().getName()}</a>
                                <div class="d-flex align-items-center justify-content-center mt-2">
                                    <a class="h5 text-decoration-none text-truncate" href="<%=request.getContextPath()%>/product/detail?id=${p.id}">${p.name}</a>
                                </div>
                                <div class="d-flex align-items-center justify-content-center mt-2">
                                    <h6>${p.price} vnd</h6>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <!-- Products End -->
    <%@include file="../footer.jsp"  %>

</html>


