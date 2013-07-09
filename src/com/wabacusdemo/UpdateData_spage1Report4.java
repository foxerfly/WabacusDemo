/* 
 * Copyright (C) 2010-2013 星星<349446658@qq.com>
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

import java.sql.SQLException;
import java.util.Map;
import java.util.Map.Entry;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.configbean.editablereport.AbsJavaEditActionBean;

public class UpdateData_spage1Report4 extends AbsJavaEditActionBean
{

    public void updateData(ReportRequest rrequest,ReportBean rbean,Map<String,String> mRowData,Map<String,String> mParamValues) throws SQLException
    {
        String updatetype=mParamValues.get("updatetype");//获取定义在<params/>中定义的更新类型的变量值
        System.out.println("当前的操作类型："+updatetype);
        System.out.println("当前操作记录行上所有列的新旧值：");
        for(Entry<String,String> entryTmp:mRowData.entrySet())
        {
            System.out.print(entryTmp.getKey()+":"+entryTmp.getValue()+";");
        }
        System.out.println("\n===============================================================================");
        System.out.println("这个JAVA类只是为了演示，不作具体的数据增、删、改操作");
    }

}

