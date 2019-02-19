<%@page import="java.util.Set"%>
<%@page import="com.platform.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.platform.domain.Category"%>
<%@page import="com.platform.domain.CategoryClass"%>
<%@page import="com.platform.domain.Course"%>
<%@page import="java.util.List"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<%
    String path = request.getRequestURI();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<base href="<%=basePath%>">
<title>开设新课</title>
<link href="../../ico/ico.jpg" rel="icon" type="image/x-ico">
<link rel="stylesheet" href="./dist/css/layui.css">
<script type="text/javascript" src="./js/jquery-3.3.1.min.js" ></script>
<script src="./dist/layui.js"></script>
</head>
<body class="layui-container">
<br>
<br>
<br>
<br>
<br>
<br>
<fieldset class="layui-elem-field">
    <%
    CategoryClass newCatalog_categoryClass = (CategoryClass) request.getSession().getAttribute("newCatalog_categoryClass");
    %>
  <legend>正在为课程： <%=newCatalog_categoryClass.getCategoryClass_name() %> 添加章节</legend>
  <div class="layui-field-box">
  
   <!-- 添加课程 -->
   <form class="layui-form" action="${ pageContext.request.contextPath }/courseAddCatalog.action" onsubmit="return sumbit_form()">
            
            <div class="layui-form-item">
                <label class="layui-form-label">章节名称</label>
                <div class="layui-input-block">
                    <input type="text" name="course_name" required lay-verify="required" placeholder="章节名称" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">请输入章节介绍</label>
                <div class="layui-input-block">
                    <textarea name="course_introduce" placeholder="章节介绍" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                    <s:token></s:token>
                    <script language="javascript">
					function sumbit_form(){
					var gnl=confirm("是否确认添加章节?");
					if (gnl==true){
					return true;
					}else{
					return false;
					}
					}
					</script>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
          </div>
</fieldset>
        <script>
            layui.use('form', function() {
                var form = layui.form;
               
            });
        </script>
    <br><p>© 2009-2018 hhxzxxxwz.top       <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备18038884号</a></p>
</body>
</html>