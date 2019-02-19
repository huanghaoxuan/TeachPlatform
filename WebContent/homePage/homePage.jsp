<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en-US">
<head>
<%
	String path = request.getRequestURI();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="../ico/ico.jpg" rel="icon" type="image/x-ico">
<title>网络授课平台</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/font-awesome.min.css">

<!-- MAIN CSS -->
<link rel="stylesheet" href="css/tooplate-style.css">

</head>
<body>

<!-- PRE LOADER -->
<div class="preloader">
     <div class="spinner">
          <span class="spinner-rotate"></span>
     </div>
</div>


<!-- HOME SECTION -->
<section id="home" class="parallax-section">
     <div class="container">
          <div class="row">

               <div class="col-md-offset-5 col-md-7 col-sm-12">
                    <div class="home-thumb">
                         <h1 class="wow fadeInUp" data-wow-delay="0.4s">网络授课平台</h1>
                         <p class="wow fadeInUp white-color" data-wow-delay="0.6s">The reason why a great man is great is that he resolves to be a great man.</p>
                         <a href="#service" class="wow fadeInUp smoothScroll btn btn-default section-btn" data-wow-delay="1s">discover more</a>
                    </div>
               </div>

          </div>
     </div>
</section>


<!-- SERVICE SECTION -->
<section id="service" class="parallax-section">
     <div class="container">
          <div class="row">

               <div class="wow fadeInUp section-title" data-wow-delay="0.2s">
                    <!-- SECTION TITLE -->
                    <h2>what things i am doing...</h2>
                    <p>you can do more and more.</p>
               </div>

               <div class="col-md-3 col-sm-6 wow fadeInUp" data-wow-delay="0.4s">
               	    <a href=" ${ pageContext.request.contextPath }/course_video.action" target="_blank">
                    <div class="service-thumb">
                         <i class="fa fa-clone"></i>
                         <h4>课程</h4>
                         <p>我们为各位准备了各种各样，丰富多彩的课程。在这里，我们将为各位开启新世界的大门</p>
                    </div>
                    </a>
               </div>

               <div class="col-md-3 col-sm-6 wow fadeInUp" data-wow-delay="0.4s">
                    <a href=" ${ pageContext.request.contextPath }/games/flop/index.html" target="_blank">
                    <div class="service-thumb bg-grey">
                         <i class="fa fa-lightbulb-o"></i>
                         <h4 class="white-color">小程序</h4>
                         <p>在学习之余，研究研究奇怪的小程序也是一种解压的方式。我们为各位呈上了一些小惊喜，一些很棒的创意</p>
                    </div>
                    
               </div>

               <div class="col-md-3 col-sm-6 wow fadeInUp" data-wow-delay="0.6s">
                    <a href="${ pageContext.request.contextPath }/user_personSpace.action" target="_blank">        
                    <div class="service-thumb">
                         <i class="fa fa-camera"></i>
                         <h4>个人中心</h4>
                         <p>你可以查询有关于你的信息，以及编辑你的头像等</p>
                    </div>
                    </a>
               </div>

               <div class="col-md-3 col-sm-6 wow fadeInUp" data-wow-delay="0.8s">
                    <div class="service-thumb">
                         <i class="fa fa-smile-o"></i>
                         <h4>论坛</h4>
                         <p>我们为大家提供一个论坛用于交流，大家可以学习、游戏、电影、音乐，甚至....你能想到的一切</p>
                    </div>
               </div>
               
          </div>
     </div>
</section>

<div class="tlinks">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>
<!-- ABOUT SECTION -->
<section id="about" class="parallax-section">
     <div class="container">
          <div class="row">
               
               <div class="col-md-4 col-sm-8">
                    <div class="about-image-thumb">
                         <img src="images/profile-image.jpg" class="wow fadeInUp img-responsive" data-wow-delay="0.2s" alt="about image">
                         <!--<ul class="social-icon">
                              <li><a href="#" class="fa fa-facebook"></a></li>
                              <li><a href="#" class="fa fa-twitter"></a></li>
                              <li><a href="#" class="fa fa-instagram"></a></li>
                              <li><a href="#" class="fa fa-behance"></a></li>
                         </ul>-->
                    </div>
               </div>

               <div class="col-md-8 col-sm-12">
                    <div class="about-thumb">
                         <!-- SECTION TITLE -->
                         <div class="wow fadeInUp section-title" data-wow-delay="0.6s">
                              <h2>关于我们</h2>
                              <p>这是我们制作人团队全力完成的网络授课平台</p>
                         </div>
                         <div class="wow fadeInUp" data-wow-delay="0.8s">
                              <p>网络课程就是通过网络表现的某门学科的教学内容及实施的教学活动的总和，是信息时代条件下课程新的表现形式。它包括按一定的教学目标、教学策略组织起来的教学内容和网络教学支撑环境。其中网络教学支撑环境特指支持网络教学的软件工具、教学资源以及在网络教学平台上实施的教学活动。</p>
                              <p>网络课程具有交互性、共享性、开放性、协作性和自主性等基本特征。</p>
                         </div>
                    </div>
               </div>

          </div>
     </div>
</section>


<!-- WORK SECTION -->
<section id="work" class="parallax-section">
     <div class="container">
          <div class="row">

               <div class="col-md-12 col-sm-12">
                    <!-- SECTION TITLE -->
                    <div class="wow fadeInUp section-title" data-wow-delay="0.2s">
                         <h2>我们的团队</h2>
                         <p>我们这个创意无限的团队</p>
                    </div>
               </div>

               <div class="wow fadeInUp col-md-4 col-sm-6" data-wow-delay="0.4s">
                    <!-- WORK THUMB -->
                    <div class="work-thumb">
                         <a href="images/work-image1.jpg" class="image-popup">
                              <div class="work-thumb-overlay">
                                   <h4 class="white-color">唐天硕</h4>
                                   <h2>工程师</h2>
                              </div>
                              <img src="images/work-image2.jpg" class="img-responsive" alt="Work 1">
                         </a>
                    </div>
               </div>

               <div class="wow fadeInUp col-md-4 col-sm-6" data-wow-delay="0.4s">
                    <!-- WORK THUMB -->
                    <div class="work-thumb">
                         <a href="images/work-image2.jpg" class="image-popup">
                              <div class="work-thumb-overlay">
                                   <h4 class="white-color">黄浩轩</h4>
                                   <h2>制作人</h2>
                              </div>
                              <img src="images/work-image1.jpg" class="img-responsive" alt="Work 2">
                         </a>
                    </div>
               </div>

               <div class="wow fadeInUp col-md-4 col-sm-6" data-wow-delay="0.4s">
                    <!-- WORK THUMB -->
                    <div class="work-thumb">
                         <a href="images/work-image3.jpg" class="image-popup">
                              <div class="work-thumb-overlay">
                                   <h4 class="white-color">袁锐</h4>
                                   <h2>工程师</h2>
                              </div>
                              <img src="images/work-image3.jpg" class="img-responsive" alt="Work 3">
                         </a>
                    </div>
               </div>

          </div>
     </div>
</section>


<!-- CONTACT SECTION -->
<section id="contact" class="parallax-section">
     <div class="container">
          <div class="row">

               <div class="col-md-12 col-sm-12">
                    <!-- SECTION TITLE -->
                    <div class="wow fadeInUp section-title" data-wow-delay="0.2s">
                         <h2>Get in touch</h2>
                         <p>联系我们</p>
                    </div>
               </div>

               <div class="col-md-7 col-sm-10">
                    <!-- CONTACT FORM HERE -->
                    <div class="wow fadeInUp" data-wow-delay="0.4s">
                        <form id="contact-form" action="${ pageContext.request.contextPath }/eMail_send.action" method="post">
                              <div class="col-md-6 col-sm-6">
                                   <input type="text" class="form-control" name="name" placeholder="Name" required="">
                              </div>
                              <div class="col-md-6 col-sm-6">
                                   <input type="email" class="form-control" name="email" placeholder="Email" required="">
                              </div>
                              <div class="col-md-12 col-sm-12">
                                   <textarea class="form-control" rows="5" name="message" placeholder="Message" required></textarea>
                              </div>
                              <div class="col-md-offset-8 col-md-4 col-sm-offset-6 col-sm-6">
                                   <button id="submit" type="submit" class="form-control" name="submit">Send Message</button>
                              </div>
                        </form>
                    </div>
               </div>

               <div class="col-md-5 col-sm-8">
                    <!-- CONTACT INFO -->
                    <div class="wow fadeInUp contact-info" data-wow-delay="0.4s">
                         <div class="section-title">
                              <h2>Contact Info</h2>
                              <p>(`・ω・´)</p>
                         </div>
                         
                         <p><i class="fa fa-map-marker"></i> 南京江苏中国     东南大学成贤学院</p>
                         <p><i class="fa fa-comment"></i> <a href="mailto:huanghaoxuan98@163.com">huanghaoxuan98@163.com</a></p>
                         <p><i class="fa fa-phone"></i> (0086) 1234-5678-999</p>
                    </div>
               </div>

          </div>
     </div>
</section>


<!-- FOOTER SECTION -->
<footer>
    <div class="container">
        <div class="row">

               <div class="wow fadeInUp col-md-12 col-sm-12" data-wow-delay="0.8s">
               	 <p class="white-color">本学生网络授课平台正在测试，由黄浩轩及团队成员进行制作，如有bug，欢迎反馈至huanghaoxuan98@163.com</p>
                    <p class="white-color">制作人及其团队成员期待您的加入！</p>
                    <div class="wow fadeInUp" data-wow-delay="1s">
                         <ul class="social-icon">
                              <li><a href="#" class="fa fa-facebook"></a></li>
                              <li><a href="#" class="fa fa-twitter"></a></li>
                              <li><a href="#" class="fa fa-instagram"></a></li>
                              <li><a href="#" class="fa fa-behance"></a></li>
                              <li><a href="#" class="fa fa-github"></a></li>
                         </ul>
                         <p class="white-color"> © 2009-2018 hhxzxxxwz.top       <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备18038884号</a></p>
                    </div>
          </div>
     </div>
</footer>

<!-- SCRIPTS -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.parallax.js"></script>
<script src="js/smoothscroll.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/magnific-popup-options.js"></script>
<script src="js/wow.min.js"></script>
<script src="js/custom.js"></script>
<br><p>© 2009-2018 hhxzxxxwz.top       <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备18038884号</a></p>
</body>
</html>