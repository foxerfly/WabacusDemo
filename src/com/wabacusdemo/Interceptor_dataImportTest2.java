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

import java.sql.Connection;
import java.util.List;

import com.wabacus.system.dataimport.DataImportItem;
import com.wabacus.system.dataimport.interceptor.IDataImportInterceptor;

public class Interceptor_dataImportTest2 implements IDataImportInterceptor
{
    public boolean doImportStart(DataImportItem arg0)
    {
        return true;
    }

    public boolean beforeImportRow(Connection conn,DataImportItem item,List<String> lstColNames,List lstRowData)
    {
        String name=null;
        if(item.getRequest()!=null) name=(String)item.getRequest().getAttribute("namekey");
        if(name==null||name.trim().equals(""))
        {
            name="名字0";
        }else
        {
            int idx=Integer.parseInt(name.substring(2))+1;
            name="名字"+idx;
        }
        if(item.getRequest()!=null) item.getRequest().setAttribute("namekey",name);
        String age=null;
        if(item.getSession()!=null) age=(String)item.getSession().getAttribute("agekey");
        int iage=0;
        if(age!=null&&!age.trim().equals(""))
        {
            iage=Integer.parseInt(age)+1;
        }
        if(item.getSession()!=null) item.getSession().setAttribute("agekey",String.valueOf(iage));//这里只要存字符串类型，框架会自动根据数据库类型转换它为相应的类型。比如这里会自动转换成int
        return true;
    }

    public void afterImportRow(Connection arg0,DataImportItem arg1,List<String> arg2,List arg3)
    {

    }

    public void doImportEnd(int arg0,DataImportItem arg1,Exception arg2)
    {

    }

}
