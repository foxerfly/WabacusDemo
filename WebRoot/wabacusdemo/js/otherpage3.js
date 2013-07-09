/**
 * 全部选中/不选中记录中的复选框
 */
function selectCheckBoxes(checkObj)
{
	var status=true;
	if(!checkObj.checked) status=false;
	var checkOptionObjsArr=document.getElementsByName('chkoption');
	if(checkOptionObjsArr&&checkOptionObjsArr.length>0)
	{
		for(var i=0;i<checkOptionObjsArr.length;i++)
		{
			checkOptionObjsArr[i].checked=status;
		}
	}
}

/**
 * 查看选中的单选框数据
 */
function viewSelectedRadioValues()
{
	var radioObjs=document.getElementsByName("radiooption");
	if(radioObjs)
	{
		for(i=0;i<radioObjs.length;i=i+1)
		{
			if(radioObjs[i].checked)
			{
				alert("选中员工工号："+radioObjs[i].value);
				return true;
			}
		}
	}
	alert('没有选中值');
}

/**
 * 查看选中的所有复选框数据
 */
function viewSelectedCheckboxValues()
{
	var checkOptionObjsArr=document.getElementsByName('chkoption');
	var selectedvalues='';
	if(checkOptionObjsArr&&checkOptionObjsArr.length>0)
	{
		for(var i=0;i<checkOptionObjsArr.length;i++)
		{
			if(checkOptionObjsArr[i].checked)
			{
				selectedvalues+=checkOptionObjsArr[i].value+';';
			}
		}
	}
	if(selectedvalues=='') selectedvalues='没有选中值';
	else selectedvalues='选中员工工号：'+selectedvalues;
	alert(selectedvalues);
}