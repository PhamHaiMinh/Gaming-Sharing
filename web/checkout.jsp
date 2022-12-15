<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>GSharing</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    </head>

    <body>
        <%@include file="header.jsp"  %>
        <div class="container-fluid">
            <!--Cart Table-->
            <div class="shopping-cart-container" style="margin-bottom: 60px;">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <h1 class="box-title" style="text-align: center;">Checkout </h1>
                        <table class="table table-striped" style="width: 100%">
                            <thead>
                                <tr>
                                    <th >Product Name</th>
                                    <th class="product-name">Product Img</th>
                                    <th class="product-price">Price</th>
                                    <th class="product-quantity">Quantity</th>
                                    <th class="product-subtotal">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="cart" items="${sessionScope['cart'].getItems()}">
                                    <tr class="cart_item">
                                        <td >
                                            <a href="#">${cart.getProduct().getName()}</a>
                                        </td>
                                        <td class="product-thumbnail" data-title="Product Name">
                                            <a class="prd-thumb" href="#">
                                                <figure><img width="113" height="113" src="${cart.getProduct().getImage()}" alt="img product in cart"></figure>
                                            </a>
                                        </td>

                                        <td class="product-price" data-title="Price">
                                            <div class="price price-contain">
                                                <ins><span class="price-amount"><span class="currencySymbol">$</span>${cart.getProduct().getPrice()}</span></ins>
                                            </div>
                                        </td>
                                        <td class="product-quantity" data-title="Quantity">
                                            <div class="quantity-box type1">
                                                ${cart.getQuantity()} 
                                            </div>
                                        </td>
                                        <td class="product-subtotal" data-title="Total">
                                            <div class="price price-contain">
                                                <ins><span class="price-amount"><span class="currencySymbol">$</span>${cart.getProduct().getPrice()*cart.getQuantity()}</span></ins>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>

                                <tr class="cart_item wrap-buttons">
                                    <td class="wrap-btn-control" colspan="3">
                                        <p>Total bill: ${cart. getTotalMoney()}</p>
                                    </td>
                                    <td class="wrap-btn-control" colspan="2">
                                        <a href="ViewCart" class="btn btn-info">Change</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <form method="post" action="Checkout" style="width: 50%; margin-top: 15px;">
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Full name</label>
                                    <input class="form-control" required maxlength="100" type="text" name="" value="${user.first_name} ${user.middle_name} ${user.last_name}">
                                </div>
                                <div class="col-md-6">
                                    <label>Gender</label><br>
                                    <input name="gender" type="radio" value="1"  ${user.gender?"checked":""} >Male
                                    <input name="gender" type="radio" value="0"  ${user.gender?"":"checked"}>Female
                                </div><div class="col-md-6">
                                    <label>Email</label>
                                    <input class="form-control" type="text" maxlength="100"  required="" name="" value="${sessionScope.account.email}">
                                </div>
                                <div class="col-md-6">
                                    <label>Phone</label>
                                    <input class="form-control" type="text"  maxlength="11"required name="" value="${user.phone}">
                                </div>
                                <div class="col-md-12">
                                    <label>Address</label>
                                    <input class="form-control" type="text" required  maxlength="100" name="" value="${address}">
                                </div>
                                <div class="col-md-12">
                                    <label>Note</label>
                                    <textarea class="form-control" required name="">

                                    </textarea>
                                </div>
                                <button class="btn btn-primary" style="margin: 20px;">Order</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <%@include file="footer.jsp"  %>
    </body>
</html>
