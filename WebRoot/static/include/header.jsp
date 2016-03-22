<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>JavaEE 上机习题</title>
    <link rel="icon" href="static/img/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="statics/img/favicon.ico" type="image/x-icon" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!-- jQueryæä»¶ãå¡å¿å¨bootstrap.min.js ä¹åå¼å¥ -->
	<script src="static/js/jquery-2.1.4.min.js"></script>
	
	<!-- ææ°ç Bootstrap æ ¸å¿ JavaScript æä»¶ -->
	<script src="static/bootstrap-3.3.5-dist/js/bootstrap.min.js" ></script>
	<script src="static/bootstrap-3.3.5-dist/js/bootstrap-select.js" ></script>
	<script src="static/js/bootbox.js"></script>
	
	<script type="text/javascript" src="static/js/jquery-smartMenu.js" ></script>
	<script type="text/javascript" src="static/js/common.js" ></script>
	

	<link rel="stylesheet" type="text/css" href="static/css/animate.min.css" />
	<link rel="stylesheet" type="text/css" href="static/css/style.css"/>
	<link rel="stylesheet" type="text/css" href="static/css/smartMenu.css"/>
	<link rel="stylesheet" href= "static/bootstrap-3.3.5-dist/css/bootstrap.min.css" >
	
	<link rel="stylesheet" type="text/css" href="static/css/index.css"  />
	<link rel="stylesheet" type="text/css" href="static/css/staff.css"  />

	
	<link rel="stylesheet" href="static/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="static/css/bootstrap-table.min.css">
	<% request.setCharacterEncoding("UTF-8"); %>
  </head>
  
  <body>
  	<div class="screen-mask none"><div class="loading">请稍等</div></div>
    <!-- 首部导航 -->
	<nav class="navbar navbar-default " role="navigation">
	   <div style="position: relative;float: left;width: 20%;">&nbsp;</div>
	   <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse"
	         data-target="#example-navbar-collapse">
	         <span class="sr-only">切换导航</span>
	         <span class="icon-bar"></span>
	         <span class="icon-bar"></span>
	         <span class="icon-bar"></span>
	      </button>
	
	      <a href=""><img style="width: 40px; top: 5px; position: relative; left: -6px;" src="static/img/logo.png" ></a>
	      <a class="navbar-brand" href="">JavaEE上机习题</a>
	   </div>
	   <div class="collapse navbar-collapse" id="example-navbar-collapse">
	      <ul class="nav navbar-nav">
	         <li class="dropdown">
            <a  href="index.jsp" class="dropdown-toggle" data-toggle="dropdown">
               <img src="static/img/glyphicons_free/glyphicons/png/glyphicons-21-home.png">&nbsp;习题一 <b class="caret"></b>
            </a>
            <ul class="dropdown-menu">
               <li><a target="_blank" href="add.jsp">
                   <img src="static/img/glyphicons_free/glyphicons/png/glyphicons-31-pencil.png">&nbsp;添加</a></li>
               <li><a href="index.jsp">
                   <img src="static/img/glyphicons_free/glyphicons/png/glyphicons-28-search.png">&nbsp;查询</a></li>
            </ul>
         </li>
	         <li class="staff-nav"><a href="index2.jsp">
	            <img src="static/img/glyphicons_free/glyphicons/png/glyphicons-276-fast-food.png">&nbsp;习题二</a>
	         </li>
	         <li><a href="index3.jsp" >
	            <img src="static/img/glyphicons_free/glyphicons/png/glyphicons-43-pie-chart.png">&nbsp;习题三</a>
	         </li>
	          <li><a href="about.jsp" >
	            <img src="static/img/glyphicons_free/glyphicons/png/glyphicons-51-link.png">&nbsp;其它</a>
	         </li>
	      </ul>
	   </div>
	</nav>
