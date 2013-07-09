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

public class TestLoadStoreRowOrderByDrag implements IListReportRoworderPersistence
{
    public String loadRoworder(Map<String,String> mColValuesInRow)
    {
        return mColValuesInRow.get("orderline");//因为此报表的orderline的列<col/>存放了当前记录行的排序值，且其rowordervalue属性为true，所以可以直接从此容器中取到此记录行的排序值
    }

    /**
     * 处理DEMO中通过拖动记录行进行排序
     */
    public void storeRoworderByDrag(ReportRequest rrequest,ReportBean rbean,Map<String,String> mColValuesInRow,
            Map<String,String> mColValuesInDestRow,boolean direct)
    {
        /**
         * 因为no、orderline两个<col/>都配置了rowordervalue为true，所以可以从中取到它们的值
         */
        String srcNo=mColValuesInRow.get("no");//取到被排序记录行的no列的值（因为column为no的<col/>的rowordervalue属性值为true）
        String destOrderline=mColValuesInDestRow.get("orderline");//取到目标位置排序列的值
        int idestOrderline;
        try
        {
            idestOrderline=Integer.parseInt(destOrderline);
        }catch(NumberFormatException e1)
        {
            idestOrderline=0;
        }
        Connection conn=null;
        Statement stmt=null;
        try
        {
            conn=Config.getInstance().getDataSource(rbean.getSbean().getDatasource()).getConnection();
            stmt=conn.createStatement();
            ResultSet rs=null;
            int iorderline=0;
            if(direct)
            {//如果是移到目标记录行的上方
                String sql="select orderline from tbl_detailinfo where orderline<"+destOrderline+" order by orderline desc";//取到目标记录行上面一行的排序值，稍后要移到它们中间
                rs=stmt.executeQuery(sql);
                if(rs.next())
                {
                    int idestorderline2=rs.getInt(1);
                    iorderline=(idestOrderline+idestorderline2)/2;//放在目标记录行与其上面一行的中间，所以排序值取它们的平均值
                    if(iorderline==idestOrderline) iorderline=iorderline-1;
                }else
                {//当前目录记录行已经是第一行
                    iorderline=idestOrderline-1;
                }
            }else
            {//移到被排序记录行的下方
                String sql="select orderline from tbl_detailinfo where orderline>"+destOrderline+" order by orderline";//取到目录记录行下面一行的排序值，稍后要移到它们中间
                rs=stmt.executeQuery(sql);
                if(rs.next())
                {
                    int idestorderline2=rs.getInt(1);
                    iorderline=(idestOrderline+idestorderline2)/2;//放在目标记录行与其下面一行的中间，所以排序值取它们的平均值
                    if(iorderline==idestOrderline) iorderline=iorderline+1;
                }else
                {//当前目标记录行已经是最后一行
                    iorderline=idestOrderline+1;
                }
            }
            stmt.executeUpdate("update tbl_detailinfo set orderline="+iorderline+" where no='"+srcNo+"'");
            rrequest.getWResponse().getMessageCollector().success("排序记录行数据成功",false);
        }catch(SQLException e)
        {
            e.printStackTrace();
            rrequest.getWResponse().getMessageCollector().warn("排序报表记录行失败",true,Consts.STATECODE_FAILED);
        }finally
        {
            WabacusAssistant.getInstance().release(conn,stmt);
        }
    }

    public void storeRoworderByArrow(ReportRequest rrequest,ReportBean rbean,Map<String,String> mColValuesInRow,
            Map<String,String> mColValuesInDestRow,boolean direct)
    {

    }

    public void storeRoworderByInputbox(ReportRequest arg0,ReportBean arg1,Map<String,String> arg2,String arg3)
    {}

    public void storeRoworderByTop(ReportRequest arg0,ReportBean arg1,Map<String,String> arg2)
    {}
}
