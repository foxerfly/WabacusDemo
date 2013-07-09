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

import java.sql.Connection;
import java.util.List;

import com.wabacus.system.dataimport.DataImportItem;
import com.wabacus.system.dataimport.filetype.AbsFileTypeProcessor;
import com.wabacus.system.dataimport.interceptor.IDataImportInterceptor;

public class Interceptor_dataImportTest implements IDataImportInterceptor
{

    public boolean doImportStart(DataImportItem dataImportItem)
    {
        System.out.println("导入文件"+dataImportItem.getDatafileObj().getAbsolutePath());
        AbsFileTypeProcessor fileProcessor=dataImportItem.getFileProcessor();
        List<String> lstColTitles=fileProcessor.getLstColnameData();
        if(lstColTitles!=null&&lstColTitles.size()>0)
        {
            System.out.print("标题行：");
            for(String colTitle:lstColTitles)
            {
                System.out.print(colTitle+";;");
            }
            System.out.println();
        }
        if(fileProcessor.isEmpty())
        {
            System.out.println("此数据文件为空");
        }else
        {
            System.out.println("此数据文件所有记录数据依次如下所示：");
            int startdatarowidx=fileProcessor.getStartrecordindex();
            int recordcount=fileProcessor.getRecordcount();
            for(int i=startdatarowidx;i<startdatarowidx+recordcount;i++)
            {
                List lstRowData=fileProcessor.getRowData(i);
                if(lstRowData==null||lstRowData.size()==0) continue;
                for(int j=0;j<lstRowData.size();j++)
                {//依次打印此行的每一列数据
                    System.out.print(lstRowData.get(j)+";;");
                }
                System.out.println();
            }
        }
        return true;//继续导入操作
    }

    public boolean beforeImportRow(Connection conn,DataImportItem dataImportItem,List<String> lstTitleRowCols,List lstDataRowCols)
    {
        System.out.println("导入数据："+lstDataRowCols);
        return true;
    }

    public void afterImportRow(Connection conn,DataImportItem dataImportItem,List<String> lstTitleRowCols,List lstDataRowCols)
    {
        System.out.println("导完数据："+lstDataRowCols);
    }

    public void doImportEnd(int success,DataImportItem dataImportItem,Exception e)
    {
        System.out.println("完成数据文件"+dataImportItem.getDatafileObj().getAbsolutePath()+"导入.......");
        if(success>0)
        {
            System.out.println("导入成功........");
        }else
        {
            System.out.println("导入失败........");
        }
        if(e!=null)
        {//导数据过程中抛出了异常
            e.printStackTrace();
        }
    }
}
