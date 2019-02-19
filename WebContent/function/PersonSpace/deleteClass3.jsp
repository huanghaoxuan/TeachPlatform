<%@page import="com.platform.domain.TeachVideo"%>
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
<title>删除内容</title>
<link href="../../ico/ico.jpg" rel="icon" type="image/x-ico">
<link rel="stylesheet" href="./dist/css/layui.css">
<script type="text/javascript" src="./js/jquery-3.3.1.min.js" ></script>
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
  <%
    CategoryClass deleteContent_categoryClass = (CategoryClass) request.getSession().getAttribute("deleteContent_categoryClass");
    %>
  <legend>正在为课程： <%=deleteContent_categoryClass.getCategoryClass_name() %> 删除内容</legend>
  <div class="layui-field-box">
  
   <!-- 添加课程 -->
   <form class="layui-form" action="${ pageContext.request.contextPath }/teachVideoDeleteContent.action" onsubmit="return sumbit_form()">

            
            
            <div class="layui-form-item">
                <label class="layui-form-label">请选择章节</label>
                <div class="layui-input-block">
                    <select name="" lay-verify="required" id="course" lay-filter="course">
                        <option value=""></option>
                        <%
                        Set<Course> courses = deleteContent_categoryClass.getCourses();
                        for (Course course : courses) {
                        %>
                        <option value="<%=course.getCourse_id() %>"><%=course.getCourse_name() %></option>
                        <%
                        }
                        %>
                    </select>
                        <select id="teachvideo" name="video_id">
    
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
                form.on('select(course)', function(data){
                	console.log(data.value);
                	$("#teachvideo").empty();
                    <%
                    for (Course course : courses) {
                        Set<TeachVideo> teachVideos = course.getTeachVideos();
                        for (TeachVideo teachVideo : teachVideos) {
                            %>
                            if(data.value == <%=course.getCourse_id() %>){
                            $("#teachvideo").append("<option value=<%=teachVideo.getVideo_id() %>>"+"<%=teachVideo.getVideo_contentName() %>"+"</option>");
                            
                            }
                            <%      
                        }
                    }
                    %>
                    
                
                form.render('select');
                }); 
                //各种基于事件的操作，下面会有进一步介绍
            });
        </script>
<br><p>© 2009-2018 hhxzxxxwz.top       <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备18038884号</a></p>
</body>
</html>