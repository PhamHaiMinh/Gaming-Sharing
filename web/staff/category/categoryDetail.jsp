<%@include file="../layout/index.jsp" %>
<div class=" container m-3 d-flex justify-content-center" style="flex-direction: column;">
    <div>
        <a class="btn btn-info m-3 mx-5" href="<%= request.getContextPath()%>/staff/category/update?id=${category.id}" role="button">Update</a>
    </div>
    <div class="card" style="width: 50rem;
         margin: 0 auto;">
        <div class="text-center my-2">
            <h1 class="title">Product</h1>
        </div>

        <div class="d-flex align-items-end mx-5 my-3">
            <h4>Name:</h4>
            <h5 class="mx-2">${category.getName()}</h5>
        </div>
    </div>
</div>