<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/inc/taglib.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link href="${path}/css/common/common.css" rel="stylesheet" type="text/css"/>
	<!-- BEGIN PAGE LEVEL STYLES -->
	<link rel="stylesheet" href="${path }/css/DT_bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="${path }/css/bootstrap-fileupload.css">

	<link href="${path }/css/style.css" rel="stylesheet" type="text/css">
	<!-- END PAGE LEVEL STYLES -->
	<title>查阅管理</title>
	<style type="text/css">
		form {
			margin: 0 0 0px;
		}
	</style>
</head>
<body>
<div id="jgModal" class="modal container hide fade" tabindex="-1" data-width="1010" data-height="600">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button data-dismiss="modal" class="close"  type="button"></button>
				<h3 class="modal-title" id="title" >
					“红叶专”档案图片
				</h3>
			</div>
			<div class="modal-body" id="jgAddDiv" style="background-color: #f1f3f6;">
			</div>
		</div>
	</div>
</div>

<div id="addModal" class="modal container hide fade" tabindex="-1" data-width="600">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button data-dismiss="modal" class="close"  type="button"></button>
				<h3 class="modal-title" id="addTitle" >
					档案阅档申请
				</h3>
			</div>
			<div class="modal-body" id="addDiv">
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12 responsive">
			<%-- 表格开始 --%>
			<form class=""id="importForm" enctype="multipart/form-data">
				<input type="hidden" name="b01Id" value="${b01Id}"/>
				<div class="portlet-title">
					<div class="caption">查阅管理</div>
					<div class="clearfix fr">

						<a id="sample_editable_1_new" class="btn green" href="#">
							输出
						</a>


						<%--<span class="controllerClass btn green file_but" >--%>
							<%--<i class="icon-circle-arrow-up"></i>清空数据--%>
							<%--<input class="file_progress" type="file" name="attachFile" id="btn-browseTemplate">--%>
						<%--</span>--%>
					</div>

				</div>
			</form>
				<div class="clearfix">
					<div class="control-group">
						<div id="query" style="float: left;">
							<form action="${path }/zzb/app/console/asetA01/ajax/list" method="POST" id="searchForm" name="searchForm">
								<input type="hidden" id="b01Id" name="b01Id" value="${b01Id}"/>
								<input type="hidden" name="OWASP_CSRFTOKEN" value="${sessionScope.OWASP_CSRFTOKEN}"/>
								<input type="hidden" name="pageNum" value="${pager.pageNum }" id="pageNum">
								<input type="hidden" name="pageSize" value="${pager.pageSize }" id="pageSize">
								查阅人：<input type="text" class="m-wrap" name="xmQuery" id="xmQuery" value="${xmQuery}" style="width: 80px;" />
								档案名称：<input type="text" class="m-wrap" name="xmQuery" id="xmQuery" value="${xmQuery}" style="width: 80px;" />
								查阅内容：<input type="text" class="m-wrap" name="xmQuery" id="xmQuery" value="${xmQuery}" style="width: 80px;" />
								授权状态：
								<select class="select_form" tabindex="-1" name="noFileQuert" id="noFileQuert" style="width: 100px; margin-bottom: 0px;" >
									<option ></option>
									<option >待审</option>
									<option >已审</option>
									<option >拒绝授权</option>
								</select>


								<button type="button" class="btn Short_but" onclick="searchSubmit()">查询</button>
								<button type="button" class="btn Short_but" onclick="clearData()">清空</button>
							</form>
						</div>
					</div>

				</div>
				<div class="portlet-body">
					<table class="table table-striped table-bordered table-hover dataTable table-set">
						<thead>

						<TR height=28>
							<th width=70>档案名称</th>
							<th width=150>查阅单位</th>
							<th width=70>查阅人</th>
							<th  width=120>查阅时间</th>
							<th width=120>申请内容</th>
							<th>查阅情况</th>
							<th width=70>审核状态</th>
							<th width="100">操作</th>
						</thead>
						<tbody>
						<tr onmouseout="this.className=''" onmouseover="this.className='table_tr_mouse'">
							<td style="text-align:center;">
								<a href="${path}/zzb/app/console/a38/shouquan"> 钱某某</a>
							</td>
							<td   style="text-align:center;">
								区委组织部
							</td>
							<td  style="text-align:center;">
								何建英
							</td>
							<td  style="text-align:center;" width="100">
							</td>
							<td   style="text-align:center;" title="全部材料">
								<div style="width:180;z-index:1;padding-bottom:2px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">全部材料</div>
							</td>
							<td  style="text-align:left;" title=""><!-- 查阅内容 -->
							</td>
							<td  style="text-align:center;" >
								待授权
							</td>
							<td style="text-align:center;">
								<a href="${path}/zzb/app/console/a38/shouquan">授权</a>|
								<a href="#">删除 </a>
							</td>
						</tr>
						<tr class="table_tr_dark" onmouseout="this.className='table_tr_dark'" onmouseover="this.className='table_tr_mouse'">
							<td style="text-align:center;">
								<a href="">黄妍</a>
							</td>
							<td   style="text-align:center;">
								区政协办公室
							</td>
							<td  style="text-align:center;">
								岳邦
							</td>
							<td  style="text-align:center;" width="100">
								2013.09.05
								<br>19分5秒<font color="blue" style="cursor:hand" onclick="showViewTimes('EC0E4B42AC15325432AEE5B41477B284','岳邦','黄妍')">【详细】</font>
                            </td>
							<td   style="text-align:center;" title="全部材料">
								<div style="width:180;z-index:1;padding-bottom:2px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">全部材料</div>
							</td>
							<td  style="text-align:left;" title="高校毕业生就业通知书,20050916,任区工商业联合会副主任科员（试用期一年）审批表,20100506,公务员调任、转任呈批表,20081118,公务员登记表,20061231,优秀学生干部登记表,19980914,转正申请书,20070815,入党申请书,200507,入党志愿书,20080125,入团志愿书,19970512,高中毕业生家庭情况调查表,20000329,其父黄妃黑的证明材料,20000328,公务员初任培训考核登记表,20050823,学生毕业、学位资格审批表,20040430,高等学校毕业生登记表,20031115,2008年度考核登记表 ,20090210,2007年度考核登记表,20080129,2006年度考核登记表,20070215,2005年度考核登记表,20060117,中学生德育考核表,200007,中学生社会实践活动登记表,199811,公务员调任、转任呈批表,20061222,公务员录用审批表,20060718,干部履历表,20070111"><!-- 查阅内容 -->
								高校毕业生就业通知书,20050916,...<font color="blue" style="cursor:hand" onclick="showContents('EC0E4B42AC15325432AEE5B41477B284','岳邦','黄妍')">【详细】</font>
							</td>
							<td  style="text-align:center;" >
								已回收
							</td>
							<td style="text-align:center;">
								<a href="#">再次授权</a>|

								<a href="#">删除</a>
							</td>
						</tr>
						<tr onmouseout="this.className=''" onmouseover="this.className='table_tr_mouse'">
							<td style="text-align:center;">
								<a href="">何庆祝</a>
							</td>
							<td   style="text-align:center;">
								区发改局
							</td>
							<td  style="text-align:center;">
								何建英
							</td>
							<td  style="text-align:center;" width="100">
								2013.09.04
								<br>4分19秒<font color="blue" style="cursor:hand" onclick="showViewTimes('E6F6E39EAC15325432AEE5B46144D162','何建英','何庆祝')">【详细】</font>

							</td><!-- 查阅时长 -->
							<td   style="text-align:center;" title="全部材料">
								<div style="width:180;z-index:1;padding-bottom:2px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">全部材料</div>

							</td>
							<td  style="text-align:left;" title="任海广司令部通信处处长报告表,19980617,军队干部转业审批报告表,20040331,晋升为海军中校军衔报告表,19960904,干部履历书,19940402"><!-- 查阅内容 -->

								任海广司令部通信处处长报告表,1...<font color="blue" style="cursor:hand" onclick="showContents('E6F6E39EAC15325432AEE5B46144D162','何建英','何庆祝')">【详细】</font>

							</td>
							<td  style="text-align:center;" >
								已回收
							</td>
							<td style="text-align:center;">
								<a href="#">再次授权</a>|
								<a href="#">删除</a>
							</td>
						</tr>
						<tr class="table_tr_dark" onmouseout="this.className='table_tr_dark'" onmouseover="this.className='table_tr_mouse'">
							<td style="text-align:center;">
								<a href="">赵国明</a>
							</td>
							<td   style="text-align:center;">
								区残联
							</td>
							<td  style="text-align:center;">
								陈万香
							</td>
							<td  style="text-align:center;" width="100">
								2013.08.29
								<br>26秒<font color="blue" style="cursor:hand" onclick="showViewTimes('C7CF4EA2AC15325432AEE5B49546FABF','陈万香','赵国明')">【详细】</font>
							</td><!-- 查阅时长 -->
							<td   style="text-align:center;" title="履历材料">
								<div style="width:180;z-index:1;padding-bottom:2px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">履历材料</div>
							</td>
							<td  style="text-align:left;" title="干部履历表,19981029,干部履历书,19941102"><!-- 查阅内容 -->
								干部履历表,19981029,干部履历书...<font color="blue" style="cursor:hand" onclick="showContents('C7CF4EA2AC15325432AEE5B49546FABF','陈万香','赵国明')">【详细】</font>
							</td>
							<td  style="text-align:center;" >
								已回收
							</td>
							<td style="text-align:center;">
								<a href="#">再次授权</a>|
								<a href="#">删除</a>
							</td>
						</tr>
						<tr onmouseout="this.className=''" onmouseover="this.className='table_tr_mouse'">
							<td style="text-align:center;">
								<a href="">杨秋菊</a>
							</td>
							<td   style="text-align:center;">
								区信访局
							</td>
							<td  style="text-align:center;">
								吴颖坚
							</td>
							<td  style="text-align:center;" width="100">
							</td><!-- 查阅时长 -->
								<td   style="text-align:center;" title="全部材料">
								<div style="width:180;z-index:1;padding-bottom:2px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">全部材料</div>
							</td>
							<td  style="text-align:left;" title=""><!-- 查阅内容 -->
							</td>
							<td  style="text-align:center;" >
								待授权
						</td>
							<td style="text-align:center;">
								<a href="#">授&nbsp;&nbsp;权</a>|
								<a href="#">删除</a>
							</td>
						</tr>
						<tr class="table_tr_dark" onmouseout="this.className='table_tr_dark'" onmouseover="this.className='table_tr_mouse'">
							<td style="text-align:center;">
								<a href="">王楠</a>
						</td>
							<td   style="text-align:center;">
								沙园街
							</td>
							<td  style="text-align:center;">
								李辉
							</td>
							<td  style="text-align:center;" width="100">
								2013.07.26

								<br>30分33秒<font color="blue" style="cursor:hand" onclick="showViewTimes('18AF2896AC1532543ED7A07436AF4CC0','李辉','王楠')">【详细】</font>

							</td><!-- 查阅时长 -->
							<!-- <td  style="text-align:left;" width="100">

                                    30分33秒<font color="blue" style="cursor:hand" onclick="showViewTimes('18AF2896AC1532543ED7A07436AF4CC0','李辉','王楠')">【详细】</font>

                            </td> -->
							<td   style="text-align:center;" title="全部材料">
								<div style="width:180;z-index:1;padding-bottom:2px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">全部材料</div>

							</td>
							<td  style="text-align:left;" title="任主任科员呈报表,20010927,任党委办主任呈报表,19951119,任正科级呈报表,19881230,任党工委副书记纪工委书记审批表,20011016,公务员登记表,20061231,入党志愿书,19831216,党员登记表,19900222,党员评议表,19890530,党员登记表,19860324,申请转正报告,19830822,转正报告,19830304,入党申请书,197508,职工连续工龄审核表,19960902,王楠外公历史问题最后结论,19820214,家庭情况汇报,19810106,函授大专班学员毕业鉴定（含成绩）,19890415,高级政工师资格评审表,20011230,干部任免审批表,20090601,函授学院学员成绩表,19970331,函授学院学历证明,19961231,函授大专班学历证明,19890301,关于文化程度的证明,19830404,职工子弟学校学生学籍表,1995年度考核登记表,19960201,工作鉴定,19850131,单位鉴定,19821125,建党对象培养、考查登记表,19810608,实习人员鉴定表,19730611,家庭报告书,19720720,干部履历表,19991020,干部履历表,1988,职工登记表,19850726"><!-- 查阅内容 -->

								任主任科员呈报表,20010927,任党...<font color="blue" style="cursor:hand" onclick="showContents('18AF2896AC1532543ED7A07436AF4CC0','李辉','王楠')">【详细】</font>

							</td>
							<td  style="text-align:center;" >




								已回收

							</td>

							<td style="text-align:center;">




								<a href="#">再次授权</a>|

								<a href="#">删除</a>

							</td>
						</tr>



						<tr onmouseout="this.className=''" onmouseover="this.className='table_tr_mouse'">
							<td style="text-align:center;">




								<a href="">张耀国</a>


							</td>
							<td   style="text-align:center;">
								区委组织部
							</td>
							<td  style="text-align:center;">
								区委组织部
							</td>
							<td  style="text-align:center;" width="100">
								2013.07.25

								<br>5分20秒<font color="blue" style="cursor:hand" onclick="showViewTimes('14B448DBAC15325461A4CA5698566AE1','区委组织部','张耀国')">【详细】</font>

							</td><!-- 查阅时长 -->
							<!-- <td  style="text-align:left;" width="100">

                                    5分20秒<font color="blue" style="cursor:hand" onclick="showViewTimes('14B448DBAC15325461A4CA5698566AE1','区委组织部','张耀国')">【详细】</font>

                            </td> -->
							<td   style="text-align:center;" title="全部材料">
								<div style="width:180;z-index:1;padding-bottom:2px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">全部材料</div>

							</td>
							<td  style="text-align:left;" title="中国人民公安大学学生学籍表,20040711,毕业证书,20040701,新录用国家公务员任职定级审批表,20050822,首次评定授予人民警察警衔审批表,20060412,人民警察警衔变动审批表,20081008,公务员登记表,20061231,录用审批表,20041025,公安普通高等学校招生政审表,20000728,证明,20000629,证明材料,20000629,证明,20000628,组织鉴定,200402,2000年山西省普通高等学校招生考生报名登记表,20000521,入党志愿书,20011130,干部履历表,20040901,中国人民公安大学学生简明登记表"><!-- 查阅内容 -->

								中国人民公安大学学生学籍表,200...<font color="blue" style="cursor:hand" onclick="showContents('14B448DBAC15325461A4CA5698566AE1','区委组织部','张耀国')">【详细】</font>

							</td>
							<td  style="text-align:center;" >




								已回收

							</td>

							<td style="text-align:center;">




								<a href="#">再次授权</a>|

								<a href="#">删除</a>

							</td>
						</tr>



						<tr class="table_tr_dark" onmouseout="this.className='table_tr_dark'" onmouseover="this.className='table_tr_mouse'">
							<td style="text-align:center;">




								<a href="">方芝阳</a>


							</td>
							<td   style="text-align:center;">
								区委组织部
							</td>
							<td  style="text-align:center;">
								王小楠
							</td>
							<td  style="text-align:center;" width="100">
								2013.07.19

								<br>8分17秒<font color="blue" style="cursor:hand" onclick="showViewTimes('F4BBA329AC153254354F6D8A7C361BCC','王小楠','方芝阳')">【详细】</font>

							</td><!-- 查阅时长 -->
							<!-- <td  style="text-align:left;" width="100">

                                    8分17秒<font color="blue" style="cursor:hand" onclick="showViewTimes('F4BBA329AC153254354F6D8A7C361BCC','王小楠','方芝阳')">【详细】</font>

                            </td> -->
							<td   style="text-align:center;" title="全部材料">
								<div style="width:180;z-index:1;padding-bottom:2px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">全部材料</div>

							</td>
							<td  style="text-align:left;" title="工作人员录用审批表,20110223,工作人员试用期满任职定级审批表,20120302,公务员非领导职务任免审批表,20120330,入党志愿书,20081215,富士康企业集团新干班应届毕业生劳动合同书,20030725,富士康企业集团录用通知书,20030415,2011年度考核登记表,20120215,2010年度考核登记表,20110323,干部履历表,20120402"><!-- 查阅内容 -->

								工作人员录用审批表,20110223,工...<font color="blue" style="cursor:hand" onclick="showContents('F4BBA329AC153254354F6D8A7C361BCC','王小楠','方芝阳')">【详细】</font>

							</td>
							<td  style="text-align:center;" >




								已回收

							</td>

							<td style="text-align:center;">




								<a href="#">再次授权</a>|

								<a href="#">删除</a>

							</td>
						</tr>



						<tr onmouseout="this.className=''" onmouseover="this.className='table_tr_mouse'">
							<td style="text-align:center;">




								<a href="">赵国明</a>


							</td>
							<td   style="text-align:center;">
								区残联
							</td>
							<td  style="text-align:center;">
								陈万香
							</td>
							<td  style="text-align:center;" width="100">
								2013.07.17

								<br>2分9秒<font color="blue" style="cursor:hand" onclick="showViewTimes('EBA1C9ACAC1532547BF9757C335618E4','陈万香','赵国明')">【详细】</font>

							</td><!-- 查阅时长 -->
							<!-- <td  style="text-align:left;" width="100">

                                    2分9秒<font color="blue" style="cursor:hand" onclick="showViewTimes('EBA1C9ACAC1532547BF9757C335618E4','陈万香','赵国明')">【详细】</font>

                            </td> -->
							<td   style="text-align:center;" title="公务员登记表">
								<div style="width:180;z-index:1;padding-bottom:2px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">公务员登记表</div>

							</td>
							<td  style="text-align:left;" title="公务员登记表,20061231"><!-- 查阅内容 -->

								公务员登记表,20061231<font color="blue" style="cursor:hand" onclick="showContents('EBA1C9ACAC1532547BF9757C335618E4','陈万香','赵国明')">【详细】</font>

							</td>
							<td  style="text-align:center;" >




								已回收

							</td>

							<td style="text-align:center;">




								<a href="#">再次授权</a>|

								<a href="#">删除</a>

							</td>
						</tr>



						<tr class="table_tr_dark" onmouseout="this.className='table_tr_dark'" onmouseover="this.className='table_tr_mouse'">
							<td style="text-align:center;">




								<a href="">赵国明</a>


							</td>
							<td   style="text-align:center;">
								区残联
							</td>
							<td  style="text-align:center;">
								陈万香
							</td>
							<td  style="text-align:center;" width="100">
								2013.07.17

								<br>13分52秒<font color="blue" style="cursor:hand" onclick="showViewTimes('EB8438FAAC1532547BF9757C795D0230','陈万香','赵国明')">【详细】</font>

							</td><!-- 查阅时长 -->
							<!-- <td  style="text-align:left;" width="100">

                                    13分52秒<font color="blue" style="cursor:hand" onclick="showViewTimes('EB8438FAAC1532547BF9757C795D0230','陈万香','赵国明')">【详细】</font>

                            </td> -->
							<td   style="text-align:center;" title="公登表">
								<div style="width:180;z-index:1;padding-bottom:2px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">公登表</div>

							</td>
							<td  style="text-align:left;" title="公务员登记表,20061231,干部履历书,19941102"><!-- 查阅内容 -->

								公务员登记表,20061231,干部履历...<font color="blue" style="cursor:hand" onclick="showContents('EB8438FAAC1532547BF9757C795D0230','陈万香','赵国明')">【详细】</font>

							</td>
							<td  style="text-align:center;" >




								已回收

							</td>

							<td style="text-align:center;">




								<a href="#">再次授权</a>|

								<a href="#">删除</a>

							</td>
						</tr>


						</tbody>
					</table>
					<jsp:include page="/WEB-INF/jsp/common/page.jsp">
						<jsp:param value="${pager.total }" name="total"/>
						<jsp:param value="${pager.pageCount }" name="endPage"/>
						<jsp:param value="${pager.pageSize }" name="pageSize"/>
						<jsp:param value="${pager.pageNum }" name="page"/>
					</jsp:include>
				</div>
		</div>
		<%-- 表格结束 --%>
	</div>
</div>

<%-- END PAGE CONTENT--%>
</div>

<script type="text/javascript">
	(function(){
		App.init();

		$("#btn-browseTemplate").bind("change",function(evt){
			if($(this).val()){
				ajaxSubmit();
			}
			$(this).val('');
		});

	})();

	var add = function(){
		$.ajax({
			url:"${path}/zzb/app/console/a38/ajax/addApplyDa",
			type : "post",
			data: {},
			headers:{
				OWASP_CSRFTOKEN:"${sessionScope.OWASP_CSRFTOKEN}"
			},
			dataType : "html",
			success : function(html){
				$('#addDiv').html(html);

				$('#addModal').modal({
					keyboard: true
				});
			},
			error : function(){
				showTip("提示","出错了请联系管理员", 1500);
			}
		});
	}

	var view = function(){
		var divHeight = $(window).height()-100;
		$('#jgModal').attr("data-height",divHeight);
		$.ajax({
			url:"${path}/zzb/app/console/a38/ajax/viewImgManage",
			type : "post",
			data: {},
			headers:{
				OWASP_CSRFTOKEN:"${sessionScope.OWASP_CSRFTOKEN}"
			},
			dataType : "html",
			success : function(html){
				$('#jgAddDiv').html(html);

				$('#jgModal').modal({
					keyboard: true
				});
			},
			error : function(){
				showTip("提示","出错了请联系管理员", 1500);
			}
		});
	}
	function pagehref (pageNum ,pageSize){
		<%--window.location.href ="${path}/zzb/app/console/gbmc/a01/list?b01Id=${b01Id}&mcid=${mcid}&pageNum="+pageNum+"&pageSize="+pageSize;--%>
		$.ajax({
			async:false,
			type:"POST",
			url:"${path}/zzb/app/console/asetA01/ajax/list",
			dataType : "html",
			headers:{
				"OWASP_CSRFTOKEN":'${sessionScope.OWASP_CSRFTOKEN}'
			},
			data:{
				'b01Id':"${b01Id}",
				'pageNum':pageNum,
				'pageSize':pageSize
			},
			success:function(html){
				$("#catalogList").html(html);
//				$("#treeId").val(nodeId);
			},
			error : function(){
				myLoading.hide();
				showTip("提示","出错了,请检查网络!",2000);
			}
		});

	}

	function searchSubmit(){
		$.ajax({
			async:false,
			type:"POST",
			url:"${path}/zzb/app/console/asetA01/ajax/list",
			dataType : "html",
			headers:{
				"OWASP_CSRFTOKEN":'${sessionScope.OWASP_CSRFTOKEN}'
			},
			data : $("#searchForm").serialize(),
			success:function(html){
				$("#catalogList").html(html);
//				$("#treeId").val(nodeId);
			},
			error : function(){
				myLoading.hide();
				showTip("提示","出错了,请检查网络!",2000);
			}
		});
	}



	var del = function(id,itemName){
		actionByConfirm1(itemName, "${path}/zzb/app/console/asetA01/delete/" + id,{} ,function(data,status){
			if (data.success == true) {
				showTip("提示","删除成功", 2000);
				setTimeout(function(){window.location.href = "${path}/zzb/app/console/asetA01/list?b01Id=${b01Id}&mcid=${mcid}"},2000);
			}else{
				showTip("提示", data.message, 2000);
			}
		});
	};
	function uploadFile(fileName){
		document.getElementById("btn-"+fileName).click();
	}
	function clearData(){
		$("#xmQuery").val('');
		$.ajax({
			async:false,
			type:"POST",
			url:"${path}/zzb/app/console/asetA01/ajax/list",
			dataType : "html",
			headers:{
				"OWASP_CSRFTOKEN":'${sessionScope.OWASP_CSRFTOKEN}'
			},
			data : $("#searchForm").serialize(),
			success:function(html){
				$("#catalogList").html(html);
//				$("#treeId").val(nodeId);
			},
			error : function(){
				myLoading.hide();
				showTip("提示","出错了,请检查网络!",2000);
			}
		});
	}
	function exportGbrmsp(){
		$.cloudAjax({
			path : '${path}',
			url : "${path }/zzb/app/console/asetA01/ajax/exportGbrmsp",
			type : "post",
			data : $("#form1").serialize(),
			dataType : "json",
			success : function(data){
				if(data.success == true){
					showTip("提示","生成干部任免审批表成功!",2000);
					//setTimeout(function(){window.location.href = "${path}/zzb/app/console/bwh/"},2000);
				}else{
					showTip("提示", "生成干部任免审批表失败!", 2000);
				}
			},
			error : function(){
				showTip("提示","出错了请联系管理员",2000);
			}
		});
	}
	function openGzzzb(){
		var url ="http://localhost:8080/GZZZB/la/index.jsp?showFlag=init&moduleCode=LA_APPOINT_STUFF";
		window.open(url);
	}
</script>
</body>
</html>
