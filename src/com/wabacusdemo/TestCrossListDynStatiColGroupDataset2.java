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

import com.wabacus.config.component.application.report.ConditionBean;
import com.wabacus.config.component.application.report.ReportDataSetValueBean;
import com.wabacus.system.component.application.report.CrossListReportType;
import com.wabacus.system.dataset.IDynamicColGroupDataSet;

public class TestCrossListDynStatiColGroupDataset2 implements IDynamicColGroupDataSet
{

    public List<Map<String,String>> getDynamicColGroupDataSet(CrossListReportType crossListReportTypeObj,ReportDataSetValueBean datasetbean,
            List<ConditionBean> lstDatasetConditions)
    {
        List<Map<String,String>> lstResults=new ArrayList<Map<String,String>>();
        Map<String,String> mTmp=new HashMap<String,String>();
        mTmp.put("year","2008");//2008年
        mTmp.put("jd","1");//第一季度
        lstResults.add(mTmp);
        mTmp=new HashMap<String,String>();
        mTmp.put("year","2008");
        mTmp.put("jd","2");//第二季度
        lstResults.add(mTmp);
        mTmp=new HashMap<String,String>();
        mTmp.put("year","2008");
        mTmp.put("jd","3");//第三季度
        lstResults.add(mTmp);
        mTmp=new HashMap<String,String>();
        mTmp.put("year","2008");
        mTmp.put("jd","4");//第四季度
        lstResults.add(mTmp);
        mTmp=new HashMap<String,String>();
        mTmp.put("year","2009");
        mTmp.put("jd","1");//第一季度
        lstResults.add(mTmp);
        mTmp=new HashMap<String,String>();
        mTmp.put("year","2009");//2009年
        mTmp.put("jd","2");//第二季度
        lstResults.add(mTmp);
        mTmp=new HashMap<String,String>();
        mTmp.put("year","2009");
        mTmp.put("jd","3");//第三季度
        lstResults.add(mTmp);
        mTmp=new HashMap<String,String>();
        mTmp.put("year","2009");
        mTmp.put("jd","4");//第四季度
        lstResults.add(mTmp);
        return lstResults;
    }
}

