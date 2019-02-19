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
<link href="../../ico/ico.jpg" rel="icon" type="image/x-ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./dist/css/layui.css">
<script type="text/javascript" src="js/jquery-3.3.1.min.js" ></script>
<script src="./dist/layui.js"></script>
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
            <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
            <button data-method="notice1" class="layui-btn">新开设课程</button>
            <button data-method="notice2" class="layui-btn">删除现有课程</button>

            </div>
            <HR
                style="FILTER: progid:DXImageTransform.Microsoft.Glow(color=#987cb9, strength=10)"
                width="80%" color=#987cb9 SIZE=1>

            <div id="sortable" class="sjs-default">
                <%
                    User user = (User)request.getSession().getAttribute("user");
                
                    Set<CategoryClass> categoryClasses = user.getCategoryClasses();
                    for (CategoryClass categoryClass : categoryClasses) {
                %>
                    <div class="col-sm-4 col-md-3 col-sm-pull-1">
                        <div class="thumbnail">
                <a
                    href="${ pageContext.request.contextPath }/categoryClass_findAll.action?categoryClass_id=<%=categoryClass.getCategoryClass_id()%>"
                    target="_blank">
                            <img src="../.././images/<%=categoryClass.getCategoryClass_icon()%>.jpg" style="height: 200px; width: 714px;">
                            <!--课程封面-->
                            <div class="caption">
                                <h3>
                                    <%=categoryClass.getCategoryClass_name()%>
                                </h3>
                                <!--课程标题-->

                                <p class="card__text">
                                    开课老师：<%=categoryClass.getCategoryClass_teacher()%></p>
                                
                            </div>
                            </a>
                            <hr>
                            <p>
                            <a
                            href="${ pageContext.request.contextPath }/categoryClass_newCatalog.action?categoryClass_id=<%=categoryClass.getCategoryClass_id() %>"
                               target="_blank" class="layui-btn" role="button">添加章节</a>
                            <a
                            href="${ pageContext.request.contextPath }/categoryClass_newContent.action?categoryClass_id=<%=categoryClass.getCategoryClass_id() %>"
                               target="_blank" class="layui-btn" role="button">补充内容</a>
                               
                            </p>
                            
                            <p>
                             <a
                            href="${ pageContext.request.contextPath }/categoryClass_deleteCatalog.action?categoryClass_id=<%=categoryClass.getCategoryClass_id() %>"
                               target="_blank" class="layui-btn" role="button">删除章节</a>
                            <a
                            href="${ pageContext.request.contextPath }/categoryClass_deleteContent.action?categoryClass_id=<%=categoryClass.getCategoryClass_id() %>"
                               target="_blank" class="layui-btn" role="button">删除内容</a>
                               
                            </p>
                        </div>
                    </div>
                
                <%
                    }
                %>
	            </div>
	        </div>
	    </div>

    <script>
            layui.use('layer', function() { //独立版的layer无需执行这一句
                var $ = layui.jquery,
                    layer = layui.layer; //独立版的layer无需执行这一句

                //触发事件
                var active = {
                		notice1: function() {
                            layer.open({
                                type: 1,
                                title: false //不显示标题栏
                                    ,
                                closeBtn: false,
                                area: '300px;',
                                shade: 0.8,
                                id: 'LAY_layuipro' //设定一个id，防止重复弹出
                                    ,
                                btn: ['确认添加', '取消'],
                                btnAlign: 'c',
                                moveType: 0 //拖拽模式，0或者1
                                    ,
                                content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">您当前操作将为您开设一门新课程！<br><br>为您开设一门新课程后，该课程信息将显示至课程总览之上，将被本系统所有用户查询，以及被其添加至课程库。<br><br>同意信息将为您配置课程信息^_^</div>',
                                success: function(layero) {
                                    var btn = layero.find('.layui-layer-btn');
                                    btn.find('.layui-layer-btn0').attr({
                                        href: '${ pageContext.request.contextPath }/function/PersonSpace/newClass.jsp',
                                        target: '_blank'
                                    });
                                }
                            });
                        }
		                ,notice2: function() {
		                    layer.open({
		                        type: 1,
		                        title: false //不显示标题栏
		                            ,
		                        closeBtn: false,
		                        area: '300px;',
		                        shade: 0.8,
		                        id: 'LAY_layuipro' //设定一个id，防止重复弹出
		                            ,
		                        btn: ['确认删除', '取消'],
		                        btnAlign: 'c',
		                        moveType: 0 //拖拽模式，0或者1
		                            ,
		                        content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">您当前操作将删除一门现有课程！<br><br>您删除该门课程后，该课程信息将从课程总览之上删除，不再被本系统所有用户查询。<br><br>同意信息将为您配置课程信息^_^</div>',
		                        success: function(layero) {
		                            var btn = layero.find('.layui-layer-btn');
		                            btn.find('.layui-layer-btn0').attr({
		                                href: '${ pageContext.request.contextPath }/function/PersonSpace/deleteClass.jsp',
		                                target: '_blank'
		                            });
		                        }
		                    });
		                }
                };
                $('#layerDemo .layui-btn').on('click', function() {
                    var othis = $(this),
                        method = othis.data('method');
                    active[method] ? active[method].call(this, othis) : '';
                });

            });
        </script>
<!-- <br><p>© 2009-2018 hhxzxxxwz.top       <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备18038884号</a></p> -->
</body>
</html>