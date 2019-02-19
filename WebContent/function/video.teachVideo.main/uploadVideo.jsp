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
<title>上传在线播放视频</title>
<link href="../../ico/ico.jpg" rel="icon" type="image/x-ico">
<link rel="stylesheet" href="./dist/css/layui.css">
  <link rel="stylesheet" href="easy-upload.css">
<script type="text/javascript" src="./js/jquery-3.3.1.min.js" ></script>
<script src="./dist/layui.js"></script>
                     
                      <!-- 视实际需要决定是否引入jquery.cookie-1.4.1.min.js-->
                      <script src="vendor/jquery.cookie-1.4.1.min.js"></script>
                      <script src="easyUpload.js"></script>
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
    TeachVideo teachVideo = (TeachVideo)request.getSession().getAttribute("findVideoMain");
    %>
  <legend>正在为 ： <%=teachVideo.getVideo_contentName() %> 添加视频
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${ pageContext.request.contextPath }/teachVideo_videoMain.action?video_id=<%=teachVideo.getVideo_id()%>" style="color: #01AAED">返回</a>
  </legend>
  <div class="layui-field-box">
  
   <!-- 添加课程 -->
            <div class="layui-form-item">
                <div class="layui-input-block">
                     <div id="easyContainer"></div>

					  <script>
					    $('#easyContainer').easyUpload({
					      allowFileTypes: '*.avi;*.wmv;*.mpeg;*.mp4;*.mov;*.mkv;*.flv;*.f4v;*.m4v;*.rmvb;*.rm;*.3gp;*.dat;*.ts;*.mts;*.vob;*.swf;*.webm;*.ogg',//允许上传文件类型，格式';*.doc;*.pdf'
					      allowFileSize: 999999999999,//允许上传文件大小(KB)
					      selectText: '选择视频文件',//选择文件按钮文案
					      multi: false,//是否允许多文件上传
					      multiNum: 1,//多文件上传时允许的文件数
					      showNote: true,//是否展示文件上传说明
					      note: '提示：请上传一个视频，用于在线播放;将为您调试在线播放，速度较慢，请耐心等待',//文件上传说明
					      showPreview: true,//是否显示文件预览
					      url: '${ pageContext.request.contextPath }/teachVideoUpload2.action',//上传文件地址
					      fileName: 'file',//文件filename配置参数
					      formParam: {
					        token: $.cookie('token_cookie'),//不需要验证token时可以去掉
					      },//文件filename以外的配置参数，格式：{key1:value1,key2:value2}
					      timeout: 99999999999999,//请求超时时间
					      okCode: 200,//与后端返回数据code值一致时执行成功回调，不配置默认200
					      successFunc: function(res) {
					        console.log('成功回调', res);
					        window.location.href="${ pageContext.request.contextPath }/teachVideo_videoMain.action?video_id=<%=teachVideo.getVideo_id()%>";
					      },//上传成功回调函数
					      errorFunc: function(res) {
					        console.log('失败回调', res);
					      },//上传失败回调函数
					      deleteFunc: function(res) {
					        console.log('删除回调', res);
					      }//删除文件回调函数
					    });
					  </script>
                </div>
            </div>
          </div>
</fieldset>
          <br><p>© 2009-2018 hhxzxxxwz.top       <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备18038884号</a></p>
</body>
</html>