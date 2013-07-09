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

import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfPCell;
import com.wabacus.config.component.application.report.ColBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.abstractreport.AbsReportType;
import com.wabacus.system.intercept.AbsPdfInterceptor;

public class PdfInterceptor_dataexportpdfpage1_vp6 extends AbsPdfInterceptor
{
    /**
     * 实现无PDF模板导出时导出每列标题或数据时的拦截方法
     */
    public void displayPerColDataWithoutTemplate(AbsReportType reportTypeObj,Object configbean,int rowidx,String value,PdfPCell cell)
    {
        if(!(configbean instanceof ColBean))
        {//当前是在导出统计数据或者导出<group/>的标题
            return;
        }
        ReportRequest rrequest=reportTypeObj.getReportRequest();
        ColBean cbean=(ColBean)configbean;
        if("photo".equals(cbean.getProperty())&&rowidx>=0)
        {//当前是在导出“照片”列，且是显示它的数据，而不是显示此列的标题
            if(value!=null&&!value.trim().equals(""))
            {
                String serverName=rrequest.getRequest().getServerName();
                String serverPort=String.valueOf(rrequest.getRequest().getServerPort());
                while(value.startsWith("/"))
                    value=value.substring(1).trim();
                value="http://"+serverName+":"+serverPort+"/"+value;//构造标准URL
                try
                {
                    cell.setFixedHeight(50f);
                    Image img=Image.getInstance(value);
                    cell.setImage(img);//将此单元格的URL转变为图片
                    //如果是修改本列的显示值，则调用 cell.addElement(new Paragraph(newvalue,font));方法
                }catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
        }
    }

}
