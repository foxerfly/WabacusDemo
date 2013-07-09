<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="com.wabacus.system.ReportRequest"%>
<%@ taglib uri="wabacus" prefix="wx"%>
		<script language="javascript">
			function  setAgeValue()
			{
  				var radioObjs = document.getElementsByName('type');
  				var type='';
				for (var i = 0; i < radioObjs.length; i = i + 1) 
				{
					if (radioObjs[i].checked)
					{ 
						type=radioObjs[i].value;
						break;	
					}
				}
				if(type=='') type='equals';
				var value=document.getElementById('id_age').value;
				if(value&&value!='')
				{
					var intvalue=parseInt(value);
					if(!intvalue||intvalue<=0||intvalue>=200)
					{
						alert(value+'不是有效年龄');
						document.getElementById('id_age').value='';
						document.getElementById('id_age').focus();
						return false;
					}
					setInputboxValueForCondition('searchboxpage3','report1','txtage',type+'|'+parseInt(value));//调用框架的javascript函数，用于设置输入框的值
				}else
				{
					setInputboxValueForCondition('searchboxpage3','report1','txtage','');
				}
			}
		</script>
<%
	ReportRequest rrequest=(ReportRequest)request.getAttribute("WX_REPORTREQUEST");
	String txtage=rrequest.getStringAttribute("txtage","");//取出输入框的条件值
	String type="=";
	String value="";
	//将age>38解析为type=">",value="38"，以便后面显示输入框时用上
	if(txtage!=null&&!txtage.trim().equals(""))
	{
		int idx=0;
		if((idx=txtage.indexOf('='))>0)
		{
			type="=";
		}else if((idx=txtage.indexOf('<'))>0)
		{
			type="<";
		}else if((idx=txtage.indexOf('>'))>0)
		{
			type=">";
		}
		value=txtage.substring(idx+1).trim();
	}
	String txtname=rrequest.getStringAttribute("txtname","");
	txtname=txtname==null?"":txtname.trim();
%>	
工号：<wx:searchbox condition="txtgonghao"/><!-- 框架提供的输入框 -->
姓名：<wx:searchbox condition="txtname" inputbox="false"><!-- 用户自定义输入框 -->
		 	<textarea onblur="setInputboxValueForCondition('searchboxpage3','report1','txtname',this.value)"><%=txtname%></textarea>		 	
	  </wx:searchbox>
	  <hr/>
	  <wx:searchbox condition="txtage" inputbox="false"><!-- 用户自定义输入框 -->
			年龄：<input type="text"  onblur="setAgeValue()" id="id_age" value="<%=value%>">&nbsp;&nbsp;
			比较类型：<input type="radio" name="type" value="equals" onclick="setAgeValue()" <%=!type.equals("=")?"":"checked"%>>等于&nbsp;
					 <input type="radio" name="type" value="great" onclick="setAgeValue()" <%=type.equals(">")?"checked":""%>>大于&nbsp;&nbsp;		
					<input type="radio" name="type" value="less" onclick="setAgeValue()" <%=type.equals("<")?"checked":""%>>小于&nbsp;&nbsp;
	  </wx:searchbox>
	  <wx:button type="search"/>
	  <br/><br/>
	  <wx:title/>
	  <wx:data/><br/>
	  <wx:navigate/>
