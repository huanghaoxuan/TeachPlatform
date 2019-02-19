<%@page import="com.platform.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%
    String path = request.getRequestURI();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<base href="<%=basePath%>">
        <title>个人中心</title>
        <meta charset="UTF-8">
<link href="../../ico/ico.jpg" rel="icon" type="image/x-ico">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="b.tabs.css" type="text/css">
        <style type="text/css">
            div.menuSideBar {}
            
            div.menuSideBar li.nav-header {
                font-size: 14px;
                padding: 3px 15px;
            }
            
            div.menuSideBar .nav-list>li>a,
            div.menuSideBar .dropdown-menu li a {
                -webkit-border-radius: 0px;
                -moz-border-radius: 0px;
                -ms-border-radius: 0px;
                border-radius: 0px;
            }
        </style>

    </head>

    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
                    <a class="navbar-brand" href="${ pageContext.request.contextPath }/homePage/homePage.jsp">首页</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href=" ${ pageContext.request.contextPath }/course_video.action" target="_blank">课程 <span class="sr-only">(current)</span></a>
                        </li>
                        <li>
                            <a href=" ${ pageContext.request.contextPath }/games/flop/index.html" target="_blank">小程序</a>
                        </li>
                        <!-- <li class="dropdown">
                             <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">个人中心 <span class="caret"></span></a>
                            <ul class="dropdown-menu">

                               <li mid="tab2" funurl="lessons.jsp">
                                   <a tabindex="-1" href="javascript:void(0);">我的课程</a>
                                </li>
                                <li>
                                    <a href="#">我的作业</a>
                                </li>
                                <li role="separator" class="divider"></li>
                                <li>
                                    <a href="#">笔记</a>
                                </li>
                                <li role="separator" class="divider"></li>
                                <li>
                                    <a href="#">我的提问</a>
                                </li>
                            </ul>
                        </li> -->
                    </ul>
                    <form class="navbar-form navbar-left" role="search"  >
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default">搜索</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>
        <div class="content">
            <div class="container">

                <div class="">
                    <div class="row-fluid">
                        <div class="col-md-2" style="padding-left: 0px;">
                            <div class="well menuSideBar" style="padding: 8px 0px;">
                                <ul class="nav nav-list" id="menuSideBar">
                                    <li class="nav-header">导航菜单</li>
                                    <li class="nav-divider"></li>

                                    <%
                                    User user = (User)request.getSession().getAttribute("user");
                                    if(user.getUser_flag() == 2 || user.getUser_flag() == 3){
                                    %>
                                     <li mid="tab6" funurl="myClass.jsp">
                                        <a tabindex="-1" href="javascript:void(0);">我开设的课程</a>
                                    </li>
                                    <%
                                    }
                                    %>
                                    <li mid="tab2" funurl="lessons.jsp">
                                        <a tabindex="-1" href="javascript:void(0);">我添加的课程</a>
                                    </li>
                                   <!--  <li mid="tab3" funurl="homeWork.html">
                                        <a tabindex="-1" href="javascript:void(0);">实战作业</a>
                                    </li>
                                    <li mid="tab4" funurl="notes.html">
                                        <a tabindex="-1" href="javascript:void(0);">笔记</a>
                                    </li>

                                    <li mid="tab5" funurl="questions.html">
                                        <a tabindex="-1" href="javascript:void(0);">我的提问</a>
                                    </li> -->

                                </ul>
                            </div>
                        </div>
                        <div class="col-md-10" id="mainFrameTabs" style="padding : 0px;">

                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active noclose">
                                    <a href="#bTabs_navTabsMainPage" data-toggle="tab">首页</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane active" id="bTabs_navTabsMainPage">
                                    <div class="page-header">
                                        <h2 style="font-size: 31.5px;text-align: center;font-weight: normal;">欢迎使用</h2>
                                    </div>
                                    <div style="text-align: center;font-size: 20px;line-height: 20px;"> Welcome to use bTabs plugin!
                                        <h3>
            您可以在个人中心里查看个人信息，开设课程，上传和审批课程与作业</h3></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <script type="text/javascript" src="js/jquery.min.js"></script>
                <script type="text/javascript" src="js/bootstrap.min.js"></script>
                <script type="text/javascript" src="js/b.tabs.js"></script>
                <script type="text/javascript" src="js/demo.js"></script>

<br><p>© 2009-2018 hhxzxxxwz.top       <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备18038884号</a></p>
    </body>
</html>