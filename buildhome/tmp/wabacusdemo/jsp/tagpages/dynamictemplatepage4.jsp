<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="wabacus" prefix="wx"%>

<hr>
<b>本报表：</b>
<hr>
	<wx:component/>
<hr>
  第二个报表整体：
  	<wx:component componentid="report2"/>
<hr>
  第二个报表细节：
  				<span class="spanText">报表标题：</span><wx:title componentid="report2" type="title"/><br/>
				<span class="spanText">下载Excel链接：</span><wx:button componentid="report2" type="richexcel"/><br/>
				<font color="green">------------------------------------------------------------------------------------------</font><br/>
				<font color="blue">------------------------------------------报表数据----------------------------------------</font><br/>
				<wx:data col="deptno" componentid="report2" showdata="false"/>：<wx:data componentid="report2" col="deptno" showlabel="false"/><br/>
				<wx:data col="deptname" componentid="report2" showdata="false"/>：<wx:data componentid="report2" col="deptname" showlabel="false"/><br/>
				部门经理：<wx:data col="manager" componentid="report2" showlabel="false"/><br/>
				创建日期：<wx:data col="builtdate" componentid="report2" showlabel="false"/><br/>
				表现：<wx:data col="performance" componentid="report2" showlabel="false"/><br/>
				简介：<wx:data col="description" componentid="report2" showlabel="false"/><br/>
<hr>



