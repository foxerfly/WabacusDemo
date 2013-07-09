<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="wabacus" prefix="wx"%>
<%
	String gh=request.getParameter("testbox");
	if(gh==null) gh="";
	else out.println("输入值："+gh);
%>
<br/><br/>
 <form name="frm" action="/WabacusDemo/wabacusdemo/jsp/tagpages/jspapppage1_jsp3.jsp">
   输入框：<input type="text" name="testbox" value="<%=gh%>"/>
	<input type="submit" value="提交"/>
 </form>