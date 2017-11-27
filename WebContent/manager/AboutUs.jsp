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
<!--Fileinput-->
<link rel="stylesheet" href="${contextPath}/css/fileinput.css">
<style type="text/css">
</style>
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
					<li class="active "><a href="${contextPath}/querylit">
							关于我们部分 </a></li>
					<li class="dropdown "><a href="${contextPath}/querybackcall">
							联系我们部分 </a></li>
					<li><a href="${contextPath}/querybackjoin">招聘部分</a></li>
					<li><a href="${contextPath}/querybackgoods">产品部分</a></li>
					<li><a href="${contextPath}/querybackdown">下载中心部分</a></li>
					<li><a id="loginout">退出到登陆页面</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="row">
		<div class="col-md-12 ">
			<form class="form-inline" id="aboutUSinner">
				<table class="table">
					<caption>添加/修改公司介绍</caption>
					<tr>
						<td><p>
								编辑内容：<br>
								<textarea rows="10"
									style="width: 400px; padding-top: 1px; font-size: 14px;"
									name="text"></textarea>
							</p></td>
						<td>
							<%
								String aboutus_inner = (String) request.getAttribute("aboutus_inner");
							%>
							<p><%=aboutus_inner%></p>
						</td>
					</tr>
					<tr>
						<td><input type="button" value="提交"
							onclick="updateaboutUSinner()" /></td>
						<td></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6 ">
			<form class="form-inline" id="aboutus_in">
				<table class="table">
					<caption>添加/替换公司介绍的第一张图</caption>
					<tr>
						<td><p>
								上传文件： <input type="file" name="file" />
							</p></td>
						<td>
							<%
								String aboutusimg_src = (String) request.getAttribute("aboutusimg_src");
							%>
							<div class="col-md-6 text-center">
								<img src="${contextPath}/<%=aboutusimg_src %>" alt="news1"
									class="img-responsive ">
							</div>
						</td>
					</tr>
					<tr>
						<td><input type="button" value="上传"
							onclick="updateaboutus_in()" /></td>
						<td></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-6">
			<form class="form-inline" id="aboutus_out">
				<table class="table">
					<caption>添加/替换公司介绍的第二张图</caption>
					<tr>
						<td><p>
								上传文件： <input type="file" name="file" />
							</p></td>
						<td>
							<%
								String aboutusimg_src2 = (String) request.getAttribute("aboutusimg_src2");
							%>
							<div class="col-md-6 text-center">
								<img src="${contextPath}/<%=aboutusimg_src2 %>" alt="news1"
									class="img-responsive ">
							</div>
						</td>
					</tr>
					<tr>
						<td><input type="button" value="上传"
							onclick="updateaboutus_out()" /></td>
						<td></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 ">
			<form class="form-inline" id="aboutus_lit">
				<table class="table">
					<caption>添加公司介绍小图</caption>
					<tr>
						<td><p>
								上传文件： <input type="file" name="file" />
							</p></td>
						<td><input type="button" value="上传"
							onclick="updateaboutus_lit()" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-12 ">
			<c:forEach items="${requestScope.querylit }" var="list"
				varStatus="num">
				<div class="col-md-3 text-center animate-box">
					<img
						src="${contextPath}/<c:out value="${list.getAboutusimg_src()}" />"
						alt="news1" class="img-responsive ">
					<hr>
					<input type="button" value="删除"
						onclick="delete_lit(${list.getAboutusimg_id()})">
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 ">
			<form class="form-inline">
				<table class="table ">
					<caption>添加发展历程</caption>
					<tr>
						<td>标题<input id="title">
						</td>
						<td>年份（如2017）<input id="date">
						</td>
					</tr>
					<tr>
						<td>内容（没有就算了）<input id="inner">
						</td>
						<td><input type="button" value="提交"
							onclick="inserttimeline()"></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-12 ">
			<c:forEach items="${requestScope.queryTimeline }" var="list2"
				varStatus="num">
				<div class="col-md-3 text-center">
					<c:out value="${list2.getTimeline_title()}" />
					<hr>
					<input type="button" value="删除"
						onclick="delete_timeline(${list2.getTimeline_id()})">
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form class="form-inline">
				<table class="table ">
					<caption>添加新闻</caption>
					<tr>
						<td>新闻题目:<input id="newstitle" /></td>
						<td>新闻时间（若浏览器不支持时间插件请使用XXXX-XX-XX的格式写）:<input id="newsdate"
							type="date" /></td>
						<td>新闻简介（不超过200字）:<input id="newslit" /></td>
					</tr>
					<tr>
						<td colspan=3><p>
								编辑内容（要使用换行请输入&lt;br&gt;）：<br>
								<textarea rows="10"
									style="width: 80%; padding-top: 1px; font-size: 14px;"
									name="newsinner" id="newsinner"></textarea>
							</p></td>
					</tr>
					<tr>
						<td><input type="button" value="添加" onclick="insertnews()" /></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-12 ">
			<h4>
				<small>编辑新闻</small>
			</h4>
			<div class="panel-group" id="accordion">
				<c:forEach items="${requestScope.queryNews }" var="list3"
					varStatus="num">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseOne${num.index}"> 点击展开“<c:out
										value="${list3.getNews_title()}" />”
								</a>
								<div class="text-right">
									<input type="button" value="修改提交"
										onclick="update_news(<c:out value="${list3.getNews_id()}" />,${num.index})">
									<input type="button"
										onclick="delete_news(<c:out value="${list3.getNews_id()}" />)"
										value="删除">
								</div>

							</h4>
						</div>
						<div id="collapseOne${num.index}" class="panel-collapse collapse">
							<div class="panel-body">
								<table class="table">
									<tr>
										<td>新闻题目:<input id="newstitle${num.index}"
											value="<c:out value="${list3.getNews_title()}" />" /></td>
										<td>新闻时间（若浏览器不支持时间插件请使用XXXX-XX-XX的格式写）:<input
											id="newsdate${num.index}" type="date"
											value="<c:out value="${list3.getNews_date()}" />" /></td>
										<td>新闻简介（不超过200字）:<input id="newslit${num.index}"
											value="<c:out value="${list3.getNews_lit()}" />" /></td>
									</tr>
									<tr>
										<td colspan=3><p>
												编辑内容（要使用换行请输入&lt;br&gt;）：<br>
												<textarea rows="10"
													style="width: 80%; padding-top: 1px; font-size: 14px;"
													name="newsinner${num.index}" id="newsinner${num.index}"><c:out value="${list3.getNews_inner()}" /></textarea>
											</p></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 ">
			<form id="insertnewsimg" enctype="multipart/form-data">
				<table class="table">
					<caption>上传新闻图片</caption>
					<tr>
						<td>选择上传的图片并在相应新闻标题下点击上传： <input type="file" name="file" /></td>
						<td><c:forEach items="${requestScope.queryNews }" var="list3"
								varStatus="num">
								<c:out value="${list3.getNews_title()}" />
								<input type="button" value="上传"
									onclick="insertnewsimg(<c:out value="${list3.getNews_id()}" />)" />
								<br>
							</c:forEach></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-12 ">
			<c:forEach items="${requestScope.queryAllNewsImg }" var="list10"
				varStatus="num">
				<div class="col-md-1 text-center">
					<img
						src="${contextPath}/<c:out value="${list10.getNewsimg_src()}" />"
						alt="news1" class="img-responsive ">
					<hr>
					<input type="button" value="删除"
						onclick="delete_newsimg(${list10.getNewsimg_id()})">
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 ">
			<form class="form-inline" id="inserthonor"
				enctype="multipart/form-data">
				<table class="table ">
					<caption>添加企业荣誉</caption>
					<tr>
						<td>标题<input id="honor_title">
						</td>
						<td>年份（如2017）<input id="honor_date">
						</td>
					</tr>
					<tr>
						<td>主图（只一张）<input type="file" name="file" />
						</td>
						<td>图片说明<input id="honor_inner">
						</td>
					</tr>
					<tr>
						<td><input type="button" value="提交" onclick="inserthonor()"></td>
						<td></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-12 ">
			<table class="table">
				<caption>编辑每个企业荣誉</caption>
				<thead>
					<tr>
						<td>标题</td>
						<td>年份</td>
						<td>主图</td>
						<td>说明</td>
						<td></td>
					</tr>
				</thead>
				<c:forEach items="${requestScope.queryHonor }" var="list4"
					varStatus="num">
					<form class="form-inline" id="updatehonor${num.index}"
						enctype="multipart/form-data">
						<tr>
							<td><input id="honor_title${num.index}"
								value="<c:out value="${list4.getHonor_title()}" />"></td>
							<td><input id="honor_date${num.index}"
								value="<c:out value="${list4.getHonor_date()}" />"></td>
							<td><img
								src="${contextPath}/<c:out value="${list4.getHonor_src()}" />"
								alt="news1" class="img-responsive " style="width: 100px"><input
								type="file" name="file" /></td>
							<td><input id="honor_inner${num.index}"
								value="<c:out value="${list4.getHonor_inner()}" />"></td>
							<td><input type="button" value="更新"
								onclick="update_honor(${list4.getHonor_id()},${num.index})"><input
								type="button" value="删除"
								onclick="delete_honor(${list4.getHonor_id()})"></td>
						</tr>
					</form>
				</c:forEach>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form class="form-inline" id="insertblog"
				enctype="multipart/form-data">
				<table class="table">
					<caption>添加团建活动</caption>
					<tr>
						<td>标题<input id="blog_title">
						</td>
						<td>团建时间（若浏览器不支持时间插件请使用XXXX-XX-XX的格式写）:<input id="blog_date"
							type="date" /></td>
					</tr>
					<tr>
						<td>主图（只一张）<input type="file" name="file" />
						</td>
						<td><input type="button" value="提交" onclick="insertblog()"></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-12 ">
			<c:forEach items="${requestScope.queryBlog }" var="list5"
				varStatus="num">
				<div class="col-md-2  text-center animate-box">
					<c:out value="${list5.getBlog_title()}" />
					<img
						src="${contextPath}/<c:out value="${list5.getBlog_banner()}" />"
						alt="news1" class="img-responsive "><hr> <input type="button"
						value="删除" onclick="delete_blog(${list5.getBlog_id()})">
				</div>
			</c:forEach>
		</div>
	</div>
	<%-- <div class="row">
		<div class="col-md-6 ">
			<form id="insertblogimg" enctype="multipart/form-data">
				<table class="table table-bordered">
					<tr>
						<td>上传团建图片</td>
					</tr>
					<tr>
						<td>选择上传的图片并在相应新闻标题下点击上传： <input type="file" name="file" /></td>
					</tr>
					<tr>
						<td>图片描述<input id="blogimg_intro">
						</td>
					</tr>
					<c:forEach items="${requestScope.queryBlog }" var="list5"
						varStatus="num">
						<tr>
							<td><c:out value="${list5.getBlog_title()}" /><br> <input
								type="button" value="上传"
								onclick="insertblogimg(<c:out value="${list5.getBlog_id()}" />)" />

							</td>
						</tr>
					</c:forEach>

				</table>
			</form>
		</div>
		<div class="col-md-6 ">
			<c:forEach items="${requestScope.queryCommonWithBlog }" var="list9"
				varStatus="num">
				<div class="col-md-3  animate-box">
					<c:out value="${list9.getBlog_title()}" />
					<br> <img
						src="${contextPath}/<c:out value="${list9.getBlogimg_src()}" />"
						alt="news1" class="img-responsive "> <input type="button"
						value="删除" onclick="delete_blogimg(${list9.getBlogimg_id()})">
				</div>
			</c:forEach>
		</div>
	</div> --%>
	<div class="row">
		<div class="col-md-12 panel panel-default">
			<form enctype="multipart/form-data">
				<h3>批量上传团建照片</h3>
				<input id="file-zh" name="file-zh" type="file" multiple> <select
					size="1" name="blogimg_idd" id="blogimg_idd">
					<c:forEach items="${requestScope.queryBlog }" var="list12"
						varStatus="num">
						<option value="<c:out value="${list12.getBlog_id()}" />"><c:out
									value="${list12.getBlog_title()}" /></option>
					</c:forEach>
				</select>
			</form>
		</div>
		<div class="col-md-12 ">
			<c:forEach items="${requestScope.queryCommonWithBlog }" var="list9"
				varStatus="num">
				<div class="col-md-1  text-center animate-box">
					<c:out value="${list9.getBlog_title()}" />
					<br> <img
						src="${contextPath}/<c:out value="${list9.getBlogimg_src()}" />"
						alt="news1" class="img-responsive "> <hr><input type="button"
						value="删除" onclick="delete_blogimg(${list9.getBlogimg_id()})">
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- jQuery -->
	<script src="${contextPath}/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${contextPath}/js/bootstrap.min.js"></script>
	<!--Fileinput-->
	<script src="${contextPath}/js/fileinput.js"></script>
	<script src="${contextPath}/js/fileinput_zh.js"></script>
	<script type="text/javascript">
		function updateaboutUSinner() {
			var formData = new FormData($("#aboutUSinner")[0]);
			$.ajax({
				url : '${contextPath}/updateaboutUsinner',
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
		function updates_banner() {
			var formData = new FormData($("#s_banner")[0]);
			$.ajax({
				url : '${contextPath}/updates_banner',
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
		function updateaboutus_in() {
			var formData = new FormData($("#aboutus_in")[0]);
			$.ajax({
				url : '${contextPath}/updateaboutus_in',
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
		function updateaboutus_out() {
			var formData = new FormData($("#aboutus_out")[0]);
			$.ajax({
				url : '${contextPath}/updateaboutus_out',
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
		function updateaboutus_lit() {
			var formData = new FormData($("#aboutus_lit")[0]);
			$.ajax({
				url : '${contextPath}/updateaboutus_lit',
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
		function delete_lit(id) {
			$.post(
				"${contextPath}/delete_lit",
				{
					litid : id,
				},
				function(data, textStatus) {
					if (data) {
						alert('OK👌');
						window.location.reload();
					}
				}
			);
		};
		function delete_timeline(id) {
			$.post(
				"${contextPath}/delete_timeline",
				{
					timelineid : id,
				},
				function(data, textStatus) {
					if (data) {
						alert('OK👌');
						window.location.reload();
					}
				}
			);
		};
		function delete_news(id) {
			$.post(
				"${contextPath}/delete_news",
				{
					newsid : id,
				},
				function(data, textStatus) {
					if (data) {
						alert('OK👌');
						window.location.reload();
					}
				}
			);
		};
		function delete_honor(id) {
			$.post(
				"${contextPath}/delete_honor",
				{
					honorid : id,
				},
				function(data, textStatus) {
					if (data) {
						alert('OK👌');
						window.location.reload();
					}
				}
			);
		};
		function delete_blog(id) {
			$.post(
				"${contextPath}/delete_blog",
				{
					blogid : id,
				},
				function(data, textStatus) {
					if (data) {
						alert('OK👌');
						window.location.reload();
					}
				}
			);
		};
		function delete_blogimg(id) {
			$.post(
				"${contextPath}/delete_blogimg",
				{
					blogimgid : id,
				},
				function(data, textStatus) {
					if (data) {
						alert('OK👌');
						window.location.reload();
					}
				}
			);
		};
		function inserttimeline() {
			$.post(
				"${contextPath}/inserttimeline",
				{
					timelinetitle:$("#title").val(),
					timelinedate:$("#date").val(),
					timelineinner:$("#inner").val()
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
		function insertnews() {
			$.post(
				"${contextPath}/insertnews",
				{
					newstitle:$("#newstitle").val(),
					newslit:$("#newslit").val(),
					newsdate:$("#newsdate").val(),
					newsinner:$("#newsinner").val()
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
		function update_news(id,news_num) {
			$.post(
				"${contextPath}/update_news",
				{
					newsid:id,
					newstitle:$("#newstitle"+news_num).val(),
					newslit:$("#newslit"+news_num).val(),
					newsdate:$("#newsdate"+news_num).val(),
					newsinner:$("#newsinner"+news_num).val()
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
		function delete_newsimg(id) {
			$.post(
				"${contextPath}/delete_newsimg",
				{
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
		function insertnewsimg(id) {
			var formData = new FormData($('#insertnewsimg')[0]);
			formData.append("id",id);
			$.ajax({  
		          url: '${contextPath}/insertnewsimg' ,  
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
		function inserthonor() {
			var formData = new FormData($('#inserthonor')[0]);
			formData.append("title",$('#honor_title').val());
			formData.append("date",$('#honor_date').val());
			formData.append("inner",$('#honor_inner').val());
			$.ajax({  
		          url: '${contextPath}/inserthonor' ,  
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
		function update_honor(id,honor_num) {
			var formData = new FormData($("#updatehonor"+honor_num)[0]);
			formData.append("id",id);
			formData.append("title",$('#honor_title'+honor_num).val());
			formData.append("date",$('#honor_date'+honor_num).val());
			formData.append("inner",$('#honor_inner'+honor_num).val());
			$.ajax({
				url : '${contextPath}/update_honor',
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
		 $(document).ready(function() {
		        $("#test-upload").fileinput({
		            'showPreview' : false,
		            'allowedFileExtensions' : ['jpg', 'png','gif'],
		            'elErrorContainer': '#errorBlock'
		        });
		    });
		function insertblog() {
			var formData = new FormData($('#insertblog')[0]);
			formData.append("title",$('#blog_title').val());
			formData.append("date",$('#blog_date').val());
			$.ajax({  
		          url: '${contextPath}/insertblog' ,  
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
		/* function insertblogimg(id) {
			var formData = new FormData($('#insertblogimg')[0]);
			formData.append("intro",$('#blogimg_intro').val());
			formData.append("id",id);
			$.ajax({  
		          url: '${contextPath}/insertblogimg' ,  
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
		}; */
		$("#loginout").on("click",function(){
			localStorage.removeItem("token");
			location.href="${contextPath}/manager/back.jsp";
		});
		
		$('#file-zh').fileinput({
	        language: 'zh',
	        uploadUrl: '${contextPath}/insertblogimg',
	        allowedFileExtensions : ['jpg', 'png','gif'],
	        uploadExtraData: function(previewId, index) {   //额外参数的关键点
                var obj = {
	        			id :$("#blogimg_idd").val(),
                    };
                return obj;
            },
	    });
		$("#file-zh").on("fileuploaded", function ( data) {
            if (data) {
				alert("oK");
				window.location.reload();
			}
         });
	</script>
</body>
</html>