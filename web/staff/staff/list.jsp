
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
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../layout/left.jsp"%>
        <div class=" container p-4 d-flex flex-column mx-auto  ">
            
            <div class="card my-3">
                <form method="get" action="" style="width: 50%; float: left; position: relative; top: 55px; left: 35px;">
                    <div class="row">
                        <div class="col-md-3">
                            <label>Status</label>
                            <select name="active"  class="form-select" onchange="this.form.submit()">
                                <option value="">All</option>
                                <<option value="1" ${"1" == param.active?"selected":"" }>Active</option>
                                <option value="0" ${"0" == param.active?"selected":"" }>Inactive</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label>Gender</label>
                           <select name="gender" class="form-select" onchange="this.form.submit()">
                                <option value="">All</option>
                                <option value="1"  ${"1" == param.roleId?"selected":"" }>Male</option>
                                <option value="0" ${"0" == param.roleId?"selected":"" }>Female</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label>Role</label>
                            <select name="roleId"  class="form-select"onchange="this.form.submit()">
                                <option value="">All</option>
                                <c:forEach var="r" items="${listRole}">
                                    <option value="${r.getRid()}" ${r.getRid() == param.roleId?"selected":"" } >${r.getName()}</option>
                                </c:forEach>
                            </select> 
                        </div>
                    </div>

                </form>
                <table class="table m-3" style="width: initial; width: 100%;"  id="tablepro">
                    <thead>
                        <tr>
                            <th scope="col">Id </th>                           
                            <th scope="col">Full Name</th>                           
                            <th scope="col">Gender</th>
                            <th scope="col">Phone</th>                       
                            <th scope="col">Email</th>
                            <th scope="col">Status</th>
                            <th scope="col">Role</th>
                            <th scope="col">Change Status</th>                       
                            <th scope="col">Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="i" value="0"></c:set>
                        <c:forEach items="${list}" var="c">
                            <c:set var="i" value="${i+1}"/>
                            <tr>
                                <td ><a href="DetailStaff?sid=${c.account.id}" >${c.account.id}</a></td>                         
                                <td>${c.last_name} ${c.middle_name} ${c.first_name}</td>
                                <td>${c.gender?"Male":"Female"}</td>
                                <td>${c.phone}</td>
                                <td>${c.account.email}</td>     
                                <td>${c.account.active?"Acvtive":"Inactive"}</td>
                                <td>${c.account.roleName}</td>
                                <c:if test="${c.account.active}">
                                      <td><a href="EditStaffStatus?uid=${c.account.id}&active=0" class="btn btn-warning">De-active</a>  </td>
                                </c:if>
                                <c:if test="${!c.account.active}">
                                   <td><a href="EditStaffStatus?uid=${c.account.id}&active=1" class="btn btn-success">Active</a>  </td>
                                </c:if>
                               <td><a href="DeleteStaff?uid=${c.account.id}" class="btn btn-danger">Delete</a>  </td>

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#tablepro").DataTable({bInfo: false, lengthChange: false});
            });
        </script>          
    </body>
</html>
