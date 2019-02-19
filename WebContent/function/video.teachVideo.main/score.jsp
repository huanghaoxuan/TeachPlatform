<%@page import="com.platform.domain.FileMain"%>
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
<title>添加分数</title>
<link href="../../ico/ico.jpg" rel="icon" type="image/x-ico">
<link rel="stylesheet" href="./dist/css/layui.css">
<script type="text/javascript" src="./js/jquery-3.3.1.min.js" ></script>
<script src="./dist/layui.js"></script>
<link rel="stylesheet" href="assets/css/main.css" />
<link href="css/video-js.min.css" rel="stylesheet">
<script src="js/video.min.js"></script>
</head>
<body class="layui-container">
<br>
<br>

<br>
<fieldset class="layui-elem-field">
    <% 
    TeachVideo teachVideo = (TeachVideo)request.getSession().getAttribute("findVideoMain");
    Set<FileMain> fileMains = teachVideo.getFileMains();
    %>
    
  <legend>正在为： <%=teachVideo.getVideo_contentName()%> 的作业添加分数
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${ pageContext.request.contextPath }/teachVideo_homework.action?video_id=<%=teachVideo.getVideo_id() %>" style="color: #01AAED">返回</a>
  </legend>
<form class="layui-form" action="${ pageContext.request.contextPath }/fileMainAddScore.action" onsubmit="return sumbit_form()" method="post">
  <div class="layui-row">
		  <table class="layui-table" lay-even lay-skin="nob">
		  <colgroup>
		    <col>
		    <col width="100">
		    <col width="150">
		    <col width="150">
		    <col>
		  </colgroup>
		  <thead>
		    <tr>
		      <th>作业</th>
		      <th>作者</th>
		      <th>当前分数</th>
		      <th>分数</th>
		      <th>评价</th>
		    </tr> 
		  </thead>

		  <tbody>
              <%
              User user = (User)request.getSession().getAttribute("user");
              User videoMainUser = teachVideo.getCourse().getCategoryClass().getUser();
             
		    int i = 0;
              for(FileMain fileMain : fileMains){
            	  
            	  if(fileMain.getFile_flag() == 2){
            %>
		    <tr>
              <td><%=fileMain.getFileFileName() %></td>
              <td><%=fileMain.getUser().getUser_useName() %></td>
              <!-- 当前分数 -->
              <td>
              <%
              if(fileMain.getFile_score() == null || fileMain.getFile_score().equals("")){
              %>
            	  无
              <%
              }
              else{
            	  %>
            	  
            	  <%=fileMain.getFile_score() %>
            	  
            	  <%
              }
              %>
              </td>
              <!-- 输入分数 -->
              <td>
              <%
              
              %>
              <div class="">
                <div class="">
                
                    <input type="hidden" name="fileMains[<%=i %>].file_id" value="<%=fileMain.getFile_id() %>"/>
                   <input type="text" name="fileMains[<%=i %>].file_score"  autocomplete="off" class="layui-input">
                
                </div>
            </div>
              </td>
              <!-- 输入评价 -->
              <td>
              <%
              
              %>
              <div class="">
                <div class="">
                   <input type="text" name="fileMains[<%=i %>].file_assess"  autocomplete="off" class="layui-input">
                </div>
            </div>
              <%
              i++;
              %>
              </td>
            </tr>
            <%
              }
            	  }
            %>
		  </tbody>
		</table>
        <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
		</div>
				
</form>
</fieldset>
<!-- Scripts -->
<script>
            layui.use('form', function() {
                var form = layui.form;
                
                //各种基于事件的操作，下面会有进一步介绍
            });
        </script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
<br><p>© 2009-2018 hhxzxxxwz.top       <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备18038884号</a></p>
</body>
</html>