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

public class TestCrossListDynStatiColGroupDataset1 implements IDynamicColGroupDataSet
{

    public List<Map<String,String>> getDynamicColGroupDataSet(CrossListReportType crossListReportTypeObj,ReportDataSetValueBean datasetbean,
            List<ConditionBean> lstDatasetConditions)
    {
        //此类只演示单行标题的动态列
        List<Map<String,String>> lstResults=new ArrayList<Map<String,String>>();
        Map<String,String> mTmp=new HashMap<String,String>();
        mTmp.put("month","1");//显示label
        lstResults.add(mTmp);
        mTmp=new HashMap<String,String>();
        mTmp.put("month","2");//显示label
        lstResults.add(mTmp);
        mTmp=new HashMap<String,String>();
        mTmp.put("month","3");//显示label
        lstResults.add(mTmp);
        mTmp=new HashMap<String,String>();
        mTmp.put("month","4");//显示label
        lstResults.add(mTmp);
        mTmp=new HashMap<String,String>();
        mTmp.put("month","5");//显示label
        lstResults.add(mTmp);
        mTmp=new HashMap<String,String>();
        mTmp.put("month","6");//显示label
        lstResults.add(mTmp);
        mTmp=new HashMap<String,String>();
        mTmp.put("month","7");//显示label
        lstResults.add(mTmp);
        mTmp=new HashMap<String,String>();
        mTmp.put("month","8");//显示label
        lstResults.add(mTmp);
        mTmp=new HashMap<String,String>();
        mTmp.put("month","9");//显示label
        lstResults.add(mTmp);
        mTmp=new HashMap<String,String>();
        mTmp.put("month","10");//显示label
        lstResults.add(mTmp);
        mTmp=new HashMap<String,String>();
        mTmp.put("month","11");//显示label
        lstResults.add(mTmp);
        mTmp=new HashMap<String,String>();
        mTmp.put("month","12");//显示label
        lstResults.add(mTmp);
        return lstResults;
    }
}

