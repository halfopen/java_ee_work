<%@page import="dao.UserDao"%>
<%@page import="beans.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%> 

<%@ include file="static/include/header.jsp" %>
<%
	User user = new User();
	UserDao userDao = new UserDao();
	
	ArrayList arrayList = userDao.queryUsers();
	System.out.println(arrayList.size()+"个用户");
 %>
<div class="container">
    <h1 class="animated bounceInLeft">习题二</h1>
    <div class="text-muted">武汉大学2013级 计科三班 2013301500100 秦贤康</div>
    
   	<h2>用户管理</h2>
   	<a href="register.jsp" target="_blank" class="btn-suceess btn">添加新用户</a>
	<div class="row free-tables-container">		
		<% for(int i=0;i<arrayList.size();i++){
				user = (User)arrayList.get(i);
				if(user.getUserType()==0){ //如果是管理员
		 %>
			 	<div class="animated pulse row-content col-lg-2 col-sm-4 col-xs-12 text-center meal-list <% if(user.getUserStatus()==1){ %>invalid-meal-list<% }%>">
			        <div class="remove-meal btn btn-danger btn-xs " pk="<%=user.getId() %>" >移除</div>
			        <span class="spin"><img src="static/img/spin/1.png"></span>
			        <div class="text-bold text-center singel-line text-success">用户名:<%=user.getName() %></div>
			        <div class="">&nbsp;</div>
			        <div class="singel-line text-left text-info">用户ID:<%=user.getId() %></div>
			        <div class="text-left singel-line">邮箱:<%=user.getEmail() %></div>
			        <div class="text-left singel-line">
			        	<span>帐号状态:</span>
			        	<span pk="<%=user.getId() %>"   status="<%=user.getUserStatus() %>"  class="btn-danger set-user-status"><% if(user.getUserStatus()==1){ %>点击锁定<% }else{%>点击激活<% 	} %></span>
			        </div>
			        <div class="text-left singel-line">上次登录日期:<%=user.getLastLoginTime() %></div>
			        <div class="text-left singel-line">登录次数:<%=user.getLoginTimes() %></div>
			        <div class="row">
			            <a href="edit_user_info.jsp?id=<%=user.getId() %>" class=" col-md-12 btn btn-sm btn-green" style="cursor: pointer; padding-right: 1%;" >修改信息</a>
			        </div>
	      		</div>
	      		<%}else{ %>
		 
		
				<div class="animated pulse row-content col-lg-2 col-sm-4 col-xs-12 text-center meal-list <% if(user.getUserStatus()==1){ %>invalid-meal-list<% }%>">
			        <div class="remove-meal btn btn-danger btn-xs " pk="<%=user.getId() %>" >移除</div>
			        <span class="spin"><img src="static/img/spin/1.png"></span>
			        <div class="text-bold text-center singel-line text-success">用户名:<%=user.getName() %></div>
			        <div class="">&nbsp;</div>
			        <div class="singel-line text-left text-info">用户ID:<%=user.getId() %></div>
			        <div class="text-left singel-line">邮箱:<%=user.getEmail() %></div>
			        <div class="text-left singel-line">
			        	<span>帐号状态:<%=user.getUserStatus() %></span>
			        	<span pk="<%=user.getId() %>"  status="<%=user.getUserStatus() %>" class="btn-danger set-user-status"><% if(user.getUserStatus()==1){ %>点击锁定<% }else{%>点击激活<% 	} %></span>
			        </div>
			        
			        <div class="text-left singel-line">上次登录日期:<%=user.getLastLoginTime() %></div>
			        <div class="text-left singel-line">登录次数:<%=user.getLoginTimes() %></div>
			        <div class="row">
			            <span pk="<%=user.getId() %>" class=" col-md-6 btn btn-sm btn-orange set-admin" style="cursor: pointer; padding-right: 1%;" >设为管理员</span>
			            <a href="edit_user_info.jsp?id=<%=user.getId() %>" class=" col-md-6 btn btn-sm btn-green" style="cursor: pointer; padding-right: 1%;" >修改信息</a>
			        </div>
			      </div> 
			       
	        
      	
			<%}} %>
    </div>
</div>
<script type="text/javascript" src="static/js/index2.js" ></script>
<%@ include file="static/include/footer.jsp" %>
