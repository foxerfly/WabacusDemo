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

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wabacus.system.ReportRequest;
import com.wabacus.system.inputbox.option.AbsOptionDatasource;

public class TestSelectBoxJavaDataSource extends AbsOptionDatasource
{

    public List<Map<String,String>> getLstSelectBoxOptions(ReportRequest rrequest,Map<String,String> mParentInputboxValues)
    {
        List<Map<String,String>> lstResults=new ArrayList<Map<String,String>>();
        Map<String,String> mOptionTmp=new HashMap<String,String>();
        mOptionTmp.put("label","生产质量部");
        mOptionTmp.put("value","0001");
        lstResults.add(mOptionTmp);
        mOptionTmp=new HashMap<String,String>();
        mOptionTmp.put("label","物流部");
        mOptionTmp.put("value","0002");
        lstResults.add(mOptionTmp);
        mOptionTmp=new HashMap<String,String>();
        mOptionTmp.put("label","采购部");
        mOptionTmp.put("value","0003");
        lstResults.add(mOptionTmp);
        mOptionTmp=new HashMap<String,String>();
        mOptionTmp.put("label","财务部");
        mOptionTmp.put("value","0004");
        lstResults.add(mOptionTmp);
        mOptionTmp=new HashMap<String,String>();
        mOptionTmp.put("label","研发技术部");
        mOptionTmp.put("value","0005");
        lstResults.add(mOptionTmp);
        mOptionTmp=new HashMap<String,String>();
        mOptionTmp.put("label","人事行政部");
        mOptionTmp.put("value","0006");
        lstResults.add(mOptionTmp);
        mOptionTmp=new HashMap<String,String>();
        mOptionTmp.put("label","信息管理部");
        mOptionTmp.put("value","0007");
        lstResults.add(mOptionTmp);
        mOptionTmp=new HashMap<String,String>();
        mOptionTmp.put("label","销售市场部");
        mOptionTmp.put("value","0008");
        lstResults.add(mOptionTmp);
        mOptionTmp=new HashMap<String,String>();
        mOptionTmp.put("label","售后服务部");
        mOptionTmp.put("value","0009");
        lstResults.add(mOptionTmp);
        mOptionTmp=new HashMap<String,String>();
        mOptionTmp.put("label","工业工程部");
        mOptionTmp.put("value","0010");
        lstResults.add(mOptionTmp);
        mOptionTmp=new HashMap<String,String>();
        mOptionTmp.put("label","设备维修部");
        mOptionTmp.put("value","0011");
        lstResults.add(mOptionTmp);
        mOptionTmp=new HashMap<String,String>();
        mOptionTmp.put("label","保卫处");
        mOptionTmp.put("value","0012");
        lstResults.add(mOptionTmp);
        return lstResults;
    }

}

