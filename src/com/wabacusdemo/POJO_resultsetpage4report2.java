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

import com.wabacus.config.component.application.report.AbsReportDataPojo;
import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;

public class POJO_resultsetpage4report2 extends AbsReportDataPojo
{
    public POJO_resultsetpage4report2(ReportRequest rrequest,ReportBean rbean)
    {
        super(rrequest,rbean);
    }

    private String no;

    private String name;

    private String sex;

    private String age;

    private String birthday;

    private String province;

    private String city;

    private String county;

    public String getNo()
    {
        return no;
    }

    public void setNo(String no)
    {
        this.no=no;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name=name;
    }

    public String getSex()
    {
        return sex;
    }

    public void setSex(String sex)
    {
        this.sex=sex;
    }

    public String getAge()
    {
        return age;
    }

    public void setAge(String age)
    {
        this.age=age;
    }

    public String getBirthday()
    {
        return birthday;
    }

    public void setBirthday(String birthday)
    {
        this.birthday=birthday;
    }

    public String getProvince()
    {
        return province;
    }

    public void setProvince(String province)
    {
        this.province=province;
    }

    public String getCity()
    {
        return city;
    }

    public void setCity(String city)
    {
        this.city=city;
    }

    public String getCounty()
    {
        return county;
    }

    public void setCounty(String county)
    {
        this.county=county;
    }

    public void format()
    {
        sex=sex==null?"1":sex.trim();
        if(sex.equals("0"))
            sex="女";
        else
            sex="男";
        birthday=birthday==null?"":birthday.trim();
        int idx=birthday.indexOf(" ");//判断是否有时间，有的话就去掉时间，只显示日期
        if(idx>0) birthday=birthday.substring(0,idx);
    }

}
