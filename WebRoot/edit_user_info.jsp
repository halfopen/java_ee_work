<%@page import="dao.UserDao"%>
<%@page import="beans.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%> 

<%@ include file="static/include/header.jsp" %>
<%
	String idString = request.getParameter("id");
	User user=new User();
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
		
		if( idString.equals(session_user_id.toString())){  can_operateBoolean = true; operator="本人";System.out.println("本人修改");}
		//out.print(can_operateBoolean);
		if(can_operateBoolean==true){
			UserDao userDao = new UserDao();
			user = userDao.queryUser(Integer.parseInt(idString));
		}else{
			response.setContentType("text/html; charset=gb2312");
	  		response.sendRedirect("index2.jsp");
	  		return;
		}
	}catch(NullPointerException npe){
		npe.printStackTrace();
		response.setContentType("text/html; charset=gb2312");
  		response.sendRedirect("index2.jsp");
  		return;
	}
 %>
<div class="container">
    <h1 class="animated bounceInLeft"><div class="btn-default center" style="text-align:center">信息修改，操作用户:<%=operator %></div></h1>
    <form class="form-horizontal vertical-center" role="form" action="update.action" method="post">
	   <div class="form-group">
	      <label for="firstname" class="col-sm-2 control-label">名字</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control name" id="name" name="name" value="<%=user.getName() %>"
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
	         <input type="email" class="form-control connect_way" id="email" name="email" value="<%=user.getEmail() %>"
	            placeholder="邮箱">
	      </div>
	   </div>
	   <div class="form-group">
	      <div class="col-sm-offset-2 col-sm-10">
	      	<input type="hidden" name="id" value="<%=idString %>" />
	         <input  class="btn btn-success submit-edit-user"   value="更新信息"  type="submit"/>
	      </div>
	   </div>
	</form>
</div>
<script type="text/javascript" src="static/js/index2.js" ></script>
<%@ include file="static/include/footer.jsp" %>
