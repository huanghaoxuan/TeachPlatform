<%@page import="com.platform.domain.User"%>
<%@page import="com.platform.domain.TeachVideo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
    String path = request.getRequestURI();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网络授课平台</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link href="css/video-js.min.css" rel="stylesheet">
<script src="js/video.min.js"></script>

<link href="../../ico/ico.jpg" rel="icon" type="image/x-ico">
</head>
<body>
<!-- Header -->
<% TeachVideo teachVideo = (TeachVideo)request.getSession().getAttribute("findVideoMain");%>
<header id="header">
    <a href="${ pageContext.request.contextPath }/teachVideo_videoMain.action?video_id=<%=teachVideo.getVideo_id()%>" class="logo"><strong><%=teachVideo.getCourse().getCategoryClass().getCategoryClass_category()%>-<%=teachVideo.getCourse().getCategoryClass().getCategoryClass_name()%>-<%=teachVideo.getCourse().getCourse_name()%>-<%=teachVideo.getVideo_contentName()%></strong></a>
    <nav>
        <a href="#menu">Menu</a>
    </nav>
</header>

<!-- Nav -->
<nav id="menu">
    <ul class="links">
        <li><a href="${ pageContext.request.contextPath }/user_homePage.action">首页</a></li>
        <li><a href="${ pageContext.request.contextPath }/course_video.action">课程</a></li>
        <li><a href="${ pageContext.request.contextPath }/user_personSpace.action">个人中心</a></li>
    </ul>
</nav>

<!-- Main -->
<section id="main">
    <div class="inner">
        <div class="image fit">
            <div>
            
                    <video
                        id="my-video"
                        class="video-js vjs-big-play-centered"
                        controls
                        preload="auto"
                        poster=""
                        data-setup='{}'
                        width="900px" height="500px"
                        >
                        <%
                        if(teachVideo.getFileFileName()!=null){
                        String teachVideopath;
                        teachVideopath = "2" + teachVideo.getFileFileName().substring(0,teachVideo.getFileFileName().lastIndexOf(".")) + ".mp4";
                        %>
                      <source src="${ pageContext.request.contextPath }/file<%=teachVideo.getVideo_path() %>/video/<%=teachVideopath %>" type="video/mp4"></source>
                      <source src="${ pageContext.request.contextPath }/file<%=teachVideo.getVideo_path() %>/video/<%=teachVideopath %>" type="video/webm"></source>
                      <source src="${ pageContext.request.contextPath }/file<%=teachVideo.getVideo_path() %>/video/<%=teachVideopath %>" type="video/ogg"></source>
                        <%
                        }
                        %>
                    </video>
                    <script type="text/javascript">
            var myPlayer = videojs('my-video');
            videojs("my-video ").ready(function() {
                var myPlayer = this;
                myPlayer.play();
            });
        </script>
</div>
        </div>
        <header>
            <h1><%=teachVideo.getVideo_contentName()%></h1>
            <p class="info">该学习内容仅供参考使用，最终解释权归制作者所有</p>
        </header>
        <p><%=teachVideo.getVideo_introduce() %></p>
        
    
    <div class="table-wrapper">
                    <table>
                        <thead>
                            <tr>
                                
                                <th>更多</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                         
                                <td>当前页面视频</td>
                                <td align="right">
                                <%
                                User user = (User)request.getSession().getAttribute("user");
                                User videoMainUser = (User)request.getSession().getAttribute("videoMainUser");
                                if((user.getUser_id().equals(videoMainUser.getUser_id()) || user.getUser_flag() == 3) && (user.getUser_flag() == 2 || user.getUser_flag() == 3) && teachVideo.getFileFileName() == null){
                                %>
                                <a href="${ pageContext.request.contextPath }/teachVideo_uploadVideo.action" class="button small">上传</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <%
                                }
                                  if((user.getUser_id().equals(videoMainUser.getUser_id()) || user.getUser_flag() == 3) && (user.getUser_flag() == 2 || user.getUser_flag() == 3) && teachVideo.getFileFileName() != null){
                                  %>
                                  <a href="${ pageContext.request.contextPath }/teachVideo_deleteVideo.action?video_id=<%=teachVideo.getVideo_id() %>" class="button small">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                                ">下载</a>
                                
                                </td>
                            </tr>
                            <tr>
                               
                                <td>课件及题目下载
                                 <%
                                if(teachVideo.getCoursewareHiden() == 2){
                                %>
                                <span style="color: #FF5722">(已关闭下载)</span>
                                <%
                                }
                                %>
                                </td>
                                <td align="right">
                                
                                <%
                                if(((user.getUser_flag() == 2 && user.getUser_id().equals(videoMainUser.getUser_id()))||user.getUser_flag() == 3) && teachVideo.getCoursewareHiden() == 1){
                                %>
                                <a href="${ pageContext.request.contextPath }/teachVideo_hidenCourseware.action?video_id=<%=teachVideo.getVideo_id() %>" class="button small">
                                                        关闭下载</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <%
                                }
                                if(((user.getUser_flag() == 2 && user.getUser_id().equals(videoMainUser.getUser_id()))||user.getUser_flag() == 3) && teachVideo.getCoursewareHiden() == 2){
                                %>
                                <a href="${ pageContext.request.contextPath }/teachVideo_hidenCourseware.action?video_id=<%=teachVideo.getVideo_id() %>" class="button small">
                                                        开放下载</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <%
                                }
                                %>
                                
                                
                                <%
                                if(((user.getUser_flag() == 2 && user.getUser_id().equals(videoMainUser.getUser_id()))||user.getUser_flag() == 3) || teachVideo.getCoursewareHiden() == 1){
                                %>
                                <a href="${ pageContext.request.contextPath }/teachVideo_courseware.action?video_id=<%=teachVideo.getVideo_id() %>" class="button small">查看</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <%
                                if((user.getUser_flag() == 2 && user.getUser_id().equals(videoMainUser.getUser_id()))||user.getUser_flag() == 3){
                                %>
                                <a href="${ pageContext.request.contextPath }/teachVideo_uploadCourseware.action?video_id=<%=teachVideo.getVideo_id() %>" class="button small">上传</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <%
                                }
                                %>
                                <a href="${ pageContext.request.contextPath }/teachVideo_courseware.action?video_id=<%=teachVideo.getVideo_id() %>" class="button special icon fa-download alt small">下载</a>
                                <%
                                }
                                %>
                                
                                </td>
                            </tr>
                            <tr>
                              
                                <td>作业提交</td>
                                <td align="right">
                                
                                <a href="${ pageContext.request.contextPath }/teachVideo_homework.action?video_id=<%=teachVideo.getVideo_id() %>" class="button small">查看</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                
                                <a href="${ pageContext.request.contextPath }/teachVideo_uploadHomework.action?video_id=<%=teachVideo.getVideo_id() %>" class="button small">上传</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="${ pageContext.request.contextPath }/teachVideo_homework.action?video_id=<%=teachVideo.getVideo_id() %>" class="button special icon fa-download alt small
					              <%
					              if((user.getUser_flag() == 1 || !user.getUser_id().equals(videoMainUser.getUser_id())) && user.getUser_flag() != 3){
					              %>
					              disabled
					              <%
					              }
					              %>
					              ">下载</a>
                            </tr>
                            
                        </tfoot>
                    </table>
                </div>
</section>

<!-- Footer -->
<footer id="footer">
    <div class="copyright">Copyright &copy; 本站由黄浩轩及其团队成员合力完成.</div>
</footer>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
<br><p>© 2009-2018 hhxzxxxwz.top       <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备18038884号</a></p>
</body>
</html>