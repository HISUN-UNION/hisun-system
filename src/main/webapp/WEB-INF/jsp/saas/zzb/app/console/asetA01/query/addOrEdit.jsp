<%@ page import="java.util.Date" %>
<%@ page import="com.hisun.util.DateUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/inc/servlet.jsp" %>
<%@include file="/WEB-INF/jsp/inc/taglib.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${path }/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css"/>
<title>查询条件设置</title>
</head>
<body>
	<div class="container-fluid">

		<div class="row-fluid">
			<div class="span12">
				<%-- BEGIN SAMPLE FORM PORTLET 表单主体--%>   

				<div class="portlet box grey">

					<div class="portlet-title">

						<div class="caption">

							<i class="icon-reorder"></i>

							<span class="hidden-480">查询条件设置</span>

						</div>
						<div class="tools">
							<a href="javascript:location.reload();" class="reload"></a>
							<button type="button" class="btn green" onclick="formSubmit()"><i class="icon-ok"></i> 确定</button>
							<a class="btn" href="${path }/zzb/app/console/asetA01Query/queryList"><i class="icon-remove-sign"></i> 取消</a>
						</div>
					</div>

					<div class="portlet-body form">
						<!-- BEGIN FORM-->
						<form action="" class="form-horizontal" id="form1"  method="post">
							<input type="hidden" id="id" name="id" value="${vo.id}">
							<dl class="dlattrbute">
								<dt><a href="###">基本信息</a></dt>
								<dd>
									<table  border="0" style="width:100%;" cellPadding="5px">
										<tr>
											<td>
												<div id="queryNameGroup" class="control-group">
													<label class="control-label"><span class="required">*</span>条件名称</label>
													<div class="controls">
														<input class="span8 m-wrap" type="text" id="queryName" name="queryName" required  maxlength="45" value="${vo.queryName}"/>
													</div>
												</div>
											</td>
											<td width="50%">
												<div id="querySortGroup" class="control-group">
													<label class="control-label"><span class="required">*</span>排序</label>
													<div class="controls">
														<input class="span8 m-wrap" type="text" id="querySort" name="querySort"  number="true" required  maxlength="45" value="${vo.querySort}"/>
													</div>
												</div>
											</td>
										</tr>
									</table>
								</dd>
							</dl>
							<dl class="dlattrbute">
								<dt><a href="###">条件信息</a></dt>
								<dd>
									<table  border="0" style="width:100%;" cellPadding="5px">
										<tr>
											<td>
												<div id="xmGroup" class="control-group">
													<label class="control-label">姓名</label>
													<div class="controls">
														<input class="span8 m-wrap" type="text" id="xm" name="xm"  maxlength="45" value="${vo.xm}"/>
													</div>
												</div>
											</td>
											<td width="50%">
												<div id="b01IdGroup" class="control-group">
													<label class="control-label">单位</label>
													<div class="controls">
														<div class="btn-group span12" style="font-size: 12px">
															<input type="hidden" name="b01Id" id="b01Id" value="${vo.b01Id}"/>
															<input type="text" id="b0101" name="b0101" readonly="readonly"
																   class="span8 m-wrap" style="cursor: pointer;" onclick="$('#objectTreeSelDiv').toggle();" value="${vo.b0101}">
															<div class="span8 m-wrap" style="border:solid 1px #ccc;overflow-y: scroll;overflow-x: auto;position: absolute;
											top: 100%;left: 0;z-index: 1000;display: none;float: left;list-style: none;text-shadow: none;padding: 0px;margin: 0px;height: 200px;background-color: white;" id="objectTreeSelDiv">
																<ul id="treeDemo" class="ztree" style="margin: 0px;padding: 0px;height: 200px;"></ul>
															</div>
														</div>

													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div id="xbGroup" class="control-group">
													<label class="control-label">性别</label>
													<div class="controls">
														<select class="span8 m-wrap" tabindex="-1" name="xb" id="xb" >
															<option value="">全部</option>
															<option value="男" <c:if test="${vo.xb == '男'}">selected="selected"</c:if>>男</option>
															<option value="女" <c:if test="${vo.xb == '女'}">selected="selected"</c:if>>女</option>
														</select>
													</div>
												</div>
											</td>
											<td width="50%">
												<div id="xrzwGroup" class="control-group">
													<label class="control-label">现任职务</label>
													<div class="controls">
														<input class="span8 m-wrap" type="text" id="xrzw" name="xrzw"  maxlength="45" value="${vo.xrzw}"/>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div >
													<label class="control-label">年龄</label>
													<div class="controls">
														<span  id="nlStartGroup" style=" display: inline-block;float: left; ">
															<input class="span8 m-wrap" style="width: 100px;" type="text" id="nlStart" name="nlStart"  maxlength="45" value="${vo.nlStart}"/>
														</span>

														<span  id="nlEndGroup" >
															--<input class="span8 m-wrap" style="width: 100px;" type="text" id="nlEnd" name="nlEnd"  maxlength="45" value="${vo.nlEnd}"/>
														</span>
													</div>
												</div>
											</td>
											<td width="50%">
												<div id="mzGroup" class="control-group">
													<label class="control-label">民族</label>
													<div class="controls">
														<input class="span8 m-wrap" type="text" id="mz" name="mz"  maxlength="45" value="${vo.mz}"/>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div id="csdGroup" class="control-group">
													<label class="control-label">出生地</label>
													<div class="controls">
														<input class="span8 m-wrap" type="text" id="csd" name="csd"  maxlength="45" value="${vo.csd}"/>
													</div>
												</div>
											</td>
											<td width="50%">
												<div id="jgGroup" class="control-group">
													<label class="control-label">籍贯</label>
													<div class="controls">
														<input class="span8 m-wrap" type="text" id="jg" name="jg"  maxlength="45" value="${vo.jg}"/>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div id="qrzxlGroup" class="control-group">
													<label class="control-label">全日制学历</label>
													<div class="controls">
														<input class="span8 m-wrap" type="text" id="qrzxl" name="qrzxl"  maxlength="45" value="${vo.qrzxl}"/>
													</div>
												</div>
											</td>
											<td width="50%">
												<div id="qrzxwGroup" class="control-group">
													<label class="control-label">全日制学位</label>
													<div class="controls">
														<input class="span8 m-wrap" type="text" id="qrzxw" name="qrzxw"  maxlength="45" value="${vo.qrzxw}"/>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div id="qrzZyGroup" class="control-group">
													<label class="control-label">全日制专业</label>
													<div class="controls">
														<input class="span8 m-wrap" type="text" id="qrzZy" name="qrzZy"  maxlength="45" value="${vo.qrzZy}"/>
													</div>
												</div>
											</td>
											<td>
												<div id="zzxlGroup" class="control-group">
													<label class="control-label">在职学历</label>
													<div class="controls">
														<input class="span8 m-wrap" type="text" id="zzxl" name="zzxl"  maxlength="45" value="${vo.zzxl}"/>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td width="50%">
												<div id="zzxwGroup" class="control-group">
													<label class="control-label">在职学位</label>
													<div class="controls">
														<input class="span8 m-wrap" type="text" id="zzxw" name="zzxw"  maxlength="45" value="${vo.zzxw}"/>
													</div>
												</div>
											</td>
											<td width="50%">
												<div id="zzZyGroup" class="control-group">
													<label class="control-label">在职专业</label>
													<div class="controls">
														<input class="span8 m-wrap" type="text" id="zzZy" name="zzZy"  maxlength="45" value="${vo.zzZy}"/>
													</div>
												</div>
											</td>
										</tr>
									</table>
								</dd>
							</dl>
						</form>
					</div>

				</div>

				<%-- END SAMPLE FORM PORTLET--%>
			</div>
		</div>
		
		<%-- END PAGE CONTENT--%>  
	</div>
	<script type="text/javascript" src="${path }/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="${path }/js/common/est-validate-init.js"></script>
	<script type="text/javascript" src="${path }/js/common/validate-message.js"></script>
	<script type="text/javascript" src="${path }/js/common/30CloudAjax.js"></script>
	<script type="text/javascript" src="${path }/js/common/DataValidate.js"></script>
	<script type="text/javascript" src="<%=path%>/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="<%=path%>/js/bootstrap-datepicker.zh-CN.js"></script>
	<script type="text/javascript" src="${path }/js/zTree/jquery.ztree.all-3.5.js"></script>
<script type="text/javascript">
	
//	(function(){
//		App.init();
//
//	})();
	var setting = {
		view : {
			selectedMulti : false
		},
		edit : {
			enable : true,
			showRemoveBtn : false,
			showRenameBtn : false
		},
		data : {
			simpleData : {
				enable : true
			}
		},
		callback : {
			onCheck : zTreeOnClick
		},
		check: {
			enable: true,
			nocheckInherit: true

		}
	};
	var resTree;
	$(function(){
		localPost("<%=path%>/zzb/app/console/bset/ajax/load/tree",{"status":1}, function(data,status){
			if (status == "success") {
				//setting.data.key.url = "_url" ;
				resTree = $.fn.zTree.init($("#treeDemo"), setting, data.customTree);

				localPost("<%=path%>/zzb/app/console/asetA01Query/selectB01?queryId=${vo.id}",null, function(data,status){
					if (status == "success") {
						var resIdList = data.data;
						if (resTree != null && resIdList != null) {

							$.each(resIdList, function(index, resId) {
								var node = resTree.getNodeByParam("id", resId, null);
								if(node){
									resTree.checkNode(node, true, false);
								}
							});
						}
					}
				},"json",{"OWASP_CSRFTOKEN":"${sessionScope.OWASP_CSRFTOKEN}"});
			}
		},"json",{"OWASP_CSRFTOKEN":"${sessionScope.OWASP_CSRFTOKEN}"});
	});

	function zTreeOnClick() {
		var nodes = resTree.getCheckedNodes(true);
		var b01IdObj = $("[id='b01Id']");
		var b0101Obj = $("[id='b0101']");
		var b01Ids = "";
		var b0101s = "";
		$.each(nodes, function(index, node) {
			if(b01Ids==""){
				b01Ids = node.id;
				b0101s = node.name;
			}else{
				b01Ids = b01Ids+";"+ node.id;
				b0101s = b0101s+","+ node.name;
			}
		});
		b01IdObj.val(b01Ids);
		b0101Obj.val(b0101s);
	}
function isNumberTmp(str) {
	var Letters = "0123456789";
	var Letters2 = "-0123456789";
	if(str.length==0)
		return false;

	//对首位进行附加判断
	if(Letters2.indexOf(str.charAt(0)) == -1){
		return false;
	}else{
		for (i = 1; i < str.length; i++) {
			var checkChar = str.charAt(i);
			if (Letters.indexOf(checkChar) == -1)
				return false;
		}
		return true;
	}
}
	function checkNlisNum(){
		var nlStart = $("[id='nlStart']").val();
		var nlEnd = $("[id='nlEnd']").val();

		if(nlStart!=""){
			if(isNumberTmp(nlStart)==false){
				showTip("提示","年龄必须为数字",2000);
				return false;
			}
		}
		if(nlEnd!=""){
			if(isNumberTmp(nlEnd)==false){
				showTip("提示","年龄必须为数字",2000);
				return false;
			}
		}
		return true;
	}
	var myVld = new EstValidate("form1");
	function formSubmit(){
		if(checkNlisNum() == false){
			return;
		}
		var bool = myVld.form();
		if(bool){
			$.cloudAjax({
				path : '${path}',
				url : "${path }/zzb/app/console/asetA01Query/save",
				type : "post",
				data : $("#form1").serialize(),
				dataType : "json",
				success : function(data){
					if(data.success){
						showTip("提示","操作成功",2000);
						setTimeout(function(){window.location.href = "${path}/zzb/app/console/asetA01Query/queryList"},2000);
					}else{
						showTip("提示", json.message, 2000);
					}
				},
				error : function(){
					showTip("提示","出错了请联系管理员",2000);
				}
			});
		}
	}
	
</script>
</body>
</html>
