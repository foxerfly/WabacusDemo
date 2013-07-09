<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="wabacus" prefix="wx"%>
			<font color="red"><b>显示第二个报表：<font color="blue" size="2">（这里只演示功能按钮和数据部分的细节控制，其它部分不再演示，请参看“数据展示篇”）</font></b></font>
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
				<font color="red">------------------------------------------------------------------------------------------</font><br/>
				<font color="red">------------报表数据<font color="blue" size="2"><b>（注意：对于这种报表类型，报表数据部分不能拆开控制显示，否则不具有编辑功能）</b></font>-------</font><br/>
				<wx:data/><br/>
				<font color="red">------------------------------------------------------------------------------------------</font><br/>
