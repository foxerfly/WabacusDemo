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

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.abstractreport.AbsReportType;
import com.wabacus.system.component.application.report.configbean.editablereport.AbsEditableReportEditDataBean;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;

public class Interceptor_otherdata_serverpage1 extends AbsInterceptorDefaultAdapter
{
    public void doStart(ReportRequest rrequest,ReportBean rbean)
    {
    }

    public int doSave(ReportRequest rrequest,ReportBean rbean,AbsEditableReportEditDataBean editbean)
    {
        List<Map<String,String>> lstInsertData=rrequest.getLstInsertedData(rbean);//添加的记录集合
        List<Map<String,String>> lstInsertExternalVals=rrequest.getLstInsertedParamValues(rbean);//因为此报表为<insert/>配置了<external-values/>
        List<Map<String,String>> lstUpdateData=rrequest.getLstUpdatedData(rbean);//修改的记录集合
        List<Map<String,String>> lstUpdateExternalVals=rrequest.getLstUpdatedParamValues(rbean);
        List<Map<String,String>> lstDeleteData=rrequest.getLstDeletedData(rbean);//删除的数据集合
        List<Map<String,String>> lstDeleteExternalVals=rrequest.getLstDeletedParamValues(rbean);
        if(lstInsertData!=null&&lstInsertData.size()>0)
        {//当前保存动作有添加的数据
            Map<String,String> mInsertvalues;
            Map<String,String> mExternalvalues;
            for(int i=0;i<lstInsertData.size();i++)
            {//循环添加的每条记录
                mInsertvalues=lstInsertData.get(i);
                mExternalvalues=lstInsertExternalVals.get(i);
                String deptno=mInsertvalues.get("deptno");
                String deptname=mInsertvalues.get("deptname");
                deptno=deptno==null?"":deptno.trim();
                deptname=deptname==null?"":deptname.trim();
                mExternalvalues.put("logcontent","添加的部门编号："+deptno+"；部门名："+deptname);//设置logcontent变量的值，这样就会将它记录到日志表中
            }
        }
        
        if(lstUpdateData!=null&&lstUpdateData.size()>0)
        {//当前保存动作有修改的数据
            Map<String,String> mUpdatevalues;
            Map<String,String> mExternalvalues;
            for(int i=0;i<lstUpdateData.size();i++)
            {//循环添加的每条记录
                mUpdatevalues=lstUpdateData.get(i);
                mExternalvalues=lstUpdateExternalVals.get(i);
                String deptno=mUpdatevalues.get("deptno");//取出修改后的部门编号
                String deptname=mUpdatevalues.get("deptname");//取出修改后的部门名
                String deptno_old=mUpdatevalues.get("deptno__old");//取出修改前的部门编号
                String deptname_old=mUpdatevalues.get("deptname__old");//取出修改前的部门名
                deptno=deptno==null?"":deptno.trim();
                deptname=deptname==null?"":deptname.trim();
                deptno_old=deptno_old==null?"":deptno_old.trim();
                deptname_old=deptname_old==null?"":deptname_old.trim();
                mExternalvalues.put("logcontent","修改部门编号："+deptno_old+"；部门名："+deptname_old
                        +"的记录，新部门编号为："+deptno+"；新部门名为："+deptname);//设置logcontent变量的值，这样就会将它记录到日志表中
            }
        }
        
        if(lstDeleteData!=null&&lstDeleteData.size()>0)
        {//当前保存动作有删除的数据
            Map<String,String> mDeletevalues;
            Map<String,String> mExternalvalues;
            for(int i=0;i<lstDeleteData.size();i++)
            {//循环删除的每条记录
                mDeletevalues=lstDeleteData.get(i);
                mExternalvalues=lstDeleteExternalVals.get(i);
                String deptno=mDeletevalues.get("deptno__old");
                String deptname=mDeletevalues.get("deptname__old");
                deptno=deptno==null?"":deptno.trim();
                deptname=deptname==null?"":deptname.trim();
                mExternalvalues.put("logcontent","删除的部门编号："+deptno+"；部门名："+deptname);//设置logcontent变量的值，这样就会将它记录到日志表中
            }
        }
        return super.doSave(rrequest,rbean,editbean);//完成框架的保存操作
    }
}
