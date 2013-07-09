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

import javax.servlet.http.HttpServletRequest;

import com.wabacus.config.component.container.page.PageBean;
import com.wabacus.system.commoninterface.IPagePersonalizePersistence;

/*
 * 这里做为测试，将页面的主题风格只保存在session中，开发人员在实际使用时，可以持久化到数据库等其它地方。并可以为每个用户存一份他们特有的主题风格
 */
public class TestPagePersonalizePersistenceImpl implements IPagePersonalizePersistence
{
    /**
     * 加载某个页面或整个项目的SKIN
     * 如果返回null，则框架会自动取在wabacus.cfg.xml中配置的skin值
     */
    public String loadSkin(HttpServletRequest request,PageBean pbean)
    {
        if(request!=null&&request.getSession()!=null)
        {
            if(pbean!=null)
            {//加载某个页面的主题风格
                return (String)request.getSession().getAttribute("dynskin_"+pbean.getId());
            }else
            {//加载整个项目的主题风格
                return (String)request.getSession().getAttribute("dynskin");
            }
        }
        return null;
    }

    public void storeSkin(HttpServletRequest request,PageBean pbean,String skin)
    {
        if(request!=null&&request.getSession()!=null)
        {
            if(pbean!=null)
            {//保存某个页面的主题风格
                request.getSession().setAttribute("dynskin_"+pbean.getId(),skin);
            }else
            {//保存整个项目的主题风格
                request.getSession().setAttribute("dynskin",skin);
            }
        }
    }
}

