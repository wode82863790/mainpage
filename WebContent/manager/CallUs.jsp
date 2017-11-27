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
					<li><a id="loginout">退出到登陆页面</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="row">
		<div class="col-md-12 ">
			<form class="form-inline" id="callus_bank">
				<table class="table ">
					<caption>添加银行logo</caption>
					<tr>
						<td><p>
								上传文件： <input type="file" name="file" />
							</p></td>
						<td><input type="button" value="上传" onclick="insertbank()" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-12 ">
			<c:forEach items="${requestScope.queryBank }" var="list"
				varStatus="num">
				<div class="col-md-2 text-center animate-box">
					<img
						src="${contextPath}/<c:out value="${list.getCallusimg_src()}" />"
						alt="news1" class="img-responsive ">
					<hr>
					<input type="button" value="删除"
						onclick="deletebank(${list.getCallusimg_id()})">
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 ">
			<form class="form-inline" id="callus_store">
				<table class="table ">
					<caption>添加商户logo</caption>
					<tr>
						<td><p>
								上传文件： <input type="file" name="file" />
							</p></td>
						<td><input type="button" value="上传" onclick="insertstore()" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-12 ">
			<c:forEach items="${requestScope.queryStore }" var="list"
				varStatus="num">
				<div class="col-md-2 text-center animate-box">
					<img
						src="${contextPath}/<c:out value="${list.getCallusimg_src()}" />"
						alt="news1" class="img-responsive ">
					<hr>
					<input type="button" value="删除"
						onclick="deletestore(${list.getCallusimg_id()})">
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 ">
			<form class="form-inline">
				<table class="table">
					<caption>添加问答</caption>
					<tr>
						<td>问题:<input id="helpask" /></td>
						<td><p>
								回答内容：（要使用换行请输入&lt;br&gt; ,例如“1.条件&lt;br&gt;2.条件”）<br>
								<textarea rows="10"
									style="width: 400px; padding-top: 1px; font-size: 14px;"
									id="helpans"></textarea>
							</p></td>
					</tr>
					<tr>
						<td><input type="button" value="添加" onclick="inserthelp()" /></td>
						<td></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-12 ">
			<table class="table">
				<caption>编辑问答</caption>
				<thead>
					<tr>
						<th>问题</th>
						<th>回答</th>
						<th></th>
					</tr>
				</thead>
				<c:forEach items="${requestScope.queryHelp }" var="list3"
					varStatus="num">
					<tbody>
						<tr>
							<td><input id="helpask${num.index}"
								value="<c:out value="${list3.getHelp_ask()}" />" /></td>
							<td><textarea rows="10"
									style="width: 400px; padding-top: 1px; font-size: 14px;"
									id="helpans${num.index}"><c:out value="${list3.getHelp_ans()}" /></textarea></td>
							<td><input type="button" value="修改"
								onclick="update_help(${list3.getHelp_id()},${num.index})"><input
								type="button" value="删除"
								onclick="delete_help(${list3.getHelp_id()})"></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 ">
			<form class="form-inline">
				<table class="table">
					<caption>添加合作伙伴</caption>
					<tr>
						<td>合作伙伴姓名/称呼:<input id="allyname" /></td>
						<td><p>
								合作伙伴联系方式： <input id="allycall" />
							</p></td>
						<td><input type="button" value="添加" onclick="insertally()" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-12">
			<table class="table">
				<caption>编辑合作伙伴</caption>
				<thead>
					<tr>
						<th>合作伙伴姓名/称呼</th>
						<th>合作伙伴联系方式</th>
						<th></th>
					</tr>
				</thead>
				<c:forEach items="${requestScope.queryAlly }" var="list4"
					varStatus="num">
					<tbody>
						<tr>
							<td><input id="allyname${num.index}"
								value="<c:out value="${list4.getAlly_name()}" />" /></td>
							<td><input id="allycall${num.index}"
								value="<c:out value="${list4.getAlly_call()}" />" /></td>
							<td><input type="button" value="修改"
								onclick="update_ally(${list4.getAlly_id()},${num.index})"><input
								type="button" value="删除"
								onclick="delete_ally(${list4.getAlly_id()})"></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
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
		function update_help(id,help_num) {
			$.post("${contextPath}/updatehelp", {
				id:id,
				helpask:$('#helpask'+help_num).val(),
				helpans:$('#helpans'+help_num).val(),	
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
		function update_ally(ally_id,ally_num) {
			$.post("${contextPath}/update_ally", {
				id:ally_id,
				allyname:$('#allyname'+ally_num).val(),
				allycall:$('#allycall'+ally_num).val(),	
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