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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.inputbox.option.SelectboxOptionBean;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;

public class Interceptor_resultsetpage3Report2 extends AbsInterceptorDefaultAdapter
{

    public Object beforeLoadData(ReportRequest rrequest,ReportBean rbean,Object typeObj,String sql)
    {
        if(typeObj instanceof SelectboxOptionBean)
        {
            sql=sql.replaceAll("%mycondition%","deptno like '001%'");//只显示部门编号以001开头的部门
            PreparedStatement pstmt=null;
            List<Map<String,String>> lstResults=new ArrayList<Map<String,String>>();
            try
            {
                Connection conn=rrequest.getConnection(rbean.getSbean().getDatasource());
                pstmt=conn.prepareStatement(sql);
                ResultSet rs=pstmt.executeQuery();
                Map<String,String> mOptionTmp;
                while(rs.next())
                {
                    mOptionTmp=new HashMap<String,String>();
                    mOptionTmp.put("label",rs.getString(((SelectboxOptionBean)typeObj).getLabel()));//取到下拉选项的显示label
                    mOptionTmp.put("value",rs.getString(((SelectboxOptionBean)typeObj).getValue()));//取到下拉选项的value
                    lstResults.add(mOptionTmp);
                }
                rs.close();
            }catch(Exception e)
            {
                e.printStackTrace();
            }finally
            {
                if(pstmt!=null)
                {
                    try
                    {
                        pstmt.close();
                    }catch(SQLException e)
                    {
                        e.printStackTrace();
                    }

                }
            }
            return lstResults;
        }
        //其它的数据库查询操作，不做修改，直接原样返回sql
        return sql;
    }

}

