<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Set"%>
<%@page import="com.platform.domain.User"%>
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
<script type="text/javascript" src="js/jquery-3.3.1.min.js" ></script>
<script src="./dist/layui.js"></script>

</head>
<body  class="layui-container">
<br>
<br>
<br>
<br>
<br>
<br>
<fieldset class="layui-elem-field">
  <legend>正在为您删除课程</legend>
  <div class="layui-field-box">
  
   <!-- 添加课程 -->
   <form class="layui-form" action="${ pageContext.request.contextPath }/categoryClassDeleteClass.action" onsubmit="return sumbit_form()">

            
            
            <div class="layui-form-item">
                <label class="layui-form-label">请选择课程</label>
                <div class="layui-input-block">
                    <select name="categoryClass_id" lay-verify="required">
                        <option value=""></option>
                        <%
                        User user = (User)request.getSession().getAttribute("user");
                
                        Set<CategoryClass> categoryClasses = user.getCategoryClasses();
                        for (CategoryClass categoryClass : categoryClasses) {
                         %>
                        <option value="<%=categoryClass.getCategoryClass_id()%>"><%=categoryClass.getCategoryClass_name()%></option>
                        <%
		                    }
		                %>
                    </select>
                </div>
            </div>
            
           
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">立即删除</button>
                    <s:token></s:token>
                    <script language="javascript">
					function sumbit_form(){
					var gnl=confirm("是否确认删除课程?");
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
                
                //各种基于事件的操作，下面会有进一步介绍
            });
        </script>
<br><p>© 2009-2018 hhxzxxxwz.top       <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备18038884号</a></p>
</body>
</html>