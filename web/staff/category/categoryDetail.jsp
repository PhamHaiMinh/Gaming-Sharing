
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
        <div class="container-80 d-flex justify-content-center pb-5" style="flex-direction: column;">
            <div>
                <a class="btn btn-info m-3 mx-5" href="<%= request.getContextPath()%>/staff/category/update?id=${category.id}" role="button">Update</a>
            </div>
            <div class="card" style="width: 50rem;
                 margin: 0 auto;">
                <div class="text-center my-2">
                    <h1 class="title">Category</h1>
                </div>
                <div class="d-flex align-items-end mx-5 my-3">
                    <h4>Name:</h4>
                    <h5 class="mx-2">${category.getName()}</h5>
                </div>
                <div class="d-flex align-items-end mx-5 my-3">
                    <h4>Total product:</h4>
                    <h5 class="mx-2">${category.totalOfProduct}</h5>
                </div>
            </div>
            <div  class="card mt-3 p-4 d-flex flex-column mx-auto" style="width: 50rem;
                  margin: 0 auto;">
                <div class="d-flex justify-content-center">
                    <h3 class="title">Product of Category</h3s>
                </div>
                <div class="card my-3">

                    <table class="table m-3" style="width: initial;">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Name</th>                           
                                <th scope="col">Category</th>
                                <th scope="col">Quantity</th>                       
                                <th scope="col">Price</th>
                                <th scope="col">Iamge</th>
                                <th scope="col">Viewed</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="i" value="0"></c:set>
                            <c:forEach items="${requestScope.products}" var="c">
                                <c:set var="i" value="${i+1}"/>
                                <tr>
                                    <th scope="row">${i}</th>
                                    <th>${c.name}</th>                       
                                    <th>${c.getCategory().getName()}</th>
                                    <th>${c.quantity}</th>
                                    <th>${c.price}</th>
                                    <th ><img src="${c.image}" width="120" alt="${c.name}"/></th>  
                                    <th>${c.viewed}</th>
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
                                                        <a class="btn btn-danger" href="<%= request.getContextPath()%>/staff/product/delete?id=${c.id}" role="button">Delete</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <a class="btn btn-info" href="<%= request.getContextPath()%>/staff/product/detail?id=${c.id}" role="button">Detail</a></th>
                                    </th>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="paging">
                        <ul class="pagination justify-content-center">
                            <c:forEach   items="${pages}" var="p">
                                <li class="page-item"><a class="page-link  ${page == p ? "active":""}  ${p}" href="detail?id=${category.id}&page=${p}">${p == "disabled"? "..." : p}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../layout/footer.jsp"%>
    </body>
</html>
