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

import com.wabacus.config.component.application.report.ColBean;
import com.wabacus.config.component.application.report.ReportDataSetValueBean;
import com.wabacus.system.CacheDataBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.abstractreport.AbsReportType;
import com.wabacus.system.dataset.IReportDataSet;

public class TestJavaDataSet implements IReportDataSet
{
    public int getRecordcount(ReportRequest rrequest,AbsReportType reportTypeObj,ReportDataSetValueBean datasetbean)
    {
        System.out.println("获取记录数..........................");
        return lstTestDeptData.size();
    }
    
    public Object getDataSet(ReportRequest rrequest,AbsReportType reportTypeObj,ReportDataSetValueBean datasetbean,List lstReportData)
    {
        CacheDataBean cdb=rrequest.getCdb(reportTypeObj.getReportBean().getId());
        /**
         * 处理点击列排序
         * String[] orderbys=(String[])rrequest.getAttribute(reportTypeObj.getReportBean().getId(),"ORDERBYARRAY");
         * String ordercolumn=null,ordertype=null;
         * if(orderbys!=null&&orderbys.length==2)
         * {
         *   System.out.println(orderbys[0]+" "+orderbys[1]);
         * }*/
        if(cdb.isLoadAllReportData()) return lstTestDeptData;//本次是加载所有数据（比如数据导出等操作）
        int[] startEndRownumArr=cdb.getStartEndRownumOfDataset(datasetbean.getGuid());
        if(startEndRownumArr==null||startEndRownumArr.length!=2||startEndRownumArr[0]<0||startEndRownumArr[1]<=0||startEndRownumArr[0]==startEndRownumArr[1]) return null;
        if(startEndRownumArr[0]>=lstTestDeptData.size()) return null;
        System.out.println("显示的起始记录号："+startEndRownumArr[0]+"；结束记录号："+startEndRownumArr[1]);
        List<Map<String,String>> lstData=new ArrayList<Map<String,String>>();
        for(int i=startEndRownumArr[0];i<startEndRownumArr[1];i++)
        {
            if(i==lstTestDeptData.size()) break;
            lstData.add(lstTestDeptData.get(i));
        }
        return lstData;
    }

    /**
     * 处理列过滤
     * @param rrequest
     * @param filterColBean
     * @param datasetbean
     * @param mSelectedFilterValues
     * @return
     */
    public Object getColFilterDataSet(ReportRequest rrequest,ColBean filterColBean,ReportDataSetValueBean datasetbean,
            Map<String,List<String>> mSelectedFilterValues)
    {
//        System.out.println("本次获取选项数据的过滤列："+filterColBean.getColumn());
//        List<Map<String,String>> lstAllDisplayData=null;
//        if(mSelectedFilterValues!=null&&mSelectedFilterValues.size()>0)
//        {//已经选择了过滤选项数据进行列过滤操作，且当前是获取被选中的数据
//            lstAllDisplayData=getDisplayData(rrequest,filterColBean.getReportBean(),datasetbean);
//        }else
//        {//获取过滤列中所有数据
//            lstAllDisplayData=lstTestDeptData;
//        }
//        List<String> lstResults=new ArrayList<String>();
//        for(Map<String,String> mRowDataTmp:lstAllDisplayData)
//        {
//            if("deptno2".equals(filterColBean.getColumn()))
//            {
//                lstResults.add(mRowDataTmp.get("deptno2"));
//            }else if("deptname2".equals(filterColBean.getColumn()))
//            {
//                lstResults.add(mRowDataTmp.get("deptname2"));
//            }
//        }
        return null;
    }

    public Object getStatisticDataSet(ReportRequest rrequest,AbsReportType reportObj,ReportDataSetValueBean svbean,Object typeObj,String sql,
            boolean isStatisticForOnePage)
    {
        return null;
    }
    
//    /**
//     * 获取一共要显示的所有数据
//     * @param rrequest
//     * @param rbean
//     * @param datasetbean
//     * @return
//     */
//    private List<Map<String,String>> getDisplayData(ReportRequest rrequest,ReportBean rbean,ReportDataSetValueBean datasetbean)
//    {
//        String txtperform=rrequest.getStringAttribute("txtperform","");//取到“表现”条件输入框的值
//        Map<String,List<String>> mColFilterSelectedValue=ListReportAssistant.getInstance().getMFilterColAndFilterValues(rrequest,rbean,datasetbean);//取到已选中的过滤列及选中的选项数据
//        if((mColFilterSelectedValue==null||mColFilterSelectedValue.size()==0)&&txtperform.equals("")) return lstTestDeptData;//如果即没有进行列过滤，也没有输入查询条件进行查询，则返回所有记录
//        List<Map<String,String>> lstResultsData=(List<Map<String,String>>)((ArrayList<Map<String,String>>)lstTestDeptData).clone();
//        if(!txtperform.trim().equals(""))
//        {//在“表现”条件框中输入了条件，则找出符合条件的记录
//            for(int i=lstResultsData.size()-1;i>=0;i--)
//            {
//                if(!txtperform.equals(lstResultsData.get(i).get("performance2")))
//                {//不符合这个条件
//                    lstResultsData.remove(i);
//                }
//            }
//        }
//        if(mColFilterSelectedValue!=null&&mColFilterSelectedValue.size()==1)
//        {//因为一次只会过滤一个列，因此如果有列过滤的话，这里只有一个元素
//            for(int i=lstResultsData.size()-1;i>=0;i--)
//            {
//                if(mColFilterSelectedValue.containsKey("deptno2"))
//                {//是在部门编号上进行列过滤
//                    if(!mColFilterSelectedValue.get("deptno2").contains(lstResultsData.get(i).get("deptno2")))
//                    {
//                        lstResultsData.remove(i);
//                    }
//                }else if(mColFilterSelectedValue.containsKey("deptname2"))
//                {//是在部门名上进行列过滤
//                    if(!mColFilterSelectedValue.get("deptname2").contains(lstResultsData.get(i).get("deptname2")))
//                    {
//                        lstResultsData.remove(i);
//                    }
//                }
//            }
//        }
//        return lstResultsData;
//    }
    
    private final static List<Map<String,String>> lstTestDeptData=new ArrayList<Map<String,String>>();
    static
    {
        Map<String,String> mRowDataTmp;
        mRowDataTmp=new HashMap<String,String>();
        mRowDataTmp.put("guid2","3a8f8189297d71b001297d71b01a0001");
        mRowDataTmp.put("deptno2","0001");
        mRowDataTmp.put("deptname2","生产质量部");
        mRowDataTmp.put("manager2","吴华云");
        mRowDataTmp.put("builtdate2","2001-01-03");
        mRowDataTmp.put("performance2","优秀");
        mRowDataTmp.put("description2","根据客户要求的产品交货期，安排生产，安排测试，安排包装，按时按质完成产品，对研发产品测试样机生产支持，管理生产车间，5S，精益生产，生产物料、半成品和成品管理，生产质量管理，生产人员管理，操作工技能培训，制定生产各部分的制度和流程，对销售的产品质量进行跟踪和管理，处理客户产品投诉，提出产品质量整改意见，组织和提高产品认证（3C，CCEE，CCIB，CE）、质量认证（ISO9000-ISO90004）、环境认证（ISO14000），制定和完善全面质量管理（TQM）");
        lstTestDeptData.add(mRowDataTmp);
        mRowDataTmp=new HashMap<String,String>();
        mRowDataTmp.put("guid2","3a8f8189297d71b001297d71b01a0002");
        mRowDataTmp.put("deptno2","0002");
        mRowDataTmp.put("deptname2","物流部");
        mRowDataTmp.put("manager2","苏伟根");
        mRowDataTmp.put("builtdate2","2001-01-03");
        mRowDataTmp.put("performance2","很差");
        mRowDataTmp.put("description2","将销售部获得的客户订单录入到ERP系统，并生成相应的加工单，对成品按照客户要求的日期和发货地点完成成品发运，衡量公司对客户及时交货率；按照物流协议向供应商购买物料，催缴物料，对物料进行质量检查，并对供应商来料进行更总和物料FIFO管理，收到发票后组织付款，衡量供应商对公司的及时交货率，以及保税物料和报关实务处理，控制库存，制定物流制度和相应流程");
        lstTestDeptData.add(mRowDataTmp);
        mRowDataTmp=new HashMap<String,String>();
        mRowDataTmp.put("guid2","3a8f8189297d71b001297d71b01a0003");
        mRowDataTmp.put("deptno2","0003");
        mRowDataTmp.put("deptname2","采购部");
        mRowDataTmp.put("manager2","胡忠华");
        mRowDataTmp.put("builtdate2","2001-11-13");
        mRowDataTmp.put("performance2","良好");
        mRowDataTmp.put("description2","前期供应商的搜寻，对供应商的认证和考核，谈判物料价格，制定物流采购协议，对供应商的产品和送货进行质量更总，非生产性物料的采购，制定所有采购材料的流程和制度，对工业项目采购的支持");
        lstTestDeptData.add(mRowDataTmp);
        mRowDataTmp=new HashMap<String,String>();
        mRowDataTmp.put("guid2","3a8f8189297d71b001297d71b01a0004");
        mRowDataTmp.put("deptno2","0004");
        mRowDataTmp.put("deptname2","财务部");
        mRowDataTmp.put("manager2","胡新立");
        mRowDataTmp.put("builtdate2","2003-06-09");
        mRowDataTmp.put("performance2","良好");
        mRowDataTmp.put("description2","对公司的经营状况进行分析，提供决策财务数据支持，各种凭证录入系统，对供应商开具的发票付款，开发票给客户，并进行应收款的工作，对各种凭证汇总产生总账，出具财务报表（资产负债表，损益表，现金流量表），管理公司存款和现金，管理支票、汇票、发票、收据，报销，管理公司固定资产");
        lstTestDeptData.add(mRowDataTmp);
        mRowDataTmp=new HashMap<String,String>();
        mRowDataTmp.put("guid2","3a8f8189297d71b001297d71b01a0005");
        mRowDataTmp.put("deptno2","0005");
        mRowDataTmp.put("deptname2","研发技术部");
        mRowDataTmp.put("manager2","潘林淘");
        mRowDataTmp.put("builtdate2","2003-12-03");
        mRowDataTmp.put("performance2","良好");
        mRowDataTmp.put("description2","负责对现有产品升级更新，性能优化，产品改进，新产品研发，产品生产技术支持，管理研发设备和研发实验室");
        lstTestDeptData.add(mRowDataTmp);
        mRowDataTmp=new HashMap<String,String>();
        mRowDataTmp.put("guid2","3a8f8189297d71b001297d71b01a0006");
        mRowDataTmp.put("deptno2","0006");
        mRowDataTmp.put("deptname2","人事行政部");
        mRowDataTmp.put("manager2","胡新华");
        mRowDataTmp.put("builtdate2","2003-12-09");
        mRowDataTmp.put("performance2","优秀");
        mRowDataTmp.put("description2","发展公司企业文化，制定公司人事制度，管理员工入职离职，劳动合同管理，员工信息管理，制定员工福利和奖惩制度，制定公司培训政策和制度，安排出差人员的食宿，管理公司班车，管理公司食堂，管理公司办公设备");
        lstTestDeptData.add(mRowDataTmp);
        mRowDataTmp=new HashMap<String,String>();
        mRowDataTmp.put("guid2","3a8f8189297d71b001297d71b01a0007");
        mRowDataTmp.put("deptno2","0007");
        mRowDataTmp.put("deptname2","信息管理部");
        mRowDataTmp.put("manager2","苏小琴");
        mRowDataTmp.put("builtdate2","2004-03-12");
        mRowDataTmp.put("performance2","优秀");
        mRowDataTmp.put("description2","管理公司的信息设备，保证设备和信息的安全，提供稳定，安全，高效的应用服务，配合公司战略规划，制定信息管理发展计划，带领和支持业务部门，提供优质的产品和服务");
        lstTestDeptData.add(mRowDataTmp);
        mRowDataTmp=new HashMap<String,String>();
        mRowDataTmp.put("guid2","3a8f8189297d71b001297d71b01a0008");
        mRowDataTmp.put("deptno2","0008");
        mRowDataTmp.put("deptname2","销售市场部");
        mRowDataTmp.put("manager2","潘云鹏");
        mRowDataTmp.put("builtdate2","2004-03-12");
        mRowDataTmp.put("performance2","较好");
        mRowDataTmp.put("description2","为公司产品策划营销活动，树立公司品牌影响力，扩大产品市场占有额，管理分销商、代理商网络，制定公司年度销售计划，对销售活动进行监督和管理，考核销售业绩，为客户提供优质产品和服务");
        lstTestDeptData.add(mRowDataTmp);
        mRowDataTmp=new HashMap<String,String>();
        mRowDataTmp.put("guid2","3a8f8189297d71b001297d71b01a0009");
        mRowDataTmp.put("deptno2","0009");
        mRowDataTmp.put("deptname2","售后服务部");
        mRowDataTmp.put("manager2","潘云飞");
        mRowDataTmp.put("builtdate2","2004-03-12");
        mRowDataTmp.put("performance2","较好");
        mRowDataTmp.put("description2","提供产品客户服务，产品安装，产品调试，产品维修，产品配件管理，产品售后服务管理，提供优质的产品售后服务");
        lstTestDeptData.add(mRowDataTmp);
        mRowDataTmp=new HashMap<String,String>();
        mRowDataTmp.put("guid2","3a8f8189297d71b001297d71b01a0010");
        mRowDataTmp.put("deptno2","0010");
        mRowDataTmp.put("deptname2","工业工程部");
        mRowDataTmp.put("manager2","吴金升");
        mRowDataTmp.put("builtdate2","2005-01-06");
        mRowDataTmp.put("performance2","较好");
        mRowDataTmp.put("description2","规划生产线，提供精益生产方法和流程，制定产品生产工艺工序，产品生产操作手册，生产车间布局管理，优化生产工艺工序，提供工作效率，规划安全生产环境，产品技术变更管理，零部件版本升级管理，工程变更管理，将新研发的产品工业化，新产品生产线规划，操作工WI培训");
        lstTestDeptData.add(mRowDataTmp);
        mRowDataTmp=new HashMap<String,String>();
        mRowDataTmp.put("guid2","3a8f8189297d71b001297d71b01a0011");
        mRowDataTmp.put("deptno2","0011");
        mRowDataTmp.put("deptname2","设备维修部");
        mRowDataTmp.put("manager2","吴平红");
        mRowDataTmp.put("builtdate2","2005-01-06");
        mRowDataTmp.put("performance2","良好");
        mRowDataTmp.put("description2","负责公司所有故障设备的维修与更新");
        lstTestDeptData.add(mRowDataTmp);
        mRowDataTmp=new HashMap<String,String>();
        mRowDataTmp.put("guid2","3a8f8189297d71b001297d71b01a0012");
        mRowDataTmp.put("deptno2","0012");
        mRowDataTmp.put("deptname2","保卫处");
        mRowDataTmp.put("manager2","胡建国");
        mRowDataTmp.put("builtdate2","2005-01-08");
        mRowDataTmp.put("performance2","优秀");
        mRowDataTmp.put("description2","维护公司及员工安全，保障公司财产不受破坏");
        lstTestDeptData.add(mRowDataTmp);
    }
}

