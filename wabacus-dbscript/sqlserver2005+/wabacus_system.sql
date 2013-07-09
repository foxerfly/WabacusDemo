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
SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO







CREATE           proc [dbo].[SP_WABACUS_EXECUTE]
(
	@i_sql  varchar(3000),
	@i_orderby  varchar(200),
   @i_systeminfo varchar(3000)
)
as
declare @startnum  int;--起始记录
declare @endnum  int;--终止记录
declare @pagesize int;--页面大小，如果是-1，则不分页显示或不是数据自动列表报表
declare @dynorderby varchar(100);--点击排序的列的字段名
declare @filtercolumn varchar(100);
declare @filtercondition varchar(300);
declare @getrecordcount varchar(10);
declare @rowgroupCols varchar(100);
declare @idx int;

set @filtercondition=dbo.FUN_WABACUS_GETPARAMVALUE('filter_condition',@i_systeminfo);
set @filtercolumn=dbo.FUN_WABACUS_GETPARAMVALUE('filter_column',@i_systeminfo);
set @getrecordcount=dbo.FUN_WABACUS_GETPARAMVALUE('get_recordcount',@i_systeminfo);
if @filtercolumn<>''
begin--获取列过滤选项数据
	set @i_sql='select  distinct '+@filtercolumn+' from ('+@i_sql +') wx_tbltemp';
  	if @filtercondition<>'' set @i_sql=@i_sql+' '+@filtercondition; --如果当前在查询选中的列过滤选项数据
	-- 如果当前是在查询所有列过滤选项数据，则不加上已经选中的列过滤选项做为条件
  	set @i_sql=@i_sql+' order by '+@filtercolumn;
end 
else if @getrecordcount='true' --分页显示报表，且本次要统计记录数
begin
	if @filtercondition<>'' set @i_sql='select * from ('+@i_sql+') wx_tbltemp1 '+@filtercondition; --有过滤条件
	set @i_sql='select  count(*) from ('+@i_sql+')  wx_tbltempcount';
	/*declare @temp varchar(200);
	declare @recordcount int;
	set @sqlCount='select  @temp=count(*) from ('+@i_sql+')  wx_tbltempcount';
 	exec sp_executesql @sqlCount,N'@temp int output',@recordcount output; 
 	set @o_systeminfo=convert(varchar(100),@recordcount);--将记录数返回*/
end
else --获取报表数据
begin
  	if @filtercondition<>'' set @i_sql='select * from ('+@i_sql+') wx_tbltemp1 '+@filtercondition; --有过滤条件
	declare @statistic_sql varchar(3000);
	set @statistic_sql=dbo.FUN_WABACUS_GETPARAMVALUE('statistic_sql',@i_systeminfo);
	set @pagesize=convert(int,dbo.FUN_WABACUS_GETPARAMVALUE('pagesize',@i_systeminfo));--每页记录数
	if @statistic_sql<>'' and @pagesize<=0
	begin --对整个报表数据进行统计
		set @i_sql=replace(@statistic_sql,'%STATISTIC_SQL%',@i_sql);--将要执行的SQL语句中的业务SQL语句替换成这里真正的查询业务数据的SQL语句
	end else
	begin
  		set @dynorderby=dbo.FUN_WABACUS_GETPARAMVALUE('dynamic_orderby',@i_systeminfo);--动态排序字段
  		if @dynorderby<>'' set @i_orderby=@dynorderby;
  		set @rowgroupCols=dbo.FUN_WABACUS_GETPARAMVALUE('rowgroup_cols',@i_systeminfo);
  		if @rowgroupCols<>''
  		begin --当前是行分组或树形分组显示的报表
			--下面将已有的排序字段,号左右空格去除，并在第一个位置和最后一个位置加上,号，以便后面判断，变成,col1 desc,col2,col3 asc,格式，即前后都有一个,号
			declare @i_orderby_tmp varchar(200);
			set @i_orderby_tmp='';
			set @i_orderby=ltrim(rtrim(@i_orderby));
			set @idx=charindex(',',@i_orderby);
			while @idx>0		
			begin
				set @i_orderby_tmp=@i_orderby_tmp+ltrim(rtrim(substring(@i_orderby,1,@idx-1)))+',';
				set @i_orderby=ltrim(rtrim(substring(@i_orderby,@idx+1,datalength(@i_orderby))));
	  			set @idx=charindex(',',@i_orderby);
			end
			if @i_orderby<>'' set @i_orderby_tmp=@i_orderby_tmp+@i_orderby+',';
			if substring(@i_orderby_tmp,1,1)<>',' set @i_orderby_tmp=','+@i_orderby_tmp;--在起始位置加上,号
			--将行分组列放在排序字段的首位
			declare @orderbyNew varchar(200);
			declare @rowgroupColTmp varchar(30);--存放取到的每个分组列字段
			declare @idx2 int;
			declare @ordertypeTmp varchar(10);
			declare @str1 varchar(100);
			declare @str2 varchar(100);
			set @orderbyNew='';
			while @rowgroupCols<>'' and @rowgroupCols<>','
			begin
				set @idx=charindex(',',@rowgroupCols);
				if @idx>0
				begin
					set @rowgroupColTmp=ltrim(rtrim(substring(@rowgroupCols,1,@idx-1)));--得到参与行分组的列，不包括前面的逗号
					set @rowgroupCols=ltrim(rtrim(substring(@rowgroupCols,@idx+1,datalength(@rowgroupCols))));
				end else
				begin --后面没有逗号了，说明已经是最后一个分组列字段了
					set @rowgroupColTmp=@rowgroupCols;
					set @rowgroupCols='';
				end
				if @rowgroupColTmp='' continue;
				set @ordertypeTmp='asc';--当前分组列的排序顺序
				set @idx2=charindex(','+lower(@rowgroupColTmp)+' ',lower(@i_orderby_tmp)); --,col1 asc/desc格式
				if @idx2<=0 set @idx2=charindex(','+lower(@rowgroupColTmp)+',',lower(@i_orderby_tmp)); --,col1,...格式
				if @idx2>0
    			begin --在@i_orderby中已经存在这个分组列做为排序字段
					set @str1=substring(@i_orderby_tmp,1,@idx2-1);--取到此排序字段前面部分，不包括逗号
					set @i_orderby_tmp=substring(@i_orderby_tmp,@idx2+1,datalength(@i_orderby_tmp));
					set @idx2=charindex(',',@i_orderby_tmp);
					if @idx2>0
					begin --在@i_orderby中此排序列后面还有排序列
						set @str2=substring(@i_orderby_tmp,1,@idx2-1);
						set @i_orderby_tmp=substring(@i_orderby_tmp,@idx2,datalength(@i_orderby_tmp));--这里保留了前面的逗号
					end else
					begin --已经是最后一个排序列了
						set @str2=substring(@i_orderby_tmp,1,datalength(@i_orderby_tmp));
						set @i_orderby_tmp='';
					end
					set @i_orderby_tmp=@str1+@i_orderby_tmp;--在@i_orderby中删掉此分组列，因为要把它提到前面进行排序
					set @idx2=charindex(' ',@str2); --@str2中存放的是当前排序字段及排序顺序
					if @idx2>0
					begin --在字段后面指定了排序顺序
						set @ordertypeTmp=ltrim(rtrim(substring(@str2,@idx2+1,datalength(@str2))));
						if @ordertypeTmp='' set @ordertypeTmp='asc';
					end
				end
				set @orderbyNew=@orderbyNew+@rowgroupColTmp+' '+@ordertypeTmp+',';
			end
			if @i_orderby_tmp<>''
			begin --将@i_orderby中剩下的部分放入@orderbyNew的后面
				if substring(@i_orderby_tmp,1,1)=',' set @i_orderby_tmp=substring(@i_orderby_tmp,2,datalength(@i_orderby_tmp));
				set @orderbyNew=@orderbyNew+@i_orderby_tmp;
			end
			if substring(@orderbyNew,datalength(@orderbyNew),datalength(@orderbyNew))=',' set @orderbyNew=substring(@orderbyNew,1,datalength(@orderbyNew)-1); --删除掉最后面的,号
			set @i_orderby=@orderbyNew;
  		end
  		if @pagesize<=0
  		begin --不分页显示的报表
  			if @i_orderby<>'' set @i_sql='select * from ('+@i_sql+') order by '+@i_orderby;
  		end else
  		begin --分页显示的报表
  			set @startnum=convert(int,dbo.FUN_WABACUS_GETPARAMVALUE('startrownum',@i_systeminfo));--起始记录号
			set @endnum=convert(int,dbo.FUN_WABACUS_GETPARAMVALUE('endrownum',@i_systeminfo));--结束记录号
			if @i_orderby='' raiserror ('调用存储过程SP_WABACUS_EXECUTE查询分页数据时必须在第二个参数传入排序字段',16,1);
			set @i_sql='select * from (select   ROW_NUMBER() OVER( order by '+@i_orderby+') AS ROWID,* from ('+@i_sql+') as wx_tbltmp2) AS wx_tblTmp3 WHERE ROWID >'+ CAST(@startnum AS CHAR(10))+' AND ROWID<='+CAST(@endnum AS CHAR(10));
			if @statistic_sql<>''
			begin --对分页报表的当前页数据进行统计
				set @i_sql=replace(@statistic_sql,'%STATISTIC_SQL%',@i_sql);
			end
  		end
	end
end
--print @i_sql;
exec(@i_sql);









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

 
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO





CREATE      function [dbo].[FUN_WABACUS_GETPARAMVALUE]  
(
	@paramname varchar(100),
   @sourcestring varchar(3000)
)
RETURNS varchar(2000)
as
begin
	declare @val varchar(2000);
	declare @idx int;
	if @paramname is null or @sourcestring is null return '';
	set @sourcestring=LTRIM(RTRIM(@sourcestring));
	set @paramname=LTRIM(RTRIM(@paramname));
	if @sourcestring='' or @paramname=''  return '';
	set @idx=charIndex('{[(<'+ @paramname+':',@sourcestring);
	if @idx<=0 return '';
	set @val=substring(@sourcestring,@idx+datalength(@paramname)+5,datalength(@sourcestring));
	set @idx=charindex('>)]}',@val);
	if @idx<=0 return @val;
	return substring(@val,1,@idx-1);
end
 