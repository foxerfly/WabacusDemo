
/**
 * 处理表单中“性别”单选框的点击事件
 */
function doSexOptionClick(sexType) {
	var isMale;
	var isFemale;
	if (sexType == "1") 
	{
		isMale = true;
		isFemale = false;
	} else if (sexType == "0") 
	{
		isMale = false;
		isFemale = true;
	}
	document.getElementById("id_report1marriage").disabled = !isMale;//如果没有选中“男”，则设置为disabled
	document.getElementById("id_report1age").disabled = !isMale;//如果没有选中“男”，则设置为disabled
	document.getElementById("id_report1salary").disabled = !isFemale;//如果没有选中“女”，则设置为disabled
	doAddDataForSaving('freeformpage1_guid_report1','true');//通知框架有数据需要保存
}

//下面代码是用于初始化第三方日期选择框和富文本编辑器，与演示无关
function onmyload()
{
	widgInit();
	$$('input.slimpicker').each( function(el){
	var picker = new SlimPicker(el);
});
}

/**
 * 将用户自定义表单部分输入框数据传给框架，并自己做一些客户端校验
 */
function packCustomizedParams()
{
	var joinindateBox=document.getElementById('id_joinindate');//入职日期
	if(joinindateBox.value=='')
	{
		alert('入职日期不能为空');
		return WX_SAVE_TERMINAT;//中断本次保存操作
	}
	setCustomizeParamValue('freeformpage1','report1','joinindate',joinindateBox.value);//传给框架
	mData['id_description'].updateWidgInput();//此方法与框架及演示无关，是第三方富文本编辑器用于刷新数据。
	var descriptionBox=document.getElementById('id_description');//简介
	if(descriptionBox.value.trim()=='')
	{
		alert('简介不能为空');
		return WX_SAVE_TERMINAT;//中断本次保存操作
	}
	setCustomizeParamValue('freeformpage1','report1','description',descriptionBox.value.trim());//传给框架
	
	var sexRadios=document.getElementsByName('report1sex');
	var sex;
	for(var i=0;i<sexRadios.length;i++)
	{
		if(sexRadios[i].checked)
		{
			sex=sexRadios[i].value;
		}
	}
	setCustomizeParamValue('freeformpage1','report1','sex',sex);//传给框架
	if(sex=='1')
	{//选中了男
		var ageBox=document.getElementById('id_report1age');
		var age=ageBox.value;
		if(!age||age=='')
		{
			alert('选中性别为男时，年龄不能为空');
			return WX_SAVE_TERMINAT;//中断本次保存操作
		}
		setCustomizeParamValue('freeformpage1','report1','age',age);//传给框架
		var marriageSelectBox=document.getElementById('id_report1marriage');
		var marriage=marriageSelectBox.options[marriageSelectBox.options.selectedIndex].value;
		setCustomizeParamValue('freeformpage1','report1','marriage',marriage);//传给框架
		setCustomizeParamValue('freeformpage1','report1','salary',document.getElementById('salary_old').value);//将工资旧值传给框架
	}else if(sex=='0')
	{//选中了女
		var salaryBox=document.getElementById('id_report1salary');
		var salary=salaryBox.value;
		if(!salary||salary=='')
		{
			alert("选中性别为女时，必须填写工资");
			return WX_SAVE_TERMINAT;//中断本次保存操作
		}
		setCustomizeParamValue('freeformpage1','report1','salary',salary);//传给框架
		setCustomizeParamValue('freeformpage1','report1','age',document.getElementById('age_old').value);//将年龄旧值传给框架
		setCustomizeParamValue('freeformpage1','report1','marriage',document.getElementById('marriage_old').value);//将婚否旧值传给框架
	}else
	{
		alert('性别不能为空');
		return WX_SAVE_TERMINAT;//中断本次保存操作
	}
	return WX_SAVE_CONTINUE;
}