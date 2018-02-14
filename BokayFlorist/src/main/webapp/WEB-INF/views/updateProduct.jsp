<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@include file="header.jsp"%>
<br/><div class="row">
<div class="modal-body col-sm-offset-3 col-sm-6" style="border:10px solid green">
		    <center><h2>Update Product</h2></center><br/>
<form:form action="${e}admin/addProduct" modelAttribute="product" class="form-horizontal" enctype="multipart/form-data">
<div class="form-group">
<label class="control-label col-sm-5 " for="catName">Category</label>
<div class="col-sm-7">
<form:select path="category.cid" id="catName" class="form-control" required="required">
<option value="" label="----------- Select Category -----------" disabled="true" selected/>
					<c:forEach items="${catList}" var="cat">
					<form:option value="${cat.cid}">${cat.categoryName}</form:option>		
					</c:forEach>
</form:select>
</div></div>
<div class="form-group">
<label class="control-label col-sm-5 " for="proName">Product Name</label>
<div class="col-sm-7">
<form:input path="proName" class="form-control" id="proName"  required="required"/>
</div></div>
<div class="form-group">
<label class="control-label col-sm-5 " for="proDesc">Product description</label>
<div class="col-sm-7">
<form:textarea path="proDesc" class="form-control" id="proDesc" required="required" maxlength="255"/>
</div></div>
<form:hidden path="proId"/>
<form:hidden path="imageName"/>
<div class="form-group">
<label class="control-label col-sm-5 " for="proImage">Upload image</label>
<div class="col-sm-7">
<form:input type="file" path="proImage" class="form-control" id="proImage"/>
</div></div>
<div class="form-group">
<label class="control-label col-sm-5 " for="proPrice">Product Price</label>
<div class="col-sm-7">
<form:input path="proPrice" class="form-control" id="proPrice" pattern="[1-9]+[0-9]*.[0-9]+" title="Price cannot be zero or start with zero"/>
</div></div>
<div class="form-group">
<label class="control-label col-sm-5 " for="proQuantity">Product Quantity</label>
<div class="col-sm-7">
<form:input path="proQuantity" class="form-control" id="proQuantity" pattern="[1-9]+[0-9]*" title="Quantity cannot be zero or start with zero"/>
</div></div>
<div class="form-group"><label class="control-label col-sm-5 " for="supName">Supplier</label>
<div class="col-sm-7">
<form:select path="supplier.sid" class="form-control" id="supName" required="required">
<option value="" label="----------- Select Supplier -----------" disabled="true" selected/>
<c:forEach items="${supList}" var="sup">
<form:option value="${sup.sid}">${sup.supplierName}</form:option>
</c:forEach>
</form:select>
</div></div>
<div class="col-sm-6">
<input type="submit" value="save" class="btn btn-success btn-block "/></div>
<div class="col-sm-6">
<a href="${e}admin/viewDetailsAdmin" class="btn btn-danger btn-block ">Cancel</a></div><br/>
</form:form>
     </div>
</div>
<br/><%@include file="footer.jsp"%>