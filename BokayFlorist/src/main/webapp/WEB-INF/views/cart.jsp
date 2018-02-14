<%@include file="header.jsp" %>
<style>
.container{margin-top: 4em;}
.thumbnail{height:170px;}
</style>
<div class="container" style="background: #fff">
<table class="table">
<div class="list-group-item list-group-item-info row"><h3><b>MY CART</b></h3></div>
<c:if test="${cartList.size()==0}">
<center><h3><b>Cart is Empty</b></h3></center>
</c:if>
<c:forEach items="${cartList}" var="cartItem">
<tr><td rowspan="2">
<div class="thumbnail">
<img src='<c:url value="/resources/images/${cartItem.cartImage}"/>' alt="${cartItem.cartProductName}" style="height:100%;"/>
</div></td><td>
	<h2>${cartItem.cartProductName}</h2>
	<h2><i class="fa fa-inr"></i><b>${cartItem.cartPrice}</b></h2> 
    </td></tr>
    <tr><td>
    <div class="row">
    <div class="col-sm-4">
    Quantity : 
     <div class="btn-group"><a href="updateCart/${cartItem.cartId}/-" class="btn btn-warning">
    <span class="glyphicon glyphicon-minus"></span></a><span class="btn">${cartItem.cartQuantity}</span>
    <a href="updateCart/${cartItem.cartId}/+" class="btn btn-warning">
    <span class="glyphicon glyphicon-plus"></span></a>
    </div>
    </div>
    <div class="col-sm-1"><span>&nbsp;</span></div>
  
    <div class="col-sm-4"><a href="deleteCart/${cartItem.cartId}" class="btn btn-danger btn-block">Remove</a>
        </div></div>
    </td></tr>
</c:forEach><tr><td colspan="3">
<div class="row" style="padding:2em;">
<c:if test="${cartList.size()==0}">
<a href="${e}" class="btn btn-success btn-block myBoldFont">Continue Shopping....</a>
</c:if>
<c:if test="${cartList.size()!=0}"><div class="col-sm-offset-2 col-sm-3">
<a href="${e}" class="btn btn-success btn-block myBoldFont">Continue Shopping....</a>
</div><div class="col-sm-2"><span>&nbsp;</span></div>
<div class="col-sm-3">
<a href="${e}checkout" class="btn btn-success btn-block myBoldFont">Check Out</a>
</div></c:if>
</div></td></tr></table></div>
<br/>
<%@include file="footer.jsp"%>