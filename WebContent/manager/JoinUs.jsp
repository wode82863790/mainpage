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
					<li class="dropdown "><a href="${contextPath}/querybackcall">
							联系我们部分 </a></li>
					<li class="active"><a href="${contextPath}/querybackjoin">招聘部分</a></li>
					<li><a href="${contextPath}/querybackgoods">产品部分</a></li>
					<li><a href="${contextPath}/querybackdown">下载中心部分</a></li>
					<li><a id="loginout">退出到登陆页面</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="row">
		<div class="col-md-12 ">
			<form class="form-inline" id="join_banner">
				<table class="table ">
					<caption>添加/替换招聘宽图</caption>
					<tbody>
						<tr>
							<td><p>
									上传文件： <input type="file" name="file" />
								</p></td>
							<td><p>就是这个图</p> <br> <%
 	String banner_src = (String) request.getAttribute("banner_src");
 %>
								<div class="col-md-6 ">
									<img src="${contextPath}/<%=banner_src %>" alt="news1"
										class="img-responsive ">
								</div></td>
						</tr>
						<tr>
							<td><input type="button" value="上传"
								onclick="updatejoin_banner()" /></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form class="form-inline">
				<table class="table ">
					<caption>添加招聘需求</caption>
					<tr>
						<td>招聘职位：<input id="join_title">
						</td>
						<td>招聘人数：<input id="join_num">人
						</td>
					</tr>
					<tr>
						<td>最低学历：<input id="join_back">
						</td>
						<td>有效期：<input id="join_date">
						</td>
					</tr>
					<tr>
						<td>岗位性质（兼职？全职？）：<input id="join_time">
						</td>
						<td>职位类别（财务？技术？）：<input id="join_class">
						</td>
					</tr>
					<tr>
						<td>工作地点（市）：<input id="join_place">
						</td>
						<td></td>
					</tr>
					<tr>
						<td>工作介绍（要使用换行请输入&lt;br&gt; ,例如“1.条件&lt;br&gt;2.条件”）：<br>
							<textarea rows="10"
								style="width: 400px; padding-top: 1px; font-size: 14px;"
								name="join_inner" id="join_inner"></textarea>
						</td>
						<td>职位需求（要使用换行请输入&lt;br&gt; ,例如“1.条件&lt;br&gt;2.条件”）：<br>
							<textarea rows="10"
								style="width: 400px; padding-top: 1px; font-size: 14px;"
								name="join_need" id="join_need"></textarea>
						</td>
					</tr>
					<tr>
						<td><input type="button" value="提交" onclick="insertjoin()">
						</td>
						<td></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<h4>
				<small>编辑每个招聘信息</small>
			</h4>
			<div class="panel-group" id="accordion">
				<c:forEach items="${requestScope.queryAll }" var="list"
					varStatus="num">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseOne${num.index}"> 点击展开“<c:out
										value="${list.getJoin_title()}" />”
								</a>
								<div class="text-right">
									<input type="button" value="修改提交"
										onclick="update_join(<c:out value="${list.getJoin_id()}" />,${num.index})">
									<input type="button"
										onclick="deletejoin(<c:out value="${list.getJoin_id()}" />)"
										value="删除">
								</div>

							</h4>
						</div>
						<div id="collapseOne${num.index}" class="panel-collapse collapse">
							<form class="form-inline" id="updatejoin${num.index}"
								enctype="multipart/form-data">
								<div class="panel-body">
									<table class="table">
										<tr>
											<td>招聘职位：<input id="join_title${num.index}"
												value="<c:out value="${list.getJoin_title()}" />">
											</td>
											<td>招聘人数：<input id="join_num${num.index}"
												value="<c:out value="${list.getJoin_num()}" />">人
											</td>
										</tr>
										<tr>
											<td>最低学历：<input id="join_back${num.index}"
												value="<c:out value="${list.getJoin_back()}" />">
											</td>
											<td>有效期：<input id="join_date${num.index}"
												value="<c:out value="${list.getJoin_date()}" />">
											</td>
										</tr>
										<tr>
											<td>岗位性质（兼职？全职？）：<input id="join_time${num.index}"
												value="<c:out value="${list.getJoin_time()}" />">
											</td>
											<td>职位类别（财务？技术？）：<input id="join_class${num.index}"
												value="<c:out value="${list.getJoin_class()}" />">
											</td>
										</tr>
										<tr>
											<td>工作地点（市）：<input id="join_place${num.index}"
												value="<c:out value="${list.getJoin_place()}" />">
											</td>
											<td></td>
										</tr>
										<tr>
											<td>工作介绍（要使用换行请输入&lt;br&gt; ,例如“1.条件&lt;br&gt;2.条件”）：<br>
												<textarea rows="10"
													style="width: 400px; padding-top: 1px; font-size: 14px;"
													name="join_inner${num.index}" id="join_inner${num.index}"><c:out value="${list.getJoin_inner()}" /></textarea>
											</td>
											<td>职位需求（要使用换行请输入&lt;br&gt; ,例如“1.条件&lt;br&gt;2.条件”）：<br>
												<textarea rows="10"
													style="width: 400px; padding-top: 1px; font-size: 14px;"
													name="join_need${num.index}" id="join_need${num.index}"><c:out value="${list.getJoin_need()}" /></textarea>
											</td>
										</tr>
									</table>
								</div>
							</form>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- jQuery -->
	<script src="${contextPath}/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function insertjoin() {
			$.post("${contextPath}/insertjoin", {
				join_title : $("#join_title").val(),
				join_num : $("#join_num").val(),
				join_back : $("#join_back").val(),
				join_date : $("#join_date").val(),
				join_time : $("#join_time").val(),
				join_class : $("#join_class").val(),
				join_place : $("#join_place").val(),
				join_inner : $("#join_inner").val(),
				join_need : $("#join_need").val(),
			}, function(data, textStatus) {
				if (data) {
					alert('OK👌');
					window.location.reload();
				} else {
					alert('怎么可能会失败呢请联系技术');
				}
			});
		};
		function update_join(id,num) {
			$.post("${contextPath}/updatejoin", {
				id:id,
				join_title : $("#join_title"+num).val(),
				join_num : $("#join_num"+num).val(),
				join_back : $("#join_back"+num).val(),
				join_date : $("#join_date"+num).val(),
				join_time : $("#join_time"+num).val(),
				join_class : $("#join_class"+num).val(),
				join_place : $("#join_place"+num).val(),
				join_inner : $("#join_inner"+num).val(),
				join_need : $("#join_need"+num).val(),
			}, function(data, textStatus) {
				if (data) {
					alert('OK👌');
					window.location.reload();
				} else {
					alert('怎么可能会失败呢请联系技术');
				}
			});
		};
		function deletejoin(id) {
			$.post("${contextPath}/deletejoin", {
				joinid : id,
			}, function(data, textStatus) {
				if (data) {
					alert('OK👌');
					window.location.reload();
				} else {
					alert('怎么可能会失败呢请联系技术');
				}
			});
		};
		function updatejoin_banner() {
			var formData = new FormData($("#join_banner")[0]);
			$.ajax({
				url : '${contextPath}/updatejoin_banner',
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
		$().ready(function() {
			var token = localStorage.getItem("token");
			if (token == null) {
				alert('你还没有登录');
				location.href = "${contextPath}/manager/back.jsp";
			} else {
				$.post("${contextPath}/judgeToken", {
					token : token,
				}, function(data, textStatus) {
					if (data) {
					} else {
						alert('无效的安全验证（token）,请重新登录:-D');
						location.href = "${contextPath}/manager/back.jsp";
					}
				});
			}
		});
		$("#loginout").on("click", function() {
			localStorage.removeItem("token");
			location.href = "${contextPath}/manager/back.jsp";
		});
	</script>
</body>
</html>