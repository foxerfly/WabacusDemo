<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="wabacus" prefix="wx"%>
<html>
<head>
<script language="javascript">
function  doSelect(reporttype)
{
  var chkObjs=document.getElementsByName('type');
  var result='';
  for(var i=0;i<chkObjs.length;i++)
  {
  	   if(chkObjs[i].checked) result=result+chkObjs[i].value+",";
  }
  selectOK(result,null,null,false);//将选中值设置到本弹出窗口的源输入框中，并且不关闭弹出窗口，否则后面无法设置其它列的值
  selectOK(result,'name',null,false);//将选中值设置到“姓名”列中，并且不关闭弹出窗口，否则后面无法设置其它列的值
  //selectOK(result,'deptno');//设置隐藏列的值
  if(reporttype=='editablelist2'||reporttype=='editabledetail2')
  {//这两种报表类型的“部门”列的值和显示label不同，因此为它们设置了新值时，如果值和label不同，则需要分别设置，如下所示
  		selectOK('0006','deptname','人事行政部');//将部门设置为物流部，它的值为0002，显示label为人事行政部
  }else
  {//editabledetail因为是显示时即显示输入框，因此不用考虑显示label的问题，只要提供值，下拉框本身会提供显示label
  		selectOK('0006','deptname');
  }
}
</script>
</head>
<body>
  <wx:popuppage/><!-- 框架的自定义标签，一定要放在弹出窗口的JSP页面中 -->
  <%
  	String no=request.getParameter("no");
  	String name=request.getParameter("name");
  	String oldvalue=request.getParameter("OLDVALUE");//OLDVALUE是框架自动传过来当前列的数据
  	oldvalue=oldvalue==null?"":oldvalue.trim();
  	String reporttype=request.getParameter("type");
  	String checked="";
  	if(name==null||name.trim().equals("")) name=no;
  %>
  为员工<u><i><%=name%></i></u>选择兴趣爱好
  <hr/>
  <% if(oldvalue.indexOf("篮球")>=0) checked="checked"; else checked="";%>
  <input type="checkbox" name="type" value="篮球" <%=checked%>/>篮球
  <% if(oldvalue.indexOf("足球")>=0) checked="checked"; else checked="";%>
  <input type="checkbox" name="type" value="足球" <%=checked%>/>足球
  <% if(oldvalue.indexOf("排球")>=0) checked="checked"; else checked="";%>
  <input type="checkbox" name="type" value="排球" <%=checked%>/>排球
  <% if(oldvalue.indexOf("游泳")>=0) checked="checked"; else checked="";%>
  <input type="checkbox" name="type" value="游泳" <%=checked%>/>游泳
  <br/><br/>
  <% if(oldvalue.indexOf("看书")>=0) checked="checked"; else checked="";%>
  <input type="checkbox" name="type" value="看书" <%=checked%>/>看书
  <% if(oldvalue.indexOf("唱歌")>=0) checked="checked"; else checked="";%>
  <input type="checkbox" name="type" value="唱歌" <%=checked%>/>唱歌
  <% if(oldvalue.indexOf("旅游")>=0) checked="checked"; else checked="";%>
  <input type="checkbox" name="type" value="旅游" <%=checked%>/>旅游
  <% if(oldvalue.indexOf("跑步")>=0) checked="checked"; else checked="";%>
  <input type="checkbox" name="type" value="跑步" <%=checked%>/>跑步
  <br/><br/>
  <% if(oldvalue.indexOf("健身")>=0) checked="checked"; else checked="";%>
  <input type="checkbox" name="type" value="健身" <%=checked%>/>健身
  <% if(oldvalue.indexOf("爬山")>=0) checked="checked"; else checked="";%>
  <input type="checkbox" name="type" value="爬山" <%=checked%>/>爬山
  <br/><br/>
  <p align='center'><input type="button" value="确定" onclick="doSelect('<%=reporttype%>')"/></p>
  <br/><br/>
  <font family ="Tahoma, Verdana, Geneva, Arial, Helvetica, sans-serif" size ="2px" color="#ff3f3f">
  注意：如果员工姓名显示为乱码，或不能正常将此员工已选中的兴趣爱好选项选中，请检查是否出现了乱码。
  比如在tomcat环境中，如果采用UTF-8编码，必须设置server.xml的&lt;Connector/>的URIEncoding属性为"UTF-8"
  即 &lt;Connector ... URIEncoding="UTF-8"/&gt;
</font>
</body>
</html>