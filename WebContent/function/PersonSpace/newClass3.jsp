<%@page import="com.platform.domain.TeachVideo"%>
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
<title>添加新内容</title>
<link href="../../ico/ico.jpg" rel="icon" type="image/x-ico">
<link rel="stylesheet" href="./dist/css/layui.css">
<link rel="stylesheet" href="css/easy-upload.css">
<script type="text/javascript" src="./js/jquery-3.3.1.min.js" ></script>
<script src="./dist/layui.js"></script>
  <script src="vendor/jquery.cookie-1.4.1.min.js"></script>
  <script src="js/easyUpload.js"></script>
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
    CategoryClass newCatalog_categoryClass = (CategoryClass) request.getSession().getAttribute("newContent_categoryClass");
    %>
  <legend>正在为课程： <%=newCatalog_categoryClass.getCategoryClass_name() %> 下的章节添加内容</legend>
  <div class="layui-field-box">
  
   <!-- 添加课程 -->
   <form class="layui-form" action="${ pageContext.request.contextPath }/teachVideoUpload.action" onsubmit="return sumbit_form()" enctype="multipart/form-data" method="post">
            
            <div class="layui-form-item">
                <label class="layui-form-label">请选择章节</label>
                <div class="layui-input-block">
                    <select name="video_course_id" lay-verify="required">
                        <option value=""></option>
                        <%
                        CategoryClass categoryClass = (CategoryClass)request.getSession().getAttribute("newContent_categoryClass");
                        Set<Course> courses = categoryClass.getCourses();
                        for (Course course : courses) {
                        %>
                        
                        <option value="<%=course.getCourse_id() %>"><%=course.getCourse_name() %></option>
                        
                        <%
                        }
                        %>
                    </select>
                </div>
            </div>
            
            <div class="layui-form-item">
                <label class="layui-form-label">内容名称</label>
                <div class="layui-input-block">
                    <input type="text" name="video_contentName" required lay-verify="required" placeholder="请输入内容名称" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">请输入内容介绍</label>
                <div class="layui-input-block">
                    <textarea name="video_introduce" required placeholder="内容介绍" class="layui-textarea"></textarea>
                </div>
            </div>
            <!-- <label class="layui-form-label">添加视频</label> -->
            <!-- <button type="button" class="layui-btn" id="upload1" name="file"><i class="layui-icon"></i>上传视频</button> -->
            <!-- <input type="file" class="" id="" name="file"></input>    -->      
            <br>
            <br>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn site-demo-active" lay-submit lay-filter="formDemo" id="upload2" data-type="loading">立即提交</button>
                    <s:token></s:token>
                    <script language="javascript">
					function sumbit_form(){
                    var gnl=false;
					gnl=confirm("是否确认为章节添加内容?");
					if (gnl==true){
					return true;
					}else{
					return false;
					}
					}
					</script>
                    <button type="reset" class="layui-btn layui-btn-primary site-demo-active" data-type="setPercent">重置</button>
                </div>
            </div>
        </form>
        <div class="layui-progress layui-progress-big" lay-showpercent="true" lay-filter="demo">
		  <div class="layui-progress-bar layui-bg-red" lay-percent="0%"></div>
		</div>
		<script>
		   
			layui.use('element', function(){
			  var $ = layui.jquery
			  ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
			  
			  //触发事件
			  var active = {
			    setPercent: function(){
			      //设置0%进度
			      
			      element.progress('demo', '0%')
			      
			    }
			    ,loading: function(othis){
			    	
			      var DISABLED = 'layui-btn-disabled';
			      if(othis.hasClass(DISABLED)) return;
			    
			      //模拟loading
			      
			      var n = 0, timer = setInterval(function(){
			        n = n + Math.random()*10|0;
			        if(n>95){
			          n = 95;
			          clearInterval(timer);
			          //othis.removeClass(DISABLED);
			        }
			        element.progress('demo', n+'%');
			      }, 300+Math.random()*1000);
			      
			      //othis.addClass(DISABLED);
			    }
			  };
			  
			  $('.site-demo-active').on('click', function(){
			    var othis = $(this), type = $(this).data('type');
			    active[type] ? active[type].call(this, othis) : '';
			  });
			});
			</script>
		
          </div>
</fieldset>
        <script>
            layui.use('form', function() {
                var form = layui.form;
               
            });
        </script>
        
        <script>
            layui.use('upload', function(){
              var $ = layui.jquery
              ,upload = layui.upload;
              
              /* var uploadInst = upload.render({
                    elem: '#upload1' //绑定元素
                    ,url:''
                    ,method: 'post'
                    ,accept: 'video' //视频
                    ,auto: false //选择文件后不自动上传
                    ,bindAction: '#upload2' //指向一个按钮触发上传
                  }); */
                });
              </script>
   <br><p>© 2009-2018 hhxzxxxwz.top       <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备18038884号</a></p>
</body>
</html>