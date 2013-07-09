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

 
create or replace package PKG_WABACUS is
   TYPE CURSOR_WABACUS IS REF CURSOR;
   PROCEDURE SP_WABACUS_EXECUTE(i_sql varchar2, i_orderby varchar2,i_systeminfo varchar2,o_cursor out CURSOR_WABACUS); 
   FUNCTION FUN_WABACUS_GETPARAMVALUE(paramname varchar2,sourcestring varchar2) return varchar2;
end PKG_WABACUS;

create or replace package body PKG_WABACUS is
   procedure SP_WABACUS_EXECUTE
   (
       i_sql IN varchar2,
       i_orderby IN varchar2,
       i_systeminfo in varchar2,
       o_cursor out CURSOR_WABACUS
   ) is
      startnum varchar2(20);
      endnum varchar2(20);
      pagesize integer;
      filtercolumn varchar2(100);
      filtercondition varchar2(300);
      getrecordcount varchar2(10);
      realorderby varchar2(100);
      dynorderby varchar2(50);
      i_orderby_tmp varchar2(300);
      rowgroupCols varchar2(100);
      rowgroupColTmp varchar2(50);
      str1 varchar2(300);
      str2 varchar2(300);
      ordertypeTmp varchar2(10);
      idx2 integer;
      statistic_sql varchar2(3000);
      idx integer;
      result_sql varchar2(3000);
   begin
      filtercondition:=FUN_WABACUS_GETPARAMVALUE('filter_condition',i_systeminfo);
      filtercolumn:=FUN_WABACUS_GETPARAMVALUE('filter_column',i_systeminfo);
      getrecordcount:=FUN_WABACUS_GETPARAMVALUE('get_recordcount',i_systeminfo);
      if filtercolumn<>' ' then /*获取列过滤选项数据*/
         result_sql:='select  distinct '||filtercolumn||' from ('||i_sql||') wx_tbltemp';
         if filtercondition<>' ' then result_sql:=result_sql||' '||filtercondition; end if;/*如果当前在查询选中的列过滤选项数据*/
         /*如果当前是在查询所有列过滤选项数据，则不加上已经选中的列过滤选项做为条件*/
         result_sql:=result_sql||' order by '||filtercolumn;
      elsif getrecordcount='true' then /*加载报表记录数*/
         result_sql:=i_sql;
         if filtercondition<>' ' then result_sql:='select * from ('||result_sql||') wx_tbltemp1 '||filtercondition; end if;/*有过滤条件*/
         result_sql:='select count(*) from ('|| result_sql||') wx_tbltempcount';
         /*execute immediate sqlCount into idx;-- using paramno;
         o_systeminfo:=to_char(idx);*/
      else /*获取报表数据*/
         result_sql:=i_sql;
         if filtercondition<>' ' then result_sql:='select * from ('||result_sql||') wx_tbltemp1 '||filtercondition; end if;/*有过滤条件*/
         pagesize:=to_number(FUN_WABACUS_GETPARAMVALUE('pagesize',i_systeminfo));/*每页记录数*/
         statistic_sql:=FUN_WABACUS_GETPARAMVALUE('statistic_sql',i_systeminfo);
         if statistic_sql<>' ' and pagesize<0 then /*当前是统计整个报表的数据(统计分页报表的一页数据不在这里处理，而是在后面处理,因为要考虑到排序,尤其是行分组报表)*/
            result_sql:=replace(statistic_sql,'%STATISTIC_SQL%',result_sql);/*将要执行的SQL语句中的业务SQL语句替换成这里真正的查询业务数据的SQL语句*/
            --insert into tbl_test(message) values(result_sql);
         else
            realorderby:=i_orderby;
            dynorderby:=FUN_WABACUS_GETPARAMVALUE('dynamic_orderby',i_systeminfo); /*动态排序字段*/
  	        if dynorderby<>' ' then realorderby:=dynorderby; end if;
  	        rowgroupCols:=FUN_WABACUS_GETPARAMVALUE('rowgroup_cols',i_systeminfo);
            if rowgroupCols<>' ' then /*当前是行分组或树形分组显示的报表*/
		           /*下面将已有的排序字段,号左右空格去除，并在第一个位置和最后一个位置加上,号，以便后面判断，变成,col1 desc,col2,col3 asc,格式，即前后都有一个,号*/
		           i_orderby_tmp:='';
		           realorderby:=ltrim(rtrim(realorderby));
		           idx:=instr(realorderby,',');
		           while idx>0 loop
		              i_orderby_tmp:=i_orderby_tmp||ltrim(rtrim(substr(realorderby,1,idx-1)))||',';
		              realorderby:=ltrim(rtrim(substr(realorderby,idx+1)));
		              idx:=instr(realorderby,',');
		           end loop;
		           if realorderby<>' ' then i_orderby_tmp:=i_orderby_tmp||realorderby||','; end if;
		           if substr(i_orderby_tmp,1,1)<>',' then i_orderby_tmp:=','||i_orderby_tmp; end if;/*在起始位置加上,号*/
		           /*将行分组列放在排序字段的首位*/
		           realorderby:=' ';
               while rowgroupCols<>' ' and rowgroupCols<> ',' loop
		              idx:=instr(rowgroupCols,',');
		              if idx>0 then
		                 rowgroupColTmp:=ltrim(rtrim(substr(rowgroupCols,1,idx-1)));/*得到参与行分组的列，不包括前面的逗号*/
			               rowgroupCols:=ltrim(rtrim(substr(rowgroupCols,idx+1)));
		              else /*后面没有逗号了，说明已经是最后一个分组列字段了*/
			               rowgroupColTmp:=rowgroupCols;
			               rowgroupCols:='';
		              end if;
		              if rowgroupColTmp<>' ' then 
			               ordertypeTmp:='asc';/*当前分组列的排序顺序*/
			               idx2:=instr(lower(i_orderby_tmp),','||lower(rowgroupColTmp)||' '); /*,col1 asc/desc格式*/
			               if idx2<=0 then idx2:=instr(lower(i_orderby_tmp),','||lower(rowgroupColTmp)||','); end if;/*,col1,...格式*/
			               if idx2>0 then /*在@i_orderby中已经存在这个分组列做为排序字段*/
			                  str1:=substr(i_orderby_tmp,1,idx2-1);/*取到此排序字段前面部分，不包括逗号*/
			                  i_orderby_tmp:=substr(i_orderby_tmp,idx2+1);
			                  idx2:=instr(i_orderby_tmp,',');
			                  if idx2>0 then /*在@i_orderby中此排序列后面还有排序列*/
				                   str2:=substr(i_orderby_tmp,1,idx2-1);
				                   i_orderby_tmp:=substr(i_orderby_tmp,idx2);/*这里保留了前面的逗号*/
			                  else /*已经是最后一个排序列了*/
				                   str2:=i_orderby_tmp;
				                   i_orderby_tmp:='';
			                  end if;
			                  i_orderby_tmp:=str1||i_orderby_tmp;/*在@i_orderby中删掉此分组列，因为要把它提到前面进行排序*/
			                  idx2:=instr(str2,' '); /*@str2中存放的是当前排序字段及排序顺序asc/desc*/
			                  if idx2>0 then /*在字段后面指定了排序顺序*/
				                   ordertypeTmp:=ltrim(rtrim(substr(str2,idx2+1)));
				                   if ordertypeTmp=' ' then ordertypeTmp:='asc'; end if;
			                  end if;
			               end if;
			               realorderby:=realorderby||rowgroupColTmp||' '||ordertypeTmp||',';
		              end if;
		           end loop;
               if i_orderby_tmp<>' ' then /*将@i_orderby中剩下的部分放入@orderbyNew的后面*/
		              if substr(i_orderby_tmp,1,1)=',' then i_orderby_tmp:=substr(i_orderby_tmp,2); end if;
		              realorderby:=realorderby||i_orderby_tmp;
		           end if;
		           if substr(realorderby,length(realorderby))=',' then realorderby:=substr(realorderby,1,length(realorderby)-1); end if;/*删除掉最后面的,号*/
            end if;
            if realorderby<>' ' then result_sql:='select * from ('||result_sql||') wx_tbltmp2 order by '||realorderby; end if;
	          if pagesize>0 then /*本次是获取某页的记录*/
		           startnum:=FUN_WABACUS_GETPARAMVALUE('startrownum',i_systeminfo);/*起始记录号*/
		           endnum:=FUN_WABACUS_GETPARAMVALUE('endrownum',i_systeminfo);/*结束记录号*/
               result_sql:='SELECT * FROM(SELECT wx_temp_tbl1.*, ROWNUM row_num FROM ('||result_sql||')  wx_temp_tbl1 WHERE ROWNUM<='||endnum||')  wx_temp_tbl2 WHERE row_num>'||startnum;
               if statistic_sql<>' ' then /*当前是统计分页数据*/
                  result_sql:=replace(statistic_sql,'%STATISTIC_SQL%',result_sql);/*将要执行的SQL语句中的业务SQL语句替换成这里真正的查询业务数据的SQL语句*/
                  --insert into tbl_test(message) values(result_sql);
               end if;
            end if;
         end if;
      end if;
      --insert into tbl_test(message) values(result_sql);
      OPEN o_cursor FOR result_sql;-- using i_maxrownum,i_minrownum;
   end SP_WABACUS_EXECUTE;
   
   
   FUNCTION FUN_WABACUS_GETPARAMVALUE
   (
       paramname varchar2,
       sourcestring varchar2
   ) return varchar2 
   is
       paramvalue varchar2(2000);
       sourcestring_local varchar2(2000);
       paramname_local varchar2(100);
       idx integer;
   begin  
       paramvalue:=' ';
       sourcestring_local:=sourcestring;
       paramname_local:=paramname;
       if paramname_local is null or sourcestring_local is null then return paramvalue; end if;
       sourcestring_local:=LTRIM(RTRIM(sourcestring_local));
       paramname_local:=LTRIM(RTRIM(paramname_local));
       if sourcestring_local=' ' and paramname_local=' '  then return paramvalue; end if;
       idx:=instr(sourcestring_local,'{[(<'|| paramname_local||':');
       if idx<=0 then return paramvalue; end if;
       paramvalue:=substr(sourcestring_local,idx+length(paramname_local)+5);
       idx:=instr(paramvalue,'>)]}');
       if idx<=0 then return paramvalue; end if;
       paramvalue:=substr(paramvalue,1,idx-1);
      return paramvalue;
   end FUN_WABACUS_GETPARAMVALUE;
end PKG_WABACUS;
