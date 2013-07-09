<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="wabacus" prefix="wx"%>
	<hr>
		员工信息列表报表功能按钮：
		<wx:button type="richexcel"/>&nbsp;&nbsp;<wx:button type="word"/>&nbsp;&nbsp;<wx:button type="search"/>
	<hr>
		<br><br>
	<hr>
		员工信息列表报表翻页按钮：
		<wx:navigate type="first"/>&nbsp;&nbsp;<wx:navigate type="previous"/>&nbsp;&nbsp;<wx:navigate type="next"/>&nbsp;&nbsp;<wx:navigate type="last"/>
	<hr>
	<hr>
		员工信息列表报表查询条件输入框：
		<wx:searchbox condition="txtno"/>&nbsp;&nbsp;<wx:searchbox condition="txtname"/>&nbsp;&nbsp;<wx:searchbox condition="txtsex"/>
	<hr>
