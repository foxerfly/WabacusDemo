<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="wabacus" prefix="wx"%>

<wx:searchbox/><br/>
<hr>
<p align="center">
	<!-- 在指定savebinding时，可以不指定此模板所属的报表ID，比如这里都没有指定report1 -->
	<wx:button type="save" savebinding="report2;report3"><input type="button" value="同时保存三个报表"></wx:button>&nbsp;&nbsp;
	<wx:button type="save" savebinding="report2"><input type="button" value="同时保存report1和report2报表"></wx:button>&nbsp;&nbsp;
	<wx:button type="save" savebinding="report3"><input type="button" value="同时保存report1和report3报表"></wx:button>
</p>
<hr>
<wx:title/><br/>
<wx:data/><br/>
<wx:navigate/><br/>




