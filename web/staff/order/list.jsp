<%-- 
    Document   : cancel
    Created on : Dec 8, 2022, 5:30:53 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <jsp:include page="../layout/left.jsp"></jsp:include>
            <div class="container-80 p-4 d-flex flex-column mx-auto">
            <h2>Đơn chờ xử lý</h2>
            <input class="form-control" id="myInput" type="text" placeholder="Search..">
            <br>
            <div class="card my-3">
                <table class="table m-3" style="width: initial;">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Mã đơn</th>
                            <th>Tình trạng</th>
                            <th>Thời gian đặt</th>
                        </tr>
                    </thead>
                    <tbody id="myTable">
                        <c:set var="i" value="0"></c:set>
                        <c:forEach items="${requestScope.orders}" var="o">
                            <c:set var="i" value="${i+1}"/>  
                            <tr>
                                <td>${i}</td>
                                <td>
                                    <a class="btn btn-info" href="<%= request.getContextPath()%>/staff/order/detail?id=${o.id}" role="button">${o.id}</a>
                                </td>
                                <td>${o.status}</td>
                                <td>${o.day_create}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <jsp:include page="../layout/footer.jsp"></jsp:include>

        <script>
            $(document).ready(function () {
                $("#myInput").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#myTable tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
            });
        </script>
    </body>
</html>
