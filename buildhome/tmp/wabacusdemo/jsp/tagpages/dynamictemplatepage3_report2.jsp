<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="wabacus" prefix="wx"%>
				<br/>
				<font color="blue">------------------------------------------搜索栏------------------------------------------</font><br/>
				<span class="spanText">搜索条件：</span><wx:searchbox condition="txtdeptno"/>&nbsp;&nbsp;&nbsp;&nbsp;<span class="spanText">搜索按钮：</span><wx:button type="search"/><br/>
				<font color="blue">------------------------------------------------------------------------------------------</font><br/>
				<font color="green">------------------------------------------标题栏------------------------------------------</font><br/>
				<span class="spanText">报表标题：</span><wx:title type="title"/><br/>
				<span class="spanText">下载Excel链接：</span><wx:button type="richexcel"/><br/>
				<font color="green">------------------------------------------------------------------------------------------</font><br/>
				<font color="blue">------------------------------------------报表数据----------------------------------------</font><br/>
				<wx:data col="deptno" showdata="false"/>：<wx:data col="deptno" showlabel="false"/><br/>
				<wx:data col="deptname" showdata="false"/>：<wx:data col="deptname" showlabel="false"/><br/>
				部门经理：<wx:data col="manager" showlabel="false"/><br/>
				创建日期：<wx:data col="builtdate" showlabel="false"/><br/>
				表现：<wx:data col="performance" showlabel="false"/><br/>
				简介：<wx:data col="description" showlabel="false"/><br/>
				<font color="blue">------------------------------------------------------------------------------------------</font><br/>
