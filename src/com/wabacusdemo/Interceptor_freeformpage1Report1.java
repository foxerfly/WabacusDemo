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

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.configbean.editablereport.AbsEditableReportEditDataBean;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;

public class Interceptor_freeformpage1Report1 extends AbsInterceptorDefaultAdapter
{

    public int doSave(ReportRequest rrequest,ReportBean rbean,AbsEditableReportEditDataBean editbean)
    {
        List<Map<String,String>> lstInsertData=rrequest.getLstInsertedData(rbean);//添加的记录集合
        List<Map<String,String>> lstUpdateData=rrequest.getLstUpdatedData(rbean);//修改的记录集合
        Map<String,String> mCustomizedData=rrequest.getMCustomizeEditData(rbean);//取到用户通过setCustomizeParamValue()方法设置进来的参数
        int flag=super.doSave(rrequest,rbean,editbean);
        String no="";
        if(lstInsertData!=null&&lstInsertData.size()>0)
        {//当前在做添加数据的保存操作，对于细览报表，一次只会添加一条记录，因此里面只有一个元素
            Map<String,String> mDataTmp=lstInsertData.get(0);
            no=mDataTmp.get("no");//取到工号
        }else if(lstUpdateData!=null&&lstUpdateData.size()>0)
        {//当前在做修改数据的保存操作
            Map<String,String> mDataTmp=lstUpdateData.get(0);
            no=mDataTmp.get("no");//取到工号
        }
        if("".equals(no)) return flag;//本次没有增、改数据
        Connection conn=rrequest.getConnection(rbean.getSbean().getDatasource());
        PreparedStatement pstmt=null;
        try
        {
            if("1".equals(mCustomizedData.get("sex")))
            {//用户选中的性别是男
                pstmt=conn.prepareStatement("update tbl_baseinfo set age=? where no=?");
                pstmt.setInt(1,Integer.parseInt(mCustomizedData.get("age")));
                pstmt.setString(2,no);
                pstmt.executeUpdate();
                pstmt.close();
                pstmt=conn.prepareStatement("update tbl_detailinfo set marriage=? where no=?");
                pstmt.setString(1,mCustomizedData.get("marriage"));
                pstmt.setString(2,no);
                pstmt.executeUpdate();
            }else if("0".equals(mCustomizedData.get("sex")))
            {//用户选中的性别是女，则更新工资
                pstmt=conn.prepareStatement("update tbl_detailinfo set salary=? where no=?");
                pstmt.setFloat(1,Float.parseFloat(mCustomizedData.get("salary")));
                pstmt.setString(2,no);
                pstmt.executeUpdate();
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }finally
        {
            try
            {
                if(pstmt!=null) pstmt.close();
            }catch(SQLException e)
            {
                e.printStackTrace();
            }
        }
        return flag;
    }

}
