<%-- 
    Document   : detail
    Created on : Dec 9, 2022, 9:54:34 AM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.Impl.OrderDAOImpl"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Detail</title>
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
                        <c:forEach items="${products}" var="p">
                            <c:set var="i" value="${i+1}"/>
                            <tr>
                                <th scope="col">${i}</th>
                                <th scope="col">${p.name}</th>                           
                                <th scope="col">${p.category.name}</th>
                                <th scope="col">${p.quantity}</th>                       
                                <th scope="col">${p.price}</th>
                                <th scope="col">${p.image}</th>
                                <th scope="col">${p.quantity*p.price}</th>
                            </tr>
                        </c:forEach>                       
                    </tbody>
                </table>
                <%OrderDAOImpl od = new OrderDAOImpl();
                if(od.canOrderEdit(Integer.parseInt(request.getParameter("id")))){ %>
                <a class="btn btn-primary" style="position: absolute;right: 240px;" href="<%= request.getContextPath()%>/staff/order/reject?id=${id}" role="button">Reject</a>
                <a class="btn btn-primary" style="position: absolute;
                   right: 150px;" href="<%= request.getContextPath()%>/staff/order/detail/edit?id=${id}" role="button">Edit</a>
                <a class="btn btn-primary" style="position: absolute;
                   right: 60px;" href="<%= request.getContextPath()%>/staff/order/accept?id=${id}" role="button">Accept</a>

                <%}%>


            </div>
            <jsp:include page="../layout/footer.jsp"></jsp:include>     

    </body>
</html>

