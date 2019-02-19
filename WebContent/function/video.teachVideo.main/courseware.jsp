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
<title>课件查询</title>
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
    
  <legend>正在查看 <%=teachVideo.getVideo_contentName()%> ：的课件及其他可下载内容
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${ pageContext.request.contextPath }/teachVideo_videoMain.action?video_id=<%=teachVideo.getVideo_id()%>" style="color: #01AAED">返回</a>
  </legend>
  <div class="layui-row">
		  <table class="layui-table" lay-even lay-skin="nob">
		  <colgroup>
		    <col width="600">
		    <col width="200">
		    <col>
		  </colgroup>
		  <thead>
		    <tr>
		      <th>名称</th>
		      
		      <th>操作</th>
		    </tr> 
		  </thead>
		  <tbody>
		  <tr>
              
              <td>在线视频</td>
              <td>
              <%
              User user = (User)request.getSession().getAttribute("user");
              User videoMainUser = teachVideo.getCourse().getCategoryClass().getUser();
              if((user.getUser_id().equals(videoMainUser.getUser_id()) || user.getUser_flag() == 3) && (user.getUser_flag() == 2 || user.getUser_flag() == 3) && teachVideo.getFileFileName() == null){
              %>
              <a href="${ pageContext.request.contextPath }/teachVideo_uploadVideo.action" class="button small">上传</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <%
              }
              %>
              <a href="${ pageContext.request.contextPath }/teachVideo_download.action?video_id=<%=teachVideo.getVideo_id() %>" class="button special icon fa-download alt small
                 <%
                 if(teachVideo.getFileFileName() == null){
                 %>
                 disabled
                 <%
                 }
                 %>
                 ">下载</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <%
	              if((user.getUser_id().equals(videoMainUser.getUser_id()) || user.getUser_flag() == 3) && (user.getUser_flag() == 2 || user.getUser_flag() == 3) && teachVideo.getFileFileName() != null){
	              %>
	              <a href="${ pageContext.request.contextPath }/teachVideo_deleteVideo.action?video_id=<%=teachVideo.getVideo_id() %>" class="button small">删除</a>
	              <%
	              }
	              %>
                 </td>
            </tr>
		    <tr>
		      <td></td>
		      
		      <td></td>
		    </tr>
		    <tr>
		      <td>课件及资料</td>
		      
		      <td>
		      <%
              if(user.getUser_id().equals(videoMainUser.getUser_id()) || user.getUser_flag() == 3){
              %>
              <a href="${ pageContext.request.contextPath }/teachVideo_uploadCourseware.action?video_id=<%=teachVideo.getVideo_id() %>" class="button small">上传</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <%
              }
              %>
		      </td>
		    </tr>
		    <%
              for(FileMain fileMain : fileMains){
            	  if(fileMain.getFile_flag() == 1){
            %>
		    <tr>
              <td><%=fileMain.getFileFileName() %></td>
              
              <td><a href="${ pageContext.request.contextPath }/fileMain_download.action?file_id=<%=fileMain.getFile_id() %>" class="button special icon fa-download alt small">下载</a>
              <%
              if(user.getUser_id().equals(videoMainUser.getUser_id()) || user.getUser_flag() == 3){
              %>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <a href="${ pageContext.request.contextPath }/fileMain_deleteCourseware.action?file_id=<%=fileMain.getFile_id() %>" class="button small">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <%
              }
              %>
              </td>
            </tr>
            <%
            }
            	    }
            %>
		  </tbody>
		</table>
		</div>
				
</fieldset>
<br><p>© 2009-2018 hhxzxxxwz.top       <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备18038884号</a></p>
<!-- Scripts -->

<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>