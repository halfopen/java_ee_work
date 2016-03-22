<%@page import="beans.Owner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%> 

<%@ include file="static/include/header.jsp" %>
<%
	String idString = request.getParameter("id");
	Owner owner=new Owner();
	Integer ownerType;
	String operator="";
	Boolean can_operateBoolean=false;
	try{
		
		Integer session_user_id =(Integer)session.getAttribute("id");
		owner.setType( (Integer)session.getAttribute("owner_type"));
		owner.setName((String)session.getAttribute("owner_name"));
		owner.setId((Integer)session.getAttribute("owner_id"));
		can_operateBoolean=true;
		//out.print(userType);
	}catch(Exception e){
		can_operateBoolean=false;
	}
 %>
<div class="container">
    <h1 class="animated bounceInLeft"><span>习题三 车辆管理系统</span></h1>
    
    <div class="text-muted">武汉大学2013级 计科三班 2013301500100 秦贤康</div>
    <fieldset style="border:1px solid #B5B8C8;padding:10px;margin-bottom:10px;display:block;border-bottom-color:Red; border-left-color:Green; border-right-color:Blue; border-top-color:Purple; text-decoration:none;">
        <legend class="animated bounceInLeft" style="width: inherit"><a data-toggle="collapse" class="mybutton" data-parent="#accordion" href="./#requirements"><span style="padding: 60px;color: white;">要求</span></a></legend>
        <div id="requirements" class="panel-collapse collapse ">
        <div class="text-muted panel-body">
         	<p>实现车辆管理系统的部分功能，以下操作均由管理员登录后操作，用户登录后只能查看自己的个人信息及拥有的车辆信息</p>
         	<p>实现人员的添加、删除、修改功能</p>
         	<p>实现车辆的添加、删除、修改功能</p>
         	<p>人员及车辆的多条件组合关联查询</p>
         	<p>具有错误处理功能、分页显示功能</p>
         	<p>要求使用Struts+Spring+Hibernate实现</p>

        </div>
        </div>
    </fieldset>
    <div>
    	<% if(can_operateBoolean==false){ %>
    		<a href="owner_login.jsp" class="btn-success" >登录</a><a href="owner_register.jsp" class="btn-danger">注册</a>
    	<%}else{ %>
    		<%if(owner.getType()==0)out.print("管理员:");else out.print("普通用户:"); %><a href="owner_cars.jsp?id=<%=owner.getId() %>" class="btn-success"><%=owner.getName() %></a><a class="btn-danger" href="servlet/OwnerLogout">注销</a>
    	<%} %>
    </div>
   	<h2>所有车辆</h2>
   	
   	<div class="container" style="<% if(owner.getType()!=0 || can_operateBoolean==false)out.print("display:none");%>">
   		<div><a href="edit_car.jsp" class="btn btn-primary">添加车辆</a><a href="edit_owner.jsp" class="btn btn-success">添加车主</a></div>
	    <table id="table"
	           data-show-columns="true"
	           data-search="true"
	           data-show-refresh="true"
	           data-show-toggle="true"
	           data-pagination="true"
	           data-height="500">
	        <thead>
	        
	    </table>
	</div>
</div>


<script src="static/js/tableExport.js"></script>
<script src="static/js/jquery.base64.js"></script>
<script src="static/js/bootstrap-table.js"></script>
<script src="static/js/bootstrap-table-export.js"></script>
<script type="text/javascript" src="static/js/index3.js" ></script>
<%@ include file="static/include/footer.jsp" %>
