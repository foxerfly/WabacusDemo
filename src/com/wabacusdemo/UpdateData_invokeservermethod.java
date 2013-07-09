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
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;
import java.util.Map.Entry;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.configbean.editablereport.AbsJavaEditActionBean;

public class UpdateData_invokeservermethod extends AbsJavaEditActionBean
{
    public void updateData(ReportRequest rrequest,ReportBean rbean,Map<String,String> mRowData,Map<String,String> mParamValues) throws SQLException
    {
        if(mRowData==null||mRowData.size()==0) return;
        for(Entry<String,String> entryTmp:mRowData.entrySet())
        {
            System.out.print(entryTmp.getKey()+"="+entryTmp.getValue()+";");
        }
        System.out.println();
        for(Entry<String,String> entryTmp:mParamValues.entrySet())
        {
            System.out.print(entryTmp.getKey()+"="+entryTmp.getValue()+";");
        }
        System.out.println();
        Connection conn=rrequest.getConnection();
        String sql="delete from tbl_baseinfo where no=?";
        PreparedStatement pstmt=conn.prepareStatement(sql);
        pstmt.setString(1,mRowData.get("param_no"));
        pstmt.executeUpdate();
        pstmt.close();
        sql="delete from tbl_detailinfo where no=?";
        pstmt=conn.prepareStatement(sql);
        pstmt.setString(1,mRowData.get("param_no"));
        pstmt.executeUpdate();
        pstmt.close();
        try
        {
            sql="insert into tbl_log(uuid,createdate,content,updatetype) values(?,?,?,?)";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,mParamValues.get("uuid"));//uuid是定义在<params/>中，所以根据<param/>的name从mParamValues中获取变量值
            pstmt.setTimestamp(2,new java.sql.Timestamp((new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(mParamValues.get("now"))).getTime()));//now是定义在<params/>中，所以根据<param/>的name从mParamValues中获取变量值
            pstmt.setString(3,mRowData.get("logcontent"));//在SQL语句中是声明成@{}格式，所以从mRowData中获取
            pstmt.setString(4,"删除记录");
            pstmt.executeUpdate();
            pstmt.close();
        }catch(ParseException e)
        {
            e.printStackTrace();
        }
    }

}

