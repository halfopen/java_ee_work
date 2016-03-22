<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.beans.factory.BeanFactory"%>
<%@page import="beans.Car"%>
<%@page import="dao.CarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%> 

<%@ include file="static/include/header.jsp" %>
<%
	Car car = new Car();
	BeanFactory factory = new ClassPathXmlApplicationContext("applicationContext.xml");
    CarDao  carDao=(CarDao) factory.getBean("CarDao");
    String id="";
	try{
		id=request.getParameter("id");
		car=carDao.queryCar(Integer.parseInt(id));
	}catch(Exception e){
		
	}
 %>
<div class="container">
	<h1 class="animated bounceInLeft"><span>习题三 车辆管理系统</span></h1>
    <h1 class="animated bounceInLeft"><div class="btn-default center" style="text-align:center">车辆信息</div></h1>
    <form class="form-horizontal vertical-center" role="form" action="edit_car.action" method="post">
	   <div class="form-group">
	      <label for="firstname" class="col-sm-2 control-label">车名</label>
	      <div class="col-sm-10">
	      	<input type="hidden"  name="id" value="<%=request.getParameter("id") %>"/>
	         <input type="text" class="form-control name" id="name" name="name"  value="<%if(car.getName()!=null)out.print(car.getName()); %>"
	            placeholder="请输入车名">
	      </div>
	   </div>
	   <div class="form-group">
	      <label for="lastname" class="col-sm-2 control-label">车主</label>
	      <div class="col-sm-10">
		      	<select id="car_owner" class="form-control" name="car_owner">
	           </select>
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