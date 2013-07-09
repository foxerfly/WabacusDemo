<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="com.wabacus.system.ReportRequest"%>
<%@ taglib uri="wabacus" prefix="wx"%>
<%
	ReportRequest rrequest=(ReportRequest)request.getAttribute("WX_REPORTREQUEST");
%>
			<font color="red"><b>显示第一个报表：</b></font>
			<hr/>
				<font color="blue">------------------------------------------搜索栏------------------------------------------</font><br/>
				<span class="spanText">三个查询条件：</span><wx:searchbox condition="txtgonghao"/>|
				<wx:searchbox condition="txtprovince"/>|
				<wx:searchbox condition="txtcity"/><br/>
				<span class="spanText">搜索按钮的三种显示方式：</span><wx:button type="search"/>|
				<wx:button type="search">搜索</wx:button>|
				<wx:button type="search"><input type="button" value="搜索"></wx:button><br/>
				<span class="spanText">其它功能按钮：</span>
				<wx:button name="button1"/>|<wx:button name="button2"/>|<wx:button name="button3"/><br/>
				<font color="blue">------------------------------------------------------------------------------------------</font><br/>
				<font color="green">------------------------------------------标题栏------------------------------------------</font><br/>
				<span class="spanText">报表标题：</span><wx:title type="title"/><br/>
				<span class="spanText">下载Excel链接的几种形式：</span><wx:button type="richexcel"/>|<wx:button type="richexcel">以Excel形式显示</wx:button>|<wx:button type="richexcel"><input type="button" value="下载Excel"></wx:button><br/>
				<font color="green">------------------------------------------------------------------------------------------</font><br/>
				<font color="blue">------------------------------------------报表数据----------------------------------------</font><br/>
				<span class="spanText">数据标题部分：</span><br/><wx:data showdata="false"/><br/>
				<span class="spanText">数据列表部分：</span><br/><wx:data showlabel="false"/><br/>
				<span class="spanText">测试取任意单元格的数据：</span><br/>
				第一行：：工号列数据：<wx:data col="no" rowidx="0"/>；姓名列数据：<wx:data col="name" rowidx="0"/>；年龄列数据：<wx:data col="age" rowidx="0"/><br/>
				第三行：：工号列数据：<wx:data col="no" rowidx="2"/>；姓名列数据：<wx:data col="name" rowidx="2"/>；年龄列数据：<wx:data col="age" rowidx="2"/><br/>
				<font color="blue">------------------------------------------------------------------------------------------</font><br/>
				<font color="blue">------------------------------------------自定义数据表格----------------------------------------</font><br/>
<% 
				int size=rrequest.getReportDataListSize("report1");
				if(size>0)
				{
%>
					<table width="100%" cellspacing="1"  bgcolor="#ff7d00">
<%
					for(int i=0;i<size;i++)
					{
%>
						<tr>
							<td bgcolor="#ffffff"><%=rrequest.getColDisplayValue("report1","no",i) %></td>
							<td bgcolor="#ffffff"><%=rrequest.getColDisplayValue("report1","name",i) %></td>
							<td bgcolor="#ffffff"><%=rrequest.getColDisplayValue("report1","ename",i) %></td>
							<td bgcolor="#ffffff"><%=rrequest.getColDisplayValue("report1","sex",i) %></td>
							<td bgcolor="#ffffff"><%=rrequest.getColDisplayValue("report1","age",i) %></td>
							<td bgcolor="#ffffff"><%=rrequest.getColDisplayValue("report1","joinindate",i) %></td>
							<td bgcolor="#ffffff"><%=rrequest.getColDisplayValue("report1","province",i) %></td>
							<td bgcolor="#ffffff"><%=rrequest.getColDisplayValue("report1","city",i) %></td>
							<td bgcolor="#ffffff"><%=rrequest.getColDisplayValue("report1","county",i) %></td>
						</tr>
<%					
					}
%>
					</table>
<%				
				}
%>				
				<font color="blue">------------------------------------------------------------------------------------------</font><br/>
				<font color="green">------------------------------------------翻页导航栏--------------------------------------</font><br/>
				<span class="spanText">翻页信息：</span>当前页码：<wx:navigate type="pageno"/>；总页数：<wx:navigate type="pagecount"/>；总记录数：<wx:navigate type="recordcount"/><br/>
				<span class="spanText">翻页按钮：</span><wx:navigate type="first">首页</wx:navigate><wx:navigate type="previous">上一页</wx:navigate><wx:navigate type="next"><input type="button" value="下一页"></wx:navigate><wx:navigate type="last"/>||<wx:navigate type="sequence"/>||<wx:navigate type="sequence" minlength="3" initcount="3" maxcount="5"><u>%PAGENO%</u></wx:navigate><br/>
				<span class="spanText">当前页：</span><wx:navigate type="pageno">text</wx:navigate>|<wx:navigate type="pageno">textbox</wx:navigate>|<wx:navigate type="pageno">selectbox</wx:navigate><br/>
				<font color="green">------------------------------------------------------------------------------------------</font><br/>
