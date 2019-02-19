
<%@page import="com.platform.domain.Course"%>
<%@page import="java.util.List"%>
<%@page import="com.platform.service.CourseService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%
	String path = request.getRequestURI();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<base href="<%=basePath%>">


<title>网络授课平台</title>
<link href="../../ico/ico.jpg" rel="icon" type="image/x-ico">
<link rel="stylesheet" type="text/css" href="css/demo.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="dist/sortable.min.css">

<script type="text/javascript" src="./dist/sortable.min.js"></script>

</head>
<body>

	<main class="sortable">
	<div class="container">

		<div class="wrapper">
			<ul class="sortable__nav nav">
				<li><a data-sjslink="all" class="nav__link">搜索结果</a></li>
			</ul>


			<div id="sortable" class="sjs-default">
				<%
					List<Course> search_courses = (List<Course>) request.getSession().getAttribute("search_courses");
				if(search_courses.isEmpty()){
					//无搜索结果    待补充
				}
				else{
				for (Course search_course : search_courses) {

				%>
				<div data-sjsel="all">
					<div class="card">
					<a href="${ pageContext.request.contextPath }/course_teachVideo.action?course_id=<%=search_course.getCourse_id()%>">
						<img class="card__picture"
							src="./images/item-<%=(int) (Math.random() * 10)%>.jpg" alt="">
						<div class="card-infos">
							<h2 class="card__title"><%=search_course.getCourse_name()%></h2>
							<p class="card__text"><%=search_course.getCourse_introduce()%></p>
						</div>
						</a>
					</div>
				</div>
				<%
					}
				}
				%>
			</div>
		</div>
	</div>
	</main>

	<script type="text/javascript">
		document.querySelector('#sortable').sortablejs()
	</script>

	<div
		style="text-align: center; margin: -14px 0; font: normal 14px/24px 'MicroSoft YaHei';">
		<p>本学生网络授课平台正在测试，由黄浩轩及团队成员进行制作，如有bug，欢迎反馈至huanghaoxuan98@163.com</p>
		<br><p>© 2009-2018 hhxzxxxwz.top       <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备18038884号</a></p>
	</div>
</body>
</html>