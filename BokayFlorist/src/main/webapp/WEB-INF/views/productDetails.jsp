<%@include file="header.jsp" %>
<style>
#proImg{
    height:490px;
}
#proImg img{
    -webkit-transition: all 1s;
    -moz-transition: all 1s;
    -o-transition: all 1s;
    -ms-transition: all 1s;
    transition: all 1s;
    height:67%;
}
#proImg:HOVER img{height:72%;
    -webkit-transition: all 1s;
    -moz-transition: all 1s;
    -o-transition: all 1s;
    -ms-transition: all 1s;
    transition: all 1s;
}
.caption{
bottom: 0;position:absolute;width:98%;
}
.proTitle{color:blue;}
</style>
<br/>
<div class="container">
<div class="col-sm-4 thumbnail" id="proImg">
<img src='<c:url value="/resources/images/${product.imageName}"/>' alt="${product.proName}" />
 <div class="caption">
          <a href="${e}addToCart/${product.proId}" class="btn btn-danger btn-block myBoldFont"><h4><span class="glyphicon glyphicon-shopping-cart"></span> Add To Cart</h4></a>
        </div>
</div>
<div class="col-sm-8">
<div class="panel panel-default">
  <div class="panel-heading proTitle"><h2><b>${product.proName}</b></h2></div>
  <div class="panel-body"><h2><i class="fa fa-inr"></i><b>${product.proPrice}</b></h2><br/>
  <h4><b>Seller : </b>${product.supplier.supplierName}</h4>
  </div>
</div>
  
  <div class="panel panel-default">
  <div class="panel-heading"><h3>Product Description</h3></div>
  <div class="panel-body"><h4>${product.proDesc}</h4></div>
</div>
  
  </div>
</div>
<%@include file="footer.jsp"%>