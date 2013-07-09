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

import com.wabacus.config.component.application.report.ColBean;
import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.assistant.ReportAssistant;
import com.wabacus.system.component.application.report.abstractreport.AbsReportType;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.system.intercept.ColDataBean;

public class Interceptor_rowgroupbgcolorpage1Report2 extends AbsInterceptorDefaultAdapter
{
    public void beforeDisplayReportDataPerCol(ReportRequest rrequest,ReportBean rbean,ColDataBean colDataBean)
    {
        if(colDataBean.getRowindex()<0)
        {//当前是在显示标题行
            return;
        }
        if(!(colDataBean.getDisplayColBean() instanceof ColBean))
        {//不是显示列的数据
            return;
        }
        ColBean cb=(ColBean)colDataBean.getDisplayColBean();
        if("province".equals(cb.getColumn())||"city".equals(cb.getColumn())
                ||"county".equals(cb.getColumn()))
        {//如果是分组列，则不改变它的背景色
            return;
        }
        AbsReportType reportTypeObj=rrequest.getDisplayReportTypeObj(rbean.getId());
        if(reportTypeObj==null||reportTypeObj.getLstReportData()==null||reportTypeObj.getLstReportData().size()<=colDataBean.getRowindex()) return;
        Object dataObj=reportTypeObj.getLstReportData().get(colDataBean.getRowindex());//取出存放当前行数据的POJO对象
        String sex=String.valueOf(ReportAssistant.getInstance().getPropertyValue(dataObj,"sex"));//从中取出sex列的数据
        if(sex.equals("女"))
        {
            String styleproperty=colDataBean.getStyleproperty();
            if(styleproperty==null) styleproperty="";
            styleproperty+=" bgcolor='#CFDFF8'";
            colDataBean.setStyleproperty(styleproperty);
        }
    }

}
