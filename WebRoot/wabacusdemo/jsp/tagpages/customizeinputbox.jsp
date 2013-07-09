<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="com.wabacus.system.ReportRequest,com.wabacus.util.Consts"%>
<%@ taglib uri="wabacus" prefix="wx"%>

	  <STYLE type=text/css>
		<!--
			.spanText{
				font-family : Tahoma, Verdana, Geneva, Arial, Helvetica, sans-serif; 	font-size : 13px;font-weight:bold;
			}
		-->
		</STYLE>
		<script language="javascript">
			function  setRadioValueToPerformace(pageid)
			{
  				var radioObjs = document.getElementsByName('performanceRadio');
				if (radioObjs) 
				{
					for (var i = 0; i < radioObjs.length; i = i + 1) 
					{
						if (radioObjs[i].checked)
						{ 
							setInputboxValueForDetailReport(pageid,'report1','performance',radioObjs[i].value);//这是框架的javascript函数，用于设置输入框的值
							break;	
						}
					}
				}
			}
		</script>
<%
	ReportRequest rrequest=(ReportRequest)request.getAttribute("WX_REPORTREQUEST");
	String pageid=rrequest.getPagebean().getId();//取到页面ID
%>
				<font color="blue">------------------------------------------搜索栏------------------------------------------</font><br/>
				<span class="spanText">搜索条件：</span><wx:searchbox condition="txtdeptno"/>&nbsp;&nbsp;&nbsp;&nbsp;<span class="spanText">搜索按钮：</span><wx:button type="search"/><br/>
				<font color="blue">------------------------------------------------------------------------------------------</font><br/>
				<font color="green">------------------------------------------标题栏------------------------------------------</font><br/>
				<span class="spanText">报表标题：</span><wx:title type="title"/><br/>
				<span class="spanText">下载Excel链接：</span><wx:button type="richexcel"/><br/>
				<font color="green">------------------------------------------------------------------------------------------</font><br/>
				<font color="blue">------------------------------------------报表数据----------------------------------------</font><br/>
				<b><wx:data col="deptno" showdata="false"/>：</b><wx:data col="deptno" showlabel="false"/><br/>
				<b><wx:data col="deptname" showdata="false"/>：</b><wx:data col="deptname" showlabel="false"/><br/>
				<b>部门经理：</b><wx:data col="manager" showlabel="false"/><br/>
				<b>创建日期：</b><wx:data col="builtdate" showlabel="false"/><br/>
				
				<b>表现：</b><wx:data col="performance" showlabel="false" inputbox="false">
<%				
				String accessmode=rrequest.getStringAttribute("report1","CURRENT_ACCESSMODE","");//获取当前访问模式
				String perform=rrequest.getColDisplayValue("report1","performance",0);
				perform=perform==null?"":perform.trim();
				if(accessmode.equals(Consts.ADD_MODE)||accessmode.equals(Consts.UPDATE_MODE))
				{//如果是编辑或添加数据模式
					String select_youxiu="";
					String select_lianghao="";
					String select_jiaohao="";
					String select_hencha="";
					if(perform.equals("优秀"))
					{
						select_youxiu="checked";
					}else if(perform.equals("良好"))
					{
						select_lianghao="checked";
					}else if(perform.equals("较好"))
					{
						select_jiaohao="checked";
					}else if(perform.equals("很差"))
					{
						select_hencha="checked";
					}
%>
					<input type="radio" onclick="setRadioValueToPerformace('<%=pageid%>');" name="performanceRadio" <%=select_youxiu%> value="优秀">优秀&nbsp;&nbsp;
					<input type="radio" onclick="setRadioValueToPerformace('<%=pageid%>');" name="performanceRadio" <%=select_lianghao%> value="良好">良好&nbsp;&nbsp;
					<input type="radio" onclick="setRadioValueToPerformace('<%=pageid%>');" name="performanceRadio" <%=select_jiaohao%> value="较好">较好&nbsp;&nbsp;
					<input type="radio" onclick="setRadioValueToPerformace('<%=pageid%>');" name="performanceRadio" <%=select_hencha%> value="很差">很差&nbsp;&nbsp;
<%					
				}else
				{//浏览模式
%>			
					<%=perform%>
<%
				}			
%>					
		  			  </wx:data>
				<br/>
				<b>简介：</b><wx:data col="description" showlabel="false" inputbox="false">
<%
				//String accessmode=rrequest.getStringAttribute("report1","CURRENT_ACCESSMODE","");
				String desc=rrequest.getColDisplayValue("report1","description",0);
				desc=desc==null?"":desc.trim();
				//if(accessmode.equals(Consts.ADD_MODE)||accessmode.equals(Consts.UPDATE_MODE))
				//{//如果是编辑或添加数据模式
%>
					<textarea id="report1description" cols="30" onblur="setInputboxValueForDetailReport('<%=pageid%>','report1','description',this.value);"><%=desc%></textarea><font color='red'>*</font>
					</wx:data>
				<br/>
				<br/>
				<wx:button type="save"/><wx:button type="modify"/><wx:button type="add"/><wx:button type="cancel"/><wx:button type="reset"/>
				
			<br><br><br>
			<font color='#ff0000'>说明：</font>
			<font color='#0000FF'>
				在此演示页面中，“表现”、“简介”两个数据的输入框是用户在自定义JSP页面中自己实现的，而没有用框架提供的输入框。
			</font>