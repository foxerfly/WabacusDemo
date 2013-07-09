<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="org.dom4j.*"%>
<%@ page import="org.dom4j.io.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.wabacus.config.xml.XmlAssistant"%>
<html>
	<head></head>
	<body>

		<%
			String configfilename=request.getParameter("configfilename");
			configfilename=configfilename==null?"":configfilename.trim();
			if(configfilename.equals(""))
			{
				out.println("没有取到页面所在的配置文件名，无法显示其配置");
				return;
			}
			String otherfilename=request.getParameter("otherfilename");
			otherfilename=otherfilename==null?"":otherfilename.trim();
		%>
<div style='font-family:Tahoma, Verdana, Geneva, Arial, Helvetica, sans-serif;font-size:15px;'>
<b>所在配置文件名：</b><br/><%=configfilename%><br/>
<%
 	if(!otherfilename.equals(""))
 	{
%> 	
 <b>其它文件：</b><br/><%=otherfilename%>
<%	
 	}
%>
</div>		
		<%			
			String pageid=request.getParameter("pageid");
			pageid=pageid==null?"":pageid.trim();
			if(pageid.equals(""))
			{
				out.println("没有取到页面ID，无法显示其配置");
				return;
			}
		    String resultStr=null;
		    try
		    {
		    	Document doc=XmlAssistant.getInstance()
		            .loadXmlDocument("report//"+configfilename);
		    	Element root=doc.getRootElement();
		    	List lstElementPages=root.elements("page");
		    	Element elePage=null;
		    	if(lstElementPages!=null)
		    	{
		    		for(int i=0;i<lstElementPages.size();i++)
		    		{
		    			if(pageid.equals(((Element)lstElementPages.get(i)).attributeValue("id")))
		    			{
		    				elePage=(Element)lstElementPages.get(i);
		    				break;
		    			}
		    		}
		    	}
		    	if(elePage==null)
		    	{
		    		out.println("没有取到页面ID为"+pageid+"的配置");
					return;
		    	}
		        OutputFormat format1=new OutputFormat(" ",true);
		        format1.setEncoding("UTF-8");
		        format1.setExpandEmptyElements(true);
		        format1.setTrimText(false);
		        format1.setNewlines(false);
		        
		        StringWriter sw=new StringWriter();
		        XMLWriter out1=new XMLWriter(sw,format1);
		        out1.write(elePage);
		        out1.close();
		        resultStr=sw.toString();
		        resultStr=resultStr.replaceAll("<","&lt;");
		        resultStr=resultStr.replaceAll(">","&gt;");
		    }catch(Exception e)
		    {
		    	out.println("读取配置文件"+configfilename+"失败");
		        e.printStackTrace();
		    }
		%>
	<b>配置信息：</b><br/>
		<pre><%=resultStr%></pre>
	</body>
</html>
