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
import java.util.List;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.config.component.application.report.ReportDataSetValueBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.abstractreport.configbean.AbsListReportFilterBean;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;

public class Interceptor_resultsetpage2Report2 extends AbsInterceptorDefaultAdapter
{
    
    /**
     * 只覆写父类的加载数据前置动作
     */
    public Object beforeLoadData(ReportRequest rrequest,ReportBean rbean,Object typeObj,String sql)
    {
        if(typeObj instanceof ReportDataSetValueBean)
        {//如果当前是在查询报表数据
            sql=sql.replaceAll("%mycondition%","age>35");//只显示年龄大于35岁的员工
            PreparedStatement pstmt=null;
            List lstResults=new ArrayList();
            try
            {
                Connection conn=rrequest.getConnection(rbean.getSbean().getDatasource());
                pstmt=conn.prepareStatement(sql);
                ResultSet rs=pstmt.executeQuery();
                if(sql.indexOf("count(*)")>0)
                {//当前是在查记录数
                    rs.next();
                    lstResults.add(rs.getInt(1));
                }else
                {//当前是在查报表数据
                    while(rs.next())
                    {//将所有报表数据取出放入List中，每条记录存放在一个POJO对象。
                        Resultsetpage2_Report2_POJO pojo=new Resultsetpage2_Report2_POJO(rrequest,rbean);
                        pojo.setAge(rs.getString("age"));
                        pojo.setBirthday(rs.getString("birthday"));
                        pojo.setDeptname(rs.getString("deptname"));
                        pojo.setName(rs.getString("name"));
                        pojo.setNo(rs.getString("no"));
                        pojo.setSex(rs.getString("sex"));
                        pojo.format();
                        lstResults.add(pojo);
                    }
                }
                rs.close();
                return lstResults;
            }catch(Exception e)
            {
                e.printStackTrace();
                if(sql.indexOf("count(*)")>0)
                {
                    lstResults.add(0);
                }
                return lstResults;
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
        }else if(typeObj instanceof AbsListReportFilterBean)
        {//如果当前正在查询列过滤的选项数据列表
            sql=sql.replaceAll("%mycondition%","age>35");//只显示年龄大于35岁的员工
            return sql;
        }else
        {//如果是在查询其它数据，比如下拉选项数据
            return sql;
        }
    }

}

