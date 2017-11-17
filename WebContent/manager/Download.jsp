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
		<div class="col-md-6 ">
			<form class="form-inline" id="insertdown"
				enctype="multipart/form-data">
				<table class="table table-bordered">
					<tr>
						<td>添加新的下载</td>
					</tr>
					<tr>
						<td>标题<input id="down_name">
						</td>
					</tr>
					<tr>
						<td>下载说明<textarea rows="10"
								style="width: 400px; padding-top: 1px; font-size: 14px;"
								name="down_inner" id="down_inner"></textarea>
						</td>
					</tr>
					<tr>
						<td>主图（只一张）<input type="file" name="file" />
						</td>
					</tr>
					<tr>
						<td>下载链接<input id="down_url">
						</td>
					</tr>
					<tr>
						<td><input type="button" value="提交" onclick="insertdown()"></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-6 ">
			<c:forEach items="${requestScope.queryDown }" var="list4"
				varStatus="num">
				<div class="col-md-3  animate-box">
					<c:out value="${list4.getDown_name()}" />
					<img
						src="${contextPath}/<c:out value="${list4.getDown_img()}" />"
						alt="news1" class="img-responsive "><input type="button" value="删除"
						onclick="delete_down(<c:out value="${list4.getDown_id()}" />)">
				</div>
			</c:forEach>
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
		formData.append("url",$('#down_url').val());
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