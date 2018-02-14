<%@include file="header.jsp"%>
<style>
.container{margin-top: 4em;}
.thumbnail{height:380px;
box-shadow:0 0 10px grey;
position:relative;}
#cart {
position:absolute;
    bottom:5px;
    display:none;
    margin-left:21%;
width:50%;
}
.see{visibility: hidden;}
</style>
<br/>
<center><h1><b>${products.categoryName}</b></h1></center>
<div class="col-sm-offset-3 col-sm-6" style="border:2px solid red"></div>
<div class="col-sm-1">&nbsp;</div>
<!-- <div class="dropdown col-sm-2" style="width:0">
    <button class="btn btn-success myBoldFont"><span class="fa fa-sort"></span> Sort
    </button>
    <ul class="dropdown-menu" style="margin-top: -0.5px;">
      <li><a ng-click="orderByMe('pro_name')">Name</a></li>
      <li><a ng-click="orderByMe('+pro_price')">Price : Low to High</a></li>
      <li><a ng-click="orderByMe('-pro_price')">Price : High to Low</a></li>
    </ul>
  </div>
 -->
<div class="container"> 
<c:forEach items="${products.products}" var="product">
<div class="col-sm-6 col-md-3">
    <div class="thumbnail">
      <a href="${e}productDetails/${product.proId}">
        <img src='<c:url value="/resources/images/${product.imageName}"/>' alt="${product.proName}" style="height:60%;"/>
        <div class="caption">
          <center><h4><b style="color:black;">${product.proName}</b></h4></center>
          <span style="bottom:5px;color:black;position: absolute;"><h4><i class="fa fa-inr"></i>${product.proPrice}</h4>
          <h5>Cash on Delivery eligible</h5></span>
<!--           <a href="addToCart?proid={{product.pro_id}}" class="btn btn-primary" id="cart"><span class="glyphicon glyphicon-shopping-cart"></span> Add To Cart</a>          
 -->        </div>
      </a>
    </div>
</div>
</c:forEach>
</div>
<%@include file="footer.jsp"%>