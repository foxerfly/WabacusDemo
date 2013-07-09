<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="wabacus" prefix="wx"%>
			<font color="red"><b>显示第一个报表：<font color="blue" size="2">（这里只演示功能按钮和数据部分的细节控制，其它部分不再演示，请参看“数据展示篇”）</font></b></font>
			<hr/>
				<font color="blue">------------------------------------------搜索栏------------------------------------------</font><br/>
				<wx:searchbox/><br/>
				<font color="blue">------------------------------------------------------------------------------------------</font><br/>
				<font color="green">------------------------------------------标题栏------------------------------------------</font><br/>
				<wx:title/><br/>
				<font color="green">------------------------------------------------------------------------------------------</font><br/>
				
				<font color="red">------------------------------------------功能按钮------------------------------------------</font><br/>
				<span class="spanText">保存按钮：</span>
					<wx:button type="save"/>&nbsp;&nbsp;
					<wx:button type="save">保存</wx:button>&nbsp;&nbsp;
					<wx:button type="save"><input type="button" value="保存"></wx:button><br/>
				<span class="spanText">添加按钮：</span>
					<wx:button type="add"/>&nbsp;&nbsp;
					<wx:button type="add">添加</wx:button>&nbsp;&nbsp;	
					<wx:button type="add"><input type="button" value="添加"></wx:button><br/>
				<span class="spanText">删除按钮：</span>	
					<wx:button type="delete"/>&nbsp;&nbsp;
					<wx:button type="delete">删除</wx:button>&nbsp;&nbsp;
					<wx:button type="delete"><input type="button" value="删除"></wx:button><br/>
				<font color="red">------------------------------------------------------------------------------------------</font><br/>
				
				<font color="red">------------------------------------------报表数据----------------------------------------</font><br/>
				<span class="spanText">数据标题部分：</span><br/><wx:data showdata="false"/><br/>
				<span class="spanText">数据列表部分：</span><br/><wx:data showlabel="false"/><br/>
				<font color="red">------------------------------------------------------------------------------------------</font><br/>
				<font color="green">------------------------------------------翻页导航栏--------------------------------------</font><br/>
				<wx:navigate/><br/>
				<font color="green">------------------------------------------------------------------------------------------</font><br/>
			