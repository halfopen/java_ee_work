<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%> 

<%@ include file="static/include/header.jsp" %>

<div class="container">
    <h1 class="animated bounceInLeft">习题二</h1>
   	<h2>
   		<span class="btn-danger">用户信息:</span>:
   		<span ><%=session.getAttribute("name") %></span>在线，登录次数:<%=session.getAttribute("login_times") %> 上次登录时间:<%=session.getAttribute("last_login_time") %></h2>
   	<div class="row">
      <div class="animated swing row-content col-lg-2 col-sm-4 col-xs-12 text-center index-guide">
         <a href="edit_user_info.jsp?id=<%=session.getAttribute("id") %>"> <img style="width: 33%" src="static/img/article.png"></a>
          <div>本人信息修改</div>
      </div>
       <div class="animated swing row-content col-lg-2 col-sm-4 col-xs-12 text-center index-guide">
        <a href="servlet/Logout"><img style="width: 33%" src="static/img/hummingbird.png"></a>
         <div>注销</div>
      </div>
      <% try{
      		Integer usertype=(Integer)session.getAttribute("user_type");
      		if(usertype==0){
      		%>
      			<div class="animated swing row-content col-lg-2 col-sm-4 col-xs-12 text-center index-guide">
			        <a href="userManage.jsp"><img style="width: 33%" src="static/img/panda.png"></a>
			         <div>用户管理</div>
			      </div>
      		<%
      		}
      	}catch(Exception e)
      	{
      		
      	}
       %>
      
   </div>
</div>
<script type="text/javascript" src="static/js/index.js" ></script>
<%@ include file="static/include/footer.jsp" %>
