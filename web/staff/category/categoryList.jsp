
<%-- 
   Document   : newjsp
   Created on : 29-11-2022, 22:19:47
   Author     : haimi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category</title>
    </head>
    <body>
        <%@include file="../layout/left.jsp"%>
        <div class=" container-70 d-flex justify-content-center flex-column ">
            <div class="d-flex">
                <a class="btn btn-primary" href="<%= request.getContextPath()%>/staff/category/create" role="button">Create</a>
            </div>
            <div class="card my-3">

                <table class="table m-3" style="width: initial;">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Name</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="i" value="0"></c:set>
                        <c:forEach items="${requestScope.categories}" var="c">
                            <c:set var="i" value="${i+1}"/>
                            <tr>
                                <th scope="row">${i}</th>
                                <th>${c.name}</th>
                                <th>
                                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal${c.id}">Delete</button>
                                    <div class="modal fade" id="exampleModal${c.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Delete confirm</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Do you agree to delete product ?</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    <a class="btn btn-danger" href="<%= request.getContextPath()%>/staff/category/delete?id=${c.id}" role="button">Delete</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <a class="btn btn-info" href="<%= request.getContextPath()%>/staff/category/detail?id=${c.id}" role="button">Detail</a></th>
                                </th>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <div class="paging">
                    <ul class="pagination justify-content-center">
                        <c:forEach   items="${pages}" var="p">
                            <li class="page-item"><a class="page-link  ${page == p ? "active":""}  ${p}" href="product?page=${p}">${p == "disabled"? "..." : p}</a></li>
                            </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <%@include file="../layout/footer.jsp"%>
        <div class="position-fixed w-100" id="alert-div">
            <c:if test="${status.equals('true')}">
                <button class="alert alert-success d-flex align-items-center position-absolute ms-3 pe-auto" id="alert" role="alert" onclick="closeAlertModal()">
                    <svg id="suc" class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                    <div>
                        Successful!
                    </div>
                </button>
            </c:if>
            <c:if test="${status.equals('false')}">
                <button class="alert alert-danger d-flex align-items-center position-absolute ms-3 pe-auto" id="alert" role="alert" onclick="closeAlertModal()">
                    <svg id="fa" class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                    <div>
                        Failed!
                    </div>
                </button>
            </c:if>
        </div>

        <script >
            setTimeout(closeAlertModal, 2000);
            function closeAlertModal() {
                let modal = document.getElementById("alert");
                modal.classList.add("fadeOutLeft");
            }
        </script>             
    </body>
</html>
