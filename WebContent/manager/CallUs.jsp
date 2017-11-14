<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- Bootstrap  -->
<link rel="stylesheet" href="${contextPath}/css/bootstrap.css">

</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">后台管理</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li class=""><a href="${contextPath}/querycommon">公共部分</a></li>
					<li class=""><a href="${contextPath}/querylit"> 关于我们部分 </a></li>
					<li class="active "><a href="${contextPath}/querybackcall">
							联系我们部分 </a></li>
					<li class=""><a href="${contextPath}/querybackjoin">招聘部分</a></li>
					<li><a href="${contextPath}/querybackgoods">产品部分</a></li>
					<li><a href="${contextPath}/querybackdown">下载中心部分</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="row">
		<div class="col-md-6 ">
			<form class="form-inline" id="callus_bank">
				<table class="table table-bordered">
					<tr>
						<td>添加银行logo</td>
					</tr>
					<tr>
						<td><p>
								上传文件： <input type="file" name="file" />
							</p> <input type="button" value="上传" onclick="insertbank()" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-6 ">
			<c:forEach items="${requestScope.queryBank }" var="list"
				varStatus="num">
				<div class="col-md-3  animate-box">
					<img
						src="${contextPath}/<c:out value="${list.getCallusimg_src()}" />"
						alt="news1" class="img-responsive "> <input type="button"
						value="删除" onclick="deletebank(${list.getCallusimg_id()})">
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6 ">
			<form class="form-inline" id="callus_store">
				<table class="table table-bordered">
					<tr>
						<td>添加商户logo</td>
					</tr>
					<tr>
						<td><p>
								上传文件： <input type="file" name="file" />
							</p> <input type="button" value="上传" onclick="insertstore()" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-6 ">
			<c:forEach items="${requestScope.queryStore }" var="list"
				varStatus="num">
				<div class="col-md-3  animate-box">
					<img
						src="${contextPath}/<c:out value="${list.getCallusimg_src()}" />"
						alt="news1" class="img-responsive "> <input type="button"
						value="删除" onclick="deletestore(${list.getCallusimg_id()})">
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6 ">
			<form class="form-inline">
				<table class="table table-bordered">
					<tr>
						<td>添加问答</td>
					</tr>
					<tr>
						<td>问题:<input id="helpask" /></td>
					</tr>
					<tr>
						<td><p>
								回答内容：（要使用换行请输入&lt;br&gt; ,例如“1.条件&lt;br&gt;2.条件”）
								<textarea rows="10"
									style="width: 400px; padding-top: 1px; font-size: 14px;"
									id="helpans"></textarea>
							</p> <input type="button" value="添加" onclick="inserthelp()" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-6 ">
			<c:forEach items="${requestScope.queryHelp }" var="list3"
				varStatus="num">
				<p>
					<c:out value="${list3.getHelp_ask()}" />
					<input type="button" value="删除"
						onclick="delete_help(${list3.getHelp_id()})">
				</p>
			</c:forEach>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6 ">
			<form class="form-inline">
				<table class="table table-bordered">
					<tr>
						<td>添加合作伙伴</td>
					</tr>
					<tr>
						<td>合作伙伴姓名/称呼:<input id="allyname" /></td>
					</tr>
					<tr>
						<td><p>
								合作伙伴联系方式：
								<input id="allycall" />
							</p> <input type="button" value="添加" onclick="insertally()" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-6 ">
			<c:forEach items="${requestScope.queryAlly }" var="list4"
				varStatus="num">
				<p>
					<c:out value="${list4.getAlly_name()}" />
					<c:out value="${list4.getAlly_call()}" />
					<input type="button" value="删除"
						onclick="delete_ally(${list4.getAlly_id()})">
				</p>
			</c:forEach>
		</div>
	</div>
	<!-- jQuery -->
	<script src="${contextPath}/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function insertbank() {
			var formData = new FormData($("#callus_bank")[0]);
			$.ajax({
				url : '${contextPath}/insertbank',
				type : 'POST',
				data : formData,
				async : false,
				cache : false,
				contentType : false,
				processData : false,
				success : function(returndata) {
					alert('OK👌');
					window.location.reload();
				},
				error : function(returndata) {
					alert('怎么可能会失败呢请联系技术');
				}
			});
		};
		function deletebank(id) {
			$.post("${contextPath}/deletebank", {
				bankid : id,
			}, function(data, textStatus) {
				if (data) {
					alert('OK👌');
					window.location.reload();
				} else {
					alert('怎么可能会失败呢请联系技术');
				}
			});
		};
		function insertstore() {
			var formData = new FormData($("#callus_store")[0]);
			$.ajax({
				url : '${contextPath}/insertstore',
				type : 'POST',
				data : formData,
				async : false,
				cache : false,
				contentType : false,
				processData : false,
				success : function(returndata) {
					alert('OK👌');
					window.location.reload();
				},
				error : function(returndata) {
					alert('怎么可能会失败呢请联系技术');
				}
			});
		};
		function deletestore(id) {
			$.post("${contextPath}/deletestore", {
				storeid : id,
			}, function(data, textStatus) {
				if (data) {
					alert('OK👌');
					window.location.reload();
				} else {
					alert('怎么可能会失败呢请联系技术');
				}
			});
		};
		function inserthelp() {
			$.post("${contextPath}/inserthelp", {
				helpask:$('#helpask').val(),
				helpans:$('#helpans').val(),	
			}, function(data, textStatus) {
				if (data) {
					alert('OK👌');
					window.location.reload();
				} else {
					alert('怎么可能会失败呢请联系技术');
				}
			});
		};
		function delete_help(id) {
			$.post("${contextPath}/deletehelp", {
				helpid : id,
			}, function(data, textStatus) {
				if (data) {
					alert('OK👌');
					window.location.reload();
				} else {
					alert('怎么可能会失败呢请联系技术');
				}
			});
		};
		function insertally() {
			$.post("${contextPath}/insertally", {
				allyname:$('#allyname').val(),
				allycall:$('#allycall').val(),	
			}, function(data, textStatus) {
				if (data) {
					alert('OK👌');
					window.location.reload();
				} else {
					alert('怎么可能会失败呢请联系技术');
				}
			});
		};
		function delete_ally(id) {
			$.post("${contextPath}/deleteally", {
				allyid: id,
			}, function(data, textStatus) {
				if (data) {
					alert('OK👌');
					window.location.reload();
				} else {
					alert('怎么可能会失败呢请联系技术');
				}
			});
		};
		$().ready(function(){
			var token=localStorage.getItem("token");
			if (token==null) {
				alert('你还没有登录');
				location.href="${contextPath}/manager/back.jsp";
			}
		});
	</script>
</body>
</html>