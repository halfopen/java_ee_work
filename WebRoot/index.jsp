<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%> 

<%@ include file="static/include/header.jsp" %>

<div class="container">
    <h1 class="animated bounceInLeft">习题一</h1>
    <div class="text-muted">武汉大学2013级 计科三班 2013301500100 秦贤康</div>
    <fieldset style="border:1px solid #B5B8C8;padding:10px;margin-bottom:10px;display:block;border-bottom-color:Red; border-left-color:Green; border-right-color:Blue; border-top-color:Purple; text-decoration:none;">
        <legend class="animated bounceInLeft" style="width: inherit"><a class="mybutton" data-toggle="collapse" data-parent="#accordion" href="./#requirements"><span style="padding: 60px;color: white;">要求</span></a></legend>
        <div id="requirements" class="panel-collapse collapse ">
        <div class="text-muted panel-body">
         <p>1、建立数据库表包含书的序列号、书名、书价格</p>
		 <p>2、输入两个数字，查询价格在这两个数字之间的图书信息，考虑只输入一个价格的情况</p>
		 <p>3、实现图书的添加、删除、修改功能</p>
		 <p>4、具有错误处理功能，例如用户输入的非法字符</p>
		 <p>5、以上功能要求使用DAO和VO实现</p>
        </div>
        </div>
    </fieldset>
   	<h2>显示价格范围内的图书信息</h2>
   	<form class="form-horizontal vertical-center" role="form" >
	   <div class="form-group">
	      <label for="firstname" class="col-sm-2 control-label">最低价格</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control name" id="l_price" name="l_price"
	            placeholder="请输入最低价格">
	      </div>
	   </div>
	   <div class="form-group">
	      <label for="lastname" class="col-sm-2 control-label">最高价格</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control connect_way" id="h_price" name="h_price"
	            placeholder="最高价格">
	      </div>
	   </div>
	   <div class="form-group">
	      <div class="col-sm-offset-2 col-sm-10">
	         <div  class="btn btn-default submit-search">提交</div>
	      </div>
	   </div>
	</form>
	<h3>显示图书信息</h3>
	<div class="row free-tables-container">		
		
		
    </div>
</div>
<script type="text/javascript" src="static/js/index.js" ></script>
<%@ include file="static/include/footer.jsp" %>
