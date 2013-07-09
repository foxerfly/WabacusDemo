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
import com.wabacus.system.component.application.report.configbean.UltraListReportGroupBean;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.system.intercept.ColDataBean;

public class Interceptor_dyncoltitlepage1Report2 extends AbsInterceptorDefaultAdapter
{
    public void beforeDisplayReportDataPerCol(ReportRequest rrequest,ReportBean rbean,ColDataBean colDataBean)
    {
        if(colDataBean.getRowindex()>=0) return ;//不是显示标题行的列
        if(colDataBean.getDisplayColBean() instanceof UltraListReportGroupBean)
        {//是显示<group/>的label
            //UltraListReportGroupBean groupbean=(UltraListReportGroupBean)colDataObj.getDisplayColBean();
            if("姓名".equals(colDataBean.getValue()))
            {
                colDataBean.setValue("<font color='red'>动态</font>姓名");
            }
        }else if(colDataBean.getDisplayColBean() instanceof ColBean)
        {
            if("省份".equals(colDataBean.getValue()))
            {
                colDataBean.setValue("<font color='red'>动态</font>省份");
            }else if("城市".equals(colDataBean.getValue()))
            {
                colDataBean.setValue("<font color='red'>动态</font>城市");
            }else if("县城".equals(colDataBean.getValue()))
            {
                colDataBean.setValue("<font color='red'>动态</font>县城");
            }
        }
    }
}

