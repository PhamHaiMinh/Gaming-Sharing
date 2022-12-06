<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>GSharing</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $(".content").slice(0, 18).show();
                $("#loadMore").on("click", function (e) {
                    e.preventDefault();
                    $(".content:hidden").slice(0, 18).slideDown();
                    if ($(".content:hidden").length == 0) {
                        $("#loadMore").text("No Content").addClass("noContent");
                    }
                });
            })
        </script>
    </head>

    <body>
        <%@include file="header.jsp"  %>
        <!-- Shop Start -->
        <div class="container-fluid">
            <div class="row px-xl-5">
                <!-- Shop Sidebar Start -->
                <div class="col-lg-3 col-md-4">
                    <form action="product" method="get" >  
                        <!-- Price Start -->
                        <input type="submit" class="btn btn-primary" style="width: -webkit-fill-available" value="Tìm kiếm">
                        <h5 class="section-title position-relative text-uppercase my-3"><span class="bg-secondary pr-3">Tìm kiếm </span></h5>
                        <div class="bg-light p-2 mb-30">
                            <input name="search" type="text" class="form-control" placeholder="Search" value="${search}">
                        </div>

                        <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Bộ Lọc </span></h5>
                        <div class="bg-light p-2 mb-30">
                            <div class="form-check">
                                <input  type="radio" name="sort" ${sort == 'sortNameDesc'? 'checked':''}  value="sortNameDesc" >
                                <label class="form-check-label  ">
                                    Tên từ a đến z
                                </label>
                            </div> 

                            <div class="form-check">
                                <input  type="radio" name="type" ${sort == 'sortNameAsc'? 'checked':''}  value="sortNameAsc">
                                <label class="form-check-label  ">
                                    Tên từ z đến a
                                </label>
                            </div> 
                            <div class="form-check">
                                <input  type="radio" name="sort" ${sort == 'sortPriceDesc'? 'checked':''} value="sortPriceDesc">
                                <label class="form-check-label  ">
                                    Giá từ thấp đến cao
                                </label>
                            </div> 
                            <div class="form-check">
                                <input  type="radio" name="sort"  ${sort == 'sortPriceDesc'? 'checked':''} value="sortPriceAsc">
                                <label class="form-check-label  ">
                                    Giá từ cao xuống thấp
                                </label>
                            </div> 
                            <div class="form-check">
                                <input  type="radio" name="sort"  ${sort == 'sortView'? 'checked':''} value="sortView">
                                <label class="form-check-label  ">
                                    Nhiều người xem nhất
                                </label>
                            </div> 
                            <div class="form-check">
                                <input  type="radio" name="sort"  ${sort == 'sortNew'? 'checked':''} value="sortNew">
                                <label class="form-check-label  ">
                                    Mới nhất 
                                </label>
                            </div> 
                        </div>

                        <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Giá </span></h5>
                        <div class="bg-light p-2 mb-30">

                            <div class="">
                                <label>Từ</label>
                                <input name="minPrice" class="form-control" placeholder="$0" type="number" min="0" max="1000000000" value="${minPrice}" />
                            </div>
                            <div class="">
                                <label>Đến</label>
                                <input name="maxPrice" class="form-control" placeholder="$0" type="number" min="0" max="1000000000" value="${maxPrice}" />
                            </div><!-- card-body.// -->
                        </div>
                        <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Danh Mục</span></h5>
                        <div class="bg-light p-2 mb-30">
                            <c:forEach items="${categories}" var="c">
                                <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                    <input type="radio"  name="categoryId" value="${c.name} "  ${c.id == categoryId? 'checked':''}>
                                    <label class="custom-control-label" for="price-all">${c.name}</label>
                                </div>
                            </c:forEach>
                        </div>
                        <input type="submit" value="Button">
                    </form>
                </div>
                <!-- Shop Sidebar End -->

                <!-- Shop Product Start -->
                <div class="col-lg-9 col-md-8">
                    <div class="row  ">
                        <c:forEach items="${products}" var="p">
                            <div class="col-lg-3 col-md-4 col-sm-6 pb-1 content category-${p.categoryId}">
                                <div class=" bg-light mb-4">
                                    <div class="product-img position-relative overflow-hidden">
                                        <img class="img-fluid w-100" src="${p.image}" alt="">
                                        <div class="product-action">
                                            <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                            <a class="btn btn-outline-dark btn-square" href="<%=request.getContextPath()%>/product/${p.id}"><i class="fa fa-search"></i></a>
                                        </div>
                                    </div>
                                    <div class="text-center py-4">
                                        <a class="h6 text-decoration-none text-truncate" href="<%=request.getContextPath()%>/category/${p.categoryId}">${p.getCategory().getName()}</a>              
                                        <div class="d-flex align-items-center justify-content-center mt-2">
                                            <a class="h5 text-decoration-none text-truncate" href="<%=request.getContextPath()%>/product/${p.id}">${p.name}</a>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-center mt-2">
                                            <h6>${p.price}vnd</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- Shop Product End -->
            </div>
        </div>
        <!-- Shop End -->
        <!-- Shop Product End -->

        <div class="text-center mb-5 btn-load">
            <button type="button" class="btn btn-outline-primary rounded-3" id="loadMore" >
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-down" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M1.646 6.646a.5.5 0 0 1 .708 0L8 12.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
                <path fill-rule="evenodd" d="M1.646 2.646a.5.5 0 0 1 .708 0L8 8.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
                </svg>
                See More
            </button>
        </div>
        <%@include file="footer.jsp"  %>
    </body>
</html>


