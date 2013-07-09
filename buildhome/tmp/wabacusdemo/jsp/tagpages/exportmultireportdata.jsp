<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="wabacus" prefix="wx"%>
<%
	String exporttype=request.getParameter("exporttype");//取出客户端传过来的本次导出数据的类型
	String exportreportids=request.getParameter("exportreportids");
%>
<p align="center">
	<wx:button type="<%=exporttype%>" componentid="<%=exportreportids%>"><input type="button" value="同时下载多个报表的数据"></wx:button><br>
</p>
<wx:searchbox/><br>
<wx:title/><br>
<wx:data/><br>
<wx:navigate/><br>




