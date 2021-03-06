<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="theme-color" content="#fff">
<title>产品中心 - 山东挥付</title>
<!-- <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,700,800" rel="stylesheet">	 -->
<link href="https://fonts.googleapis.com/css?family=Inconsolata:400,700"
	rel="stylesheet">
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Animate.css -->
<link rel="stylesheet" href="${contextPath}/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="${contextPath}/css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="${contextPath}/css/bootstrap.css">
<!-- Flexslider  -->
<link rel="stylesheet" href="${contextPath}/css/flexslider.css">
<!-- Swiper -->
<link rel="stylesheet" href="${contextPath}/css/swiper-3.4.2.min.css">
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
						<div class="col-md-1"></div>
						<div class="col-md-9 text-left menu-1">
							<ul>
								<li><a href="${contextPath}/index">主页</a></li>
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
								<li class="active"><a href="${contextPath}/queryGoods">产品中心</a></li>
								<li><a href="${contextPath}/queryDown">下载中心</a></li>
								<li><a href="${contextPath}/queryJoin">诚聘英才</a></li>
								<li><a href="#" onclick="erreor()">会员入口</a></li>
								<li class="has-dropdown"><a href="${contextPath}/queryCall">联系我们</a>
									<ul class="dropdown">
										<li><a href="${contextPath}/queryHelp">帮助中心</a></li>
										<li><a href="${contextPath}/queryAlly">加盟代理</a></li>
										<li><a href="${contextPath}/queryCall">合作伙伴</a></li>
									</ul></li>
								<li>
							</ul>
						</div>
						<div class="col-md-2">
							<div id="fh5co-logo">
								<%
									String logo_src = (String) request.getAttribute("logo_src");
								%>
								<a href="${contextPath}/index"><img alt=""
									src="${contextPath}/<%=logo_src %>"></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</nav>
		<header class="fh5co-header">
			<div class="overlay"></div>
			<p>
				<%
					String banner_src = (String) request.getAttribute("banner_src2");
				%>
				<img src="${contextPath}/<%=banner_src %>" alt="banner"
					class="img-responsive img-rounded ">
			</p>
			<div class="row">
				<c:forEach items="${requestScope.queryGoodsThirdBanner }" var="list"
					varStatus="num">
					<div class="col-md-4">
						<div class="fh5co-portfolio animate-box">
							<a
								href="${contextPath}/queryGoodsInner?id=<c:out value="${list.getBanner_outid()}" />">
								<div class="portfolio-entry"
									style="background-image: url(${contextPath}/<c:out value="${list.getBanner_src()}" />);"></div>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</header>
		<div id="fh5co-contact">
			<div class="container">
				<div class="row">
					<div class="col-md-3 animate-box ">
						<h4 class="text-center">
							<i class="fa fa-shopping-bag" style="color: #DD356E;"></i>产品列表
						</h4>
						<ul>
							<c:forEach items="${requestScope.queryGoods }" var="list2"
								varStatus="num">
								<li
									style="line-height: 300%; border-bottom: 1px solid #9CB0B3; list-style: none"><a
									href="${contextPath}/queryGoodsInner?id=<c:out value="${list2.getGoods_id()}" />"><c:out
											value="${list2.getGoods_name()}" /></a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="col-md-9  animate-box">
						<div class="page-header">
							<h4>产品展示</h4>
						</div>
						<div class="row">
							<!-- Swiper -->
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<c:forEach items="${requestScope.queryGoods }" var="list3"
										varStatus="num">
										<div class="swiper-slide">
											<a
												href="${contextPath}/queryGoodsInner?id=<c:out value="${list3.getGoods_id()}" />"><img
												alt="a1"
												src="${contextPath}/<c:out value="${list3.getGoods_mainimg()}" />"
												class=" img-responsive "></a>
										</div>
									</c:forEach>
								</div>
								<!-- Add Scrollbar -->
								<div class="swiper-scrollbar"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer id="fh5co-footer" role="contentinfo">
			<div class="container">
				<div class="row copyright">
					<div class="col-md-6 text-left">
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
	<!-- Swiper -->
	<script src="${contextPath}/js/swiper-3.4.2.min.js"></script>
	<!-- Layer -->
	<script src="${contextPath}/js/layer.js"></script>
	<!-- Initialize Swiper -->
	<script>
		var swiper = new Swiper('.swiper-container', {
			pagination : '.swiper-pagination',
			paginationClickable : true,
			slidesPerView : 4,
			spaceBetween : 50,
			breakpoints : {
				1024 : {
					slidesPerView : 4,
					spaceBetween : 40
				},
				768 : {
					slidesPerView : 3,
					spaceBetween : 30
				},
				640 : {
					slidesPerView : 2,
					spaceBetween : 20
				},
				320 : {
					slidesPerView : 1,
					spaceBetween : 10
				}
			},
			autoplay : 2500,
			autoplayDisableOnInteraction : false
		});
	</script>
	<script type="text/javascript">
		function erreor() {
			layer.msg('十分抱歉，此功能尚未上线。');
		}
	</script>
</body>
</html>