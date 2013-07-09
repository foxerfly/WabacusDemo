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
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wabacus.config.Config;
import com.wabacus.config.component.IComponentConfigBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.assistant.WabacusAssistant;
import com.wabacus.system.serveraction.IServerAction;
import com.wabacus.util.UUIDGenerator;

public class TestServerCallBack1 implements IServerAction
{
    /**
     * 与框架无关的ajax调用
     */
    public String executeServerAction(HttpServletRequest request,HttpServletResponse response,List<Map<String,String>> lstData)
    {
        System.out.println("executeServerAction(HttpServletRequest request,HttpServletResponse response,List<Map<String,String>> lstData)方法...");
        printLstParams(lstData);//打印客户端传过来的参数
        if(lstData==null||lstData.size()==0) return "没有传入数据";
        Connection conn=Config.getInstance().getDataSource("").getConnection();//取配置的默认数据源的连接
        PreparedStatement pstmt=null;
        try
        {
            for(Map<String,String> mParams:lstData)
            {//将传入的每条数据插入数据库中
                String content=mParams.get("text");//从客户端取传过来的数据
                String updatetype=mParams.get("actiontype");//从客户端取传过来的数据
                if(updatetype==null||updatetype.trim().equals("")) continue;
                if(updatetype.equals("clear"))
                {//当前是做清空记录的操作
                    pstmt=conn.prepareStatement("delete from tbl_log");
                    pstmt.executeUpdate();
                    pstmt.close();
                    return "插入数据成功";
                }else
                {
                    if(content==null||content.trim().equals("")) continue;
                    pstmt=conn.prepareStatement("insert into tbl_log(uuid,createdate,content,updatetype) values(?,?,?,?)");
                    pstmt.setString(1,UUIDGenerator.generateID());
                    pstmt.setTimestamp(2,new Timestamp((new Date()).getTime()));
                    pstmt.setString(3,content);
                    pstmt.setString(4,updatetype);
                    pstmt.executeUpdate();
                    pstmt.close();
                }
            }
            return "插入数据成功";
        }catch(Exception e)
        {
            e.printStackTrace();
            return "调用失败";
        }finally
        {
            WabacusAssistant.getInstance().release(conn,null);
        }
    }

    /**
     * 针对组件通过ajax调用服务器端方法
     */
    public String executeSeverAction(ReportRequest rrequest,IComponentConfigBean ccbean,List<Map<String,String>> lstData,Map<String,String> mCustomizedData)
    {
        System.out.println("调用executeSeverAction(ReportRequest rrequest,IComponentConfigBean ccbean,List<Map<String,String>> lstData)方法...");
        rrequest.getWResponse().getMessageCollector().success("调用服务器端方法成功",false);//向前台提示一条信息，这里还可以终止后续处理
        printLstParams(lstData);//打印客户端传过来的参数
        return "调用成功!!!";
    }

    private void printLstParams(List<Map<String,String>> lstData)
    {
        if(lstData==null||lstData.size()==0)
        {
            System.out.println("无参数");
        }else
        {
            System.out.print("客户端传入参数列表：：：");
            for(Map<String,String> mParams:lstData)
            {
                StringBuffer paramBuf=new StringBuffer();
                for(Entry<String,String> entryTmp:mParams.entrySet())
                {
                    paramBuf.append("[paramname:"+entryTmp.getKey()+";paramvalue:"+entryTmp.getValue()+"]");
                }
                System.out.print("{"+paramBuf.toString()+"};");
            }
            System.out.println(" ");
        }
    }
}

