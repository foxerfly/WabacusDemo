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
package com.wabacusdemo.roworder;

import java.util.Map;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.commoninterface.IListReportRoworderPersistence;

public class TestLoadStoreRowOrder implements IListReportRoworderPersistence
{
    public String loadRoworder(Map<String,String> mColValuesInRow)
    {
        return mColValuesInRow.get("orderline");//因为此报表的orderline的列<col/>存放了当前记录行的排序值，且其rowordervalue属性为true，所以可以直接从此容器中取到此记录行的排序值
    }

    public void storeRoworderByDrag(ReportRequest rrequest,ReportBean rbean,Map<String,String> mColValuesInRow,
            Map<String,String> mColValuesInDestRow,boolean direct)
    {
        new TestLoadStoreRowOrderByDrag().storeRoworderByDrag(rrequest,rbean,mColValuesInRow,mColValuesInDestRow,direct);
    }

    public void storeRoworderByArrow(ReportRequest rrequest,ReportBean rbean,Map<String,String> mColValuesInRow,
            Map<String,String> mColValuesInDestRow,boolean direct)
    {
        new TestLoadStoreRowOrderByArrow().storeRoworderByArrow(rrequest,rbean,mColValuesInRow,mColValuesInDestRow,direct);
    }

    public void storeRoworderByInputbox(ReportRequest rrequest,ReportBean rbean,Map<String,String> mColValuesInRow,String newordervalue)
    {
        new TestLoadStoreRowOrderByInputbox().storeRoworderByInputbox(rrequest,rbean,mColValuesInRow,newordervalue);
    }

    public void storeRoworderByTop(ReportRequest rrequest,ReportBean rbean,Map<String,String> mColValuesInRow)
    {
        new TestLoadStoreRowOrderByTop().storeRoworderByTop(rrequest,rbean,mColValuesInRow);
    }
}
