<%@include file="header.jsp"%>
<style>
.loginback{
  background:url("<c:url value="/resources/images/bg.jpg"/>");
  }
 .msg{border:1px solid white;padding:10px;font-size: 25px;}
</style>
<div class="container-fluid loginback"><br/>
<div class="container col-sm-4 col-sm-offset-4" style="background:#aaa;margin-bottom: 20px;">
							<center>
							<c:if test="${msg!=null}"><br/><br/>
							<span class="msg">${msg}</span>
							</c:if>
							<h1>Sign In</h1></center>
							<form action="perform_login" method="post" class="form-horizontal">
							<div id="username">
							<label>Username</label>
							<input type="text" name="username" class="form-control" required="" maxlength="25"/>
							</div><br/>
							<div id="password">
							<label>Password</label>
							<input type="password" name="password" class="form-control" required="" pattern="[A-za-z0-9]{8,}" title="Atleast have 8 characters, special characters are not allowed"/>
							</div><br/>
							<input type="submit" value="Sign in" class="btn btn-primary btn-block submitBut"/>
							</form><br/>
							<div>
							<span>Don't have an account?</span>&nbsp;&nbsp;&nbsp;<a href="register">Sign Up</a>
							</div><br/>
							</div>
	</div>
<%@include file="footer.jsp"%>