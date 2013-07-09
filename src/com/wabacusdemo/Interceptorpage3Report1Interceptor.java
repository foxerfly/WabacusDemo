/* 
 * Copyright (C) 2010 星星<349446658@qq.com>
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

import java.util.Date;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;

public class Interceptorpage3Report1Interceptor extends AbsInterceptorDefaultAdapter
{

    public void doStart(ReportRequest rrequest,ReportBean rbean)
    {
        String age=rrequest.getStringAttribute("txtage","");
        if(!age.equals(""))
        {
            try
            {
                int iage=Integer.parseInt(age);
                if(iage<10||iage>20)
                {
                    rrequest.getWResponse().getMessageCollector().alert("输入的年龄："+age+"起出范围，只能输入10到20之间的数字",true);
                }
            }catch(NumberFormatException nfe)
            {
                rrequest.getWResponse().getMessageCollector().alert("输入的年龄："+age+"不是合法数字",true);
            }
        }
        System.out.println(new Date()+":::执行完前置动作------------------");
    }

    public void doEnd(ReportRequest rrequest,ReportBean rbean)
    {
        System.out.println(new Date()+":::执行完后置动作-------------------");
    }
}
