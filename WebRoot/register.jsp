<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%> 

<%@ include file="static/include/header.jsp" %>
<%
	Integer userType;
	String operator="";
	Boolean can_operateBoolean=false;
	try{
		
		Integer session_user_id =(Integer)session.getAttribute("id");
		userType = (Integer)session.getAttribute("user_type");
		//out.print(userType);
		//out.print(session_user_id);
		
		//如果是管理员 或者是本人
		if(userType.equals(0) ){ can_operateBoolean = true; operator="管理员"; System.out.println("管理员修改");}
		else{
			operator = "普通用户";
		}
		}catch(NullPointerException npe){
			operator = "普通用户";
		}
 %>
<div class="container">
    <h1 class="animated bounceInLeft"><div class="btn-default center" style="text-align:center">注册窗口---<span class="btn-info"><%=operator %></span></div></h1>
    <form class="form-horizontal vertical-center" role="form" action="register.action" method="post">
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
	      <label for="lastname" class="col-sm-2 control-label">邮箱</label>
	      <div class="col-sm-10">
	         <input type="email" class="form-control connect_way" id="email" name="email"
	            placeholder="邮箱">
	      </div>
	   </div>
	   <%
	   		if(can_operateBoolean==true){
	    %>
	    	<div class="form-group">
		      <label for="lastname" class="col-sm-2 control-label">用户类型</label>
		      <div class="col-sm-10">
		         <select id="id_time" class="form-control" name="userType">
		            <option value="1">普通用户</option>
		            <option value="0">管理员</option>
	            </select>
		      </div>
		   </div>
	    <%} %>
	   <div class="form-group">
	      <div class="col-sm-offset-2 col-sm-10">
	         <input  class="btn btn-success submit-login" value="注册"  type="submit"/>
	      </div>
	   </div>
	</form>
</div>
<script type="text/javascript" src="static/js/index2.js" ></script>
<%@ include file="static/include/footer.jsp" %>
