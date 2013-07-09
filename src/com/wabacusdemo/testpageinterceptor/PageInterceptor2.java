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
package com.wabacusdemo.testpageinterceptor;

import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsPageInterceptor;

public class PageInterceptor2 extends AbsPageInterceptor
{
    public void doStart(ReportRequest rrequest)
    {
        System.out.println("PageInterceptor2.doStart("+rrequest.getPagebean().getId()+");");
    }
    
    public void doEnd(ReportRequest rrequest)
    {
        System.out.println("PageInterceptor2.doEnd("+rrequest.getPagebean().getId()+");");
    }
}

