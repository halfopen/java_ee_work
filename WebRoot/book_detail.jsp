<%@page import="dao.BookDao"%>
<%@page import="beans.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%> 

<%@ include file="static/include/header.jsp" %>
<%
	int id;
	String idString = request.getParameter("id");
	BookDao bookDao = new BookDao();
	Book book= new Book();
	if(idString==null){
		//out.println("error");
		//id = 3;
		response.setContentType("text/html; charset=gb2312");
  		response.sendRedirect("index2.jsp");
  		return;
	}
	//out.print(idString);
	//id=3;
	id= Integer.parseInt(idString);
	book = bookDao.queryBook(id);
	
	//out.print(book);
 %>
<div class="container">
    <h1 class="animated bounceInLeft">书籍详情</h1>
    <div class="text-muted">武汉大学2013级 计科三班 2013301500100 秦贤康</div>
    
   	<form class="form-horizontal vertical-center" role="form" >
	   <div class="form-group">
	      <label for="firstname" class="col-sm-2 control-label">书名</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control name"  id="book-name" name="bookname"  value="<%=book.getBookname() %>"
	            placeholder="请输入书名">
	      </div>
	   </div>
	   <div class="form-group">
	      <label for="lastname" class="col-sm-2 control-label">价格</label>
	      <div class="col-sm-10">
	         <input type="text" class="form-control connect_way"  id="book-price" name="bookprice"  value="<%=book.getBookprice() %>"
	            placeholder="最高价格">
	      </div>
	   </div>
	   <div class="form-group">
	      <div class="col-sm-offset-2 col-sm-10">
	         <div bookid="<%=id %>" class="btn btn-default update-book">更新</div>
	      </div>
	   </div>
	</form>
</div>
<script type="text/javascript" src="static/js/index.js" ></script>
<%@ include file="static/include/footer.jsp" %>
