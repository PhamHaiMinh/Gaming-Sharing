<%-- 
    Document   : detail
    Created on : Dec 9, 2022, 9:54:34 AM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Detail</title>
        <style>
            .content{
                display: flex;
                flex: 1;
                flex-direction: column;
                width: 100%;
            }
            .line{
                background-color: black;
                width: -webkit-fill-available;
                height: 1px;
                margin-bottom: 5px;
            }
            h2 {
                padding-left: 10px;
            }
            p{
                padding-left: 20px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../layout/left.jsp"></jsp:include>
            <div class="container-70 d-flex justify-content-center flex-column">
                <div class="container">
                    <h2>Thanh toán</h2>
                    <div class="line"></div>
                    <p>Địa chỉ: ${user.address.detail}, ${user.address.ward}, ${user.address.district}, ${user.address.province}</p>
                <p>Tên: ${user.last_name} ${user.middle_name} ${user.first_name}</p>
                <p>Giới tính: 
                    <c:if test="${user.gender}">
                        Nam
                    </c:if>
                    <c:if test="${!user.gender}">
                        Nữ
                    </c:if>
                </p>
                <p>Số điện thoại: ${user.phone}</p>
                <p>Email: ${user.account.email}</p>


                <h2>Sản phẩm</h2>
                <div class="line"></div>
                <table class="table m-3" style="width: initial;">
                    <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">Name</th>                           
                            <th scope="col">Category</th>
                            <th scope="col">Quantity</th>                       
                            <th scope="col">Price</th>
                            <th scope="col">Image</th>
                            <th scope="col">Total</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="i" value="0"></c:set>
                            <tr>
                                <th scope="col">1</th>
                                <th scope="col">${product.name}</th>                           
                            <th scope="col">${product.category.name}</th>
                            <th scope="col">${product.quantity}</th>                       
                            <th scope="col">${product.price}</th>
                            <th scope="col">${product.image}</th>
                            <th scope="col">${product.quantity*product.price}</th>
                        </tr>
                    </tbody>
                </table>
                <a class="btn btn-primary" href="#" role="button">Accept</a>
            </div>
        </div>
        <jsp:include page="../layout/footer.jsp"></jsp:include>     

    </body>
</html>

