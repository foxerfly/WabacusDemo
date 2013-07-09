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
package com.wabacusdemo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wabacus.config.component.application.report.AbsReportDataPojo;
import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.abstractreport.AbsReportType;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;

public class Interceptor_resultsetpage4report1 extends AbsInterceptorDefaultAdapter
{

    public Object afterLoadData(ReportRequest rrequest,ReportBean rbean,Object typeObj,Object dataObj)
    {
        if(!(typeObj instanceof AbsReportType)) return super.afterLoadData(rrequest,rbean,typeObj,dataObj);//如果当前不是查询报表数据，则不做处理
        List<AbsReportDataPojo> lstData=(List<AbsReportDataPojo>)dataObj;//此时dataObj参数存放的就是当前报表加载出的数据列表
        if(lstData==null||lstData.size()==0) return dataObj;
        /**
         * 下面将取到的所有no列的值拼凑成no1,no2,...格式，以便稍后用它们做为条件从另一个表（甚至其它库中的表）取到省、市、县
         */
        StringBuffer noBuf=new StringBuffer();
        String noTmp;
        for(AbsReportDataPojo pojoTmp:lstData)
        {
            noTmp=pojoTmp.getColStringValue("no");
            if(noTmp==null||noTmp.trim().equals("")) continue;
            noBuf.append("'").append(noTmp).append("',");
        }
        if(noBuf.charAt(noBuf.length()-1)==',') noBuf.deleteCharAt(noBuf.length()-1);
        String strnos=noBuf.toString().trim();
        if(strnos.equals("")) return dataObj;
        Connection conn=rrequest.getConnection();//如果是从其它数据库中取此报表的数据，则可以在此传入相应的数据源名
        Statement stmt=null;
        //下面从数据库中取到本报表当前显示的所有no中对应的省、市、县数据，并存放在mData中
        Map<String,String> mDataTmp=new HashMap<String,String>();
        try
        {
            stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery("select no,province,city,county from tbl_detailinfo where no in("+strnos+")");
            while(rs.next())
            {
                noTmp=rs.getString("no");
                mDataTmp.put(noTmp+"_province",rs.getString("province"));
                mDataTmp.put(noTmp+"_city",rs.getString("city"));
                mDataTmp.put(noTmp+"_county",rs.getString("county"));
            }
            rs.close();
        }catch(SQLException e)
        {
            e.printStackTrace();
        }finally
        {
            try
            {
                stmt.close();
            }catch(SQLException e)
            {
                e.printStackTrace();
            }
            //这里不用关闭conn，框架会统一关闭
        }
        /*将每个工号对应的省市县设置到相应记录的POJO对象中*/
        for(AbsReportDataPojo dataObjTmp:lstData)
        {
            noTmp=dataObjTmp.getColStringValue("no");//从当前记录的POJO对象中取到工号列的值
            dataObjTmp.setColValue("province",mDataTmp.get(noTmp+"_province"));//将此工号对应的省设置到此记录pojo对象的province列中
            dataObjTmp.setColValue("city",mDataTmp.get(noTmp+"_city"));//将此工号对应的省设置到此记录pojo对象的city列中
            dataObjTmp.setColValue("county",mDataTmp.get(noTmp+"_county"));//将此工号对应的省设置到此记录pojo对象的county列中
        }
        return lstData;//返回设置完所有记录的省市县三列值的对象集合，这样显示时就能将它们显示出来
    }

}

