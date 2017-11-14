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
					<li class=""><a href="${contextPath}/querybackcall">
							联系我们部分 </a></li>
					<li class=""><a href="${contextPath}/querybackjoin">招聘部分</a></li>
					<li class="active"><a href="${contextPath}/querybackgoods">产品部分</a></li>
					<li><a href="${contextPath}/querybackdown">下载中心部分</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="row">
		<div class="col-md-6 ">
			<form class="form-inline" id="goodsbanner">
				<table class="table table-bordered">
					<tr>
						<td>添加/替换商品主宣</td>
					</tr>
					<tr>
						<td><p>
								上传文件： <input type="file" name="file" />
							</p> <input type="button" value="上传" onclick="updategoodsbanner()" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6 ">
			<form class="form-inline" id="insertgoods"
				enctype="multipart/form-data">
				<table class="table table-bordered">
					<tr>
						<td>添加产品</td>
					</tr>
					<tr>
						<td>产品名称<input id="goods_name">
						</td>
					</tr>
					<tr>
						<td>产品主图<input type="file" name="file" />
						</td>
					</tr>
					<tr>
						<td><input type="button" value="提交" onclick="insertgoods()"></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-6 ">
			<c:forEach items="${requestScope.queryGoods }" var="list2"
				varStatus="num">
				<p>
					<c:out value="${list2.getGoods_name()}" />
					<input type="button" value="删除"
						onclick="delete_goods(${list2.getGoods_id()})">
				</p>
			</c:forEach>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6 ">
			<form>
				<table class="table table-bordered">
					<tr>
						<td>添加产品主要介绍</td>
					</tr>
					<tr>
						<td><textarea rows="10"
								style="width: 400px; padding-top: 1px; font-size: 14px;"
								name="goodsmain" id="goodsmain"></textarea></td>
					</tr>
					<c:forEach items="${requestScope.queryGoods }" var="list2"
						varStatus="num">
						<tr>
							<td><c:out value="${list2.getGoods_name()}" /><br> <input
								type="button" value="上传"
								onclick="insertgoodsmain(<c:out value="${list2.getGoods_id()}" />)" />

							</td>
						</tr>
					</c:forEach>
				</table>
			</form>
		</div>
		<div class="col-md-6 ">
			<form id="insertgoodsintro" enctype="multipart/form-data">
				<table class="table table-bordered">
					<tr>
						<td>添加产品详情(逐条添加)</td>
					</tr>
					<tr>
						<td>详情图片部分<input type="file" name="file" /><br> 详情文字部分<textarea
								rows="10"
								style="width: 400px; padding-top: 1px; font-size: 14px;"
								name="goodsintroinner" id="goodsintroinner"></textarea>
						</td>
					</tr>
					<c:forEach items="${requestScope.queryGoods }" var="list2"
						varStatus="num">
						<tr>
							<td><c:out value="${list2.getGoods_name()}" /><br> <input
								type="button" value="上传"
								onclick="insertgoodsintro(<c:out value="${list2.getGoods_id()}" />)" />

							</td>
						</tr>
					</c:forEach>

				</table>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6 ">
			<form class="form-inline" id="thirdbanner"
				enctype="multipart/form-data">
				<table class="table table-bordered">
					<tr>
						<td>添加三个主宣</td>
					</tr>
					<tr>
						<td>主宣图<input type="file" name="file" />
						</td>
					</tr>
					<c:forEach items="${requestScope.queryGoods }" var="list2"
						varStatus="num">
						<tr>
							<td><c:out value="${list2.getGoods_name()}" /><br> <input
								type="button" value="上传"
								onclick="insert3banner(<c:out value="${list2.getGoods_id()}" />)" />

							</td>
						</tr>
					</c:forEach>
				</table>
			</form>
		</div>
		<div class="col-md-6 ">
			<c:forEach items="${requestScope.queryGoodsThirdBanner }" var="list3"
				varStatus="num">
				<div class="col-md-3  animate-box">
					<img alt=""
						src="${contextPath}/<c:out value="${list3.getBanner_src()}" />"
						class="img-responsive"> <input type="button" value="删除"
						onclick="delete_goodsbanner(${list3.getBanner_id()})">
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- jQuery -->
	<script src="${contextPath}/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function updategoodsbanner() {
			var formData = new FormData($("#goodsbanner")[0]);
			$.ajax({
				url : '${contextPath}/updategoodsbanner',
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
		function insertgoods() {
			var formData = new FormData($("#insertgoods")[0]);
			formData.append("name",$('#goods_name').val());
			$.ajax({
				url : '${contextPath}/insertgoods',
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
		function delete_goods(id) {
			$.post(
				"${contextPath}/delete_goods",
				{
					goodsid : id,
				},
				function(data, textStatus) {
					if (data) {
						alert('OK👌');
						window.location.reload();
					}
				}
			);
		};
		function insertgoodsintro(id) {
			var formData = new FormData($("#insertgoodsintro")[0]);
			formData.append("goodsintroinner",$('#goodsintroinner').val());
			formData.append("id",id);
			$.ajax({
				url : '${contextPath}/insertgoodsintro',
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
		function insertgoodsmain(id) {
			$.post(
				"${contextPath}/insertgoodsmain",
				{
					goodsmain:$("#goodsmain").val(),
					id:id,
				},
				function(data, textStatus) {
					if (data) {
						alert('OK👌');
						window.location.reload();
					}else{
						alert('怎么可能会失败呢请联系技术');
					}
				}
			);
		};
		function insert3banner(id) {
			var formData = new FormData($("#thirdbanner")[0]);
			formData.append("id",id);
			$.ajax({
				url : '${contextPath}/insert3banner',
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
		function delete_goodsbanner(id) {
			$.post(
				"${contextPath}/delete_goodsbanner",
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