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

public class TestLoadStoreRowOrderByArrow implements IListReportRoworderPersistence
{

    public String loadRoworder(Map<String,String> mColValuesInRow)
    {
        return mColValuesInRow.get("orderline");//因为此报表的orderline的列<col/>存放了当前记录行的排序值，且其rowordervalue属性为true，所以可以直接从此容器中取到此记录行的排序值
    }

    public void storeRoworderByDrag(ReportRequest rrequest,ReportBean rbean,Map<String,String> mColValuesInRow,
            Map<String,String> mColValuesInDestRow,boolean direct)
    {

    }

    /**
     * 处理DEMO中通过点击上下箭头进行排序
     */
    public void storeRoworderByArrow(ReportRequest rrequest,ReportBean rbean,Map<String,String> mColValuesInRow,
            Map<String,String> mColValuesInDestRow,boolean direct)
    {
        Connection conn=null;
        Statement stmt=null;
        try
        {
            conn=Config.getInstance().getDataSource(rbean.getSbean().getDatasource()).getConnection();
            stmt=conn.createStatement();
            String srcNo=mColValuesInRow.get("no");//取到被排序记录行的no列的值（因为column为no的<col/>的rowordervalue属性值为true）
            String srcOrderline=mColValuesInRow.get("orderline");
            int isrcorderline=0;
            if(srcOrderline!=null&&!srcOrderline.trim().equals(""))
            {
                isrcorderline=Integer.parseInt(srcOrderline.trim());
            }
            String destNo=null;//目标记录行上no列的值
            int idestorderline=0;
            if(mColValuesInDestRow!=null&&mColValuesInDestRow.size()>0)
            {//有目标记录行，说明如果本次点击的是向上箭头时，当前排序行不是本页的最上面一行；或者本次点击的是向下箭头时，当前排序行不是本页的最后一行
                destNo=mColValuesInDestRow.get("no");
                String destOrderline=mColValuesInDestRow.get("orderline");
                if(destOrderline!=null&&!destOrderline.trim().equals(""))
                {
                    idestorderline=Integer.parseInt(destOrderline.trim());
                }
            }else
            {
                String sql=null;
                ResultSet rs=null;
                if(direct)
                {//点击“向上”箭头
                    sql="select no,orderline from tbl_detailinfo where orderline<"+isrcorderline+" order by orderline desc";//取到小于当前记录行排序值的最大排序值，待会要移到它的上面
                    rs=stmt.executeQuery(sql);
                    if(rs.next())
                    {
                        destNo=rs.getString(1);
                        idestorderline=rs.getInt(2);
                    }else
                    {//当前记录行已经是第一行
                        rs.close();
                        return;
                    }
                }else
                {//点击“向下”箭头
                    sql="select no,orderline from tbl_detailinfo where orderline>"+isrcorderline+" order by orderline";//取到大于当前记录行排序值的第小排序值，待会要移到它的下面
                    rs=stmt.executeQuery(sql);
                    if(rs.next())
                    {
                        destNo=rs.getString(1);
                        idestorderline=rs.getInt(2);
                    }else
                    {//当前记录行已经是最后一行
                        rs.close();
                        return;
                    }
                }
                rs.close();
            }
            if(isrcorderline==idestorderline)
            {
                if(direct)
                {
                    idestorderline=idestorderline-1;
                }else
                {
                    idestorderline=idestorderline+1;
                }
            }
            //交换一下排序码
            stmt.executeUpdate("update tbl_detailinfo set orderline="+idestorderline+" where no='"+srcNo+"'");
            stmt.executeUpdate("update tbl_detailinfo set orderline="+isrcorderline+" where no='"+destNo+"'");
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

    public void storeRoworderByInputbox(ReportRequest rrequest,ReportBean rbean,Map<String,String> mColValuesInRow,String newordervalue)
    {}

    public void storeRoworderByTop(ReportRequest rrequest,ReportBean rbean,Map<String,String> mColValuesInRow)
    {}
}
