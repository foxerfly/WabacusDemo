/* 
 * Copyright (C) 2010-2012 星星<349446658@qq.com>
 * 
 * This file is part of Wabacus 
 * 
 * Wabacus is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package com.wabacusdemo;

import java.util.Map;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.inputbox.autocomplete.AutoCompleteBean;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.util.Tools;

public class Interceptor_autocompletedatapage1Report2 extends AbsInterceptorDefaultAdapter
{

    public Object afterLoadData(ReportRequest rrequest,ReportBean rbean,Object typeObj,Object dataObj)
    {
       if(!(typeObj instanceof AutoCompleteBean))
       {//当前不是加载自动填充数据
           return super.afterLoadData(rrequest,rbean,typeObj,dataObj);
       }
       Map<String,String> mColValues=(Map<String,String>)dataObj;
       if(mColValues==null||mColValues.size()==0) return mColValues;
       String birthday=mColValues.get("birthday");
       if(birthday!=null&&birthday.trim().indexOf(" ")>0)
       {//有时间部分，则去掉时间，只保留日期
           birthday=birthday.trim();
           birthday=birthday.substring(0,birthday.indexOf(" "));
           mColValues.put("birthday",birthday);
       }
       String salary=mColValues.get("salary");
       if(salary!=null&&!salary.trim().equals(""))
       {
           salary=Tools.formatDouble(salary,"#######.00");//保留小数点两位
           mColValues.put("salary",salary);
       }
       //因为这是editablelist2报表类型，“性别”列在显示时显示“男”、“女”，而实际值为“1”、“0”，因此从数据库取出的是0和1，而显示的是“男”和“女”
       String sex=mColValues.get("sex");//mColValues存放了所有取到的填充列数据，可以添加或修改
       String sexlabel="";
       if("1".equals(sex))
       {
           sexlabel="男";
       }else if("0".equals(sex))
       {
           sexlabel="女";
       }
       mColValues.put("sex$label",sexlabel);
       System.out.println(mColValues);
       return mColValues;
    }

}

