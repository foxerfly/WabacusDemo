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

import com.itextpdf.text.Document;
import com.itextpdf.text.Image;
import com.wabacus.config.Config;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.abstractreport.AbsReportType;
import com.wabacus.system.intercept.AbsPdfInterceptor;

public class PdfInterceptor_dataexportpdfpage1_vp7 extends AbsPdfInterceptor
{

    /**
     * 当报表没有配置PDF模板时，此方法在显示完每页PDF后执行
     * 现在在此方法中演示显示完每页后向其中添加一个图片
     */
    public void afterDisplayPdfPageWithoutTemplate(Document document,AbsReportType reportTypeObj)
    {
        super.afterDisplayPdfPageWithoutTemplate(document,reportTypeObj);
        ReportRequest rrequest=reportTypeObj.getReportRequest();
        String serverName=rrequest.getRequest().getServerName();
        String serverPort=String.valueOf(rrequest.getRequest().getServerPort());
        String imgurl="http://"+serverName+":"+serverPort+Config.webroot+"wabacusdemo/pdftemplate/logo.gif";//构造要添加图片的URL
        try
        {
            Image img=Image.getInstance(imgurl);
            float width = document.getPageSize().getWidth();
            float height=document.getPageSize().getHeight();
            //width = width - img.getWidth();
            img.setAbsolutePosition(width/2,height/2+300f);
            img.setAlignment(Image.ALIGN_CENTER); 
            document.add(img);
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }

}

