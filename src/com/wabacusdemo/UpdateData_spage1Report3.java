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
import java.util.Map;
import java.util.Map.Entry;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.configbean.editablereport.AbsJavaEditActionBean;
import com.wabacus.util.UUIDGenerator;

public class UpdateData_spage1Report3 extends AbsJavaEditActionBean
{
    public void updateData(ReportRequest rrequest,ReportBean rbean,Map<String,String> mRowData,Map<String,String> mParamValues) throws SQLException
    {
        String updatetype=mParamValues.get("updatetype");//获取定义在<params/>中定义的更新类型的变量值
        System.out.println("当前的操作类型："+updatetype);
        System.out.println("当前操作记录行上所有列的新旧值：");
        for(Entry<String,String> entryTmp:mRowData.entrySet())
        {
            System.out.print(entryTmp.getKey()+":"+entryTmp.getValue()+";");
        }
        System.out.println("\n===============================================================================");
        Connection conn=rrequest.getConnection();
        PreparedStatement pstmt=null;
        if(updatetype.equals("insert"))
        {
            pstmt=conn.prepareStatement("insert into tbl_department(guid,deptno,deptname,manager,performance) values (?,?,?,?,?)");
            pstmt.setString(1,UUIDGenerator.generateID());
            pstmt.setString(2,mRowData.get("deptno"));
            pstmt.setString(3,mRowData.get("deptname"));
            pstmt.setString(4,mRowData.get("manager"));
            //pstmt.setString(5,mRowData.get("builtdate"));
            pstmt.setString(5,mRowData.get("performance"));
        }else if(updatetype.equals("update"))
        {
            pstmt=conn.prepareStatement("update tbl_department set deptno=?,deptname=?,manager=?,performance=? where deptno=?");
            pstmt.setString(1,mRowData.get("deptno"));
            pstmt.setString(2,mRowData.get("deptname"));
            pstmt.setString(3,mRowData.get("manager"));
            //pstmt.setString(4,mRowData.get("builtdate"));
            pstmt.setString(4,mRowData.get("performance"));
            pstmt.setString(5,mRowData.get("deptno__old"));
        }else
        {//delete
            pstmt=conn.prepareStatement("delete from tbl_department where deptno=?");
            pstmt.setString(1,mRowData.get("deptno__old"));
        }
        pstmt.executeUpdate();
        pstmt.close();
        //这里不能调用conn.close();
    }

}
