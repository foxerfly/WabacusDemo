set character_set_client=GBK; 
set character_set_connection=GBK; 
set character_set_database=GBK; 
set character_set_results=GBK; 
set character_set_server=GBK;
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
 DELIMITER $$  ;
DROP PROCEDURE IF EXISTS SP_WABACUS_EXECUTE$$

CREATE PROCEDURE SP_WABACUS_EXECUTE(
    i_sql  varchar(3000),
    i_orderby  varchar(200),
    i_systeminfo varchar(3000)
    /*out o_systeminfo varchar(100)*/
)
BEGIN
    declare startnum varchar(20);
    declare endnum varchar(20);
    declare pagesize int;/*页面大小，如果是-1，则不分页显示或不是数据自动列表报表*/
    declare filtercolumn varchar(100);
    declare filtercondition varchar(300);
    declare getrecordcount varchar(10);
    declare dynorderby varchar(50);
    declare i_orderby_tmp varchar(300);
    declare rowgroupCols varchar(100);
    declare rowgroupColTmp varchar(50);
    declare str1 varchar(300);
    declare str2 varchar(300);
    declare ordertypeTmp varchar(10);
    declare statistic_sql varchar(3000);
    declare idx int;
    declare idx2 int;
    set @sql='';
    set filtercondition=FUN_WABACUS_GETPARAMVALUE('filter_condition',i_systeminfo);
    set filtercolumn=FUN_WABACUS_GETPARAMVALUE('filter_column',i_systeminfo);
    set getrecordcount=FUN_WABACUS_GETPARAMVALUE('get_recordcount',i_systeminfo);
    if filtercolumn<>'' then /*获取列过滤选项数据*/
	set i_sql=concat('select  distinct ',filtercolumn,' from (',i_sql ,') wx_tbltemp');
  	if filtercondition<>'' then set i_sql=concat(i_sql,' ',filtercondition); end if;/*如果当前在查询选中的列过滤选项数据*/
	/*如果当前是在查询所有列过滤选项数据，则不加上已经选中的列过滤选项做为条件*/
  	set i_sql=concat(i_sql,' order by ',filtercolumn);
	set @sql=i_sql;
    elseif getrecordcount='true' then /*加载报表记录数*/
	if filtercondition<>'' then set i_sql=concat('select * from (',i_sql,') wx_tbltemp1 ',filtercondition); end if;/*有过滤条件*/
	/*set @tmp=0;*/
	set @sql=concat('select  count(*) from (',i_sql,')  wx_tbltempcount ');
	/*set @sql=concat('select  count(*) from (',i_sql,')  wx_tbltempcount into @tmp');
	prepare stmt from @sqlCount;
	execute stmt;
	set o_systeminfo=cast(@tmp as char(20));
	deallocate prepare stmt;*/
    else /*获取报表数据*/
	if filtercondition<>'' then set i_sql=concat('select * from (',i_sql,') wx_tbltemp1 ',filtercondition); end if;/*有过滤条件*/
	set pagesize=cast(FUN_WABACUS_GETPARAMVALUE('pagesize',i_systeminfo) as signed);/*每页记录数*/
	set statistic_sql=FUN_WABACUS_GETPARAMVALUE('statistic_sql',i_systeminfo);
	if statistic_sql<>'' and pagesize<0 then /*当前是查询对整个报表数据的统计数据*/
	    set i_sql=replace(statistic_sql,'%STATISTIC_SQL%',i_sql);/*将要执行的SQL语句中的业务SQL语句替换成这里真正的查询业务数据的SQL语句*/
	    set @sql=i_sql;
	else
  	    set dynorderby=FUN_WABACUS_GETPARAMVALUE('dynamic_orderby',i_systeminfo); /*动态排序字段*/
  	    if dynorderby<>'' then set i_orderby=dynorderby; end if;
  	    set rowgroupCols=FUN_WABACUS_GETPARAMVALUE('rowgroup_cols',i_systeminfo);
	    if rowgroupCols<>'' then /*当前是行分组或树形分组显示的报表*/
		/*下面将已有的排序字段,号左右空格去除，并在第一个位置和最后一个位置加上,号，以便后面判断，变成,col1 desc,col2,col3 asc,格式，即前后都有一个,号*/
		set i_orderby_tmp='';
		set i_orderby=ltrim(rtrim(i_orderby));
		set idx=instr(i_orderby,',');
		while idx>0 do
		    set i_orderby_tmp=concat(i_orderby_tmp,ltrim(rtrim(substring(i_orderby,1,idx-1))),',');
		    set i_orderby=ltrim(rtrim(substring(i_orderby,idx+1)));
		    set idx=instr(i_orderby,',');
		end while;
		if i_orderby<>'' then set i_orderby_tmp=concat(i_orderby_tmp,i_orderby,','); end if;
		if substring(i_orderby_tmp,1,1)<>',' then set i_orderby_tmp=concat(',',i_orderby_tmp); end if;/*在起始位置加上,号*/
		/*将行分组列放在排序字段的首位*/
		set i_orderby='';
		while rowgroupCols<>'' and rowgroupCols<>',' do
		    set idx=instr(rowgroupCols,',');
		    if idx>0 then
		        set rowgroupColTmp=ltrim(rtrim(substring(rowgroupCols,1,idx-1)));/*得到参与行分组的列，不包括前面的逗号*/
			set rowgroupCols=ltrim(rtrim(substring(rowgroupCols,idx+1)));
		    else /*后面没有逗号了，说明已经是最后一个分组列字段了*/
			set rowgroupColTmp=rowgroupCols;
			set rowgroupCols='';
		    end if;
		    if rowgroupColTmp<>'' then 
			set ordertypeTmp='asc';/*当前分组列的排序顺序*/
			set idx2=instr(lower(i_orderby_tmp),concat(',',lower(rowgroupColTmp),' ')); /*,col1 asc/desc格式*/
			if idx2<=0 then set idx2=instr(lower(i_orderby_tmp),concat(',',lower(rowgroupColTmp),',')); end if;/*,col1,...格式*/
			if idx2>0 then /*在@i_orderby中已经存在这个分组列做为排序字段*/
			    set str1=substring(i_orderby_tmp,1,idx2-1);/*取到此排序字段前面部分，不包括逗号*/
			    set i_orderby_tmp=substring(i_orderby_tmp,idx2+1);
			    set idx2=instr(i_orderby_tmp,',');
			    if idx2>0 then /*在@i_orderby中此排序列后面还有排序列*/
				set str2=substring(i_orderby_tmp,1,idx2-1);
				set i_orderby_tmp=substring(i_orderby_tmp,idx2);/*这里保留了前面的逗号*/
			    else /*已经是最后一个排序列了*/
				set str2=i_orderby_tmp;
				set i_orderby_tmp='';
			    end if;
			    set i_orderby_tmp=concat(str1,i_orderby_tmp);/*在@i_orderby中删掉此分组列，因为要把它提到前面进行排序*/
			    set idx2=instr(str2,' '); /*@str2中存放的是当前排序字段及排序顺序asc/desc*/
			    if idx2>0 then /*在字段后面指定了排序顺序*/
				set ordertypeTmp=ltrim(rtrim(substring(str2,idx2+1)));
				if ordertypeTmp='' then set ordertypeTmp='asc'; end if;
			    end if;
			end if;
			set i_orderby=concat(i_orderby,rowgroupColTmp,' ',ordertypeTmp,',');
		    end if;
		end while;
		if i_orderby_tmp<>'' then /*将@i_orderby中剩下的部分放入@orderbyNew的后面*/
		    if substring(i_orderby_tmp,1,1)=',' then set i_orderby_tmp=substring(i_orderby_tmp,2); end if;
		    set i_orderby=concat(i_orderby,i_orderby_tmp);
		end if;
		if substring(i_orderby,length(i_orderby))=',' then set i_orderby=substring(i_orderby,1,length(i_orderby)-1); end if;/*删除掉最后面的,号*/
	    end if;
	
	    if i_orderby<>'' then set i_sql=concat('select * from (',i_sql,') wx_tbltmp2 order by ',i_orderby); end if;
	    if pagesize>0 then /*本次是获取某页的记录*/
		set startnum=FUN_WABACUS_GETPARAMVALUE('startrownum',i_systeminfo);/*起始记录号*/
		set endnum=FUN_WABACUS_GETPARAMVALUE('endrownum',i_systeminfo);/*结束记录号*/
		set i_sql=concat(i_sql,' limit ',startnum,',',pagesize);
		if statistic_sql<>'' then/*当前是对某页数据进行统计，这里必须考虑排序，因为要精确定位到统计的这一页数据*/
		    set i_sql=replace(statistic_sql,'%STATISTIC_SQL%',i_sql);/*将要执行的SQL语句中的业务SQL语句替换成这里真正的查询业务数据的SQL语句*/
		end if;
  	    end if;
	    set @sql=i_sql;
        end if;
    end if;
   /*insert testable values(@sql);*/
   prepare stmt2 from @sql;
   execute stmt2;
   deallocate prepare stmt2;
END$$


DROP FUNCTION IF EXISTS FUN_WABACUS_GETPARAMVALUE$$

CREATE FUNCTION FUN_WABACUS_GETPARAMVALUE(
    paramname varchar(100),
    sourcestring varchar(3000)
) RETURNS varchar(2000)
BEGIN
    declare val varchar(2000);
    declare idx int;
    set val='';
    if paramname is not null and sourcestring is not null then
        set sourcestring=LTRIM(RTRIM(sourcestring));
        set paramname=LTRIM(RTRIM(paramname));
        if sourcestring<>'' and paramname<>'' then
	    set idx=instr(sourcestring,concat('{[(<',paramname,':'));
	    if idx>0 then 
		set val=substring(sourcestring,idx+length(paramname)+5);
		set idx=instr(val,'>)]}');
		if idx>0 then
		    set val=substring(val,1,idx-1);
		end if;
	    end if;
	end if;
    end if;
    return val;
END$$