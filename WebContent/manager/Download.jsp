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
					<li class=" "><a href="${contextPath}/querylit"> 关于我们部分 </a></li>
					<li class="dropdown "><a href="${contextPath}/querybackcall">
							联系我们部分 </a></li>
					<li><a href="${contextPath}/querybackjoin">招聘部分</a></li>
					<li><a href="${contextPath}/querybackgoods">产品部分</a></li>
					<li class="active"><a href="${contextPath}/querybackdown">下载中心部分</a></li>
					<li><a id="loginout">退出到登陆页面</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="row">
		<div class="col-md-12 ">
			<form class="form-inline" id="insertdown"
				enctype="multipart/form-data">
				<table class="table ">
					<caption>添加App</caption>
					<tbody>
						<tr>
							<td>app名称<br> <input id="down_name"></td>
							<td>app图标<br> <input type="file" name="file" /></td>
						</tr>
						<tr>
							<td>安卓下载链接<br> <input id="down_url_1"></td>
							<td>苹果下载链接<br> <input id="down_url_2"></td>
						</tr>
						<tr>
							<td>下载说明<br> <textarea rows="10"
									style="width: 400px; padding-top: 1px; font-size: 14px;"
									name="down_inner" id="down_inner"></textarea></td>
						</tr>
						<tr>
							<td><input type="button" value="提交" onclick="insertdown()"></td>
						</tr>

					</tbody>
				</table>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 ">
			<table class="table">
				<caption>编辑每个App信息</caption>
				<thead>
					<tr>
						<th>app名称</th>
						<th>app图标</th>
						<th>安卓连接</th>
						<th>苹果连接</th>
						<th>app说明</th>
						<th></th>
					</tr>
				</thead>
				<c:forEach items="${requestScope.queryDown }" var="list4"
					varStatus="num">
					<form class="form-inline" id="updatedown${num.index}"
						enctype="multipart/form-data">
					<tbody>
						<tr>
							<td><input value="<c:out value="${list4.getDown_name()}" />"
								id="down_name${num.index}"></td>
							<td><img alt=""
								src="${contextPath}/<c:out value="${list4.getDown_img()}" />"
								style="width: 10%"> <input type="file" name="file" /></td>
							<td><input
								value="<c:out value="${list4.getDown_url_Android()}" />"
								id="down_url_1${num.index}"></td>
							<td><input
								value="<c:out value="${list4.getDown_url_iOS()}" />"
								id="down_url_2${num.index}"></td>
							<td><input
								value="<c:out value="${list4.getDown_inner()}" />"
								id="down_inner${num.index}"></td>
							<td><input type="button" value="修改提交"
								onclick="update_down(<c:out value="${list4.getDown_id()}" />,${num.index})">
								<input type="button" value="删除"
								onclick="delete_down(<c:out value="${list4.getDown_id()}" />)"></td>
						</tr>
					</tbody>
					</form>
				</c:forEach>

			</table>

		</div>
	</div>
	<!-- jQuery -->
	<script src="${contextPath}/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	function insertdown() {
		var formData = new FormData($('#insertdown')[0]);
		formData.append("name",$('#down_name').val());
		formData.append("inner",$('#down_inner').val());
		formData.append("url1",$('#down_url_1').val());
		formData.append("url2",$('#down_url_2').val());
		$.ajax({  
	          url: '${contextPath}/insertdown' ,  
	          type: 'POST',  
	          data: formData,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (returndata) {  
	        	 		alert('OK👌');
					window.location.reload();
	          },  
	          error: function (returndata) {  
	              alert(returndata);  
	          }  
	     });  
	};
	function update_down(id,num) {
		var formData = new FormData($('#updatedown'+num)[0]);
		formData.append("id",id);
		formData.append("name",$('#down_name'+num).val());
		formData.append("inner",$('#down_inner'+num).val());
		formData.append("url1",$('#down_url_1'+num).val());
		formData.append("url2",$('#down_url_2'+num).val());
		$.ajax({  
	          url: '${contextPath}/updatedown' ,  
	          type: 'POST',  
	          data: formData,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (returndata) {  
	        	 		alert('OK👌');
					window.location.reload();
	          },  
	          error: function (returndata) {  
	              alert(returndata);  
	          }  
	     });  
	};
	function delete_down(id) {
		$.post("${contextPath}/delete_down", {
			downid: id,
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