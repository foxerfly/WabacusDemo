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

import java.text.DecimalFormat;

import com.wabacus.config.component.application.report.ReportBean;

public class TestFormatMethod
{
    public static String formatDouble(String srcString)
    {
        try
        {
            if(srcString==null||srcString.trim().equals(""))
            {
                return "";
            }
            DecimalFormat df=new DecimalFormat("#,###0.00");
            srcString=df.format(Double.parseDouble(srcString));
            return srcString;
        }catch(Exception e)
        {
            e.printStackTrace();
            return srcString;
        }
    }
    
    /**
     * 格式化列过滤中的性别
     * @param rbean
     * @param originalSexs
     * @return
     */
    public static String[] formatColFilterSex(ReportBean rbean,String[] originalSexs)
    {
        if(originalSexs==null||originalSexs.length==0) return new String[0];
        /**
         * 为列过滤选项的显示值定义一个新的数组，而不能直接改originalSexs这里面值，因为这里的值在选中后要传到后台拼凑条件，除非真的有这种需求
         */
        String[] displaySexs=new String[originalSexs.length];
        for(int i=0,len=originalSexs.length;i<len;i++)
        {
            if(originalSexs[i].equals("0"))
            {
                displaySexs[i]="女";
            }else if(originalSexs[i].equals("1"))
            {
                displaySexs[i]="男";
            }else
            {
                displaySexs[i]="";
            }
        }
        return displaySexs;
    }
}

