<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%> 

<%@ include file="static/include/header.jsp" %>

<div class="container">
    <h1 class="animated bounceInLeft">习题二</h1>
    <div class="text-muted">武汉大学2013级 计科三班 2013301500100 秦贤康</div>
    <fieldset style="border:1px solid #B5B8C8;padding:10px;margin-bottom:10px;display:block;border-bottom-color:Red; border-left-color:Green; border-right-color:Blue; border-top-color:Purple; text-decoration:none;">
        <legend class="animated bounceInLeft" style="width: inherit"><a data-toggle="collapse" class="mybutton" data-parent="#accordion" href="./#requirements"><span style="padding: 60px;color: white;">要求</span></a></legend>
        <div id="requirements" class="panel-collapse collapse ">
        <div class="text-muted panel-body">
         	<p>1、建立数据库表包含用户名、密码、邮箱、用户登录次数、用户最后登录时间、用户类型、用户状态等信息</p>
			 <p>2、如果用户库表为空则添加用户名、密码均为“admin”的用户，该用户类型为管理员</p>
			 <p>3、普通用户可以注册，等管理员审批后即可登录</p>
			 <p>4、普通用户登录后可以修改自己的密码、邮箱信息</p>
			 <p>5、管理员登录后可以查询、添加、删除、修改、审批、锁定普通用户及修改自己的信息，也可以添加其它管理员</p>
			 <p>6、具有错误处理功能，例如用户注册输入非法邮箱</p>
			 <p>7、以上功能要求使用Struts2、DAO、VO实现</p>
        </div>
        </div>
    </fieldset>
   	<h2>用户首页</h2>
   	<div class="row">
      <div class="animated swing row-content col-lg-4 col-sm-4 col-xs-12 text-center index-guide">
         <a href="login.jsp"> <img style="width: 33%" src="static/img/article.png"></a>
          <div>登录</div>
      </div>
       <div class="animated swing row-content col-lg-4 col-sm-4 col-xs-12 text-center index-guide">
        <a href="register.jsp"><img style="width: 33%" src="static/img/hummingbird.png"></a>
         <div>注册</div>
      </div>
      
      <div class="animated swing row-content col-lg-4 col-sm-4 col-xs-12 text-center index-guide">
        <a href="userHome.jsp"><img style="width: 33%" src="static/img/browser-window.png"></a>
         <div>管理</div>
      </div>
   </div>
</div>
<script type="text/javascript" src="static/js/index.js" ></script>
<%@ include file="static/include/footer.jsp" %>
