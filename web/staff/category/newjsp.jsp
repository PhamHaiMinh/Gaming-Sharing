

<%@include file="../layout/index.jsp"  %>

<div class="container-category">
    <div>
        <a class="btn btn-primary" href="<%= request.getContextPath()%>/staff/category/create" role="button">Create</a>
    </div>
    <div class="side-nav-categories">
        <table class="table">
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
                            <a class="btn btn-info" href="<%= request.getContextPath()%>/staff/category/update?id=${c.id}" role="button">Update</a></th>
                        </th>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>