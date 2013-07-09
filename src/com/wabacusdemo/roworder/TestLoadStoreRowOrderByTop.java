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

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;

import com.wabacus.config.Config;
import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.assistant.WabacusAssistant;
import com.wabacus.system.commoninterface.IListReportRoworderPersistence;
import com.wabacus.util.Consts;

public class TestLoadStoreRowOrderByTop implements IListReportRoworderPersistence
{
    public String loadRoworder(Map<String,String> mColValuesInRow)
    {
        return mColValuesInRow.get("orderline");//因为此报表的orderline的列<col/>存放了当前记录行的排序值，且其rowordervalue属性为true，所以可以直接从此容器中取到此记录行的排序值
    }

    public void storeRoworderByDrag(ReportRequest rrequest,ReportBean rbean,Map<String,String> mColValuesInRow,
            Map<String,String> mColValuesInDestRow,boolean direct)
    {

    }

    public void storeRoworderByArrow(ReportRequest rrequest,ReportBean rbean,Map<String,String> mColValuesInRow,
            Map<String,String> mColValuesInDestRow,boolean direct)
    {

    }

    /**
     * 处理DEMO中通过输入框输入排序值进行排序
     */
    public void storeRoworderByInputbox(ReportRequest rrequest,ReportBean rbean,Map<String,String> mColValuesInRow,String newordervalue)
    {}

    public void storeRoworderByTop(ReportRequest rrequest,ReportBean rbean,Map<String,String> mColValuesInRow)
    {
        /**
         * 因为no、orderline两个<col/>都配置了rowordervalue为true，所以可以从中取到它们的值
         */
        String no=mColValuesInRow.get("no");//取到被排序记录行的no列的值（因为column为no的<col/>的rowordervalue属性值为true）
        Connection conn=null;
        Statement stmt=null;
        try
        {
            conn=Config.getInstance().getDataSource(rbean.getSbean().getDatasource()).getConnection();
            stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery("select min(orderline) from tbl_detailinfo");
            int minorderline=0;
            if(rs.next())
            {
                minorderline=rs.getInt(1);
            }
            rs.close();
            minorderline=minorderline-1;
            stmt.executeUpdate("update tbl_detailinfo set orderline="+minorderline+" where no='"+no+"'");
            rrequest.getWResponse().getMessageCollector().success("置顶成功",false);
        }catch(SQLException e)
        {
            e.printStackTrace();
            rrequest.getWResponse().getMessageCollector().warn("置顶失败",true,Consts.STATECODE_FAILED);
        }finally
        {
            WabacusAssistant.getInstance().release(conn,stmt);
        }
    }
}
