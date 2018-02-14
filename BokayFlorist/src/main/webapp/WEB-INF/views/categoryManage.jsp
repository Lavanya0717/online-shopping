<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"><title>Home Page</title>
</head>
<body>

<div class="container">
	<div class="panel-group">
		<div class="panel panel-primary">
						<div class="panel-heading text-center">
			<span style="font-size: 30px">Category Details</span>
			</div>
			<div class="panel-body table-responsive">
				<table class="table table-hover">
					<tr><th>Category Id</th><th>Category Name</th><th>Operation</th></tr>
					<c:forEach items="${catList}" var="category">
						<tr>
							<td>${category.cid}</td><td>${category.categoryName}</td>
							<td>
								<button onclick="setModal(${category.cid},'${category.categoryName}')" class="btn btn-success myBoldFont">Update</button>
								<a href="<c:url value="deleteCategory?id=${category.cid}"/>" class="btn btn-danger myBoldFont">Delete</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div><br/><br/>
<script>
var setModal=function(id,name){
	document.forms["frm1"].elements[0].value=id;
	document.forms["frm1"].elements[1].value=name;
	$("#catModal").modal("show");
}
</script>
</body>
</html>