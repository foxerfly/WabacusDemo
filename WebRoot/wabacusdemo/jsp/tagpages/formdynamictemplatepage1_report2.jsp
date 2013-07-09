<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="wabacus" prefix="wx"%>
			<font color="red"><b>显示第二个表单：<font color="blue" size="2">（这里只演示功能按钮和数据部分的细节控制，其它部分不再演示，请参看“数据展示篇”）</font></b></font>
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
				<span class="spanText">重填按钮：</span>	
					<wx:button type="reset"/>&nbsp;&nbsp;
					<wx:button type="reset">重填</wx:button>&nbsp;&nbsp;
					<wx:button type="reset"><input type="button" value="重填"></wx:button><br/>
				<font color="red">------------------------------------------------------------------------------------------</font><br/>
				<font color="red">-----------------------------------表单数据------------------------------------------------</font><br/>
				工号：<wx:data col="no" showlabel="false"/><br/>
				中文名：<wx:data col="name" showlabel="false"/><br/>
				英文名：<wx:data col="ename" showlabel="false"/><br/>
				性别：<wx:data col="sex" showlabel="false"/><br/>
				年龄：<wx:data col="age" showlabel="false"/><br/>
				婚否：<wx:data col="marriage" showlabel="false"/><br/>
				工资：<wx:data col="salary" showlabel="false"/><br/>
				所属部门：<wx:data col="deptname" showlabel="false"/><br/>
				出生日期：<wx:data col="birthday" showlabel="false"/><br/>
				入职日期：<wx:data col="joinindate" showlabel="false"/><br/>
				省：<wx:data col="province" showlabel="false"/><br/>
				市：<wx:data col="city" showlabel="false"/><br/>
				县：<wx:data col="county" showlabel="false"/><br/>
				兴趣爱好：<wx:data col="interest" showlabel="false"/><br/>
				<font color="red">------------------------------------------------------------------------------------------</font><br/>
			
