<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="theme-color" content="#fff">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>首页 - 山东挥付</title>
<link href="https://fonts.googleapis.com/css?family=Inconsolata:400,700"
	rel="stylesheet">
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Animate.css -->
<link rel="stylesheet" href="${contextPath}/css/animate.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="${contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${contextPath}/css/carousel-ani.css">
<!-- Flexslider  -->
<link rel="stylesheet" href="${contextPath}/css/flexslider.css">
<!-- Theme style  -->
<link rel="stylesheet" href="${contextPath}/css/style.css">
<!-- Modernizr JS -->
<script src="${contextPath}/js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<!--载入动画-->
	<div class="fh5co-loader"></div>
	<div id="page">
		<nav class="fh5co-nav" role="navigation">
			<div class="top-menu">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-1 "></div>
						<div class="col-md-9  menu-1">
							<ul>
								<li class="active"><a href="${contextPath}/index">主页</a></li>
								<li class="has-dropdown"><a
									href="${contextPath}/queryAboutUsIntro">关于我们</a>
									<ul class="dropdown ">
										<li><a href="${contextPath}/queryAboutUsIntro">公司介绍</a></li>
										<li><a href="${contextPath}/queryAboutUsTimeline">发展历程</a></li>
										<li><a href="${contextPath}/queryAboutUsNews">新闻中心</a></li>
										<li><a href="${contextPath}/queryAboutUsCulture">企业文化</a></li>
										<li><a href="${contextPath}/queryAboutUsHonor">企业荣誉</a></li>
										<li><a href="${contextPath}/queryAboutUsBlog">企业风采</a></li>
									</ul></li>
								<li><a href="${contextPath}/queryGoods">产品中心</a></li>
								<li><a href="${contextPath}/queryDown">下载中心</a></li>
								<li><a href="${contextPath}/queryJoin">诚聘英才</a></li>
								<li><a href="#" onclick="erreor()">会员入口</a></li>
								<li class="has-dropdown"><a href="${contextPath}/queryCall">联系我们</a>
									<ul class="dropdown">
										<li><a href="${contextPath}/queryHelp">帮助中心</a></li>
										<li><a href="${contextPath}/queryAlly">加盟代理</a></li>
										<li><a href="${contextPath}/queryCall">合作伙伴</a></li>
									</ul></li>
							</ul>
						</div>
						<div class="col-md-2">
							<div id="fh5co-logo">
								<a href="${contextPath}/index"><img alt=""
									src="${contextPath}/images/logo.jpg"></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</nav>
		<header id="fh5co-header" class="fh5co-cover " role="banner">
			<div class="overlay"></div>
			<!-- 轮播 -->
			<div id="myCarousel" class="carousel slide carousel-fade">
				<div class="carousel-inner">
					<%
						String mbanner_src = (String) request.getAttribute("mbanner_src");
					%>
					<div class="item active">
						<a href="#"><img src="${contextPath}/<%= mbanner_src%>"
							alt="Second slide" class="img-rounded"></a>
					</div>
					<c:forEach items="${requestScope.queryBanner}" var="list"
						varStatus="num">
						<div class="item">
							<a href="#"><img
								src="${contextPath}/<c:out value="${list.getBanner_src()}" />"
								alt="First slide" class="img-rounded"></a>
						</div>
					</c:forEach>
				</div>
			</div>
		</header>
		<div style="margin-bottom: 50px; margin-top: 50px">
			<div class="row">
				<div class="col-xs-3">
					<div class="text-center">
						<a href="#"> <i class="fa fa-user-o fa-3x"></i><br>个人支付
						</a>
					</div>

				</div>
				<div class="col-xs-3">
					<div class="text-center">
						<a href="#"> <i class="fa fa-paypal fa-3x"></i><br>跨境支付
						</a>
					</div>
				</div>
				<div class="col-xs-3">
					<div class="text-center">
						<a href="#"> <i class="fa fa-money fa-3x"></i><br>商户收单
						</a>
					</div>
				</div>
				<div class="col-xs-3">
					<div class="text-center">
						<a href="#"> <i class="fa fa-file-text-o fa-3x"></i><br>挥付信整
						</a>
					</div>
				</div>
			</div>
		</div>
		<footer id="fh5co-footer" role="contentinfo">
			<div class="container">
				<div class="row copyright">
					<div class="col-md-6 text-left ">
						<p>
							<small class="block"><i class="fa fa-phone"></i>联系方式:4009-222-166</small>
							<small class="block"><i class="fa fa-wechat"></i>官方微信:18253118868（挥付云商客服）</small>
							<small class="block"><i class="fa fa-comments"></i>微信公众号:zcl@hfpay.net</small>
						</p>
					</div>
					<div class="col-md-3"></div>
					<div class="col-md-3 ">
						<div class="column">
							<small class="block"><i class="fa fa-qrcode"></i>微信二维码:</small>
							<div style="width: 100px; height: 100px">
								<img alt="" src="${contextPath}/images/qr.jpg"
									class="img-rounded img-responsive">
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</div>
	<!-- jQuery -->
	<script src="${contextPath}/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="${contextPath}/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${contextPath}/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${contextPath}/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="${contextPath}/js/jquery.flexslider-min.js"></script>
	<!-- Main -->
	<script src="${contextPath}/js/main.js"></script>
	<!-- Layer -->
	<script src="${contextPath}/js/layer.js"></script>
	<script>
		$(function() {
			$().ready(function() {
				$("#myCarousel").carousel({
					interval : 3000
				});
			});
		})
		function erreor() {
			layer.msg('十分抱歉，此功能尚未上线。');
		}
	</script>
</body>
<!--
author:张鼎
made with love and joy：）
  -->
</html>