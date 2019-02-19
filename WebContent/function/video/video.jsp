<%@page import="com.platform.domain.CategoryClass"%>
<%@page import="com.platform.domain.Category"%>
<%@page import="com.platform.domain.Course"%>
<%@page import="java.util.List"%>
<%@page import="com.platform.service.CourseService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
<%
	String path = request.getRequestURI();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">



<title>网络授课平台</title>
<link href="../../ico/ico.jpg" rel="icon" type="image/x-ico">
<!-- <link href="css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.demo {
	background: #494A5F;
	padding: 2em 0;
}

.pagination-outer {
	text-align: center;
}

.pagination {
	display: inline-flex;
	border-radius: 0;
	overflow: hidden;
	position: relative;
}

.pagination li a.page-link {
	width: 40px;
	height: 40px;
	line-height: 30px;
	background: #ff095c;
	border-radius: 0;
	border: none;
	outline: 2px solid #fff;
	outline-offset: -6px;
	font-size: 15px;
	font-weight: 700;
	color: #fff;
	letter-spacing: 1px;
	margin: 0 4px 0 0;
	position: relative;
	z-index: 1;
	transition: all 0.4s ease 0s;
}

.pagination li:first-child a.page-link, .pagination li:last-child a.page-link
	{
	line-height: 32px;
}

.pagination li:last-child a.page-link {
	margin-right: 0;
}

.pagination li.active a.page-link, .pagination li a.page-link:hover,
	.pagination li.active a.page-link:hover {
	background: #ff095c;
	color: #fff;
	outline: thin dotted;
	outline-offset: -2px;
}

.pagination li a.page-link:before {
	content: "";
	width: 0;
	height: 0;
	background: rgba(0, 0, 0, 0)
		linear-gradient(135deg, #081f3c 45%, #aaa 50%, #ccc 56%, #fff 80%);
	box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.4);
	position: absolute;
	top: 0;
	left: 0;
	transition: all 0.3s ease 0s;
}

.pagination li a.page-link:hover:before, .pagination li.active a.page-link:before
	{
	width: 17px;
	height: 17px;
}

@media only screen and (max-width: 480px) {
	.pagination {
		display: block;
	}
	.pagination li {
		display: inline-block;
		margin-bottom: 10px;
	}
}
</style> -->

<style>
.search1 {
	background: #fff;
	color: #666;
	font: 85%/140% Arial, Helvetica, sans-serif;
	width: 800px;
	max-width: 96%;
	margin: 0 auto;
}

/* reset webkit search input browser style */
input {
	outline: none;
}

input[type=search] {
	-webkit-appearance: textfield;
	-webkit-box-sizing: content-box;
	font-family: inherit;
	font-size: 100%;
}

input::-webkit-search-decoration, input::-webkit-search-cancel-button {
	display: none; /* remove the search and cancel icon */
}

/* search input field */
input[type=search] {
	background: #ededed url(images/search-icon.png) no-repeat 9px center;
	border: solid 1px #ccc;
	padding: 9px 10px 9px 32px;
	width: 55px;
	-webkit-border-radius: 10em;
	-moz-border-radius: 10em;
	border-radius: 10em;
	-webkit-transition: all .5s;
	-moz-transition: all .5s;
	transition: all .5s;
}

input[type=search]:focus {
	width: 130px;
	background-color: #fff;
	border-color: #6dcff6;
	-webkit-box-shadow: 0 0 5px rgba(109, 207, 246, .5);
	-moz-box-shadow: 0 0 5px rgba(109, 207, 246, .5);
	box-shadow: 0 0 5px rgba(109, 207, 246, .5);
}

/* placeholder */
input:-moz-placeholder {
	color: #999;
}

input::-webkit-input-placeholder {
	color: #999;
}

/* demo B */
#demo-b input[type=search] {
	width: 15px;
	padding-left: 10px;
	color: transparent;
	cursor: pointer;
}

#demo-b input[type=search]:hover {
	background-color: #fff;
}

#demo-b input[type=search]:focus {
	width: 130px;
	padding-left: 32px;
	color: #000;
	background-color: #fff;
	cursor: auto;
}

#demo-b input:-moz-placeholder {
	color: transparent;
}

#demo-b input::-webkit-input-placeholder {
	color: transparent;
}
</style>

<link rel="stylesheet" type="text/css" href="css/demo.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="dist/sortable.min.css">

<script type="text/javascript" src="dist/sortable.min.js"></script>
<script type="text/javascript" src="dist/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="assets/css/main.css" />
<link href="css/video-js.min.css" rel="stylesheet">
<script src="js/video.min.js"></script>


<script type="text/javascript">
$(document).ready(function(){ 
    $(":submit").click(function(){      
        $("#collect_form").submit();
        alert("已成功加入课程！");
    });
});
</script>
</head>
<body>

	<main class="sortable">
	<div class="container">

		<div class="wrapper">
			<ul class="sortable__nav nav">
				<li><a data-sjslink="all" class="nav__link">所有</a></li>
				<% 
				List<Category> categorys = (List<Category>)request.getSession().getAttribute("categorys"); 
				for (Category category : categorys) {
				%>
				<li><a data-sjslink="<%= category.getCategory_name() %>" class="nav__link"><%= category.getCategory_name() %></a></li>
	<%
                    }
                        
                %>
				
			</ul>
				<div align="center" style="margin: 10px 0">
					<form class="search1" target="_blank" style="background: #494A5F;" action="${ pageContext.request.contextPath }/categoryClass_search.action" method="post">
						<input type="search" placeholder="Search" name="categoryClass_name">
					</form>
				</div>

			<div id="sortable" class="sjs-default">
				<%
					List<CategoryClass> categoryClasses = (List<CategoryClass>) request.getSession().getAttribute("findCategoryClass");
					for (CategoryClass categoryClass : categoryClasses) {
						
				%>
				<div data-sjsel="<%=categoryClass.getCategoryClass_category() %>">
					<div class="card">
				<a href="${ pageContext.request.contextPath }/categoryClass_findAll.action?categoryClass_id=<%=categoryClass.getCategoryClass_id()%>">
						<img class="card__picture"
							src="../.././images/<%=categoryClass.getCategoryClass_icon()%>.jpg" alt="">
						<div class="card-infos">
							<h2 class="card__title"><%=categoryClass.getCategoryClass_name()%></h2>
							<p class="card__text">开课老师：<%=categoryClass.getCategoryClass_teacher()%></p>
							<hr>
							<p class="card__text"><%=categoryClass.getCategoryClass_introduce()%></p>
						</div>
					</a>
					<form method="post" action="${ pageContext.request.contextPath }/categoryClass_collect.action?categoryClass_id=<%=categoryClass.getCategoryClass_id()%>">
					<div  align="center">
					<input type="submit" value="加入课程" class="button">
                    </div>
					</form>
					</div>
				</div>
				<%
					}
						
				%>
				


			</div>
			
		</div>
	</div>
	</main>

	<script type="text/javascript">
		document.querySelector('#sortable').sortablejs()
	</script>

	<!-- <div class="demo">
		<div class="container">
			<div class="row pad-15">
				<div class="col-md-12">
					<nav class="pagination-outer" aria-label="Page navigation">
					<ul class="pagination">
						<li class="page-item"><a href="#" class="page-link"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a href="#" class="page-link"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
					</nav>
				</div>
			</div>
		</div>
	</div> -->
	<div
		style="text-align: center; margin: -14px 0; font: normal 14px/24px 'MicroSoft YaHei';">
		<p>本学生网络授课平台正在测试，由黄浩轩及团队成员进行制作，如有bug，欢迎反馈至huanghaoxuan98@163.com</p>
		<br><p>© 2009-2018 hhxzxxxwz.top       <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备18038884号</a></p>
	</div>
</body>
</html>