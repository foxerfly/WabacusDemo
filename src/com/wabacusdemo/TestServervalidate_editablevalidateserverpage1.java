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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.wabacus.system.ReportRequest;

public class TestServervalidate_editablevalidateserverpage1
{
    /**
     * 校验输入的部门编号是否为四位字符
     * @param rrequest
     * @param deptno
     * @param mValues
     * @param lstErrorMessages
     * @return
     */
    public static boolean isValidDeptnoString(ReportRequest rrequest,String deptno,Map<String,String> mValues,List<String> lstErrorMessages)
    {
        if(deptno==null||deptno.trim().equals("")) return true;//为空不在这里校验，而是在isNotEmpty()中校验，所以直接返回true
        System.out.println("进行isValidDeptno()服务器端校验时各列的新旧值为：");
        for(Entry<String,String> entryTmp:mValues.entrySet())
        {
            System.out.print(entryTmp.getKey()+"="+entryTmp.getValue()+";;");
        }
        System.out.println();
        deptno=deptno.trim();
        return deptno.length()==4;
    }

    /**
     * 校验输入的部门编号是否已经存在
     * @param rrequest
     * @param deptno
     * @param mValues
     * @param lstErrorMessages
     * @return
     */
    public static boolean isUniqueDeptno(ReportRequest rrequest,String deptno,Map<String,String> mValues,List<String> lstErrorMessages)
    {
        if(deptno==null||deptno.trim().equals("")) return true;//为空不在这里校验，而是在isNotEmpty()中校验，所以直接返回true
        System.out.println("进行isUniqueDeptno()服务器端校验时各列的新旧值为：");
        for(Entry<String,String> entryTmp:mValues.entrySet())
        {
            System.out.print(entryTmp.getKey()+"="+entryTmp.getValue()+";;");
        }
        System.out.println();
        deptno=deptno.trim();
        String olddeptno=mValues.get("deptno__old");//取到修改前的部门编号
        if(deptno.equals(olddeptno)) return true;//本次没有修改deptno，则不可能存在重复
        Connection conn=rrequest.getConnection();
        Statement stmt=null;
        try
        {
            stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery("select count(*) from tbl_department where deptno='"+deptno+"'");
            rs.next();
            int count=rs.getInt(1);
            rs.close();
            return count==0;
        }catch(SQLException e)
        {
            e.printStackTrace();
            return false;
        }finally
        {
            try
            {
                if(stmt!=null) stmt.close();
            }catch(SQLException e)
            {
                e.printStackTrace();
            }
        }
    }

    public static boolean isValidDeptno(ReportRequest rrequest,String deptno,Map<String,String> mValues,List<String> lstErrorMessages)
    {
        lstErrorMessages.clear();//清掉配置的出错提示信息，完全由自己进行提示
        if(deptno==null||deptno.trim().equals(""))
        {
            rrequest.addServerValidateParams("errormessage","部门编号不能为空");
            return false;
        }
        if(deptno.trim().length()!=4)
        {
            rrequest.addServerValidateParams("errormessage","部门编号必须为四位字符");
            return false;
        }
        if(!isUniqueDeptno(rrequest,deptno,mValues,lstErrorMessages))
        {
            rrequest.addServerValidateParams("errormessage","此部门编号已经存在");
            return false;
        }
        return true;
    }

    public static boolean isNotEmptyDeptname(ReportRequest rrequest,String deptno,Map<String,String> mValues,List<String> lstErrorMessages)
    {
        lstErrorMessages.clear();//清掉配置的出错提示信息，完全由自己进行提示
        if(deptno==null||deptno.trim().equals(""))
        {
            lstErrorMessages.add("[自定义校验出错提示信息]部门名称列不能为空");
            return false;
        }
        return true;
    }
    
}
