/* 
 * Copyright (C) 2010-2011 星星<349446658@qq.com>
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

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.configbean.editablereport.AbsEditableReportEditDataBean;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;

public class Interceptor_saveinterceptorreport extends AbsInterceptorDefaultAdapter
{

    public int doSave(ReportRequest rrequest,ReportBean rbean,AbsEditableReportEditDataBean editbean)
    {
        List<Map<String,String>> lstInsertData=rrequest.getLstInsertedData(rbean);//添加的记录集合
        List<Map<String,String>> lstInsertExternalVals=rrequest.getLstInsertedParamValues(rbean);//因为此报表为<insert/>配置了<external-values/>
        List<Map<String,String>> lstUpdateData=rrequest.getLstUpdatedData(rbean);//修改的记录集合
        List<Map<String,String>> lstDeleteData=rrequest.getLstDeletedData(rbean);//删除的记录集合
        if(lstInsertData!=null&&lstInsertData.size()>0||lstUpdateData!=null&&lstUpdateData.size()>0||lstDeleteData!=null&&lstDeleteData.size()>0)
        {
            System.out.println("--------------拦截器类型：JAVA类----------执行保存操作前置动作-------------------");
        }
        if(lstInsertData!=null&&lstInsertData.size()>0)
        {//当前在做添加数据的保存操作
            int i=0;
            Map<String,String> mParamValues;
            for(Map<String,String> mDataTmp:lstInsertData)
            {//循环添加的每条记录
                mParamValues=lstInsertExternalVals.get(i);
                i++;
                System.out.println("第"+i+"条添加的记录：");
                for(Entry<String,String> entry:mDataTmp.entrySet())
                {
                    System.out.print("["+entry.getKey()+"="+entry.getValue()+"]");
                }
                System.out.println();
                System.out.println("此条记录对应的<params/>定义的变量值：");
                for(Entry<String,String> entry:mParamValues.entrySet())
                {
                    System.out.print("["+entry.getKey()+"="+entry.getValue()+"]");
                }
                System.out.println();
            }
        }

        if(lstUpdateData!=null&&lstUpdateData.size()>0)
        {//当前在做修改数据的保存操作
            int i=1;
            for(Map<String,String> mDataTmp:lstUpdateData)
            {//循环修改的每条记录
                System.out.println("第"+(i++)+"条修改的记录：");
                for(Entry<String,String> entry:mDataTmp.entrySet())
                {
                    System.out.print("["+entry.getKey()+"="+entry.getValue()+"]");
                }
                System.out.println();
            }
        }

        if(lstDeleteData!=null&&lstDeleteData.size()>0)
        {//当前在做删除数据的保存操作
            int i=1;
            for(Map<String,String> mDataTmp:lstDeleteData)
            {//循环删除的每条记录
                System.out.println("第"+(i++)+"条删除的记录：");
                for(Entry<String,String> entry:mDataTmp.entrySet())
                {
                    System.out.print("["+entry.getKey()+"="+entry.getValue()+"]");
                }
                System.out.println();
            }
        }
        return super.doSave(rrequest,rbean,editbean);
    }
}
