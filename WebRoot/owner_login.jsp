<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%> 

<%@ include file="static/include/header.jsp" %>

<div class="container">
    <h1 class="animated bounceInLeft"><div class="btn-default center" style="text-align:center">登录窗口</div></h1>
    <form class="form-horizontal vertical-center" role="form" action="owner_login.action" method="post">
	   <div class="form-group">
	      <label for="firstname" class="col-sm-2 control-label">名字</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control name" id="name" name="name"
	            placeholder="请输入名字">
	      </div>
	   </div>
	   <div class="form-group">
	      <label for="lastname" class="col-sm-2 control-label">密码</label>
	      <div class="col-sm-10">
	         <input type="password" class="form-control connect_way" id="password" name="password"
	            placeholder="密码">
	      </div>
	   </div>
	   <div class="form-group">
	      <div class="col-sm-offset-2 col-sm-10">
	         <input  class="btn btn-success submit-login" value="登录"  type="submit"/>
	      </div>
	   </div>
	</form>
</div>
<script type="text/javascript" src="static/js/index3.js" ></script>
<%@ include file="static/include/footer.jsp" %>
