<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" href="style.css"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>


<body>
<header>
<%@ include file="header.jsp"%>
</header>
<div class="container-fluid" style="padding: 0">
	<div class="carousel slide" data-ride="carousel">
		
    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="${pageContext.request.contextPath}/resources/images/slide4.jpg"  alt="" style="height:450px;width:100%;">
      </div>

      <div class="item">
        <img src="${pageContext.request.contextPath}/resources/images/slide5.jpg"  alt="" style="height:450px;width:100%;">
      </div>
    
      <div class="item">
        <img src="${pageContext.request.contextPath}/resources/images/slide6.jpg"  alt="" style="height:450px;width:100%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  </div>
 
 <div class="container">
	<div class="row">
		<div class="col-md-4">
			<div class="thumbnail">
				<a href="#"> <img src="resources/images/flower.jpg"
					alt="Image 1" style="height:450px;width: 100%">
					<div class="caption">
						<p>Teleflora's Be Happy® Bouquet With Roses</p>
						<a href="#" class="m-product-mini-buynow homePageEngagement pdplink">Buy Now ></a>
					</div>
				</a>
			</div>
		</div>
		<div class="col-md-4">
			<div class="thumbnail">
				<a href="#"> <img src="resources/images/flower1.jpg"
					alt="Image 2" style="height:450px;width: 100%">
					<div class="caption">
						<p>Teleflora's Happy Dots Bouquet</p>
						<a href="#" class="m-product-mini-buynow homePageEngagement pdplink">Buy Now ></a>
					</div>
				</a>
			</div>
		</div>
		<div class="col-md-4">
			<div class="thumbnail">
				<a href="#"> <img src="resources/images/flower2.jpg"
					alt="Image 3" style="height:450px;width: 100%">
					<div class="caption">
						<p>His Favorite Ford F1 Pickup By Teleflora</p>
						<a href="#" class="m-product-mini-buynow homePageEngagement pdplink">Buy Now ></a>
					</div>
				</a>
			</div>
		</div>
	</div>
</div>

  <footer>
  <jsp:include page="footer.jsp" />  
</footer>
</body>
</html>






</body>
</html>
