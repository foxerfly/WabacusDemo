<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="wabacus" prefix="wx"%>
<html>
	<head>
		<LINK rel="stylesheet" type="text/css" href="/WabacusDemo/webresources/skin/qq/ymPrompt.css"/>
	  <STYLE type=text/css>
		<!--
			.cls_td1
			{
				border:1px solid #5F9EA0;text-align:center;font-size : 13px;
			}
		-->
		</STYLE>
		<script language="javascript"  src="/WabacusDemo/webresources/component/ymPrompt/ymPrompt.js"></script>
	</head>
	<body>
		<table border="0" cellspacing="1px" width="100%" style="border:1px solid #5F9EA0;BORDER-COLLAPSE:collapse;" align="left">
			<tr>
				<td colspan="3" class="cls_td1"><font size="3" color="blue"><b>测试数据导入标签</b></font></td>
			</tr>
			<tr>
				<td colspan="2" class="cls_td1">
					<wx:dataimport ref="resetdata1;resetdata2"><input type="button" class="cls-button2" value="还原数据"></wx:dataimport>&nbsp;&nbsp;
					<input type="button" class="cls-button2" value="查看报表" 
					onclick="ymPrompt.win('/WabacusDemo/ShowReport.wx?PAGEID=viewtblimport1page1',800,600,'查看报表数据',null,null,null,true);"/>
				</td>
				<td class="cls_td1" style="text-align:left;color:red">说明：<br/>
					&nbsp;&nbsp;1、因为所有数据导入项均将数据文件的上传位置配置在D:\test目录下，因此为了测试数据导入功能，请在D盘建立一个名为test的目录。<br/>
					&nbsp;&nbsp;2、测试用的数据文件都放在release包的根目录下的“测试数据导入数据\”目录下面。<br/>
					&nbsp;&nbsp;3、请使用下面每个功能前，先还原数据，然后查看报表，再导入数据，再查看报表，这样可以看到导入数据前后的效果<br/>
					&nbsp;&nbsp;4、所有数据导入项均配置在资源文件resources_importdata.xml中
				</td>
			</tr>
			<tr style="background-color:#FAEBD7">
				<th class="cls_td1" width="20%">演示类型</th>
				<th  class="cls_td1" width="10%">功能</th>
				<th class="cls_td1" width="70%">描述</th>
			</tr>
			<tr>
				<th class="cls_td1" colspan="3" style="background-color:#F0F8FF;text-align:left;"><b>数据导入类型</b></th>
			</tr>
			<tr>
				<td class="cls_td1" width="20%">覆盖模式</td>
				<td  class="cls_td1" width="10%"><wx:dataimport ref="dataimport.overwrite"/></td>
				<td class="cls_td1" style="text-align:left" width="70%">&nbsp;&nbsp;&nbsp;&nbsp;特点：将&lt;dataimport/&gt;的importtype属性配置为overwrite，每次导入数据时，先删除表中所有数据，再将数据文件中的数据写入表中</td>
			</tr>
			<tr>
				<td class="cls_td1" width="20%">追加模式1</td>
				<td  class="cls_td1" width="10%"><wx:dataimport ref="dataimport.append1"/></td>
				<td class="cls_td1" style="text-align:left" width="70%">&nbsp;&nbsp;&nbsp;&nbsp;特点：在&lt;dataimport/&gt;的keyfields属性中配置关键字段(列表)，每次导入数据时，对于数据表中已经存在的记录，则修改它，不存在的则追加到后面。存不存在的判断依据就是keyfields对应的字段数据是否相同。</td>
			</tr>
			<tr>
				<td class="cls_td1" width="20%">追加模式2</td>
				<td  class="cls_td1" width="10%"><wx:dataimport ref="dataimport.append2"/></td>
				<td class="cls_td1" style="text-align:left" width="70%">&nbsp;&nbsp;&nbsp;&nbsp;特点：不配置&lt;dataimport/&gt;的keyfields属性，每次导入数据时，都是无条件追加到数据表后面。</td>
			</tr>
			<tr>
				<td class="cls_td1" width="20%">动态改变导入模式</td>
				<td  class="cls_td1" width="10%"><wx:dataimport ref="dataimport.append1"/></td>
				<td class="cls_td1" style="text-align:left" width="70%">&nbsp;&nbsp;&nbsp;&nbsp;特点：通过在文件名前面加[append/overwrite/delete]前缀，动态指定本次的导入模式，在这里请上传数据文件<font color='red'>[overwrite]data1.xls</font>或<font color='red'>[delete]data1.xls</font>进行测试。</td>
			</tr>
			<tr>
				<th class="cls_td1" colspan="3" style="background-color:#F0F8FF;text-align:left;"><b>字段匹配类型</b></th>
			</tr>
			<tr>
				<td class="cls_td1" width="20%">按字段位置自动匹配</td>
				<td  class="cls_td1" width="10%"><wx:dataimport ref="dataimport.index"/></td>
				<td class="cls_td1" style="text-align:left" width="70%">&nbsp;&nbsp;&nbsp;&nbsp;特点：通过数据文件的字段位置与数据库表的字段位置自动匹配，这里排除掉数据库表中第2和第4个字段（即age和salary两列数据）不导入。字段位置都是从0开始</td>
			</tr>
			<tr>
				<td class="cls_td1" width="20%">按字段名自动匹配</td>
				<td  class="cls_td1" width="10%"><wx:dataimport ref="dataimport.name"/></td>
				<td class="cls_td1" style="text-align:left" width="70%">&nbsp;&nbsp;&nbsp;&nbsp;特点：通过数据文件的字段名与数据库表的字段名自动匹配，这里排除掉数据库表中名为birthday和name两列不导入。</td>
			</tr>
			<tr>
				<td class="cls_td1" width="20%">显式指定“字段名=字段名”</td>
				<td class="cls_td1" width="10%"><wx:dataimport ref="dataimport.name.name"/></td>
				<td class="cls_td1" style="text-align:left" width="70%">&nbsp;&nbsp;&nbsp;&nbsp;特点：
					在&lt;columnmap/&gt;标签内容中，显式指定从数据文件的哪个字段导入到数据库表的哪个字段中<br/>
				配置映射关系时，等号左边为数据库，右边为数据文件，左边不能出现重复，右边可以出现重复，即不能将数据库的一个字段从多个数据文件字段取值，但一个数据文件字段值可以赋给数据库的多个字段
				</td>
			</tr>
			<tr>
				<td class="cls_td1" width="20%">显式指定“字段名=字段位置”</td>
				<td class="cls_td1" width="10%"><wx:dataimport ref="dataimport.name.index"/></td>
				<td class="cls_td1" style="text-align:left" width="70%">&nbsp;&nbsp;&nbsp;&nbsp;特点：
				显式指定从数据文件的哪个位置的字段导入到数据库表的哪个字段名对应的字段中，位置序号从0开始，<br/>
				配置映射关系时，等号左边为数据库，右边为数据文件，左边不能出现重复，右边可以出现重复，
				即不能将数据库的一个字段从多个数据文件字段取值，但一个数据文件字段值可以赋给数据库的多个字段
				</td>
			</tr>
			<tr>
				<td class="cls_td1" width="20%">显式指定“字段位置=字段名”</td>
				<td class="cls_td1" width="10%"><wx:dataimport ref="dataimport.index.name"/></td>
				<td class="cls_td1" style="text-align:left" width="70%">&nbsp;&nbsp;&nbsp;&nbsp;特点：
					显式指定从数据文件的哪个字段名的字段导入到数据库表的哪个位置的字段中<br/>
				配置映射关系时，等号左边为数据库，右边为数据文件，左边不能出现重复，右边可以出现重复，
				即不能将数据库的一个字段从多个数据文件字段取值，但一个数据文件字段值可以赋给数据库的多个字段
				</td>
			</tr>
			<tr>
				<td class="cls_td1" width="20%">显式指定“字段位置=字段位置”</td>
				<td  class="cls_td1" width="10%"><wx:dataimport ref="dataimport.index.index"/></td>
				<td class="cls_td1" style="text-align:left" width="70%">&nbsp;&nbsp;&nbsp;&nbsp;特点：
					显式指定从数据文件的哪个位置的字段导入到数据库表的哪个位置的字段中，字段位置都是从0开始。<br/>
				配置映射关系时，等号左边为数据库，右边为数据文件，左边不能出现重复，右边可以出现重复，
				即不能将数据库的一个字段从多个数据文件字段取值，但一个数据文件字段值可以赋给数据库的多个字段
				</td>
			</tr>
			<tr>
				<td class="cls_td1" width="20%">导入数据来自request/session&nbsp;&nbsp;<font color='red'>New</font></td>
				<td  class="cls_td1" width="10%"><wx:dataimport ref="dataimport.request.session"/></td>
				<td class="cls_td1" style="text-align:left" width="70%">&nbsp;&nbsp;&nbsp;&nbsp;特点：
					如果显式指定要导哪些字段，则可以指定“字段名/字段下标=requet/session{key/key.property}”，即指定数据表中某个下标的字段或某个字段名的字段的数据来自于request或session某个属性值或某个对象的成员变量值
					这里导入的“姓名”和“年龄”字段的数据分别来自于request和session，它们的值是在拉截器导入每条记录前置动作中赋值进去的。
				</td>
			</tr>
			<tr>
				<th class="cls_td1" colspan="3" style="background-color:#F0F8FF;text-align:left;"><b>数据标题行类型</b></th>
			</tr>
			<tr>
				<td class="cls_td1" width="20%">纯数据（无标题行）</td>
				<td  class="cls_td1" width="10%"><wx:dataimport ref="dataimport.notitlerow"/></td>
				<td class="cls_td1" style="text-align:left" width="70%">&nbsp;&nbsp;&nbsp;&nbsp;特点：
					Excel文件中全部是数据，包括第一行，没有标题行。因为没有字段名行，因此不能配置为根据数据文件的字段名进行匹配，数据文件这一端只能根据位置序号进行匹配。
				</td>
			</tr>
			<tr>
				<td class="cls_td1" width="20%">复杂标题行</td>
				<td  class="cls_td1" width="10%"><wx:dataimport ref="dataimport.complextitlerow"/></td>
				<td class="cls_td1" style="text-align:left" width="70%">&nbsp;&nbsp;&nbsp;&nbsp;特点：
					Excel文件中前面几行是任意标题行，但没有包括字段名行，，因此不能配置为根据数据文件的字段名进行匹配，数据文件这一端只能根据位置序号进行匹配。
				</td>
			</tr>
			<tr>
				<td class="cls_td1" width="20%">混合复杂标题行和字段名行</td>
				<td  class="cls_td1" width="10%"><wx:dataimport ref="dataimport.mixedtitlerow"/></td>
				<td class="cls_td1" style="text-align:left" width="70%">&nbsp;&nbsp;&nbsp;&nbsp;特点：
					Excel文件中数据部分的上面即有普通标题行，也有字段名行，因此即可以根据字段位置匹配，也可以根据字段名匹配。因为这里字段名行与数据行没有掺着，中间隔了一行或多行，因此
					同时配置了startnamerowindex和startdatarowindex两个属性，如果字段名行与数据行相邻，则可以只配置startnamerowindex，框架会自动将startnamerowindex+1做为数据行的起始行
				</td>
			</tr>
			<tr>
				<th class="cls_td1" colspan="3" style="background-color:#F0F8FF;text-align:left;"><b>其它</b></th>
			</tr>
			<tr>
				<td class="cls_td1" width="20%">异步导入<font color='red'>New</font></td>
				<td  class="cls_td1" width="10%"><wx:dataimport ref="dataimport.interceptor" asyn="true"/></td>
				<td class="cls_td1" style="text-align:left" width="70%">&nbsp;&nbsp;&nbsp;&nbsp;特点：
					通过&lt;dataimport/&gt;的asyn属性可以指定本数据导入为异步导入，异步导入是指数据文件上传完后立即返回，并通知另一个独立线程完成数据导入，这样用户可以立即得到响应，适用于大数据量的导入，不需用户等待。
				</td>
			</tr>
			<tr>
				<td class="cls_td1" width="20%">配置拦截器</td>
				<td  class="cls_td1" width="10%"><wx:dataimport ref="dataimport.interceptor"/></td>
				<td class="cls_td1" style="text-align:left" width="70%">&nbsp;&nbsp;&nbsp;&nbsp;特点：
					通过&lt;dataimport/&gt;的interceptor属性可以配置拦截器，拦截器接口有四个方法，会在四个时机进行调用，这里会在四个方法中分别打印一些信息。<br/>
					关于四个拦截方法的介绍，请参看《开发指南二》中的介绍。
				</td>
			</tr>
			<tr>
				<td class="cls_td1" width="20%">同时导入多个表和文件</td>
				<td  class="cls_td1" width="10%"><wx:dataimport ref="dataimport.multifiles;dataimport.multifiles2" popupparams="{width:300,height:200}"/></td>
				<td class="cls_td1" style="text-align:left" width="70%">&nbsp;&nbsp;&nbsp;&nbsp;特点：
					可以给数据导入的自定义标签的ref属性指定多个数据导入项，如果多个数据导入项配置的filename属性不同，则会为每一类filename属性生成一个文件上传输入框。<br/>
					注意：<br/>
					&nbsp;&nbsp;1、被一个数据导入标签引入的不同数据导入项可以使用相同的filename属性，此时只会为它们生成一个文件上传输入框，然后将上传的这个数据文件数据导入到各数据导入项相应的表中。<br/>
					&nbsp;&nbsp;2、被一个数据导入标签引入的不同数据导入项的filepath属性必须相同，即它们必须是在同一个路径下存放上传的数据文件。<br/>
					在此演示中，为一个数据导入标签的ref属性配置了两个数据导入项，它们的filename属性不同，且分别导入到不同的表中。为了查看这两个表导入的数据，请点击
					<input type="button" class="cls-button2" value="查看报表2" 
					onclick="ymPrompt.win('/WabacusDemo/ShowReport.wx?PAGEID=viewtblimport1page2',800,600,'查看报表数据',null,null,null,true);"/>
				</td>
			</tr>
		</table>
	</body>
</html>
