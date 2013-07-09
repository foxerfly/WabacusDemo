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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.wabacus.system.ReportRequest;
import com.wabacus.system.inputbox.autocomplete.AutoCompleteBean;
import com.wabacus.system.inputbox.autocomplete.IAutoCompleteDataSet;

public class AutoCompleteDataSet_autocompletedatapage1Report2 implements IAutoCompleteDataSet
{

    public Map<String,String> getAutoCompleteColumnsData(ReportRequest rrequest,AutoCompleteBean completebean,Map<String,String> mParams)
    {
        if(mParams==null||!mParams.containsKey("deptno")) return null;
        String deptno=mParams.get("deptno");
        if(deptno==null||deptno.trim().equals("")) return null;//没有输入部门编号，则不自动填充
        Connection conn=rrequest.getConnection();
        PreparedStatement pstmt=null;
        try
        {
            pstmt=conn.prepareStatement("SELECT * FROM tbl_department where  deptno like ?");
            pstmt.setString(1,"%"+deptno+"%");
            Map<String,String> mResults=new HashMap<String,String>();
            ResultSet rs=pstmt.executeQuery();
            if(rs.next())
            {//取到在columns属性中配置的需要自动填充的各列值，存入Map中返回
                mResults.put("deptno",rs.getString("deptno"));
                mResults.put("deptname",rs.getString("deptname"));
                mResults.put("manager",rs.getString("manager"));
                mResults.put("performance",rs.getString("performance"));
            }
            rs.close();
            return mResults;
        }catch(SQLException e)
        {
            e.printStackTrace();
            return null;
        }finally
        {
            try
            {
                if(pstmt!=null) pstmt.close();
            }catch(SQLException e)
            {
                e.printStackTrace();
            }
            //这里不用关闭conn
        }
    }

}

