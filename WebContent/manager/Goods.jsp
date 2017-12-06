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
					<li><a id="loginout">退出到登陆页面</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="row">
		<div class="col-md-12 ">
			<form class="form-inline" id="goodSbG">
				<table class="table">
					<caption>添加/替换产品中心宽图</caption>
					<tr>
						<td><p>
								上传文件： <input type="file" name="file" />
							</p></td>
						<td>
							<%
								String sbg_src = (String) request.getAttribute("banner_src");
							%>
							<div class="col-md-5  animate-box">
								<img src="${contextPath}/<%= sbg_src%>" alt="news1"
									class="img-responsive ">
							</div>
						</td>
					</tr>
					<tr>
						<td><input type="button" value="上传" onclick="updategoodSbG()" />
						</td>
						<td></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 ">
			<form class="form-inline" id="insertgoods"
				enctype="multipart/form-data">
				<table class="table">
					<caption>添加产品</caption>
					<tr>
						<td>产品名称<input id="goods_name">
						</td>
						<td>产品主图<input type="file" name="file" />
						</td>
						<td><input type="button" value="提交" onclick="insertgoods()"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 ">
			<form>
				<table class="table ">
					<caption>添加产品主要介绍</caption>
					<tr>
						<td><textarea rows="10"
								style="width: 60%; padding-top: 1px; font-size: 14px;"
								name="goodsmain" id="goodsmain"></textarea></td>
						<td><c:forEach items="${requestScope.queryGoods }"
								var="list2" varStatus="num">
								产品名称<c:out value="${list2.getGoods_name()}" />
								<input type="button" value="上传"
									onclick="insertgoodsmain(<c:out value="${list2.getGoods_id()}" />)" />
							</c:forEach></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<caption>编辑每个产品基本信息</caption>
				<thead>
					<tr>
						<th>产品名称</th>
						<th>产品主图</th>
						<th>产品主要介绍</th>
						<th></th>
					</tr>
				</thead>
				<c:forEach items="${requestScope.queryCommonWithGoods }" var="list4"
					varStatus="num">
					<form class="form-inline" id="updategoods${num.index}"
						enctype="multipart/form-data">
						<tbody>
							<tr>
								<td><input
									value="<c:out value="${list4.getGoods_name()}" />"
									id="goods_name${num.index}"></td>
								<td><img alt=""
									src="${contextPath}/<c:out value="${list4.getGoods_mainimg()}" />"
									style="width: 30%"> <input type="file" name="file" /></td>
								<td><p>如需换行可以加入&lt;br&gt;</p> <br> <textarea rows="10"
										style="width: 400px; padding-top: 1px; font-size: 14px;"
										id="goodsintro_inner${num.index}"><c:out value="${list4.getGoodsintro_inner()}" /></textarea></td>
								<td><input type="button" value="修改提交"
									onclick="updategoods(<c:out value="${list4.getGoods_id()}" />,<c:out value="${list4.getGoodsintro_id()}" />,${num.index})">
									<input type="button" value="删除"
									onclick="delete_goods(<c:out value="${list4.getGoods_id()}" />)"></td>
							</tr>
						</tbody>
					</form>
				</c:forEach>

			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form id="insertgoodsintro" enctype="multipart/form-data">
				<table class="table">
					<caption>添加产品详情(逐条添加)</caption>
					<tr>
						<td>详情图片部分<input type="file" name="file" />
						</td>
						<td>详情文字<br> <textarea rows="10"
								style="width: 400px; padding-top: 1px; font-size: 14px;"
								name="goods_intro" id="goods_intro"></textarea>
						</td>
						<td><c:forEach items="${requestScope.queryCommonWithGoods }"
								var="list4" varStatus="num">
								<c:out value="${list4.getGoods_name()}" />
								<input type="button" value="上传"
									onclick="insertgoodsintro(<c:out value="${list4.getGoods_id()}" />)" />
							</c:forEach></td>
						<td></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<caption>编辑产品每条详情介绍</caption>
				<thead>
					<tr>
						<th>产品名称</th>
						<th>产品详情图片</th>
						<th>产品详情介绍</th>
						<th></th>
					</tr>
				</thead>
				<c:forEach items="${requestScope.queryCommonWithGoods2 }"
					var="list5" varStatus="num">
					<form class="form-inline" id="updategoodsintro${num.index}"
						enctype="multipart/form-data">
						<tbody>
							<tr>
								<td><c:out value="${list5.getGoods_name()}" /></td>
								<td><img alt=""
									src="${contextPath}/<c:out value="${list5.getGoodsintro_img()}" />"
									style="width: 30%"> <input type="file" name="file" /></td>
								<td><textarea rows="10"
										style="width: 400px; padding-top: 1px; font-size: 14px;"
										id="goods_intro${num.index}"><c:out value="${list5.getGoodsintro_inner()}" /></textarea></td>
								<td><input type="button" value="修改提交"
									onclick="updategoodsintro(<c:out value="${list5.getGoodsintro_id()}" />,${num.index})">
									<input type="button" value="删除"
									onclick="delete_goodsintro(<c:out value="${list5.getGoodsintro_id()}" />)"></td>
							</tr>
						</tbody>
					</form>
				</c:forEach>

			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 ">
			<form class="form-inline" id="goodsbanner">
				<table class="table">
					<caption>添加/替换产品详情宽图</caption>
					<tr>
						<td><p>
								上传文件： <input type="file" name="file" />
							</p></td>
						<c:forEach items="${requestScope.queryGoods }" var="list2"
							varStatus="num">
							<td><c:out value="${list2.getGoods_name()}" /><br> <input
								type="button" value="上传"
								onclick="updategoodsbanner(<c:out value="${list2.getGoods_id()}" />)" />
							</td>
						</c:forEach>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 ">
			<c:forEach items="${requestScope.queryAllGoodsBanner }" var="list8"
				varStatus="num">
				<div class="col-md-3  animate-box">
					<img
						src="${contextPath}/<c:out value="${list8.getBanner_src()}" />"
						alt="news1" class="img-responsive ">
					<hr>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 ">
			<form class="form-inline" id="thirdbanner"
				enctype="multipart/form-data">
				<table class="table ">
					<caption>添加三个主宣</caption>
					<tr>
						<td>主宣图<input type="file" name="file" />
						</td>
						<td><c:forEach items="${requestScope.queryGoods }"
								var="list2" varStatus="num">
								<c:out value="${list2.getGoods_name()}" />
								<br>
								<input type="button" value="上传"
									onclick="insert3banner(<c:out value="${list2.getGoods_id()}" />)" /><br>
							</c:forEach></td>
					</tr>

				</table>
			</form>
		</div>
		<div class="col-md-12 ">
			<c:forEach items="${requestScope.queryGoodsThirdBanner }" var="list3"
				varStatus="num">
				<div class="col-md-4 text-center animate-box">
					<img alt=""
						src="${contextPath}/<c:out value="${list3.getBanner_src()}" />"
						class="img-responsive">
					<hr>
					<input type="button" value="删除"
						onclick="delete_goodsbanner(${list3.getBanner_id()})">
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 ">
			<form class="form-inline" id="fouthbanner"
				enctype="multipart/form-data">
				<table class="table ">
					<caption>添加产品滚动宣传</caption>
					<tr>
						<td><input type="file" name="file" /></td>
						<td><c:forEach items="${requestScope.queryGoods }"
								var="list2" varStatus="num">
								<c:out value="${list2.getGoods_name()}" />
								<br>
								<input type="button" value="上传"
									onclick="insert4banner(<c:out value="${list2.getGoods_id()}" />)" />
							</c:forEach></td>
					</tr>

				</table>
			</form>
		</div>
		<div class="col-md-12 ">
			<c:forEach items="${requestScope.queryGoodsFouthBanner }" var="list3"
				varStatus="num">
				<div class="col-md-4 text-center animate-box">
					<img alt=""
						src="${contextPath}/<c:out value="${list3.getBanner_src()}" />"
						class="img-responsive">
					<hr>
					<input type="button" value="删除"
						onclick="delete_4banner(${list3.getBanner_id()})">
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- jQuery -->
	<script src="${contextPath}/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function updategoodSbG(id) {
			var formData = new FormData($("#goodSbG")[0]);
			$.ajax({
				url : '${contextPath}/updategoodSbG',
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
		function updategoodsbanner(id) {
			var formData = new FormData($("#goodsbanner")[0]);
			formData.append("id",id);
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
		function updategoods(id,oid,num) {
			var goodsintro_inner=$('#goodsintro_inner'+num).val();
			goodsintro_inner=goodsintro_inner.replace(/\n/g,'<br/>');
			goodsintro_inner=goodsintro_inner.replace(/\s/g, '&nbsp;');
			var formData = new FormData($("#updategoods"+num)[0]);
			formData.append("id",id);
			formData.append("oid",oid);
			formData.append("goods_name",$('#goods_name'+num).val());
			formData.append("goodsintro_inner",goodsintro_inner);
			$.ajax({
				url : '${contextPath}/updategoods',
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
		function updategoodsintro(oid_intro,num_intro) {
			var goods_intro=$('#goods_intro'+num_intro).val();
			goods_intro=goods_intro.replace(/\n/g,'<br/>');
			goods_intro=goods_intro.replace(/\s/g, '&nbsp;');
			var formData = new FormData($("#updategoodsintro"+num_intro)[0]);
			formData.append("oid",oid_intro);
			formData.append("goods_intro",goods_intro);
			$.ajax({
				url : '${contextPath}/updategoodsintro',
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
		function delete_4banner(id) {
			$.post(
				"${contextPath}/delete_4banner",
				{
					id : id,
				},
				function(data, textStatus) {
					if (data) {
						alert('OK👌');
						window.location.reload();
					}
				}
			);
		};
		function delete_goodsintro(id_intro) {
			$.post(
				"${contextPath}/delete_goodsintro",
				{
					goodsintroid : id_intro,
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
			var goodsintro=$('#goods_intro').val();
			goodsintro=goodsintro.replace(/\n/g,'<br/>');
			goodsintro=goodsintro.replace(/\s/g, '&nbsp;');
			var formData = new FormData($("#insertgoodsintro")[0]);
			formData.append("goodsintro",goodsintro);
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
			var goodsmain=$('#goodsmain').val();
			goodsmain=goodsmain.replace(/\n/g,'<br/>');
			goodsmain=goodsmain.replace(/\s/g, '&nbsp;');
			$.post(
				"${contextPath}/insertgoodsmain",
				{
					goodsmain:goodsmain,
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
		function insert4banner(id) {
			var formData = new FormData($("#fouthbanner")[0]);
			formData.append("id",id);
			$.ajax({
				url : '${contextPath}/insert4banner',
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
			}else{
				$.post(
					"${contextPath}/judgeToken",
					{
						token:token,
					},
					function(data, textStatus) {
						if (data) {
						}else{
							alert('无效的安全验证（token）,请重新登录:-D');
							location.href="${contextPath}/manager/back.jsp";
						}
					}
				);
			}
		});
		$("#loginout").on("click",function(){
			localStorage.removeItem("token");
			location.href="${contextPath}/manager/back.jsp";
		});
	</script>
</body>
</html>