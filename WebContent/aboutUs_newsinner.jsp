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
<title>新闻 - 山东挥付</title>
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
		<nav class="fh5co-nav  " role="navigation">
			<div class="top-menu">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-9 text-left menu-1">
							<ul>
								<li><a href="index">主页</a></li>
								<li class="has-dropdown active"><a
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
								<li><a href="${contextPath}/queryJoin">诚聘英才</a></li>
								<li><a href="#">会员入口</a></li>
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
		<div id="fh5co-contact">
			<div class="container">
				<div class="col-md-12 animate-box">
					<div class="column">
						<div class="page-header">
							<%
								String news_date = (String) request.getAttribute("news_date");
								String news_inner = (String) request.getAttribute("news_inner");
								String news_title = (String) request.getAttribute("news_title");
							%>
							<h4>新闻中心</h4>
						</div>
						<h2 class="text-center"><%=news_title%></h2>
						<p class="text-center">
							<small style="color: gray;">时间：<%=news_date%></small>
						</p>
						<hr>
						<p>
							<c:forEach items="${requestScope.queryNewsInnerImg }" var="list"
								varStatus="num">
								<img alt=""
									src="${contextPath}/<c:out value="${list.getNewsimg_src()}" />"
									class="img-responsive center-block">
							</c:forEach>
						</p>
						<p><%=news_inner%></p>
						<hr>
						<div class="bshare-custom">
							<a title="分享到QQ空间" class="bshare-qzone"></a><a title="分享到新浪微博"
								class="bshare-sinaminiblog"></a><a title="分享到人人网"
								class="bshare-renren"></a><a title="分享到腾讯微博" class="bshare-qqmb"></a><a
								title="分享到网易微博" class="bshare-neteasemb"></a><a title="更多平台"
								class="bshare-more bshare-more-icon more-style-addthis"></a><span
								class="BSHARE_COUNT bshare-share-count">0</span>
						</div>
						<hr style="border-style: dashed; width: 75%;">
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
	<script type="text/javascript" charset="utf-8"
		src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
	<script type="text/javascript" charset="utf-8"
		src="http://static.bshare.cn/b/bshareC0.js"></script>
</body>
</html>