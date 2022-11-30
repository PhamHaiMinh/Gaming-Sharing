<%@include file="../layout/index.jsp" %>
<div class="container-category">
    <a class="btn btn-info m-3 mx-5" href="<%= request.getContextPath()%>/staff/category/update?id=${category.id}" role="button">Update</a>

    <div class="side-nav-categories">
        <div class="div-title">
            <h1 class="title">Category</h1>
        </div>
        <div class="d-flex mx-5 my-3 align-items-end">
            <h3>Name:</h3>
            <h5 class="mx-2">${category.name}</h5>
        </div>

    </div>
</div>
<script>

    }
</script>
<style>
    .side-nav-categories {
        border-radius: 30px;
        text-align: center;
        padding: 0px;
        position: relative;
        background-color: #fff;
        border-width: 1px;
        border-style: solid;
        border-color: #f5f5f5 #eee #d5d5d5 #eee;
        box-shadow: 0 5px 0 rgba(200,200,200,.2);
        width: 800px;
        margin: auto;
        top:15px;
        left: 20px;
    }
    .div-title{
        margin-top: 20px;
    }
    .title{
        font-family: serif;

    }
    .div-id{
        margin-top: 30px;
        margin-left: 100px;
    }
    .title-id{
        font-family: serif;
        text-align: left;
    }
    .text-id{
        border-radius: 5px;
        text-align: left;
        width: 200px;
        height: 32px;
        margin-right: 500px;
    }

    .div-name{
        margin-top: 20px;
        margin-left: 100px;
    }
    .title-name{
        font-family: serif;
        text-align: left;
    }
    .text-name{
        border-radius: 5px;
        text-align: left;
        width: 550px;
        height: 32px;
        margin-right: 200px;
    }

    .btn-primary{
        background-color: rgb(255, 165, 0);
        margin-top: 60px;
        margin-bottom: 60px;
        width: 100px;
        height: 45px;
    }
    #text-category{
        margin-right: 540px;
    }

</style>