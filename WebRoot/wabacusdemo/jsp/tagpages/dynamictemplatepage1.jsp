<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="com.wabacus.system.*,com.wabacus.system.component.application.report.abstractreport.AbsReportType,java.util.*,com.wabacus.system.assistant.*"%>
<%@ page import="com.wabacus.config.component.application.report.*"%>
<%@ taglib uri="wabacus" prefix="wx"%>

<hr>
<%
	ReportRequest rrequest=(ReportRequest)request.getAttribute("WX_REPORTREQUEST");
	AbsReportType reportTypeObj=(AbsReportType)request.getAttribute("WX_COMPONENT_OBJ");//取到报表对象
	List<AbsReportDataPojo> lstData=reportTypeObj.getLstReportData();
	for(AbsReportDataPojo dataObjTmp:lstData)
	{
		System.out.println(dataObjTmp.getColStringValue("name"));
	}
%>
<b>报表<%=reportTypeObj.getReportBean().getId() %>起始内容</b>
<hr>
	<wx:component/>
<hr>
  <b>报表<%=reportTypeObj.getReportBean().getId() %>结束内容</b>
<hr>



