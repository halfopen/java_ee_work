<%@page import="dao.OwnerDao"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.beans.factory.BeanFactory"%>
<%@page import="beans.Owner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%> 

<%@ include file="static/include/header.jsp" %>
<%
	Owner owner = new Owner();
	BeanFactory factory = new ClassPathXmlApplicationContext("applicationContext.xml");

    OwnerDao  ownerDao=(OwnerDao) factory.getBean("OwnerDao");
    String id="";
	try{
		id=request.getParameter("id");
		owner=ownerDao.queryOwner(Integer.parseInt(id));
	}catch(Exception e){
		
	}
 %>
<div class="container">
	<h1 class="animated bounceInLeft"><span>习题三 车辆管理系统</span></h1>
    <h1 class="animated bounceInLeft"><div class="btn-default center" style="text-align:center">车主信息</div></h1>
    <form class="form-horizontal vertical-center" role="form" action="edit_owner.action" method="post">
	   <div class="form-group">
	      <label for="firstname" class="col-sm-2 control-label">车主名</label>
	      <div class="col-sm-10">
	      	<input type="hidden"  name="id" value="<%=request.getParameter("id") %>"/>
	         <input type="text" class="form-control name" id="name" name="name" value="<%if(owner.getName()!=null)out.print(owner.getName()); %>"
	            placeholder="请输入车主名">
	      </div>
	   </div>
	   <div class="form-group">
	      <label for="lastname" class="col-sm-2 control-label">密码</label>
	      <div class="col-sm-10">
		      	<input id="password" class="form-control" name="password"  type="password"/>
	       </div>
	   </div>
	   <div class="form-group">
	      <div class="col-sm-offset-2 col-sm-10">
	         <input  class="btn btn-success submit-login" value="确认"  type="submit"/>
	      </div>
	   </div>
	</form>
</div>
<script>
	 $.ajax({
         type:"GET",
         url:"servlet/GetAllOwners",
         //返回数据的格式
         datatype: "json",//"xml", "html", "script", "json", "jsonp", "text".
         success:function(data){
        	 console.log(data);
        	 data=  $.parseJSON(data);
        	 console.log(data.length);
        	 html="";
        	 for(var i=0;i<data.length;i++){
        	 	html+="<option value='"+data[i].id+"'>"+data[i].name+"</option>";
        	 }
        	 $("#car_owner").html(html);
         }   ,
         error: function(){
         	bootbox.alert("<h1>请求失败</h1>", function() {
                 console.log("ok");
             });
         }
 });
</script>
<script type="text/javascript" src="static/js/index3.js" ></script>
<%@ include file="static/include/footer.jsp" %>