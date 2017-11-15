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
					<li class="active"><a href="${contextPath}/querycommon">公共部分</a></li>
					<li class=" "><a href="${contextPath}/querylit"> 关于我们部分 </a></li>
					<li class="dropdown "><a href="${contextPath}/querybackcall">
							联系我们部分 </a></li>
					<li><a href="${contextPath}/querybackjoin">招聘部分</a></li>
					<li><a href="${contextPath}/querybackgoods">产品部分</a></li>
					<li><a href="${contextPath}/querybackdown">下载中心部分</a></li>
					<li><a id="loginout">退出到登陆页面</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="row">
		<div class="col-md-6 ">
			<form class="form-inline" id="logo">
				<table class="table table-bordered">
					<tr>
						<td>添加/替换logo</td>
					</tr>
					<tr>
						<td><p>
								上传文件： <input type="file" name="file" />
							</p> <input type="button" value="上传" onclick="updatelogo()" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-6 ">
			<%
				String logo_src = (String) request.getAttribute("logo_src");
			%>
			<img src="${contextPath}/<%=logo_src %>" alt="news1"
				class="img-responsive ">
		</div>
	</div>
	<div class="row">
		<div class="col-md-6 ">
			<form class="form-inline" id="s_banner">
				<table class="table table-bordered">
					<tr>
						<td>添加/替换二级头图</td>
					</tr>
					<tr>
						<td><p>
								上传文件： <input type="file" name="file" />
							</p> <input type="button" value="上传" onclick="updates_banner()" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-6 ">
			<%
				String banner_src = (String) request.getAttribute("banner_src");
			%>
			<div class="col-md-6 ">
				<img src="${contextPath}/<%=banner_src %>" alt="news1"
					class="img-responsive ">
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6 ">
			<form class="form-inline" id="qr">
				<table class="table table-bordered">
					<tr>
						<td>添加/替换二维码</td>
					</tr>
					<tr>
						<td><p>
								上传文件： <input type="file" name="file" />
							</p> <input type="button" value="上传" onclick="update_qr()" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-6 ">
			<div class="col-md-3 ">
				<img src="${contextPath}/images/qr.jpg" alt="news1"
					class="img-responsive ">
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6 ">
			<form class="form-inline" id="mbanner">
				<table class="table table-bordered">
					<tr>
						<td>添加/替换首页第一张头图</td>
					</tr>
					<tr>
						<td><p>
								上传文件： <input type="file" name="file" />
							</p> <input type="button" value="上传" onclick="update_mbanner()" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-6 ">
			<%
				String banner_src2 = (String) request.getAttribute("banner_src2");
			%>
			<div class="col-md-6 ">
				<img src="${contextPath}/<%=banner_src2 %>" alt="news1"
					class="img-responsive ">
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6 ">
			<form class="form-inline" id="banner1">
				<table class="table table-bordered">
					<tr>
						<td>添加其他头图</td>
					</tr>
					<tr>
						<td><p>
								上传文件： <input type="file" name="file" />
							</p> <input type="button" value="上传" onclick="updatebanner()" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-6 ">
			<c:forEach items="${requestScope.queryBanner }" var="list"
				varStatus="num">
				<div class="col-md-3  animate-box">
					<img src="${contextPath}/<c:out value="${list.getBanner_src()}" />"
						alt="news1" class="img-responsive "> <input type="button"
						value="删除" onclick="delete_banner(${list.getBanner_id()})">
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- jQuery -->
	<script src="${contextPath}/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function updatelogo() {
			var formData = new FormData($("#logo")[0]);
			$.ajax({
				url : '${contextPath}/updatelogo',
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
		function updates_banner() {
			var formData = new FormData($("#s_banner")[0]);
			$.ajax({
				url : '${contextPath}/updates_banner',
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
		function update_qr() {
			var formData = new FormData($("#qr")[0]);
			$.ajax({
				url : '${contextPath}/update_qr',
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
		function update_mbanner() {
			var formData = new FormData($("#mbanner")[0]);
			$.ajax({
				url : '${contextPath}/update_mbanner',
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
		function updatebanner() {
			var formData = new FormData($("#banner1")[0]);
			$.ajax({
				url : '${contextPath}/updatebanner',
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
		function delete_banner(id) {
			$.post(
				"${contextPath}/delete_banner",
				{
					bannerid : id,
				},
				function(data, textStatus) {
					if (data) {
						alert('OK👌');
						window.location.reload();
					}
				}
			);
		};
		$("#loginout").on("click",function(){
			localStorage.removeItem("token");
			location.href="${contextPath}/manager/back.jsp";
		});
		$().ready(function(){
			var token=localStorage.getItem("token");
			if (token==null) {
				alert('你还没有登录');
				location.href="${contextPath}/manager/back.jsp";
			}else{
				
			}
		});
	</script>
</body>
</html>