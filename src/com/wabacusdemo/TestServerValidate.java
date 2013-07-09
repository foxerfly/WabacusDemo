/* 
 * Copyright (C) 2010 星星<349446658@qq.com>
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

import java.util.List;
import java.util.Map;

import com.wabacus.system.ReportRequest;

public class TestServerValidate
{
    public static boolean isValidAge(ReportRequest rrequest,String age,Map<String,String> mValues,List<String> lstErrorMessages)
    {
        if(age==null||age.trim().equals("")) return true;
        int iage;
        try
        {
            iage=Integer.parseInt(age);
        }catch(NumberFormatException e)
        {
           return false;
        }
        if(iage>0&&iage<200) return true;
        return false;
    }
}

