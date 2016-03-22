<%@page import="beans.Owner"%>
<%@page import="dao.OwnerDao"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.beans.factory.BeanFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%> 

<%@ include file="static/include/header.jsp" %>

<%
	String id = request.getParameter("id");
	BeanFactory factory = new ClassPathXmlApplicationContext("applicationContext.xml");

    OwnerDao  ownerDao=(OwnerDao) factory.getBean("OwnerDao");
    Owner owner = ownerDao.queryOwner(Integer.parseInt(id));
    System.out.println(owner);
 %>
<div class="container">
    <h1 class="animated bounceInLeft">习题三</h1>
    <div class="text-muted">武汉大学2013级 计科三班 2013301500100 秦贤康</div>

   	<h2>显示用户:<b><%=owner.getName() %></b>的所有车辆</h2>
   	<span><a class="btn-danger" href="edit_owner.jsp?id=<%=request.getParameter("id") %>">编辑车主</a></span>
   	<div class="container" >
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
<script type="text/javascript" src="static/js/show_owner_cars.js" ></script>

<%@ include file="static/include/footer.jsp" %>
