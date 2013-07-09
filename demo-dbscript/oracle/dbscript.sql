create table tbl_dynamicolumns(
	layer1 varchar2 (50) ,
	layer2 varchar2 (50) ,
	layer3 varchar2 (50) ,
	col_column varchar2 (50) 
);
insert into tbl_dynamicolumns values('[动态]个人资料','[动态]姓名','[动态]中文名','name');
insert into tbl_dynamicolumns values('[动态]个人资料','[动态]姓名','[动态]英文名','ename');
insert into tbl_dynamicolumns values('[动态]个人资料',null,'[动态]性别','sex');
insert into tbl_dynamicolumns values('[动态]个人资料',null,'[动态]年龄','age');
insert into tbl_dynamicolumns values(null,null,'[动态]出生日期','birthday');

create table tbl_area(
	province	varchar2(20),
	city		varchar2(20),
	county		varchar2(20)
);
insert into tbl_area values('江西','宜春','上高');
insert into tbl_area values('江西','宜春','高安');
insert into tbl_area values('江西','宜春','万载');
insert into tbl_area values('江西','宜春','奉新');
insert into tbl_area values('江西','南昌','进贤');
insert into tbl_area values('江西','南昌','新建');
insert into tbl_area values('江西','抚州','东乡');
insert into tbl_area values('江西','抚州','临川');
insert into tbl_area values('广东','深圳','宝安');
insert into tbl_area values('广东','深圳','福田');
insert into tbl_area values('广东','深圳','南山');
insert into tbl_area values('广东','东莞','塘厦');
insert into tbl_area values('广东','东莞','长安');
insert into tbl_area values('福建','泉州','惠安');
insert into tbl_area values('福建','泉州','安溪');
insert into tbl_area values('福建','泉州','南安');
insert into tbl_area values('福建','福州','永泰');
insert into tbl_area values('福建','福州','连江');
commit;


create table tbl_baseinfo(
	uuid		varchar2(50),
	no		varchar2(20),
	name		varchar2(30),
	sex		integer,
	age		integer,
	birthday	date,
	deptno		varchar2(20)
);

insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0001','10001','宋文华',1,25,to_date('1978-01-03','YYYY-MM-DD'),'0001');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0002','10002','周燕',0,38,to_date('1978-12-21','YYYY-MM-DD'),'0001');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0003','10003','周红',0,45,to_date('1968-05-23','YYYY-MM-DD'),'0003');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0004','10004','胡智波',1,35,to_date('1963-08-12','YYYY-MM-DD'),'0001');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0005','10005','胡秀青',1,36,to_date('1965-06-11','YYYY-MM-DD'),'0002');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0006','10006','涂琦英',0,56,to_date('1959-05-03','YYYY-MM-DD'),'0001');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0007','10007','宋节斌',1,45,to_date('1957-11-05','YYYY-MM-DD'),'0002');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0008','10008','周英龙',1,26,to_date('1980-10-09','YYYY-MM-DD'),'0003');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0009','10009','吴树青',1,32,to_date('1983-11-15','YYYY-MM-DD'),'0001');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0010','10010','范新华',1,36,to_date('1983-08-17','YYYY-MM-DD'),'0012');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0011','10011','吴国发',1,26,to_date('1980-07-19','YYYY-MM-DD'),'0001');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0012','10012','吴志枫',1,43,to_date('1978-08-13','YYYY-MM-DD'),'0002');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0013','10013','范坚琴',0,28,to_date('1977-03-03','YYYY-MM-DD'),'0001');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0014','10014','周勇伟',1,36,to_date('1978-07-05','YYYY-MM-DD'),'0005');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0015','10015','周节华',1,46,to_date('1976-05-17','YYYY-MM-DD'),'0009');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0016','10016','范员波',1,35,to_date('1978-07-16','YYYY-MM-DD'),'0009');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0017','10017','胡冬琴',0,56,to_date('1980-06-15','YYYY-MM-DD'),'0005');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0018','10018','王洪枚',0,28,to_date('1980-08-21','YYYY-MM-DD'),'0007');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0019','10019','吴志清',1,37,to_date('1968-07-27','YYYY-MM-DD'),'0004');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0020','10020','吴志国',1,38,to_date('1987-08-29','YYYY-MM-DD'),'0001');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0021','10021','吴清珊',0,28,to_date('1969-06-25','YYYY-MM-DD'),'0009');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0022','10022','王志尖',1,36,to_date('1980-07-26','YYYY-MM-DD'),'0012');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0023','10023','吴良光',1,28,to_date('1986-03-25','YYYY-MM-DD'),'0001');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0024','10024','胡玟乐',1,37,to_date('1976-03-21','YYYY-MM-DD'),'0004');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0025','10025','洪亮亮',1,46,to_date('1978-04-23','YYYY-MM-DD'),'0001');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0026','10026','付瑞明',1,45,to_date('1966-06-12','YYYY-MM-DD'),'0006');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0027','10027','胡志莹',0,29,to_date('1985-07-11','YYYY-MM-DD'),'0010');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0028','10028','高洪波',1,34,to_date('1975-03-10','YYYY-MM-DD'),'0008');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0029','10029','刘铭署',1,38,to_date('1973-07-15','YYYY-MM-DD'),'0006');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0030','10030','胡婷',0,36,to_date('1976-11-03','YYYY-MM-DD'),'0010');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0031','10031','吴建中',1,39,to_date('1988-12-15','YYYY-MM-DD'),'0001');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0032','10032','吴志诚',1,26,to_date('1986-04-19','YYYY-MM-DD'),'0007');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0033','10033','苏伟官',1,28,to_date('1963-10-26','YYYY-MM-DD'),'0007');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0034','10034','吴圆蛾',0,29,to_date('1968-08-27','YYYY-MM-DD'),'0001');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0035','10035','吴芝红',0,23,to_date('1965-01-21','YYYY-MM-DD'),'0002');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0036','10036','万兴国',1,27,to_date('1958-11-20','YYYY-MM-DD'),'0011');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0037','10037','范贵红',0,45,to_date('1980-10-23','YYYY-MM-DD'),'0001');
insert into tbl_baseinfo values('8a9f8189297d71b001297d71b01a0038','10038','宋国珍',0,36,to_date('1982-06-13','YYYY-MM-DD'),'0008');
commit;


create table tbl_department(
	guid			varchar2(50),
	deptno			varchar2(20),	
	deptname		varchar2(30),
	manager			varchar2(30),
	builtdate		date,
	performance		varchar2(20),
	description		clob
);

insert into tbl_department values('3a8f8189297d71b001297d71b01a0001','0001','生产质量部','吴华云',to_date('2001-01-03','YYYY-MM-DD'),'优秀','根据客户要求的产品交货期，安排生产，安排测试，安排包装，按时按质完成产品，对研发产品测试样机生产支持，管理生产车间，5S，精益生产，生产物料、半成品和成品管理，生产质量管理，生产人员管理，操作工技能培训，制定生产各部分的制度和流程，对销售的产品质量进行跟踪和管理，处理客户产品投诉，提出产品质量整改意见，组织和提高产品认证（3C，CCEE，CCIB，CE）、质量认证（ISO9000-ISO90004）、环境认证（ISO14000），制定和完善全面质量管理（TQM）');
insert into tbl_department values('3a8f8189297d71b001297d71b01a0002','0002','物流部','苏伟根',to_date('2001-01-03','YYYY-MM-DD'),'很差','将销售部获得的客户订单录入到ERP系统，并生成相应的加工单，对成品按照客户要求的日期和发货地点完成成品发运，衡量公司对客户及时交货率；按照物流协议向供应商购买物料，催缴物料，对物料进行质量检查，并对供应商来料进行更总和物料FIFO管理，收到发票后组织付款，衡量供应商对公司的及时交货率，以及保税物料和报关实务处理，控制库存，制定物流制度和相应流程');
insert into tbl_department values('3a8f8189297d71b001297d71b01a0003','0003','采购部','胡忠华',to_date('2001-11-13','YYYY-MM-DD'),'良好','前期供应商的搜寻，对供应商的认证和考核，谈判物料价格，制定物流采购协议，对供应商的产品和送货进行质量更总，非生产性物料的采购，制定所有采购材料的流程和制度，对工业项目采购的支持');
insert into tbl_department values('3a8f8189297d71b001297d71b01a0004','0004','财务部','胡新立',to_date('2003-06-09','YYYY-MM-DD'),'良好','对公司的经营状况进行分析，提供决策财务数据支持，各种凭证录入系统，对供应商开具的发票付款，开发票给客户，并进行应收款的工作，对各种凭证汇总产生总账，出具财务报表（资产负债表，损益表，现金流量表），管理公司存款和现金，管理支票、汇票、发票、收据，报销，管理公司固定资产');
insert into tbl_department values('3a8f8189297d71b001297d71b01a0005','0005','研发技术部','潘林淘',to_date('2003-12-03','YYYY-MM-DD'),'良好','负责对现有产品升级更新，性能优化，产品改进，新产品研发，产品生产技术支持，管理研发设备和研发实验室');
insert into tbl_department values('3a8f8189297d71b001297d71b01a0006','0006','人事行政部','胡新华',to_date('2003-12-09','YYYY-MM-DD'),'优秀','发展公司企业文化，制定公司人事制度，管理员工入职离职，劳动合同管理，员工信息管理，制定员工福利和奖惩制度，制定公司培训政策和制度，安排出差人员的食宿，管理公司班车，管理公司食堂，管理公司办公设备');
insert into tbl_department values('3a8f8189297d71b001297d71b01a0007','0007','信息管理部','苏小琴',to_date('2004-03-12','YYYY-MM-DD'),'优秀','管理公司的信息设备，保证设备和信息的安全，提供稳定，安全，高效的应用服务，配合公司战略规划，制定信息管理发展计划，带领和支持业务部门，提供优质的产品和服务');
insert into tbl_department values('3a8f8189297d71b001297d71b01a0008','0008','销售市场部','潘云鹏',to_date('2004-03-12','YYYY-MM-DD'),'较好','为公司产品策划营销活动，树立公司品牌影响力，扩大产品市场占有额，管理分销商、代理商网络，制定公司年度销售计划，对销售活动进行监督和管理，考核销售业绩，为客户提供优质产品和服务');
insert into tbl_department values('3a8f8189297d71b001297d71b01a0009','0009','售后服务部','潘云飞',to_date('2004-03-12','YYYY-MM-DD'),'较好','提供产品客户服务，产品安装，产品调试，产品维修，产品配件管理，产品售后服务管理，提供优质的产品售后服务');
insert into tbl_department values('3a8f8189297d71b001297d71b01a00010','0010','工业工程部','吴金升',to_date('2005-01-06','YYYY-MM-DD'),'较好','规划生产线，提供精益生产方法和流程，制定产品生产工艺工序，产品生产操作手册，生产车间布局管理，优化生产工艺工序，提供工作效率，规划安全生产环境，产品技术变更管理，零部件版本升级管理，工程变更管理，将新研发的产品工业化，新产品生产线规划，操作工WI培训');
insert into tbl_department values('3a8f8189297d71b001297d71b01a00011','0011','设备维修部','吴平红',to_date('2005-01-06','YYYY-MM-DD'),'良好','负责公司所有故障设备的维修与更新');
insert into tbl_department values('3a8f8189297d71b001297d71b01a00012','0012','保卫处','胡建国',to_date('2005-01-08','YYYY-MM-DD'),'优秀','维护公司及员工安全，保障公司财产不受破坏');
commit;

create table tbl_dept_pingjia(
	guid			varchar2(50),
	pingjia			varchar2(30)
);

insert into tbl_dept_pingjia values('3a8f8189297d71b001297d71b01a0001','很好');
insert into tbl_dept_pingjia values('3a8f8189297d71b001297d71b01a0002','很差');
insert into tbl_dept_pingjia values('3a8f8189297d71b001297d71b01a0003','较好');
insert into tbl_dept_pingjia values('3a8f8189297d71b001297d71b01a0004','较差');
insert into tbl_dept_pingjia values('3a8f8189297d71b001297d71b01a0005','很好');
insert into tbl_dept_pingjia values('3a8f8189297d71b001297d71b01a0006','较好');
insert into tbl_dept_pingjia values('3a8f8189297d71b001297d71b01a0007','较好');
insert into tbl_dept_pingjia values('3a8f8189297d71b001297d71b01a0008','很好');
insert into tbl_dept_pingjia values('3a8f8189297d71b001297d71b01a0009','较好');
insert into tbl_dept_pingjia values('3a8f8189297d71b001297d71b01a00010','较好');
insert into tbl_dept_pingjia values('3a8f8189297d71b001297d71b01a00011','很差');
insert into tbl_dept_pingjia values('3a8f8189297d71b001297d71b01a00012','很好');
commit;


create table tbl_detailinfo(
	no		varchar2(20),
	ename		varchar2(30),
	salary		float,
	joinindate	date,
	province	varchar2(30),
	city		varchar2(30),
	county		varchar2(30),
	marriage	integer,
	interest	varchar2(100),--兴趣爱好
	photo		varchar2(100),--照片
	description	clob,
	jl		varchar2(100),
	orderline	int
);

insert into tbl_detailinfo values('10001','songwenhua',1320.2,to_date('2008-11-03','YYYY-MM-DD'),'江西','南昌','进贤',1,'健身,篮球','/WabacusDemo/wabacusdemo/uploadfile/2_chiay.jpg','努力勤奋，上进好学','',101538111);
insert into tbl_detailinfo values('10002','zhouyuan',2345.32,to_date('2003-02-21','YYYY-MM-DD'),'广东','深圳','宝安',0,'排球,旅游,跑步','/WabacusDemo/wabacusdemo/uploadfile/2_claudxyz.jpg','好吃懒做，游手好闲，好逸恶劳','',111538112);
insert into tbl_detailinfo values('10003','zhouhong',4323.23,to_date('2005-03-23','YYYY-MM-DD'),'福建','泉州','惠安',0,'足球,爬山,游泳','/WabacusDemo/wabacusdemo/uploadfile/2_cuidenghong123.jpg','勤偷节约，积极上进','',121538113);
insert into tbl_detailinfo values('10004','huzhibo',6352,to_date('2006-08-22','YYYY-MM-DD'),'江西','宜春','高安',1,'排球,旅游','/WabacusDemo/wabacusdemo/uploadfile/2_cxz003.jpg','努力勤奋，上进好学','',131538114);
insert into tbl_detailinfo values('10005','huxiuqing',4367.2,to_date('2005-06-01','YYYY-MM-DD'),'福建','泉州','安溪',0,'足球,旅游,跑步,健身','/WabacusDemo/wabacusdemo/uploadfile/2_e_mi_tuo_fo.jpg','勤偷节约，积极上进','',141538115);
insert into tbl_detailinfo values('10006','tuqiying',5355.2,to_date('2006-05-23','YYYY-MM-DD'),'广东','东莞','塘厦',0,'跑步,健身','/WabacusDemo/wabacusdemo/uploadfile/2_emon123.jpg','努力勤奋，上进好学','',151538116);
insert into tbl_detailinfo values('10007','songjiebin',7434.34,to_date('2002-11-03','YYYY-MM-DD'),'江西','南昌','进贤',0,'跑步,健身,篮球','/WabacusDemo/wabacusdemo/uploadfile/2_fanyuanwaifdl.jpg','勤偷节约，积极上进','',161538117);
insert into tbl_detailinfo values('10008','zhouyinglong',7436.5,to_date('2000-10-19','YYYY-MM-DD'),'福建','泉州','惠安',0,'游泳,排球,旅游,','/WabacusDemo/wabacusdemo/uploadfile/2_fellowcheng.jpg','努力勤奋，上进好学','',171538118);
insert into tbl_detailinfo values('10009','wushuqing',3455.3,to_date('2009-11-15','YYYY-MM-DD'),'江西','抚州','临川',1,'篮球','/WabacusDemo/wabacusdemo/uploadfile/2_gaohenggaoheng.jpg','努力勤奋，上进好学','',181538119);
insert into tbl_detailinfo values('10010','fanxinhua',3466.3,to_date('2007-08-20','YYYY-MM-DD'),'江西','南昌','进贤',0,'游泳,排球','/WabacusDemo/wabacusdemo/uploadfile/2_haiyong_sea.jpg','努力勤奋，上进好学','',191538120);
insert into tbl_detailinfo values('10011','woguofa',3677.4,to_date('2000-07-29','YYYY-MM-DD'),'江西','抚州','临川',0,'跑步,健身,篮球','/WabacusDemo/wabacusdemo/uploadfile/2_huahua320.jpg','努力勤奋，上进好学','',201538121);
insert into tbl_detailinfo values('10012','wuzhifeng',7637.3,to_date('2002-08-23','YYYY-MM-DD'),'广东','深圳','福田',0,'游泳,排球,旅游','/WabacusDemo/wabacusdemo/uploadfile/2_huiyaxiong.jpg','勤偷节约，积极上进','',211538122);
insert into tbl_detailinfo values('10013','fanjianqin',6346.3,to_date('2006-03-23','YYYY-MM-DD'),'江西','宜春','高安',0,'爬山,排球','/WabacusDemo/wabacusdemo/uploadfile/2_hyblusea.jpg','好吃懒做，游手好闲，好逸恶劳','',221538123);
insert into tbl_detailinfo values('10014','zhouyongwei',7598,to_date('2004-07-15','YYYY-MM-DD'),'福建','泉州','惠安',0,'足球,跑步,健身','/WabacusDemo/wabacusdemo/uploadfile/2_ivfangwang_long.jpg','好吃懒做，游手好闲，好逸恶劳','',231538124);
insert into tbl_detailinfo values('10015','zhoujiehua',9346.3,to_date('2000-05-07','YYYY-MM-DD'),'广东','深圳','宝安',1,'旅游,跑步,健身','/WabacusDemo/wabacusdemo/uploadfile/2_jaffy.jpg','勤偷节约，积极上进','',241538125);
insert into tbl_detailinfo values('10016','fanyuanbo',7463.3,to_date('2003-07-06','YYYY-MM-DD'),'江西','抚州','临川',0,'跑步,健身,篮球','/WabacusDemo/wabacusdemo/uploadfile/2_javaalpha.jpg','勤偷节约，积极上进','',51538126);
insert into tbl_detailinfo values('10017','hudongqin',8998.2,to_date('2008-06-05','YYYY-MM-DD'),'江西','宜春','上高',0,'足球,爬山,篮球','/WabacusDemo/wabacusdemo/uploadfile/2_jennyvenus.jpg','好吃懒做，游手好闲，好逸恶劳','',281538127);
insert into tbl_detailinfo values('10018','zhouhong',7654.7,to_date('2007-08-11','YYYY-MM-DD'),'福建','福州','永泰',0,'足球,爬山,排球','/WabacusDemo/wabacusdemo/uploadfile/2_jjkodada.jpg','勤偷节约，积极上进','',271538128);
insert into tbl_detailinfo values('10019','wuzhiqing',6745.3,to_date('2006-07-17','YYYY-MM-DD'),'广东','深圳','南山',1,'健身,篮球','/WabacusDemo/wabacusdemo/uploadfile/2_kaiyekai.jpg','努力勤奋，上进好学','',281538129);
insert into tbl_detailinfo values('10020','wuzhiguo',7655.4,to_date('2005-08-20','YYYY-MM-DD'),'广东','深圳','福田',0,'足球,爬山','/WabacusDemo/wabacusdemo/uploadfile/2_kakajay008.jpg','勤偷节约，积极上进','',291538130);
insert into tbl_detailinfo values('10021','wuqingshan',10080.3,to_date('2005-06-15','YYYY-MM-DD'),'福建','福州','连江',0,'旅游,跑步','/WabacusDemo/wabacusdemo/uploadfile/2_lbh119.jpg','勤偷节约，积极上进','',301538131);
insert into tbl_detailinfo values('10022','wangzhijian',2980.9,to_date('2006-07-20','YYYY-MM-DD'),'江西','宜春','高安',1,'健身,篮球','/WabacusDemo/wabacusdemo/uploadfile/2_liufang12381.jpg','好吃懒做，游手好闲，好逸恶劳','',311538132);
insert into tbl_detailinfo values('10023','wuliangguang',3800,to_date('2007-03-20','YYYY-MM-DD'),'广东','深圳','福田',0,'足球,篮球','/WabacusDemo/wabacusdemo/uploadfile/2_liuxk99.jpg','勤偷节约，积极上进','',321538134);
insert into tbl_detailinfo values('10024','huwenle',9890.3,to_date('2006-03-23','YYYY-MM-DD'),'广东','深圳','福田',1,'足球,爬山,游泳,排球','/WabacusDemo/wabacusdemo/uploadfile/2_luojianfeng.jpg','勤偷节约，积极上进','',331538135);
insert into tbl_detailinfo values('10025','hongliangliang',6551,to_date('2008-04-21','YYYY-MM-DD'),'福建','泉州','惠安',1,'排球,健身,篮球','/WabacusDemo/wabacusdemo/uploadfile/2_luxiaoshuai.jpg','好吃懒做，游手好闲，好逸恶劳','',341538136);
insert into tbl_detailinfo values('10026','fuluiming',3455.3,to_date('2003-06-22','YYYY-MM-DD'),'福建','福州','连江',1,'跑步,健身,篮球','/WabacusDemo/wabacusdemo/uploadfile/2_lzj_freedom.jpg','勤偷节约，积极上进','',351538137);
insert into tbl_detailinfo values('10027','huzhiying',5764.3,to_date('2009-07-12','YYYY-MM-DD'),'江西','宜春','上高',0,'旅游,跑步,健身,篮球','/WabacusDemo/wabacusdemo/uploadfile/2_minvt.jpg','好吃懒做，游手好闲，好逸恶劳','',361538138);
insert into tbl_detailinfo values('10028','gaohongbo',9832.3,to_date('2007-03-13','YYYY-MM-DD'),'福建','福州','连江',0,'排球,旅游,跑步','/WabacusDemo/wabacusdemo/uploadfile/2_pepeet.jpg','勤偷节约，积极上进','',371538139);
insert into tbl_detailinfo values('10029','liumingshu',4645,to_date('2006-07-16','YYYY-MM-DD'),'江西','南昌','新建',0,'跑步,健身,篮球','/WabacusDemo/wabacusdemo/uploadfile/2_pxh360395296.jpg','勤偷节约，积极上进','',381538140);
insert into tbl_detailinfo values('10030','huting',5789,to_date('2004-11-02','YYYY-MM-DD'),'广东','深圳','南山',0,'爬山,游泳,健身,篮球','/WabacusDemo/wabacusdemo/uploadfile/2_pzy0428.jpg','好吃懒做，游手好闲，好逸恶劳','',391538141);
insert into tbl_detailinfo values('10031','wujianzhong',3456,to_date('2007-12-25','YYYY-MM-DD'),'福建','福州','永泰',0,'足球,爬山,游泳','/WabacusDemo/wabacusdemo/uploadfile/2_q107770540.jpg','勤偷节约，积极上进','',401538142);
insert into tbl_detailinfo values('10032','wuzhicheng',9253,to_date('2003-04-10','YYYY-MM-DD'),'江西','南昌','进贤',1,'足球,爬山,篮球','/WabacusDemo/wabacusdemo/uploadfile/2_qiubojuncode.jpg','勤偷节约，积极上进','',411538143);
insert into tbl_detailinfo values('10033','shuweiguan',8992.5,to_date('2000-10-16','YYYY-MM-DD'),'广东','东莞','塘厦',0,'健身,篮球','/WabacusDemo/wabacusdemo/uploadfile/2_shineboyadh.jpg','努力勤奋，上进好学','',421538144);
insert into tbl_detailinfo values('10034','wuyuane',7687,to_date('2002-08-23','YYYY-MM-DD'),'福建','福州','永泰',1,'足球,爬山,篮球','/WabacusDemo/wabacusdemo/uploadfile/2_songpengasp.jpg','好吃懒做，游手好闲，好逸恶劳','',431538145);
insert into tbl_detailinfo values('10035','wuzhihong',2336,to_date('2006-01-22','YYYY-MM-DD'),'江西','宜春','高安',0,'排球,旅游,跑步','/WabacusDemo/wabacusdemo/uploadfile/2_steptodream.jpg','勤偷节约，积极上进','',441538146);
insert into tbl_detailinfo values('10036','wanxingguo',8566.3,to_date('2005-11-23','YYYY-MM-DD'),'福建','泉州','安溪',0,'游泳,排球','/WabacusDemo/wabacusdemo/uploadfile/2_stonekind.jpg','勤偷节约，积极上进','',451538147);
insert into tbl_detailinfo values('10037','fanguihong',3246,to_date('2001-10-25','YYYY-MM-DD'),'江西','南昌','新建',1,'跑步,健身,篮球','/WabacusDemo/wabacusdemo/uploadfile/2_tashiwoweiyi.jpg','好吃懒做，游手好闲，好逸恶劳','',461538148);
insert into tbl_detailinfo values('10038','songguozhen',9675,to_date('2003-06-18','YYYY-MM-DD'),'广东','东莞','长安',1,'足球,爬山,篮球','/WabacusDemo/wabacusdemo/uploadfile/2_teng_s2000.jpg','努力勤奋，上进好学','',471538149);
commit;


create table tbl_zhaoping(
	id		integer not null,
	zhiwei		varchar2(30),
	salary		float,
	count		integer,
	xueli		varchar2(30)
);
insert into tbl_zhaoping values(1,'网络工程师',5030,1,'本科以上');
insert into tbl_zhaoping values(2,'软件工程师',6800,3,'本科以上');
insert into tbl_zhaoping values(3,'高级会计师',8000,1,'硕士以上');
insert into tbl_zhaoping values(4,'计算机运行维护工程师',4500,2,'专科以上');
insert into tbl_zhaoping values(5,'策划经理',8200,1,'本科以上');
insert into tbl_zhaoping values(6,'质量管理工程师',5500,5,'本科以上');
insert into tbl_zhaoping values(7,'普工',1200,20,'无');
insert into tbl_zhaoping values(8,'厨师',3000,2,'无');
insert into tbl_zhaoping values(9,'项目经理',8500,2,'本科以上');

create sequence seq_zhaoping
	start with 10
	minvalue  1
	maxvalue  999999
	increment by 1
	nocache;
commit;


create table tbl_zhaopingdesc(
	id		integer,
	yaoqiu		varchar2(3000),
	description	varchar2(3000)
);
insert into tbl_zhaopingdesc values(1,'两年以上相关工作经验，工作刻苦，能承受工作压力，能出差','负责公司网络架构与维护以及网络相关产品的采购');
insert into tbl_zhaopingdesc values(2,'三年以上相关工作经验，学习能力强，能承受工作压力，能出差','负责公司所用软件的开发与维护，并培训公司员工使用');
insert into tbl_zhaopingdesc values(3,'五年以上相关工作经验，思维活跃，认真负责','负责公司做帐');
insert into tbl_zhaopingdesc values(4,'工作刻苦，能承受工作压力，能出差','负责公司所用电脑进行安装与维护');
insert into tbl_zhaopingdesc values(5,'三年以上相关工作经验，思维活跃，认真负责，责任心强，亲和力强','负责公司新产品的策划以及公司其它活动的组织和策划');
insert into tbl_zhaopingdesc values(6,'，认真负责，工作刻苦，能承受工作压力，能出差','负责公司产品的测试');
insert into tbl_zhaopingdesc values(7,'工作刻苦，积极肯干，能承受工作压力，服从安排','负责公司产品的生产');
insert into tbl_zhaopingdesc values(8,'三年以上相关工作经验，工作刻苦，讲卫生','负责公司食堂炒菜煮饭');
insert into tbl_zhaopingdesc values(9,'三年以上相关工作经验，表达能力强，亲和力强','负责领导公司产品小组的开发与测试');


create table tbl_zhaoping2(
	id		integer  NOT NULL,
	zhiwei		varchar(30),
	salary		float,
	count		integer,
	xueli		varchar(30)
);
insert into tbl_zhaoping2 values(1,'网络工程师2',5030,1,'本科以上');
insert into tbl_zhaoping2 values(2,'软件工程师2',6800,3,'本科以上');
insert into tbl_zhaoping2 values(3,'高级会计师2',8000,1,'硕士以上');
insert into tbl_zhaoping2 values(4,'计算机运行维护工程师2',4500,2,'专科以上');
insert into tbl_zhaoping2 values(5,'策划经理2',8200,1,'本科以上');
insert into tbl_zhaoping2 values(6,'质量管理工程师2',5500,5,'本科以上');
insert into tbl_zhaoping2 values(7,'普工2',1200,20,'无');
insert into tbl_zhaoping2 values(8,'厨师2',3000,2,'无');
insert into tbl_zhaoping2 values(9,'项目经理2',8500,2,'本科以上');


create table tbl_zhaopingdesc2(
	id		integer  NOT NULL,
	yaoqiu		varchar(3000),
	description	varchar(3000)
);
insert into tbl_zhaopingdesc2 values(1,'两年以上相关工作经验，工作刻苦，能承受工作压力，能出差','负责公司网络架构与维护以及网络相关产品的采购');
insert into tbl_zhaopingdesc2 values(2,'三年以上相关工作经验，学习能力强，能承受工作压力，能出差','负责公司所用软件的开发与维护，并培训公司员工使用');
insert into tbl_zhaopingdesc2 values(3,'五年以上相关工作经验，思维活跃，认真负责','负责公司做帐');
insert into tbl_zhaopingdesc2 values(4,'工作刻苦，能承受工作压力，能出差','负责公司所用电脑进行安装与维护');
insert into tbl_zhaopingdesc2 values(5,'三年以上相关工作经验，思维活跃，认真负责，责任心强，亲和力强','负责公司新产品的策划以及公司其它活动的组织和策划');
insert into tbl_zhaopingdesc2 values(6,'，认真负责，工作刻苦，能承受工作压力，能出差','负责公司产品的测试');
insert into tbl_zhaopingdesc2 values(7,'工作刻苦，积极肯干，能承受工作压力，服从安排','负责公司产品的生产');
insert into tbl_zhaopingdesc2 values(8,'三年以上相关工作经验，工作刻苦，讲卫生','负责公司食堂炒菜煮饭');
insert into tbl_zhaopingdesc2 values(9,'三年以上相关工作经验，表达能力强，亲和力强','负责领导公司产品小组的开发与测试');

CREATE TABLE tbl_salary (
	no varchar2(50),
	year integer null,
	month integer null,
	salary float NULL 
);

insert into tbl_salary values('10001',2008,1,3543.3);
insert into tbl_salary values('10001',2008,2,3643.3);
insert into tbl_salary values('10001',2008,3,3573.2);
insert into tbl_salary values('10001',2008,4,4543.3);
insert into tbl_salary values('10001',2008,5,3943.8);
insert into tbl_salary values('10001',2008,6,3547.3);
insert into tbl_salary values('10001',2008,7,3549.3);
insert into tbl_salary values('10001',2008,8,3543.0);
insert into tbl_salary values('10001',2008,9,3544.3);
insert into tbl_salary values('10001',2008,10,3343.6);
insert into tbl_salary values('10001',2008,11,3143.4);
insert into tbl_salary values('10001',2008,12,3943.3);

insert into tbl_salary values('10002',2008,1,6343.3);
insert into tbl_salary values('10002',2008,2,6743.3);
insert into tbl_salary values('10002',2008,3,6843.3);
insert into tbl_salary values('10002',2008,4,6543.45);
insert into tbl_salary values('10002',2008,5,6342.0);
insert into tbl_salary values('10002',2008,6,6443.3);
insert into tbl_salary values('10002',2008,7,6541.3);
insert into tbl_salary values('10002',2008,8,6643.5);
insert into tbl_salary values('10002',2008,9,6844.3);
insert into tbl_salary values('10002',2008,10,7573.3);
insert into tbl_salary values('10002',2008,11,4593.7);
insert into tbl_salary values('10002',2008,12,6545.13);

insert into tbl_salary values('10003',2008,1,5463.13);
insert into tbl_salary values('10003',2008,2,5142.2);
insert into tbl_salary values('10003',2008,3,5343.3);
insert into tbl_salary values('10003',2008,4,5543.7);
insert into tbl_salary values('10003',2008,5,5596.3);
insert into tbl_salary values('10003',2008,6,5543.3);
insert into tbl_salary values('10003',2008,7,5643.3);
insert into tbl_salary values('10003',2008,8,5579.9);
insert into tbl_salary values('10003',2008,9,5543.3);
insert into tbl_salary values('10003',2008,10,5540.3);
insert into tbl_salary values('10003',2008,11,5583.3);
insert into tbl_salary values('10003',2008,12,5841.0);

insert into tbl_salary values('10004',2008,1,1583.6);
insert into tbl_salary values('10004',2008,2,1842.3);
insert into tbl_salary values('10004',2008,3,1563.8);
insert into tbl_salary values('10004',2008,4,1443.3);
insert into tbl_salary values('10004',2008,5,1508.3);
insert into tbl_salary values('10004',2008,6,1543.3);
insert into tbl_salary values('10004',2008,7,1643.9);
insert into tbl_salary values('10004',2008,8,1239.3);
insert into tbl_salary values('10004',2008,9,1743.3);
insert into tbl_salary values('10004',2008,10,1553.3);
insert into tbl_salary values('10004',2008,11,1943.5);
insert into tbl_salary values('10004',2008,12,1812.3);

insert into tbl_salary values('10005',2008,1,3542.2);
insert into tbl_salary values('10005',2008,2,3713.3);
insert into tbl_salary values('10005',2008,3,3541.5);
insert into tbl_salary values('10005',2008,4,3843.3);
insert into tbl_salary values('10005',2008,5,3513.3);
insert into tbl_salary values('10005',2008,6,3040.7);
insert into tbl_salary values('10005',2008,7,3543.3);
insert into tbl_salary values('10005',2008,8,3523.2);
insert into tbl_salary values('10005',2008,9,3243.3);
insert into tbl_salary values('10005',2008,10,3527.3);
insert into tbl_salary values('10005',2008,11,3143.2);
insert into tbl_salary values('10005',2008,12,3549.3);

insert into tbl_salary values('10006',2008,1,7543.3);
insert into tbl_salary values('10006',2008,2,7570.2);
insert into tbl_salary values('10006',2008,3,7543.3);
insert into tbl_salary values('10006',2008,4,7518.6);
insert into tbl_salary values('10006',2008,5,7543.3);
insert into tbl_salary values('10006',2008,6,7543.2);
insert into tbl_salary values('10006',2008,7,7593.3);
insert into tbl_salary values('10006',2008,8,7543.3);
insert into tbl_salary values('10006',2008,9,7549.3);
insert into tbl_salary values('10006',2008,10,7563.6);
insert into tbl_salary values('10006',2008,11,7540.3);
insert into tbl_salary values('10006',2008,12,7510.1);

insert into tbl_salary values('10007',2008,1,6519.1);
insert into tbl_salary values('10007',2008,2,6343.3);
insert into tbl_salary values('10007',2008,3,6547.5);
insert into tbl_salary values('10007',2008,4,6753.3);
insert into tbl_salary values('10007',2008,5,6743.3);
insert into tbl_salary values('10007',2008,6,6541.7);
insert into tbl_salary values('10007',2008,7,6993.3);
insert into tbl_salary values('10007',2008,8,6507.3);
insert into tbl_salary values('10007',2008,9,6043.8);
insert into tbl_salary values('10007',2008,10,6943.3);
insert into tbl_salary values('10007',2008,11,6903.8);
insert into tbl_salary values('10007',2008,12,6213.5);


insert into tbl_salary values('10008',2008,1,3569.23);
insert into tbl_salary values('10008',2008,2,3643.3);
insert into tbl_salary values('10008',2008,3,3529.8);
insert into tbl_salary values('10008',2008,4,3523.3);
insert into tbl_salary values('10008',2008,5,3923.8);
insert into tbl_salary values('10008',2008,6,3544.3);
insert into tbl_salary values('10008',2008,7,3543.7);
insert into tbl_salary values('10008',2008,8,3013.3);
insert into tbl_salary values('10008',2008,9,3519.9);
insert into tbl_salary values('10008',2008,10,3313.0);
insert into tbl_salary values('10008',2008,11,3153.0);
insert into tbl_salary values('10008',2008,12,3189.8);

insert into tbl_salary values('10009',2008,1,2829.2);
insert into tbl_salary values('10009',2008,2,2543.3);
insert into tbl_salary values('10009',2008,3,2610.3);
insert into tbl_salary values('10009',2008,4,2542.5);
insert into tbl_salary values('10009',2008,5,2433.3);
insert into tbl_salary values('10009',2008,6,2543.3);
insert into tbl_salary values('10009',2008,7,2538.3);
insert into tbl_salary values('10009',2008,8,2835.6);
insert into tbl_salary values('10009',2008,9,2518.3);
insert into tbl_salary values('10009',2008,10,2557.36);
insert into tbl_salary values('10009',2008,11,2913.3);
insert into tbl_salary values('10009',2008,12,2915.35);

insert into tbl_salary values('10010',2008,1,10546.2);
insert into tbl_salary values('10010',2008,2,10513.3);
insert into tbl_salary values('10010',2008,3,10240.3);
insert into tbl_salary values('10010',2008,4,10543.4);
insert into tbl_salary values('10010',2008,5,10243.3);
insert into tbl_salary values('10010',2008,6,10592.3);
insert into tbl_salary values('10010',2008,7,10640.2);
insert into tbl_salary values('10010',2008,8,10540.3);
insert into tbl_salary values('10010',2008,9,10833.3);
insert into tbl_salary values('10010',2008,10,10543.3);
insert into tbl_salary values('10010',2008,11,10040.3);
insert into tbl_salary values('10010',2008,12,10801.6);

insert into tbl_salary values('10011',2008,1,2830.0);
insert into tbl_salary values('10011',2008,2,2543.3);
insert into tbl_salary values('10011',2008,3,2122.5);
insert into tbl_salary values('10011',2008,4,2543.3);
insert into tbl_salary values('10011',2008,5,1912.6);
insert into tbl_salary values('10011',2008,6,2143.3);
insert into tbl_salary values('10011',2008,7,2508.8);
insert into tbl_salary values('10011',2008,8,2943.3);
insert into tbl_salary values('10011',2008,9,2505.8);
insert into tbl_salary values('10011',2008,10,2703.7);
insert into tbl_salary values('10011',2008,11,2216.6);
insert into tbl_salary values('10011',2008,12,2731.5);

insert into tbl_salary values('10012',2008,1,12768.6);
insert into tbl_salary values('10012',2008,2,12643.2);
insert into tbl_salary values('10012',2008,3,12471.3);
insert into tbl_salary values('10012',2008,4,12143.0);
insert into tbl_salary values('10012',2008,5,12222.3);
insert into tbl_salary values('10012',2008,6,12243.0);
insert into tbl_salary values('10012',2008,7,12312.3);
insert into tbl_salary values('10012',2008,8,12043.0);
insert into tbl_salary values('10012',2008,9,12843.3);
insert into tbl_salary values('10012',2008,10,12510.2);
insert into tbl_salary values('10012',2008,11,12643.1);
insert into tbl_salary values('10012',2008,12,12560.8);

insert into tbl_salary values('10001',2009,1,5546.3);
insert into tbl_salary values('10001',2009,2,5523.3);
insert into tbl_salary values('10001',2009,3,5543.3);
insert into tbl_salary values('10001',2009,4,5518.1);
insert into tbl_salary values('10001',2009,5,5643.1);
insert into tbl_salary values('10001',2009,6,5543.3);
insert into tbl_salary values('10001',2009,7,5943.2);
insert into tbl_salary values('10001',2009,8,5549.3);
insert into tbl_salary values('10001',2009,9,5443.3);
insert into tbl_salary values('10001',2009,10,5523.8);
insert into tbl_salary values('10001',2009,11,6543.3);
insert into tbl_salary values('10001',2009,12,5518.9);
                                          
insert into tbl_salary values('10002',2009,1,8233.3);
insert into tbl_salary values('10002',2009,2,8343.13);
insert into tbl_salary values('10002',2009,3,8633.23);
insert into tbl_salary values('10002',2009,4,8723.3);
insert into tbl_salary values('10002',2009,5,8413.34);
insert into tbl_salary values('10002',2009,6,8533.62);
insert into tbl_salary values('10002',2009,7,8353.3);
insert into tbl_salary values('10002',2009,8,8283.3);
insert into tbl_salary values('10002',2009,9,8143.3);
insert into tbl_salary values('10002',2009,10,8673.8);
insert into tbl_salary values('10002',2009,11,8723.9);
insert into tbl_salary values('10002',2009,12,8833.31);
                                          
insert into tbl_salary values('10003',2009,1,6703.3);
insert into tbl_salary values('10003',2009,2,6542.5);
insert into tbl_salary values('10003',2009,3,6593.3);
insert into tbl_salary values('10003',2009,4,6843.3);
insert into tbl_salary values('10003',2009,5,6541.13);
insert into tbl_salary values('10003',2009,6,6543.3);
insert into tbl_salary values('10003',2009,7,6533.0);
insert into tbl_salary values('10003',2009,8,6571.3);
insert into tbl_salary values('10003',2009,9,6243.3);
insert into tbl_salary values('10003',2009,10,6241.8);
insert into tbl_salary values('10003',2009,11,6573.3);
insert into tbl_salary values('10003',2009,12,6241.9);
                                          
insert into tbl_salary values('10004',2009,1,2591.2);
insert into tbl_salary values('10004',2009,2,2643.3);
insert into tbl_salary values('10004',2009,3,2986.2);
insert into tbl_salary values('10004',2009,4,2543.3);
insert into tbl_salary values('10004',2009,5,2848.3);
insert into tbl_salary values('10004',2009,6,2543.7);
insert into tbl_salary values('10004',2009,7,26473.3);
insert into tbl_salary values('10004',2009,8,2549.3);
insert into tbl_salary values('10004',2009,9,2353.2);
insert into tbl_salary values('10004',2009,10,2543.3);
insert into tbl_salary values('10004',2009,11,2213.3);
insert into tbl_salary values('10004',2009,12,2142.1);
                                         
insert into tbl_salary values('10005',2009,1,3811.2);
insert into tbl_salary values('10005',2009,2,3841.3);
insert into tbl_salary values('10005',2009,3,3842.3);
insert into tbl_salary values('10005',2009,4,3553.3);
insert into tbl_salary values('10005',2009,5,3847.3);
insert into tbl_salary values('10005',2009,6,3543.7);
insert into tbl_salary values('10005',2009,7,3542.3);
insert into tbl_salary values('10005',2009,8,3863.3);
insert into tbl_salary values('10005',2009,9,3541.2);
insert into tbl_salary values('10005',2009,10,3543.3);
insert into tbl_salary values('10005',2009,11,3743.3);
insert into tbl_salary values('10005',2009,12,3961.1);
                                          
insert into tbl_salary values('10006',2009,1,7805.2);
insert into tbl_salary values('10006',2009,2,7803.3);
insert into tbl_salary values('10006',2009,3,7873.3);
insert into tbl_salary values('10006',2009,4,7883.8);
insert into tbl_salary values('10006',2009,5,7865.3);
insert into tbl_salary values('10006',2009,6,7843.3);
insert into tbl_salary values('10006',2009,7,782.4);
insert into tbl_salary values('10006',2009,8,7841.3);
insert into tbl_salary values('10006',2009,9,7843.1);
insert into tbl_salary values('10006',2009,10,7823.3);
insert into tbl_salary values('10006',2009,11,7843.1);
insert into tbl_salary values('10006',2009,12,7810.3);
                                          
insert into tbl_salary values('10007',2009,1,7519.1);
insert into tbl_salary values('10007',2009,2,7348.3);
insert into tbl_salary values('10007',2009,3,7547.5);
insert into tbl_salary values('10007',2009,4,7558.4);
insert into tbl_salary values('10007',2009,5,7443.8);
insert into tbl_salary values('10007',2009,6,7541.7);
insert into tbl_salary values('10007',2009,7,7995.3);
insert into tbl_salary values('10007',2009,8,7507.3);
insert into tbl_salary values('10007',2009,9,7043.2);
insert into tbl_salary values('10007',2009,10,7943.2);
insert into tbl_salary values('10007',2009,11,7903.8);
insert into tbl_salary values('10007',2009,12,7215.1);
                                   
insert into tbl_salary values('10008',2009,1,4169.23);
insert into tbl_salary values('10008',2009,2,4243.3);
insert into tbl_salary values('10008',2009,3,4529.8);
insert into tbl_salary values('10008',2009,4,3927.3);
insert into tbl_salary values('10008',2009,5,4783.8);
insert into tbl_salary values('10008',2009,6,3844.3);
insert into tbl_salary values('10008',2009,7,4543.7);
insert into tbl_salary values('10008',2009,8,4313.3);
insert into tbl_salary values('10008',2009,9,4519.9);
insert into tbl_salary values('10008',2009,10,3813.2);
insert into tbl_salary values('10008',2009,11,4453.2);
insert into tbl_salary values('10008',2009,12,4189.6);
                                          
insert into tbl_salary values('10009',2009,1,3821.2);
insert into tbl_salary values('10009',2009,2,3543.0);
insert into tbl_salary values('10009',2009,3,3115.3);
insert into tbl_salary values('10009',2009,4,3542.5);
insert into tbl_salary values('10009',2009,5,3233.8);
insert into tbl_salary values('10009',2009,6,3545.3);
insert into tbl_salary values('10009',2009,7,2538.8);
insert into tbl_salary values('10009',2009,8,2935.6);
insert into tbl_salary values('10009',2009,9,3513.1);
insert into tbl_salary values('10009',2009,10,2557.9);
insert into tbl_salary values('10009',2009,11,3013.3);
insert into tbl_salary values('10009',2009,12,3016.8);
                                          
insert into tbl_salary values('10010',2009,1,11546.2);
insert into tbl_salary values('10010',2009,2,11513.1);
insert into tbl_salary values('10010',2009,3,11240.0);
insert into tbl_salary values('10010',2009,4,10943.4);
insert into tbl_salary values('10010',2009,5,10843.7);
insert into tbl_salary values('10010',2009,6,11592.3);
insert into tbl_salary values('10010',2009,7,10646.2);
insert into tbl_salary values('10010',2009,8,10930.1);
insert into tbl_salary values('10010',2009,9,10938.2);
insert into tbl_salary values('10010',2009,10,11523.6);
insert into tbl_salary values('10010',2009,11,10940.3);
insert into tbl_salary values('10010',2009,12,11209.8);
                                          
insert into tbl_salary values('10011',2009,1,3138.0);
insert into tbl_salary values('10011',2009,2,3043.3);
insert into tbl_salary values('10011',2009,3,3362.5);
insert into tbl_salary values('10011',2009,4,3245.6);
insert into tbl_salary values('10011',2009,5,3312.7);
insert into tbl_salary values('10011',2009,6,3547.2);
insert into tbl_salary values('10011',2009,7,3608.4);
insert into tbl_salary values('10011',2009,8,3042.1);
insert into tbl_salary values('10011',2009,9,3105.2);
insert into tbl_salary values('10011',2009,10,2902.0);
insert into tbl_salary values('10011',2009,11,3216.3);
insert into tbl_salary values('10011',2009,12,3035.6);
                                          
insert into tbl_salary values('10012',2009,1,13162.3);
insert into tbl_salary values('10012',2009,2,13243.5);
insert into tbl_salary values('10012',2009,3,13178.5);
insert into tbl_salary values('10012',2009,4,13343.5);
insert into tbl_salary values('10012',2009,5,13128.8);
insert into tbl_salary values('10012',2009,6,13043.8);
insert into tbl_salary values('10012',2009,7,13612.3);
insert into tbl_salary values('10012',2009,8,12546.3);
insert into tbl_salary values('10012',2009,9,13345.2);
insert into tbl_salary values('10012',2009,10,13119.1);
insert into tbl_salary values('10012',2009,11,13049.8);
insert into tbl_salary values('10012',2009,12,13566.3);

CREATE TABLE tbl_salary2 (
	no varchar(50),
	year int null,
	jan float null,
	feb float NULL,
	mar float NULL,
	apr float NULL,
	may float NULL,
	june float NULL,
	july float NULL,
	aug float NULL,
	sep float NULL,
	oct float NULL,
	nov float NULL,
	dece float NULL,
);

insert into tbl_salary2 values('10001',2008,7575.3,6757,2426.2,2964.3,2422.5,4644.5,5234.2,7675.2,7680,8676,4744,6575.3);
insert into tbl_salary2 values('10002',2008,3543.3,6535,3433.2,4235.3,2454.5,5775.5,2335.2,6444.2,5467,5675,7568,5646.3);
insert into tbl_salary2 values('10003',2008,7867.3,5475,5463.2,1124.3,3532.5,4470.5,5346.2,6489.2,4469,5678,5458,5464.3);
insert into tbl_salary2 values('10004',2008,5346.3,6887,3535.2,1421.3,2453.5,10755.5,2422.2,3565.2,3567,5647,6857,3533.3);
insert into tbl_salary2 values('10005',2008,7689.3,3456,5357.2,3414.3,4663.5,6355.5,5435.2,5635.2,4653,6587,4364,3535.3);
insert into tbl_salary2 values('10006',2008,4355.3,3444,4645.2,4212.3,4278.5,2378.5,5343.2,5689.2,5754,6758,5675,4522.3);
insert into tbl_salary2 values('10007',2008,7870.3,7565,3535.2,5353.3,3453.5,12786.5,3536.2,6675.2,2367,5867,8966,3246.3);
insert into tbl_salary2 values('10008',2008,8967.3,4555,5354.2,3808.3,4257.5,2757.5,6444.2,6578.2,3424,7865,4564,3566.3);
insert into tbl_salary2 values('10009',2008,8656.3,7699,4356.2,7865.3,3535.5,8653.5,3535.2,7568.2,1954,5758,4654,5424.3);
insert into tbl_salary2 values('10010',2008,2243.3,5466,3464.2,6448.3,5362.5,3787.5,2345.2,7647.2,7576,7478,5657,4263.3);
insert into tbl_salary2 values('10011',2008,5798.3,3453,6543.2,5757.3,2346.5,5376.5,3424.2,6478.2,3556,4767,6347,3456.3);
insert into tbl_salary2 values('10012',2008,7867.3,6768,3536.2,9766.3,5423.5,8675.5,4647.2,5474.2,7555,5689,4643,5365.3);

insert into tbl_salary2 values('10001',2009,8980.3,6789,7546.2,5464.3,2235.5,23453.5,6789.2,7866.2,9566,8676,6545,5646.3);
insert into tbl_salary2 values('10002',2009,8690.3,8866,3564.2,3432.3,2543.5,1276.5,4326.2,6458.2,7568,6746,7655,5464.3);
insert into tbl_salary2 values('10003',2009,5460.3,6475,3567.2,5353.3,2144.5,1256.5,8553.2,5690.2,5674,5867,4568,7866.3);
insert into tbl_salary2 values('10004',2009,2425.3,5768,8955.2,3357.3,2131.5,4786.5,5236.2,5757.2,4687,8696,7968,2355.3);
insert into tbl_salary2 values('10005',2009,3543.3,5457,8865.2,5333.3,2467.5,1576.5,1435.2,4633.2,6548,5675,2545,5422.3);
insert into tbl_salary2 values('10006',2009,7690.3,8708,5346.2,3454.3,2425.5,5456.5,5322.2,7988.2,4467,8796,6799,2422.3);
insert into tbl_salary2 values('10007',2009,5375.3,7797,7586.2,5464.3,5472.5,2435.5,2489.2,6759.2,6778,6765,69679,4224.3);
insert into tbl_salary2 values('10008',2009,6775.3,5688,8686.2,5467.3,2437.5,4669.5,3649.2,6570.2,6347,4765,5796,3535.3);
insert into tbl_salary2 values('10009',2009,2454.3,9977,4644.2,5353.3,3533.5,4568.5,4646.2,6757.2,5686,5889,5758,3542.3);
insert into tbl_salary2 values('10010',2009,5646.3,4575,4678.2,7567.3,2342.5,9564.5,5648.2,3654.2,5465,5856,5745,2425.3);
insert into tbl_salary2 values('10011',2009,3586.3,6842,7885.2,6545.3,2425.5,4366.5,7853.2,8066.2,7686,5787,5678,2635.3);
insert into tbl_salary2 values('10012',2009,6678.3,6478,5478.2,7956.3,5332.5,4697.5,3256.2,4589.2,6890,6467,7689,5648.3);

create table tbl_log(
	uuid		varchar2(50),
	createdate	date,
	content		varchar2(200),
	updatetype	varchar2(50)
);

create table tbl_testimport1(
	no		varchar2(20),	
	name		varchar2(30),
	age		integer,
	birthday	date,
	salary		float
);

create table tbl_testimport2(
	no		varchar2(20),	
	description	clob
);
commit;

CREATE OR REPLACE PROCEDURE sp_testInsertData
(
  in_uuid in varchar2,
  in_deptno in varchar2,
  in_deptname in varchar2,
  in_manager in varchar2,
  in_builtdate in date,
  in_performance in varchar2,
  in_description in varchar2,
  out_rtnValue out varchar2 
)
AS
BEGIN
  insert into tbl_department(guid,deptno,deptname,manager,builtdate,performance,description)values(in_uuid,in_deptno,in_deptname,in_manager,in_builtdate,in_performance,in_description);
   commit;
  out_rtnValue:='添加工号：'||in_deptno||'，姓名：'||in_deptname||'的记录成功';
END;


CREATE OR REPLACE PROCEDURE sp_testInvokeServerSP(
    in_uuid in varchar2,
    in_now in date,
    in_param_no in varchar2,
    in_content in varchar2
) AS
BEGIN
    update tbl_detailinfo set marriage=0 where no=in_param_no;
    insert into tbl_log(uuid,createdate,content,updatetype)values(in_uuid,in_now,in_content,'设置为未婚状态');
    commit;
END;


CREATE OR REPLACE PROCEDURE sp_testUpdateData
(
  in_deptno in varchar2,
  in_deptno_old in varchar2,
  in_manager in varchar2,
  in_builtdate in date,
  in_performance in varchar2,
  in_description in varchar2,
  out_rtnValue out varchar2 
)
AS
--定义变量
BEGIN
   update tbl_department set deptno=in_deptno,manager=in_manager,builtdate=in_builtdate,performance=in_performance,description=in_description where deptno=in_deptno_old;
   commit;
  out_rtnValue:='修改工号：'||in_deptno_old||'的记录成功';
END;




create or replace procedure sp_selectEmployeeData
(
    txtno varchar2,
    txtprovince varchar2,
    txtage varchar2,
    i_systeminfo varchar2,
    o_cursor out PKG_WABACUS.CURSOR_WABACUS
)
is
    var_sql varchar2(1000);
begin
    var_sql:='SELECT A.no,name,ename,sex,age,salary,marriage,birthday,joinindate,province,city,county,description FROM tbl_baseinfo A left join tbl_detailinfo B on A.no=B.no where  1=1';
    if txtno<>' ' then var_sql:=var_sql||' and A.no like  ''%'||txtno||'%'''; end if;
    if txtprovince<>' ' then var_sql:=var_sql||' and province like  ''%'||txtprovince||'%'''; end if;
    if txtage<>' ' then var_sql:=var_sql||' and A.age >='||txtage; end if;
    PKG_WABACUS.SP_WABACUS_EXECUTE(var_sql,'no,name desc',i_systeminfo,o_cursor);
end sp_selectEmployeeData;


CREATE OR REPLACE PROCEDURE sp_testDeleteData
(
  in_deptno in varchar2
)
AS
BEGIN
   delete from tbl_department where deptno=in_deptno;
   commit;
END;