<%-- 
    Document   : newjsp
    Created on : Jul 26, 2023, 3:23:37 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">


        <title>Shopping Cart</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
         <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <style type="text/css">
            body{
                margin-top:20px;
                background:#eee;
            }
            .ui-w-40 {
                width: 40px !important;
                height: auto;
            }

            .card{
                box-shadow: 0 1px 15px 1px rgba(52,40,104,.08);
            }

            .ui-product-color {
                display: inline-block;
                overflow: hidden;
                margin: .144em;
                width: .875rem;
                height: .875rem;
                border-radius: 10rem;
                -webkit-box-shadow: 0 0 0 1px rgba(0,0,0,0.15) inset;
                box-shadow: 0 0 0 1px rgba(0,0,0,0.15) inset;
                vertical-align: middle;
            }
        </style>
        <script>
        function decreaseQuantity(itemId) {
            var quantityElement = document.getElementById("quantity_" + itemId);
            var priceElement = document.getElementById("price_" + itemId);
            var contentPrice = priceElement.textContent;
            var price = parseInt(contentPrice.replace(/\D/g, ''));
            var currentQuantity = parseInt(quantityElement.value);
            if (currentQuantity > 0) {
                quantityElement.value = currentQuantity - 1;
                updatePrice(itemId,-price);
                updateSessionQuantity(itemId, currentQuantity - 1);
            }
        }

        function increaseQuantity(itemId) {
            var quantityElement = document.getElementById("quantity_" + itemId);
            var priceElement = document.getElementById("price_" + itemId);
            var contentPrice = priceElement.textContent;
            var price = parseInt(contentPrice.replace(/\D/g, ''));
            var currentQuantity = parseInt(quantityElement.value);
            quantityElement.value = currentQuantity + 1;
            updatePrice(itemId,price);
            updateSessionQuantity(itemId, currentQuantity + 1);
        }
            
        function updatePrice(itemId, price) {
            var totalElement = document.getElementById("total_" + itemId);
            var contentTotal = totalElement.textContent;
            var total = parseInt(contentTotal.replace(/\D/g, ''));
            
            var totalPriceElement = document.getElementById("totalPrice");
            var contentTotalPrice = totalPriceElement.textContent;
            var totalPrice = parseInt(contentTotalPrice.replace(/\D/g, ''));
            
            var newTotal = total + price;
            var newTotalPrice = totalPrice + price;
            
            totalElement.innerText="$"+newTotal;
            totalPriceElement.innerText="$"+newTotalPrice;
        }
        
            
        function updateSessionQuantity(itemId, newQuantity) {
            // Gửi yêu cầu AJAX tới servlet để cập nhật số lượng sản phẩm trong session
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "UpdateQuantityServlet", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // Xử lý phản hồi từ servlet (nếu cần)
                }
            };
            var params = "itemId=" + itemId + "&quantity=" + newQuantity;
            xhr.send(params);
        }
        
    </script>
    </head>
    <body>
        <div class="container px-3 my-5 clearfix">

            <div class="card">
                <div class="card-header">
                    <h2>Shopping Cart</h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered m-0">
                            <thead>
                                <tr>

                                    <th class="text-center py-3 px-4" style="min-width: 400px;">Product Name &amp; Details</th>
                                    <th class="text-right py-3 px-4" style="width: 100px;">Price</th>
                                    <th class="text-center py-3 px-4" style="width: 120px;">Quantity</th>
                                    <th class="text-right py-3 px-4" style="width: 100px;">Total</th>
                                    <th class="text-center align-middle py-3 px-0" style="width: 40px;"><a href="#" class="shop-tooltip float-none text-light" title data-original-title="Clear cart"><i class="ino ion-md-trash"></i></a></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%!int totalPrice;
                                    String type;
                                %>
                               <%
                                HttpSession session1 = request.getSession();
                                totalPrice= 0;
                                Order order = (Order)session1.getAttribute("order");
                                if(order != null)
                                {
                                    for(Item item : order.getItems())
                                    {
                                        totalPrice += item.getTotalPrice();
                                        if(item.getCoffee().getMaLoai()==1)
                                            type = "Hot";
                                        else
                                            type="Cold";
                                    %>
                                        <tr>
                                        <td class="p-4">
                                            <div class="media align-items-center">
                                                <img src="<%=request.getContextPath()%>/assets/img/<%= item.getCoffee().getImage()%>" class="d-block ui-w-40 ui-bordered mr-4" alt>
                                                <div class="media-body">
                                                    <a href="#" class="d-block text-dark"><%=item.getCoffee().getTen()%></a>
                                                    <small>
                                                        <span class="text-muted">Type: </span> <%=type%>,
                                                        <span class="text-muted">Description: </span> <%=item.getCoffee().getMota()%>
                                                    </small>
                                                </div>
                                            </div>
                                        </td>
                                        <td id="price_<%=item.getId()%>"class="text-right font-weight-semibold align-middle p-4">$<%=item.getCoffee().getGia()%></td>
                                        <td class="align-middle p-4 quantity"style="position: relative;font-size: 20px;"><input id="quantity_<%=item.getId()%>" type="text" class="form-control text-center" value="<%=item.getQuantity()%>">
                                            <i onclick="increaseQuantity(<%=item.getId()%>)" class="fas fa-sort-up" style="position: absolute;top: 32px;right: 30px; font-size: 23px;height: 10px; cursor: pointer;"></i>
                                            <i onclick="decreaseQuantity(<%=item.getId()%>)" class="fas fa-sort-up"style="position: absolute;top: 55px;right: 30px;font-size: 23px; height: 10px; transform: rotate(180deg); cursor: pointer;"></i>
                                        </td>
                                        <td id="total_<%=item.getId()%>"class="text-right font-weight-semibold align-middle p-4">$<%=item.getCoffee().getGia()* item.getQuantity() %></td>
                                        <td class="text-center align-middle px-0"><a href="deleteItem?itemId=<%=item.getId()%>" class="shop-tooltip close float-none text-danger" title data-original-title="Remove">×</a></td>
                                    </tr>
                                    <%
                                    }
                               }
                               %>
                            </tbody>
                        </table>
                    </div>
                            
                  

                    <div class="d-flex flex-wrap justify-content-between align-items-center pb-4">
                        <div class="mt-4">
                            <label class="text-muted font-weight-normal">Promocode</label>
                            <input type="text" placeholder="ABC" class="form-control">
                        </div>
                        <div class="d-flex">
                            <div class="text-right mt-4 mr-5">
                                <label class="text-muted font-weight-normal m-0">Discount</label>
                                <div class="text-large"><strong>$0.0</strong></div>
                            </div>
                            <div class="text-right mt-4">
                                <label class="text-muted font-weight-normal m-0">Total price</label>
                                <div id="totalPrice" class="text-large" style="font-weight: bold;">$<%=totalPrice%></div>
                            </div>
                        </div>
                    </div>
                    <div class="float-right">
                        
                        <button type="button" class="btn btn-lg btn-default md-btn-flat mt-2 mr-3"><a href="<%=request.getContextPath()%>/index#menu">Back to shopping</a></button>
                        <button type="button" class="btn btn-lg btn-primary mt-2">Checkout</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">

        </script>
    </body>
</html>
