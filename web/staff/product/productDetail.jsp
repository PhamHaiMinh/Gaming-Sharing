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
        <title>Product</title>
    </head>
    <body>
        <%@include file="../layout/left.jsp"%>

        <div class="container-80 py-5 d-flex justify-content-center" style="flex-direction: column;">
            <div>
                <a class="btn btn-info m-3 mx-5" href="<%= request.getContextPath()%>/staff/product/update?id=${product.id}" role="button">Update</a>
            </div>
            <div class="card" style="width: 50rem;
                 margin: 0 auto;">
                <div class="text-center">
                    <h1 class="title">Product</h1>
                </div>
                <div class="d-flex">
                    <div class="mx-3">

                        <img src="${product.image}" width="200" height="200"  alt="${product.name}"/>
                    </div>
                    <div>
                        <div class="d-flex align-items-end">
                            <h4>Name:</h4>
                            <h5 class="mx-2">${product.getName()}</h5>
                        </div>
                        <div class="d-flex align-items-end">
                            <h4>Category:</h4>
                            <h5 class="mx-2">${product.getCategory().getName()}</h5>
                        </div>
                        <div class="d-flex align-items-end">
                            <h4>Quantity:</h4>
                            <h5 class="mx-2">${product.getQuantity()}</h5>
                        </div>
                        <div class="d-flex align-items-end">
                            <h4>Price:</h4>
                            <h5 class="mx-2">${product.getPrice()}</h5>
                        </div>
                        <div class="d-flex align-items-end">
                            <h4>Viewed:</h4>
                            <h5 class="mx-2">${product.getViewed()}</h5>
                        </div>
                    </div>
                </div>
                <div class="card m-3">
                    ${product.getDescription()}
                </div>
            </div>
        </div>
        <%@include file="../layout/footer.jsp"%>
    </body>
</html>
