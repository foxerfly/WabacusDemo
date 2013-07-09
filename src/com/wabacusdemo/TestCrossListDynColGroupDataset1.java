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

public class TestCrossListDynColGroupDataset1 implements IDynamicColGroupDataSet
{

    public List<Map<String,String>> getDynamicColGroupDataSet(CrossListReportType crossListReportTypeObj,ReportDataSetValueBean datasetbean,
            List<ConditionBean> lstDatasetConditions)
    {
        //此类只演示单行标题的动态列
        List<Map<String,String>> lstResults=new ArrayList<Map<String,String>>();
        Map<String,String> mTmp=new HashMap<String,String>();
        mTmp.put("layer3","[动态]中文名");//显示label
        mTmp.put("col_column","name");//取此列数据的字段名
        lstResults.add(mTmp);
        mTmp=new HashMap<String,String>();
        mTmp.put("layer3","[动态]英文名");
        mTmp.put("col_column","ename");
        lstResults.add(mTmp);
        mTmp=new HashMap<String,String>();
        mTmp.put("layer3","[动态]性别");
        mTmp.put("col_column","sex");
        lstResults.add(mTmp);
        mTmp=new HashMap<String,String>();
        mTmp.put("layer3","[动态]年龄");
        mTmp.put("col_column","age");
        lstResults.add(mTmp);
        mTmp=new HashMap<String,String>();
        mTmp.put("layer3","[动态]出生日期");
        mTmp.put("col_column","birthday");
        lstResults.add(mTmp);
        return lstResults;
    }

}
