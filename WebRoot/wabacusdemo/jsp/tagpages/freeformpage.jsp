<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="com.wabacus.system.ReportRequest,com.wabacus.util.Consts"%>
<%@ taglib uri="wabacus" prefix="wx"%>
<link rel="stylesheet" href="/WabacusDemo/wabacusdemo/third-components/widgEditor/css/info.css"/>
<link rel="stylesheet" href="/WabacusDemo/wabacusdemo/third-components/widgEditor/css/main.css"/>
<link rel="stylesheet" href="/WabacusDemo/wabacusdemo/third-components/widgEditor/css/widgEditor.css"/>
<link rel="stylesheet" href="/WabacusDemo/wabacusdemo/third-components/datepicker/slimpicker.css"/>
<script src="/WabacusDemo/wabacusdemo/third-components/datepicker/mootools-1.2.4-core-yc.js"></script>
<script src="/WabacusDemo/wabacusdemo/third-components/datepicker/mootools-1.2.4.4-more-yc.js"></script>
<script src="/WabacusDemo/wabacusdemo/third-components/datepicker/slimpicker.js"></script>
<script src="/WabacusDemo/wabacusdemo/third-components/widgEditor/scripts/widgEditor.js"></script>

<%
	ReportRequest rrequest=(ReportRequest)request.getAttribute("WX_REPORTREQUEST");
%>
			<form>
<%
    ///////////下面获取报表数据的代码必须放在<wx:report>标签的后面，因为显示了<wx:report>后才会加载此报表数据，才能获取到。
	/**
	 * 因为此表单所有列所用的POJO是框架自动生成，因此取用其数据时，需要通过框架的rrequest的getColDisplayValue方法获取。
	 *		getColDisplayValue()方法得到的是此列的显示字符串，如果想获取某列相应类型的值，则调用rrequest的getColRealValue方法。
	 * 如果是自己开发POJO，则可以先调用rrequest的getReportDataObj(String reportid,int rowindex)方法获取到存放指定行的POJO对象
	 *     然后转换成真正类型后，直接调用它的get/set方法得到指定列的数据
	 */
	String report1_age=rrequest.getColDisplayValue("report1","age",0);//年龄
	String report1_sex=rrequest.getColDisplayValue("report1","sex",0);//性别
	String report1_marriage=rrequest.getColDisplayValue("report1","marriage",0);//婚否
	String report1_salary=rrequest.getColDisplayValue("report1","salary",0);//工资
	String report1_joinindate=rrequest.getColDisplayValue("report1","joinindate",0);//入职日期
	String report1_description=rrequest.getColDisplayValue("report1","description",0);//简介
	report1_sex=report1_sex==null?"":report1_sex.trim();
	report1_age=report1_age==null?"":report1_age.trim();
	report1_marriage=report1_marriage==null?"":report1_marriage.trim();
	report1_salary=report1_salary==null?"":report1_salary.trim();
	report1_joinindate=report1_joinindate==null?"":report1_joinindate.trim();
	report1_description=report1_description==null?"":report1_description.trim();

%>			
				<input type="hidden" id="marriage_old" value="<%=report1_marriage%>">
				<input type="hidden" id="salary_old" value="<%=report1_salary%>">
				<input type="hidden" id="age_old" value="<%=report1_age%>">
				<table width="100%" border="0" cellspacing="3" style="border:1px solid #ACCCFF;BORDER-COLLAPSE:collapse;">
				  <tr><td align="center" colspan="3" style="border:1px solid #BDDFFF;"><b><wx:title type="title"/></b></td></tr>
				  <tr>
					<td align="left" style="border:1px solid #BDDFFF;">工号：<wx:data col="no" showlabel="false"/></td>
					<td align="left" style="border:1px solid #BDDFFF;">姓名：<wx:data col="name" showlabel="false"/></td>
					<td align="left" style="border:1px solid #BDDFFF;">英文名：<wx:data col="ename" showlabel="false"/></td>
				  </tr>
				  <tr>
					<td align="left" style="border:1px solid #BDDFFF;"><input type="radio" name="report1sex" value="1" onclick="doSexOptionClick('1')" <%if(report1_sex.equals("1")) out.println("checked");%>>&nbsp;男</td>
					<td align="left" style="border:1px solid #BDDFFF;">婚否：<select id="id_report1marriage" onchange="doAddDataForSaving('freeformpage1_guid_report1','true');" <%if(!report1_sex.equals("1")) out.println("disabled");%>>
											<option value="1" <%if(report1_marriage.equals("1")) out.println("selected");%>>已婚</option>
											<option value="0" <%if(report1_marriage.equals("0")) out.println("selected");%>>未婚</option> 
										  </select></td>
					<td align="left" style="border:1px solid #BDDFFF;">年龄：<input type="text" id="id_report1age" onkeypress="doAddDataForSaving('freeformpage1_guid_report1','true');" <%if(!report1_sex.equals("1")) out.println("disabled");%> value="<%=report1_age%>"> </td>
				  </tr>
				  <tr>
					<td align="left" style="border:1px solid #BDDFFF;"><input type="radio" name="report1sex" value="0" onclick="doSexOptionClick('0')" <%if(report1_sex.equals("0")) out.println("checked");%>>&nbsp;女</td>
					<td align="left" colspan="2" style="border:1px solid #BDDFFF;">工资：<input type="text" id="id_report1salary" onkeypress="doAddDataForSaving('freeformpage1_guid_report1','true');" <%if(!report1_sex.equals("0")) out.println("disabled");%> value="<%=report1_salary%>"> </td>
				  </tr>
				  <tr>
				    <td align="left" style="border:1px solid #BDDFFF;">
						出生日期：<wx:data col="birthday" showlabel="false"/>
					</td>
					<td align="left" style="border:1px solid #BDDFFF;">
					  <table><tr><td>
						入职日期：</td><td><input id="id_joinindate" name="id_joinindate" type="text" class="slimpicker" autocomplete="off" value="<%=report1_joinindate%>" />
						</td></tr></table>
					</td>
					<td align="left" style="border:1px solid #BDDFFF;">
						所属部门：<wx:data col="deptname" showlabel="false"/>
					</td>
				  </tr>
				  <tr>
				    <td align="left" style="border:1px solid #BDDFFF;">
						省：<wx:data col="province" showlabel="false"/>
					</td>
					<td align="left" style="border:1px solid #BDDFFF;">
						市：<wx:data col="city" showlabel="false"/>
					</td>
					<td align="left" style="border:1px solid #BDDFFF;">
						县：<wx:data col="county" showlabel="false"/>
					</td>
				  </tr>
				  <tr>
					<td align="left" colspan="3" style="border:1px solid #BDDFFF;">简介：
						<textarea id="id_description" name="id_description" class="widgEditor nothing">
							<%=report1_description%>
						</textarea>
					</td>
				  </tr>
				  <tr>
					<td align="center" colspan="3">
						<wx:button type="save"/><wx:button type="modify"/><wx:button type="add"/><wx:button type="cancel"/><wx:button type="reset"/>
					</td>
				  </tr>
				</table>
			</form>
