<%@include file="header.jsp"%>
<style>
.loginback{
  background:url("<c:url value="/resources/images/bg.jpg"/>");
  }
 .msg{border:1px solid white;padding:10px;font-size: 25px;}
</style>
<div class="container-fluid loginback"><br/>
<div class="container col-sm-4 col-sm-offset-4" style="background:#aaa;margin-bottom: 20px;">
							<center><h1>Sign Up</h1></center>
							<form action="addUser" method="post" class="form-horizontal">
							<div id="name">
							<label>Enter Name</label>
							<input name="full_name" class="form-control" required="" maxlength="25" pattern="[A-Za-z]+[ ]*[A-Za-z]*" title="Enter a valid name"/>
							</div><br/>
							<div id="email">
							<label>Enter Email</label>
							<input type="email" name="email" class="form-control" required="" title="Enter a valid email address"/>
							</div><br/>
							<div id="mobile">
							<label>Mobile Number</label>
							<input type="text" name="mobile" class="form-control" required="" pattern="[6-9]{1}[0-9]{9}" title="Enter a 10 digit mobile number" maxlength="10"/>
							</div><br/>
							<div id="username">
							<label>Create Username</label>
							<input name="username" class="form-control" required=""/>
							</div><br/>
							<div id="password">
							<label>Create Password</label>
							<input type="password" name="password" class="form-control" required="" pattern="[A-za-z0-9]{8,}" title="Atleast have 8 characters, special characters or spaces are not allowed"/>
							</div><br/>
							<div id="address">
							<label>Address</label>
							<textarea name="address" class="form-control" required="" rows="5" maxlength="255"></textarea>
							</div><br/>
							<input type="submit" value="Sign Up" class="btn btn-primary btn-block"/>
							</form><br/>
							<div>
							<span>Already have an account?</span>&nbsp;&nbsp;&nbsp;<a href="login">Sign In</a>
							</div><br/>
							</div>
</div>
<%@include file="footer.jsp"%>