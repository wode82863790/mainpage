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
<style type="text/css">
.form-bg {
	background: #00b4ef;
}

.form-horizontal {
	background: #fff;
	padding-bottom: 40px;
	border-radius: 15px;
	text-align: center;
}

.form-horizontal .heading {
	display: block;
	font-size: 35px;
	font-weight: 700;
	padding: 35px 0;
	border-bottom: 1px solid #f0f0f0;
	margin-bottom: 30px;
}

.form-horizontal .form-group {
	padding: 0 40px;
	margin: 0 0 25px 0;
	position: relative;
}

.form-horizontal .form-control {
	background: #f0f0f0;
	border: none;
	border-radius: 20px;
	box-shadow: none;
	padding: 0 20px 0 45px;
	height: 40px;
	transition: all 0.3s ease 0s;
}

.form-horizontal .form-control:focus {
	background: #e0e0e0;
	box-shadow: none;
	outline: 0 none;
}

.form-horizontal .form-group i {
	position: absolute;
	top: 12px;
	left: 60px;
	font-size: 17px;
	color: #c8c8c8;
	transition: all 0.5s ease 0s;
}

.form-horizontal .form-control:focus+i {
	color: #00b4ef;
}

.form-horizontal .fa-question-circle {
	display: inline-block;
	position: absolute;
	top: 12px;
	right: 60px;
	font-size: 20px;
	color: #808080;
	transition: all 0.5s ease 0s;
}

.form-horizontal .fa-question-circle:hover {
	color: #000;
}

.form-horizontal .main-checkbox {
	float: left;
	width: 20px;
	height: 20px;
	background: #11a3fc;
	border-radius: 50%;
	position: relative;
	margin: 5px 0 0 5px;
	border: 1px solid #11a3fc;
}

.form-horizontal .main-checkbox label {
	width: 20px;
	height: 20px;
	position: absolute;
	top: 0;
	left: 0;
	cursor: pointer;
}

.form-horizontal .main-checkbox label:after {
	content: "";
	width: 10px;
	height: 5px;
	position: absolute;
	top: 5px;
	left: 4px;
	border: 3px solid #fff;
	border-top: none;
	border-right: none;
	background: transparent;
	opacity: 0;
	-webkit-transform: rotate(-45deg);
	transform: rotate(-45deg);
}

.form-horizontal .main-checkbox input[type=checkbox] {
	visibility: hidden;
}

.form-horizontal .main-checkbox input[type=checkbox]:checked+label:after
	{
	opacity: 1;
}

.form-horizontal .text {
	float: left;
	margin-left: 7px;
	line-height: 20px;
	padding-top: 5px;
	text-transform: capitalize;
}

.form-horizontal .btn {
	float: right;
	font-size: 14px;
	color: #fff;
	background: #00b4ef;
	border-radius: 30px;
	padding: 10px 25px;
	border: none;
	text-transform: capitalize;
	transition: all 0.5s ease 0s;
}

@media only screen and (max-width: 479px) {
	.form-horizontal .form-group {
		padding: 0 25px;
	}
	.form-horizontal .form-group i {
		left: 45px;
	}
	.form-horizontal .btn {
		padding: 10px 20px;
	}
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
				<form class="form-horizontal">
					<span class="heading">后台登录</span>
					<div class="form-group">
						<input class="form-control" id="userName" name="userName"
							placeholder="维护账户" required="required"> <i
							class="fa fa-user"></i>
					</div>
					<div class="form-group help">
						<input type="password" class="form-control" id="password"
							name="password" placeholder="密　码" required="required"> <i
							class="fa fa-lock"></i>
					</div>
					<div class="form-group">
						<spanp>请使用Chrome（谷歌）或具有Chrome内核的浏览器</spanp>
						<button class="btn btn-default" id="login">登录</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- jQuery -->
	<script src="${contextPath}/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${contextPath}/js/bootstrap.min.js"></script>
	<script>
		$('#login').on('click', function(e) {
			window.event.returnValue = false;
			var userName = $.trim($('#userName').val());
			var password = $.trim($('#password').val());
			$.ajax({
				type : "post",
				url : "${contextPath}/back_login",
				data : {
					userName : userName,
					password : password
				},
				dataType : 'json',
				success : function(resp) {
					alert(resp.msg);
					if (resp.success) {
						//将token存在本地存储，然后跳转到主页面
						localStorage.setItem('token', resp.token);
						location.href = "${contextPath}/querycommon";
					}
				},
				error : function(resp) {
					alert('怎么可能会失败呢请联系技术');
				}
			});
		})
	</script>
</body>
</html>