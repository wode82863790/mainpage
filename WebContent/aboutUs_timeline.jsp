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
<title>关于我们 - 翼开店</title>
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
<!-- timeline -->
<link rel="stylesheet"
	href="${contextPath}/css/jquery.eeyellow.Timeline.css" />
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
										<%-- <li><a href="${contextPath}/queryAboutUsBlog">企业风采</a></li> --%>
									</ul></li>
								<li><a href="${contextPath}/queryGoods">产品中心</a></li>
								<li><a href="${contextPath}/queryJoin">诚聘英才</a></li>
								<li><a href="#">会员入口</a></li>
								<li class="has-dropdown"><a
									href="${contextPath}/queryCall">联系我们</a>
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
		<header id="fh5co-header" class="fh5co-cover " role="banner"
			style="background: aqua;">
			<div class="overlay"></div>
			<p>
				<%
					String banner_src = (String) request.getAttribute("banner_src");
				%>
				<img src="${contextPath}/<%=banner_src %>" alt="banner"
					class="img-responsive img-rounded ">
			</p>
		</header>

		<div id="fh5co-contact">
			<div class="container">
				<div class="row">
					<div class="col-md-2  animate-box">
						<ul>
							<li
								style="line-height: 200%; border-bottom: 1px solid #9CB0B3; list-style: none"><a
								href="${contextPath}/queryAboutUsIntro"><small>公司介绍</small></a></li>
							<li
								style="line-height: 200%; border-bottom: 1px solid #9CB0B3; list-style: none"><a
								href="${contextPath}/queryAboutUsTimeline"><small>发展历程</small></a></li>
							<li
								style="line-height: 200%; border-bottom: 1px solid #9CB0B3; list-style: none"><a
								href="${contextPath}/queryAboutUsNews"><small>新闻中心</small></a></li>
							<li
								style="line-height: 200%; border-bottom: 1px solid #9CB0B3; list-style: none"><a
								href="${contextPath}/queryAboutUsCulture"><small>企业文化</small></a></li>
							<li
								style="line-height: 200%; border-bottom: 1px solid #9CB0B3; list-style: none"><a
								href="${contextPath}/queryAboutUsHonor"><small>企业荣誉</small></a></li>
							<%-- <li
								style="line-height: 200%; border-bottom: 1px solid #9CB0B3; list-style: none"><a
								href="${contextPath}/queryAboutUsBlog"><small>企业风采</small></a></li> --%>
						</ul>
					</div>
					<div class="col-md-10  animate-box" id="about-us">
						<div class="VivaTimeline">
							<dl>
								<c:forEach items="${requestScope.queryTimeline }" var="list"
									varStatus="num">
									<dt>
										<c:out value="${list.getTimeline_date()}" />
									</dt>
									<dd class="pos-left clearfix">
										<div class="circ"></div>
										<div class="events">
											<div class="events-header">
												<c:out value="${list.getTimeline_title()}" />
											</div>
											<div class="events-body">
												<c:out value="${list.getTimeline_inner()}" />
											</div>
										</div>
									</dd>
								</c:forEach>
							</dl>
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
							<small class="block"><i class="fa fa-wechat"></i>官方微信:XXXXX</small>
							<small class="block"><i class="fa fa-comments"></i>微信公众号:XXXXX</small>
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
	<!--timeline-->
	<script src="${contextPath}/js/jquery.eeyellow.Timeline.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.VivaTimeline').vivaTimeline({
				carousel : true,
				carouselTime : 3000
			});
		});
	</script>
</body>
</html>