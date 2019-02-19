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
    
  <legend>正在查看： <%=teachVideo.getVideo_contentName()%> 的作业
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${ pageContext.request.contextPath }/teachVideo_videoMain.action?video_id=<%=teachVideo.getVideo_id()%>" style="color: #01AAED">返回</a>
  </legend>
  <div class="layui-row">
		  <table class="layui-table" lay-even lay-skin="nob">
		  <colgroup>
		    <col>
		    <col width="100">
		    <col width="100">
		    <col>
		    <col width="250">
		  </colgroup>
		  <thead>
		    <tr>
		      <th></th>
		      <th>作者</th>
		      <th>分数</th>
		      <th>评价<span style="color: #FF0000">(点击可查看详细内容)</span></th>
		      <th>操作</th>
		    </tr> 
		  </thead>
		  <tbody>
		  
              <%
              User user = (User)request.getSession().getAttribute("user");
              User videoMainUser = teachVideo.getCourse().getCategoryClass().getUser();
             
              %>
             
		    <tr>
		      <td>已提交作业</td>
		      <td></td>
		      <td>
		      <a href="${ pageContext.request.contextPath }/teachVideo_addScore.action?video_id=<%=teachVideo.getVideo_id() %>" class="button small">修改</a>
		      </td>
		      <td>
		      <a href="${ pageContext.request.contextPath }/teachVideo_addScore.action?video_id=<%=teachVideo.getVideo_id() %>" class="button small">修改</a>
		      </td>
		      <td>
		      
              <a href="${ pageContext.request.contextPath }/teachVideo_uploadHomework.action?video_id=<%=teachVideo.getVideo_id() %>" class="button small">上传</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              
		      </td>
		    </tr>
		    <%
		    int i = 0;
              for(FileMain fileMain : fileMains){
            	  if(fileMain.getFile_flag() == 2){
            %>
		    <tr>
              <td><%=fileMain.getFileFileName() %></td>
              <td><%=fileMain.getUser().getUser_useName() %></td>
              <!-- 显示分数 -->
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
              <!-- 显示评价 -->
              <td data-method="notice<%=i %>" class="layerDemo">
              <%
              if(fileMain.getFile_assess() == null || fileMain.getFile_assess().equals("")){
              %>
                                无
              <%
              }
              else{
            	  if(fileMain.getFile_assess().length() < 10){
                  %>
                  
                  <%=fileMain.getFile_assess() %>
                  
                  <%
                  }
            	  else{
            		  %>
                      
                      <%=fileMain.getFile_assess().substring(0, 10) %>...
                      
                      <%
            	  }
              }
              %>
              </td>
              
              
              
              
              <!-- 操作 -->
              <td>
              <%
              if((fileMain.getUser().getUser_id().equals(user.getUser_id()) || user.getUser_id().equals(videoMainUser.getUser_id())) || user.getUser_flag() == 3){
              %>
              <a href="${ pageContext.request.contextPath }/fileMain_download.action?file_id=<%=fileMain.getFile_id() %>" class="button special icon fa-download alt small">下载</a>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <a href="${ pageContext.request.contextPath }/fileMain_deleteHomework.action?file_id=<%=fileMain.getFile_id() %>" class="button small">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <%
              }
              %>
              </td>
            </tr>
            <%
              }
            	  i++;
            	  }
            %>
		  </tbody>
		</table>
		</div>
				<!-- 弹出式窗口显示评价 -->
              <script>
            layui.use('layer', function() { //独立版的layer无需执行这一句
                var $ = layui.jquery,
                    layer = layui.layer; //独立版的layer无需执行这一句

                //触发事件
                var active = {
              <%
              int m = 0;
              for(FileMain fileMain : fileMains){
            %>
                        notice<%=m %>: function() {
                            layer.open({
                                type: 1,
                                title: false //不显示标题栏
                                    ,
                                closeBtn: false,
                                area: '300px;',
                                shade: 0.8,
                                btn: ['关闭'],
                                btnAlign: 'c',
                                moveType: 0 //拖拽模式，0或者1
                                    ,
                                content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><%=fileMain.getFile_assess() %></div>'
                            });
                        },
                        
                <%
                m++;
                  }
              %>
                };
                $('.layerDemo').on('click', function() {
                    var othis = $(this),
                        method = othis.data('method');
                    active[method] ? active[method].call(this, othis) : '';
                });
     
            });
            
        </script>
</fieldset>
<br><p>© 2009-2018 hhxzxxxwz.top       <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备18038884号</a></p>
<!-- Scripts -->

<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>