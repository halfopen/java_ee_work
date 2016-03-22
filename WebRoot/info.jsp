<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%> 
<%@ page import="java.net.URLDecoder" %>
<%@ include file="static/include/header.jsp" %>

<div class="container">
    <h1 class="animated bounceInLeft">信息提示</h1>
    <fieldset style="border:1px solid #B5B8C8;padding:10px;margin-bottom:10px;display:block;border-bottom-color:Red; border-left-color:Green; border-right-color:Blue; border-top-color:Purple; text-decoration:none;">
      <ul class="text-muted panel-body">
         	<%=URLDecoder.decode(request.getParameter("info"),"UTF-8") %>

        </ul>
   	</fieldset>
</div>
<%@ include file="static/include/footer.jsp" %>
