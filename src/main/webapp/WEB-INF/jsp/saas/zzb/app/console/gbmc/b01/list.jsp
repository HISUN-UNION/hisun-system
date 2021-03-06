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
<title>名册目录</title>
	<style type="text/css">
		form {
			margin: 0 0 0px;
		}
	</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12 responsive">
				<%-- 表格开始 --%>
				<form class=""id="importForm" enctype="multipart/form-data"  action="${path }/zzb/app/console/gbmc/b01/list">
					<div class="portlet-title">
						<div class="caption">名册目录</div>
						<div class="clearfix fr">
							<a id="sample_editable_1_new" class="btn green" href="${path }/zzb/app/console/gbmc/b01/add?mcid=${mcid}">
								<i class="icon-plus"></i> 添加
							</a>
							<span class="controllerClass btn green file_but">
								<i class="icon-circle-arrow-up"></i>上传目录
								<input class="file_progress" type="file" name="attachFile" id="btn-browseTemplate">
							</span>
							<a class="btn" href="${path }/zzb/app/console/gbmc/"><i class="icon-undo"></i>返回</a>
						</div>
                        </div>
					</form>
					<%-- 表格结束 --%>
					<div class="clearfix">
						<div class="control-group">
							<div id="query" style="float: left;">
								<form action="${path }/zzb/app/console/gbmc/b01/list" method="POST" id="searchForm" name="searchForm">
									<input type="hidden" id="mcid" name="mcid" value="${mcid}"/>
									<input type="hidden" name="OWASP_CSRFTOKEN" value="${sessionScope.OWASP_CSRFTOKEN}"/>
									<input type="hidden" name="pageNum" value="${pager.pageNum }" id="pageNum">
									<input type="hidden" name="pageSize" value="${pager.pageSize }" id="pageSize">
									目录名称：<input type="text" class="m-wrap" name="b0101Query" id="b0101Query" value="${b0101Query}" style="width: 100px;" />
									<button type="button" class="btn Short_but" onclick="searchSubmit()">查询</button>
									<button type="button" class="btn Short_but" onclick="clearData()">清空</button>
								</form>
							</div>
						</div>

					</div>
                        <div class="portlet-body">
							 <table class="table table-striped table-bordered table-hover dataTable table-set">
                                <thead>
                                    <tr>
                                        <th>目录名称</th>
										<th width="10%">人员</th>
                                        <th width="100">排序</th>
										<th width="100">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${pager.datas}" var="vo">
                                        <tr style="text-overflow:ellipsis;">
                                            <td><a href="${path}/zzb/app/console/gbmc/a01/list?mcid=${mcid}&mcb01id=${vo.id }"><c:out value="${vo.b0101}"></c:out></a></td>
											<td><a href="${path}/zzb/app/console/gbmc/a01/list?mcid=${mcid}&mcb01id=${vo.id }">共<c:out value="${vo.a01Count}"></c:out>人</a></td>
                                            <td><c:out value="${vo.px}"></c:out></td>
											<td class="Left_alignment">
												<a href="${path}/zzb/app/console/gbmc/b01/edit?id=${vo.id }" class="">编辑</a>|
												<a href="javascript:del('${vo.id }','${vo.b0101}')" class="">删除</a>
											</td>
                                        </tr>

                                    </c:forEach>
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
			</div>
		</div>

		<%-- END PAGE CONTENT--%>
	</div>
	<script type="text/javascript" src="${path }/js/common/loading.js"></script>
	<script src="${path }/js/bootstrap-fileupload.js"></script>
	<script src="${path }/js/bootstrap-fileupload.js"></script>
	<!— 引入确认框模块 —>
	<%@ include file="/WEB-INF/jsp/inc/confirmModal.jsp" %>
	<script type="text/javascript">
		(function(){
			App.init();

			$("#btn-browseTemplate").bind("change",function(evt){
				if($(this).val()){
					ajaxSubmit();
				}
				$(this).val('');
			});
			var myLoading = new MyLoading("${path}",{zindex:20000});
			function ajaxSubmit(){
				var fileInput = document.getElementById("btn-browseTemplate");
				if(fileInput.files.length>0){
					var name = fileInput.files[0].name
					var arr = name.split(".");
					if(arr.length<2 || !(arr[arr.length-1]=="doc" || arr[arr.length-1]=="docx"|| arr[arr.length-1]=="DOC"|| arr[arr.length-1]=="DOCX")){
						showTip("提示","请上传word文件",2000);
						return;
					}
				}else{
					showTip("提示","请选择文件上传",2000);
					return;
				}
				//hideErrorMsg();
				$("#importForm").ajaxSubmit({
					url : "${path }/zzb/app/console/gbmc/b01/ajax/execute?mcid=${mcid}",
					type : "post",
					headers:{
						OWASP_CSRFTOKEN:"${sessionScope.OWASP_CSRFTOKEN}"
					},
					beforeSend:function(XHR){
						myLoading.show();
					},
					success : function(json){
						if(json.code == 1){
							showTip("提示","操作成功",500);
							//loadCiList(ciObjectId);
							window.location.href="${path }/zzb/app/console/gbmc/b01/list?mcid=${mcid}";
						}else if(json.code == -1){
							showTip("提示", json.message, 500);
						}else if(json.code == -2){
							showTip("提示", "导入数据存在错误，请及时下载已标记错误处的日志模板文件",500);
							//$('#downloanErrorTd').show();
							//$('#downloanError').attr('href','${path}/sacm/asset/export/downloanError?OWASP_CSRFTOKEN=${sessionScope.OWASP_CSRFTOKEN}&path='+encodeURIComponent(encodeURIComponent(json.path)));
							//$('#errorMsg').text('导入数据存在错误，请及时下载已标记错误处的日志模板文件');
						}else{
							showTip("提示","出错了,请检查网络!",500);
						}
					},
					error : function(arg1, arg2, arg3){
						showTip("提示","出错了,请检查网络!",500);
					},
					complete : function(XHR, TS){
						myLoading.hide();
					}
				});
			}

		})();

		function pagehref (pageNum ,pageSize){
			<%--window.location.href ="${path}/zzb/app/console/gbmc/b01/list?mcid=${mcid}&pageNum="+pageNum+"&pageSize="+pageSize;--%>
			$("#pageNum").val(pageNum);
			$("#pageSize").val(pageSize);
			$("#searchForm").submit();
		}

		function searchSubmit(){
			document.searchForm.submit();
		}

		var del = function(id,itemName){
			actionByConfirm1(itemName, "${path}/zzb/app/console/gbmc/b01/delete/" + id,{} ,function(data,status){
				if (data.success == true) {
					showTip("提示","删除成功", 2000);
					setTimeout(function(){window.location.href = "${path }/zzb/app/console/gbmc/b01/list?mcid=${mcid}"},2000);
				}else{
					showTip("提示", data.message, 2000);
				}
			});
		};
		function uploadFile(fileName){
			document.getElementById("btn-"+fileName).click();
		}
		function clearData(){
			$("#b0101Query").val('');
			document.searchForm.submit();
		}
	</script>
</body>
</html>
