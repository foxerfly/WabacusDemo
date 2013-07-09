<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="wabacus" prefix="wx"%>
<html>
	<head>
	  <STYLE type=text/css>
		<!--
			.cls_td1
			{
				border:1px solid #5F9EA0;text-align:center;font-size : 13px;
			}
		-->
		</STYLE>
	</head>
	<body>
		<table border="0" cellspacing="1px" width="100%" style="border:1px solid #5F9EA0;BORDER-COLLAPSE:collapse;" align="left">
			<tr>
				<td colspan="3" class="cls_td1"><font size="3" color="blue"><b>测试文件上传标签</b></font></td>
			</tr>
		
				<tr>
				<td class="cls_td1"  colspan="3"  style="text-align:left;color:red">说明：<br/>
					&nbsp;&nbsp;1、这里上传文件全部保存在WEB服务器根目录，要换上传目录，请修改&lt;wx:fileupload/&gt;标签的savepath属性。<br/>
					&nbsp;&nbsp;2、这里介绍的文件上传功能是用标签实现，可以独立使用在任意JSP页面中，与文件上传输入框类型不同。<br/>
					&nbsp;&nbsp;3、这里只演示了大概功能，更多功能请参看《开发指南》中文件上传一节的介绍。<br/>
				</td>
			</tr>
			<tr style="background-color:#FAEBD7">
				<th class="cls_td1" width="20%">演示类型</th>
				<th  class="cls_td1" width="10%">功能</th>
				<th class="cls_td1" width="70%">描述</th>
			</tr>
			<tr>
				<th class="cls_td1" colspan="3" style="background-color:#F0F8FF;text-align:left;"><b>上传文件个数</b></th>
			</tr>
			<tr>
				<td class="cls_td1" width="20%">上传一个文件</td>
				<td  class="cls_td1" width="10%">
					<wx:fileupload savepath="relative{/}" allowtypes="xls;doc;txt;rtf;pdf"/>
				</td>
				<td class="cls_td1" style="text-align:left" width="70%">&nbsp;&nbsp;&nbsp;&nbsp;特点：
					这里演示了利用文件上传标签实现上传一个文件到服务器根目录的功能
				</td>
			</tr>
			<tr>
				<td class="cls_td1" width="20%">上传多个文件</td>
				<td  class="cls_td1" width="10%">
					<wx:fileupload savepath="relative{/}" allowtypes="xls;doc;txt;rtf;pdf"
										uploadcount="5" popupparams="{width:300,height:250}"/>
				</td>
				<td class="cls_td1" style="text-align:left" width="70%">
					&nbsp;&nbsp;&nbsp;&nbsp;特点：这里演示利用文件上传标签实现同时上传多个文件到服务器根目录的功能。
				</td>
			</tr>
			<tr>
				<th class="cls_td1" colspan="3" style="background-color:#F0F8FF;text-align:left;"><b>上传文件类型</b></th>
			</tr>
			<tr>
				<td class="cls_td1" width="20%">上传普通文件</td>
				<td  class="cls_td1" width="10%">
					<wx:fileupload savepath="relative{/}" allowtypes="xls;doc;txt;" uploadcount="3" popupparams="{width:260,height:200}"/>
				</td>
				<td class="cls_td1" style="text-align:left" width="70%">
					&nbsp;&nbsp;&nbsp;&nbsp;特点：
					上传普通文件是指只需将文件上传到服务器，不用考虑通过URL访问它们，它们可以上传到任意相对或绝对路径中，根据savepath属性的指定。
				</td>
			</tr>
			<tr>
				<td class="cls_td1" width="20%">上传WEB文件</td>
				<td  class="cls_td1" width="10%"><wx:fileupload savepath="relative{/}" rooturl="/" allowtypes="html;jpg;gif"  uploadcount="3" popupparams="{width:260,height:200}"/></td>
				<td class="cls_td1" style="text-align:left" width="70%">
					&nbsp;&nbsp;&nbsp;&nbsp;特点：
					上传WEB文件是指上传后由框架返回一个此文件的访问URL，根据此URL就可以在浏览器中访问到它们，它们只能上传到服务器目录，否则即使上传上去了也没法通过URL访问。<br/>
					在配置上传WEB文件时，只需在&lt;wx:fileupload/&gt;标签中指定rooturl属性，它要与savepath保持一致，即要根据rooturl+文件名能访问到保存到savepath中的文件	
				</td>
			</tr>
			
			<tr>
				<th class="cls_td1" colspan="3" style="background-color:#F0F8FF;text-align:left;"><b>其它</b></th>
			</tr>
			<tr>
				<td class="cls_td1" width="20%">上传后改变文件名</td>
				<td  class="cls_td1" width="10%">
					<wx:fileupload savepath="relative{/}" newfilename="{timestamp}" allowtypes="xls;doc;txt;rtf;pdf"/>
				</td>
				<td class="cls_td1" style="text-align:left" width="70%">&nbsp;&nbsp;&nbsp;&nbsp;特点：
					如果指定了&lt;wx:fileupload/&gt;标签的newfilename属性，则会上传文件后使用newfilename属性指定值做为新的文件名。<br/>
					此属性除了常量字符串外，还可以指定如下类型的值： {date}：以当前日期做为文件名；{time}：以当前时间做为文件名；{timestamp}：以当前日期时间的毫秒数做为文件名，可以保持每次上传的文件名不重复<br/>
					注意：只有一次上传一个文件时，即uploadcount属性不指定，或指定为1时，才能改变上传文件名。
				</td>
			</tr>
			<tr>
				<td class="cls_td1" width="20%">自己提供标签内容</td>
				<td  class="cls_td1" width="10%">
					<wx:fileupload savepath="relative{/}" allowtypes="xls;doc;txt;rtf;pdf">
						<input type="button" value="我的上传"/>
					</wx:fileupload>
				</td>
				<td class="cls_td1" style="text-align:left" width="70%">&nbsp;&nbsp;&nbsp;&nbsp;特点：
					如果指定了&lt;wx:fileupload/&gt;标签内容，则会使用标签内容做为文件上传的label，而不会使用框架默认提供的。
				</td>
			</tr>
			<tr>
				<td class="cls_td1" width="20%">文件上传拦截器<font color='red'>New<font/></td>
				<td  class="cls_td1" width="10%">
					<wx:fileupload savepath="relative{/}" allowtypes="xls;doc;txt;rtf;pdf"  
						interceptor="com.wabacusdemo.TestFileUploadInterceptor"/>
				</td>
				<td class="cls_td1" style="text-align:left" width="70%">&nbsp;&nbsp;&nbsp;&nbsp;特点：
					这里通过文件上传输入框的拦截器在上传界面显示了一个额外的表单输入框，上传完成后将文件大小及用户在此表单域中输入的数据提示到前台页面
				</td>
			</tr>
		</table>
	</body>
</html>
