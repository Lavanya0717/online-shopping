<%@include file="header.jsp"%>
<style>
.panel-heading,td,th,input{font-size: 1.5em;}
.thumbnail{height:100px;}
</style>
<br/><br/>
<div class="container" style="background: #fff">
<table class="table"><tr><th colspan="2">
<div class="list-group-item list-group-item-info" style="margin: -25px">
<center><h2><b>Shipping Details</b></h2></center></div></th></tr>
				<form action="${e}placeOrder" method="post">
				<tr><th class="text-center" colspan="2"><h3><b>Shipping Address</b></h3></th></tr>
				<tr><th>House Locality</th><td>
				<input name="locality" class="form-control" required="required"/></td>
				</tr>
				<tr><th>City</th><td>
				<input name="city" class="form-control" required="required" pattern="[A-Za-z]+[ ]*[A-Za-z]*" title="Enter a valid name"/></td>
				</tr>
				<tr><th>State</th><td>
				<input name="state" class="form-control" required="required" pattern="[A-Za-z]+[ ]*[A-Za-z]*" title="Enter a valid name"/></td>
				</tr>
				<tr><th>Pincode</th><td>
				<input name="pincode" class="form-control" pattern="[0-9]{6}" title="Pincode must be six digit long" maxlength="6"/></td>
				</tr>
				<tr><th class="text-center" colspan="2"><h3><b>Payment</b></h3></th></tr>
				<tr><th>Payment Mode</th><td>&nbsp;
				<label class="radio-inline"><input name="payMode" type="radio" value="Credit Card" required="true"/>Credit Card</label>
				<label class="radio-inline"><input name="payMode" type="radio" value="Internet Banking"/>Internet Banking</label>
				<label class="radio-inline"><input name="payMode" type="radio" value="Cash On Delivery"/>Cash On Delivery</label></td></tr>				
				<tr><td colspan="2">
<div class="row">
<div class="col-sm-offset-2 col-sm-3">
<a href="${e}cart" class="btn btn-danger btn-block myBoldFont" id="goBack">Go Back</a>
</div><div class="col-sm-2"><span>&nbsp;</span></div>
<div class="col-sm-3">
<input type="submit" value="Place Order" class="btn btn-danger btn-block myBoldFont"/>
</div>
</div></td></tr></form>			
</table></div><br/><br/>
<%@include file="footer.jsp"%>