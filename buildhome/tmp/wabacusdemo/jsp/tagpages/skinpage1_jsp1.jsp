<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="com.wabacus.config.Config"%>
<%
	String myskin=request.getParameter("myskin");//本页面的主题风格
	String globalskin=request.getParameter("globalskin");//全局主题风格
	myskin=myskin==null?"":myskin.trim();
	globalskin=globalskin==null?"":globalskin.trim();
	boolean hasSetSkin=false;
	if(!myskin.equals(""))
	{//设置了本页面的主题风格
		Config.getInstance().setSkin(request,"skinpage1",myskin);
		hasSetSkin=true;
	}
	if(!globalskin.equals(""))
	{//设置了整个项目的全局风格
		Config.getInstance().setSkin(request,"",globalskin);
		hasSetSkin=true;
	}
	if(hasSetSkin)
	{//如果设置了主题风格，则刷新一下整个页面
%>
	<script type="text/javascript">
		parent.window.location.href='/WabacusDemo/ShowReport.wx?PAGEID=skinpage1';
	</script>
<%	
		return;
	}
	myskin=Config.getInstance().getSkin(request,"skinpage1");//取到页面的主题风格
	globalskin=Config.getInstance().getSkin(request,"");//取到全局的主题风格
%>
 <form name="frm1" action="/WabacusDemo/wabacusdemo/jsp/tagpages/skinpage1_jsp1.jsp" style="margin:0px">
	 <table width='100%' border="0">
	 	<tr>
	 		<td align='left' width='120px'>
	   		<font size="2">当前页面主题风格：</font>
	   	</td>
	   	<td align='left' width='60px'>
			   <select name="myskin">
			   	<option value="vista" <%="vista".equals(myskin)?"selected":""%>>vista</option>
			   	<option value="qq" <%="qq".equals(myskin)?"selected":""%>>qq</option>   
			   </select>
			</td>
			<td align='left' width='60px'>
	   		<input type="submit" value="设置"/>
	   	</td>
	   	<td align='left'>
	   		[<font color='red' size="2">说明：</font><font size="2" color='blue'>设置完成后只影响本用户访问本页面的主题风格</font>]
	   	</td>
	   </tr>
   </table>
 </form>

 <form name="frm2" action="/WabacusDemo/wabacusdemo/jsp/tagpages/skinpage1_jsp1.jsp" style="margin:0px">
 	<table width='100%' border="0">
	 	<tr>
	 		<td align='left' width='120px'>
			   <font size="2">全局默认主题风格：</font>
			</td>
	   	<td align='left' width='60px'>
			   <select name="globalskin">
			   	<option value="vista" <%="vista".equals(globalskin)?"selected":""%>>vista</option>
			   	<option value="qq" <%="qq".equals(globalskin)?"selected":""%>>qq</option>   
			   </select>
			</td>
			<td align='left' width='60px'>
				<input type="submit" value="设置"/>
			</td>
	   	<td align='left'>[<font color='red' size="2">说明：</font><font size="2" color='blue'>设置完成后会影响整个DEMO所有页面，可以在设置完成后点击其它页面查看效果，但不会影响其他用户</font>]
	   	</td>
	   </tr>
   </table>
 </form>
 <hr>
 <br>
 <font color='red' size="2">说明：</font><br>
 &nbsp;&nbsp;&nbsp;&nbsp;<font color='blue' size="2">1、如果设置了“当前页面主题风格”，再设置“全局默认主题风格”时对本页面无效，因为前者优先级更高，不过对DEMO的其它页面有效</font><br>
 &nbsp;&nbsp;&nbsp;&nbsp;<font color='blue' size="2">2、这里做为测试，只是将设置的主题风格保存在session中，用户可以将它保存在任意地方，具体参看《开发指南》文档</font><br>
 &nbsp;&nbsp;&nbsp;&nbsp;<font color='blue' size="2">3、vista和qq是框架内置的两种主题风格，用户也可以新增自己的主题风格，只要新增一个目录并提供相应的图片和CSS文件即可，具体参看《开发指南》文档</font>