<%@page import="java.util.Set"%>
<%@page import="com.platform.domain.User"%>
<%@page import="com.platform.domain.CategoryClass"%>
<%@page import="com.platform.domain.Category"%>
<%@page import="com.platform.domain.Course"%>
<%@page import="java.util.List"%>
<%@page import="com.platform.service.CourseService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>个人中心</title>
<%
	String path = request.getRequestURI();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../../ico/ico.jpg" rel="icon" type="image/x-ico">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" href="b.tabs.css" type="text/css">
<style type="text/css">
div.menuSideBar {
	
}

div.menuSideBar li.nav-header {
	font-size: 14px;
	padding: 3px 15px;
}

div.menuSideBar .nav-list>li>a, div.menuSideBar .dropdown-menu li a {
	-webkit-border-radius: 0px;
	-moz-border-radius: 0px;
	-ms-border-radius: 0px;
	border-radius: 0px;
}
</style>

</head>
<body>
	<div class="container">
		<div class="row">
			<div style="padding-top: 30px;"></div>
			<HR
				style="FILTER: progid:DXImageTransform.Microsoft.Glow(color=#987cb9, strength=10)"
				width="80%" color=#987cb9 SIZE=1>




			<div id="sortable" class="sjs-default">
				<%
					User user = (User)request.getSession().getAttribute("user");
				
					Set<CategoryClass> categoryClasses = user.getCategoryClasses2();
					for (CategoryClass categoryClass : categoryClasses) {
				%>
				<a
					href="${ pageContext.request.contextPath }/categoryClass_findAll.action?categoryClass_id=<%=categoryClass.getCategoryClass_id()%>"					
					target="_blank">
					<div class="col-sm-4 col-md-3 col-sm-pull-1">
						<div class="thumbnail">
							<img src="../.././images/<%=categoryClass.getCategoryClass_icon()%>.jpg"
								style="height: 200px; width: 714px;">
							<!--课程封面-->
							<div class="caption">
								<h3>
									<%=categoryClass.getCategoryClass_name()%>
								</h3>
								<!--课程标题-->

								<p class="card__text">
									开课老师：<%=categoryClass.getCategoryClass_teacher()%></p>
								<hr>
							</div>
							<p>
								<a
                                href="${ pageContext.request.contextPath }/categoryClass_findAll.action?categoryClass_id=<%=categoryClass.getCategoryClass_id()%>"									target="_blank" class="btn btn-primary" role="button">继续学习</a>
								<!--超链接到该课程-->

							</p>
						</div>
					</div>
				</a>
				<%
					}
				
				%>



			</div>

		</div>


	</div>
	</div>
<!-- <br><p>© 2009-2018 hhxzxxxwz.top       <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备18038884号</a></p> -->
</body>

</html>