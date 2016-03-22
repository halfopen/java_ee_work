<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%> 

<%@ include file="static/include/header.jsp" %>

<div class="container">
    <h1 class="animated bounceInLeft">评分标准及等级</h1>
    <fieldset style="border:1px solid #B5B8C8;padding:10px;margin-bottom:10px;display:block;border-bottom-color:Red; border-left-color:Green; border-right-color:Blue; border-top-color:Purple; text-decoration:none;">
      <ul class="text-muted panel-body">
         	<li>没有完成题目规定的功能（0－60）</li>
			<li>没有错误处理及错误提示（60－75）</li>
			<li>思路清晰、流程设计合理（75－90）</li>
			<li>界面排版合理、美观大方（90－100）</li>

        </ul>
   	</fieldset>
</div>
<%@ include file="static/include/footer.jsp" %>
