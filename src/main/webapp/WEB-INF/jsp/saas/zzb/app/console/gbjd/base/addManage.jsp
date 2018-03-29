<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/inc/servlet.jsp" %>
<%@include file="/WEB-INF/jsp/inc/taglib.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>修改干部监督信息档案</title>
</head>
<body>
<div class="container-fluid">

	<div class="row-fluid">
		<div class="portlet box grey ">
			<div class="portlet-body">
				<div class="relationbetTop">
					<div class="relationbetTop_left">修改干部监督信息档案</div>
					<div class="relationbetTop_but">

						<button type="button" class="btn green" onclick=""><i class="icon-ok"></i> 确定</button>
						<a class="btn"  onclick="cancel()"><i class="icon-remove-sign"></i> 取消</a>
					</div>
				</div>
				<div class="tabbable tabbable-custom">
					<ul class="nav nav-tabs" style="font-size: 14px;font-weight: bold;" id="tabs">
						<li class="active"><a id="#tab_1_1" href="#tab_1_1" data-toggle="tab">基本信息</a></li>
						<li ><a id="#tab_1_2" href="#tab_1_1" data-toggle="tab">个人事项查核情况</a></li>
						<li><a id="#tab_1_3" href="#tab_1_1" data-toggle="tab">经济责任审计</a></li>
						<li><a id="#tab_1_4" href="#tab_1_1" data-toggle="tab">信访举报</a></li>
						<li><a id="#tab_1_5" href="#tab_1_1" data-toggle="tab">三书预警</a></li>
						<li><a id="#tab_1_6" href="#tab_1_1" data-toggle="tab">责任追究</a></li>
						<li><a id="#tab_1_7" href="#tab_1_1" data-toggle="tab">问责</a></li>
					</ul>
					<div class="tab-content" style="border:none; border-top:solid 1px #e4e4e4; padding:10px 0;">
						<div class="tab-pane active" id="tab_show">
						</div>
					</div>
				</div>
			</div>
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
<script type="text/javascript" src="${path }/js/common/loading.js"></script>
<script type="text/javascript">
	$(function(){
		App.init();
//		var bzCount=0;
//		var zwCount=0;
		baseLoad();

		var ciFlag=true;

//		$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
//			if($(e.target).attr('id')!='#tab_1_1'){
////				if(!ciFlag){
//					$("[id='#tab_1_1']").tab('show');
//					return;
////				}
//			}
//
//		});



		$("#tabs li a").each(function(){
			$(this).click(function(){
				if($(this).attr("id")=="#tab_1_1"){
					$("[id='#tab_1_1']").tab('show');
					baseLoad();
				}else if($(this).attr("id")=="#tab_1_2"){
					$("[id='#tab_1_2']").tab('show');
					grsxchLoad();
				}else if($(this).attr("id")=="#tab_1_3"){
					$("[id='#tab_1_3']").tab('show');
					jjzrsjLoad();
				}else if($(this).attr("id")=="#tab_1_4"){
					$("[id='#tab_1_4']").tab('show');
					xfjbLoad();
				}else if($(this).attr("id")=="#tab_1_5"){
					$("[id='#tab_1_5']").tab('show');
					ssyjLoad();
				}else if($(this).attr("id")=="#tab_1_6"){
					$("[id='#tab_1_6']").tab('show');
					zrzjLoad();
				}else if($(this).attr("id")=="#tab_1_7"){
					$("[id='#tab_1_7']").tab('show');
					wzLoad();
				}

			});
		});

	});

	function cancel(){
			window.location.href = "${path}/zzb/app/console/gbjd/base";

	}

	//基本信息
	function baseLoad(){
		$.ajax({
			url : "${path }/zzb/app/console/gbjd/ajax/editBase",
			type : "post",
			data : {"parentId":"${parentId}","id":"${ciId}"},
			dataType : "html",
			success : function(html){
				var view = $("#tab_show");
				view.html(html);
			},
			error : function(arg1, arg2, arg3){
				showTip("提示","基本信息数据失败");
			}
		});
	}
	function grsxchLoad(){
		$.ajax({
			url : "${path }/zzb/app/console/gbjd/ajax/grsxchGrList",
			type : "post",
			data : {"parentId":"${parentId}","id":"${ciId}"},
			dataType : "html",
			success : function(html){
				var view = $("#tab_show");
				view.html(html);
			},
			error : function(arg1, arg2, arg3){
				showTip("提示","基本信息数据失败");
			}
		});
	}

	function jjzrsjLoad(){
		$.ajax({
			url : "${path }/zzb/app/console/gbjd/ajax/sjgbGrList",
			type : "post",
			data : {"parentId":"${parentId}","id":"${ciId}"},
			dataType : "html",
			success : function(html){
				var view = $("#tab_show");
				view.html(html);
			},
			error : function(arg1, arg2, arg3){
				showTip("提示","基本信息数据失败");
			}
		});
	}
	function xfjbLoad(){
		$.ajax({
			url : "${path }/zzb/app/console/gbjd/ajax/xfjbGrList",
			type : "post",
			data : {"parentId":"${parentId}","id":"${ciId}"},
			dataType : "html",
			success : function(html){
				var view = $("#tab_show");
				view.html(html);
			},
			error : function(arg1, arg2, arg3){
				showTip("提示","基本信息数据失败");
			}
		});
	}
	function ssyjLoad(){
		$.ajax({
			url : "${path }/zzb/app/console/gbjd/ajax/ssyjList",
			type : "post",
			data : {"parentId":"${parentId}","id":"${ciId}"},
			dataType : "html",
			success : function(html){
				var view = $("#tab_show");
				view.html(html);
			},
			error : function(arg1, arg2, arg3){
				showTip("提示","基本信息数据失败");
			}
		});
	}
	function zrzjLoad(){
		$.ajax({
			url : "${path }/zzb/app/console/gbjd/ajax/zrzjGrList",
			type : "post",
			data : {"parentId":"${parentId}","id":"${ciId}"},
			dataType : "html",
			success : function(html){
				var view = $("#tab_show");
				view.html(html);
			},
			error : function(arg1, arg2, arg3){
				showTip("提示","基本信息数据失败");
			}
		});
	}
	function wzLoad(){
		$.ajax({
			url : "${path }/zzb/app/console/gbjd/ajax/wzGrList",
			type : "post",
			data : {"parentId":"${parentId}","id":"${ciId}"},
			dataType : "html",
			success : function(html){
				var view = $("#tab_show");
				view.html(html);
			},
			error : function(arg1, arg2, arg3){
				showTip("提示","基本信息数据失败");
			}
		});
	}



</script>
</body>
</html>
