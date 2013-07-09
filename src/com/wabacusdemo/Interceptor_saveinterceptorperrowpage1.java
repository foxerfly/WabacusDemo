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

import java.util.Iterator;
import java.util.Map;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.configbean.editablereport.AbsEditableReportEditDataBean;
import com.wabacus.system.component.application.report.configbean.editablereport.EditableReportDeleteDataBean;
import com.wabacus.system.component.application.report.configbean.editablereport.EditableReportInsertDataBean;
import com.wabacus.system.component.application.report.configbean.editablereport.EditableReportUpdateDataBean;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;

public class Interceptor_saveinterceptorperrowpage1 extends AbsInterceptorDefaultAdapter
{
    public int doSavePerRow(ReportRequest rrequest,ReportBean rbean,Map<String,String> mRowData,Map<String,String> mParamValues,
            AbsEditableReportEditDataBean editbean)
    {
        String message="";
        if(editbean instanceof EditableReportInsertDataBean)
        {//对本条记录做添加操作
            message="正在添加记录：";
        }else   if(editbean instanceof EditableReportUpdateDataBean)
        {//对本条记录做修改操作
            message="正在修改记录：";
        }else if(editbean instanceof EditableReportDeleteDataBean)
        {//对本条记录做删除操作
            message="正在删除记录：";
        }
        //因为没有通过<button/>配置调用后台服务的操作，因此不用先判断editbean instanceof  EditableReportSQLButtonDataBean
        if(message!=null)
        {
            System.out.print(message);
            if(mRowData!=null)//mRowData中存放了本条记录各列的值
            {
                Iterator itKeys=mRowData.keySet().iterator();
                while(itKeys.hasNext())
                {
                    String key=(String)itKeys.next();
                    String value=(String)mRowData.get(key);
                    System.out.print("["+key+"="+value+"]");
                }
                System.out.println();
            }
            if(mParamValues!=null)//存放了相对于本条记录的在<insert/>或<update/>或<delete/>中定义的变量值
            {
                System.out.print("各变量的值为：");
                Iterator itKeys=mParamValues.keySet().iterator();
                while(itKeys.hasNext())
                {
                    String key=(String)itKeys.next();
                    String value=(String)mParamValues.get(key);
                    System.out.print("["+key+"="+value+"]");
                }
                System.out.println();
            }
        }
        return super.doSavePerRow(rrequest,rbean,mRowData,mParamValues,editbean);
    }
}
