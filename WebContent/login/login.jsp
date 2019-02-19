<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%
    String path = request.getRequestURI();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<base href="<%=basePath%>">
        <title>登录</title>
        <link href="../ico/ico.jpg" rel="icon" type="image/x-ico">
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <link rel="stylesheet" href="css/jigsaw.css">
        <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
        
        <!-- ** **************************用于login.jsp界面的登录失败的弹窗判断***************************
        ******************************************************************************************* -->
        <script>
        var OK_Name = false;
        var OK_Password = false;
        var OK_Validate_password = false;
        var OK_Maile = false;
        var OK_useName = false;
        var OK_flag = false;

        setTimeout(function(){ 
            $(document).ready(function(){
                if(${ login_err }){
                    <% request.getSession().setAttribute("login_err", false); %>
                    alert("用户名或密码错误");
                }
        });},300);
        
        /******************************************************************************************
        **************************************************************************************** */
        
        
        /**************************使用ajax用于注册用户名是否重复提示功能********************************************
        **************************************************************************************** */
        
      
        $(document).ready(function(){
              $('#name_register').focus(function(){
                  $('#name_register_err').hide();
                  
                  
                  
              });
            });
        
      
        $(document).ready(function(){
             
              $('#name_register').blur(function(){

                  var name_register = document.getElementById("name_register").value;
                  if(name_register === ""){
                      $('#name_register_success').hide();
                      $('#name_register_err').show();    
                      OK_Name = false;
                  }
                  else {
                      $.ajax({
                          type : "post",
                          url: "${ pageContext.request.contextPath }/user_register_name_validate.action",
                          data: { "user_name": document.getElementById("name_register").value},
                          success: function(msg){
                              if(msg == "true"){
                                  $('#name_register_success').hide();
                                  $('#name_register_err').show();
                                  OK_Name = false;
                              }
                              else{
                                  $('#name_register_success').show();
                                  OK_Name = true;
                              }
                        }
                        }); 
                }
              });
            });
        
        <!-- **************************************************************************************** -->
        <!-- **************************************************************************************** -->
        
        
        
        <!-- *************************用于注册其他的提示功能******************************************** -->
        <!-- **************************************************************************************** -->
         
         
         <!-- 密码的成功图标显示 -->
         
        $(document).ready(function(){
              $('#password_register').blur(function(){
                  var password_register = document.getElementById("password_register").value;
                 
                  if(password_register === ""){
                      $('#password_register_success').hide();
                      $('#password_register_err').show();
                      OK_Password = false;
                  }
                  /*  正则校验密码   校验密码：只能输入6-20个字母、数字、下划线 */
                  else if (!/^(\w){6,20}$/.test(password_register)) {
                      $('#password_register_success').hide();
                      $('#password_register_err').show();
                      OK_Password = false;
                      }
                  else{
                      $('#password_register_success').show();
                      OK_Password = true;
                      $('#password_register_err').hide();
                  }
              });
            });
        
        
        <!-- 验证密码的成功图标显示 -->
         
        $(document).ready(function(){
              $('#validate_password_register').blur(function(){
                  var password_register = document.getElementById("password_register").value;
                  var validate_password_register = document.getElementById("validate_password_register").value;
                  if (validate_password_register === "") {
                      $('#validate_password_register_success').hide();
                      $('#validate_password_register_err').show();
                      OK_Validate_password = false;
                }
                  
                  else if(password_register === validate_password_register){
                    $('#validate_password_register_success').show();
                    OK_Validate_password = true;
                    $('#validate_password_register_err').hide();
                    }
                  else {
                      $('#validate_password_register_success').hide();
                      $('#validate_password_register_err').show();
                      OK_Validate_password = false;
                }
              });
            });
        <!-- 昵称的成功图标显示 -->
         
        $(document).ready(function(){
              $('#useName_register').blur(function(){
                  var useName_register = document.getElementById("useName_register").value;
                  if (useName_register === "") {
                      $('#useName_register_success').hide();
                      $('#useName_register_err').show();
                      OK_useName = false;
                }
                  else {
                      $('#useName_register_success').show();
                      $('#useName_register_err').hide();
                      OK_useName = true;
                }
              });
            });
        
        
        
        <!-- 验证邮箱的成功图标显示 -->
        
        $(document).ready(function(){
              $('#mail_register').blur(function(){
                  var mail_register = document.getElementById("mail_register").value;
                  if (mail_register === "") {
                      $('#mail_register_success').hide();
                      $('#mail_register_err').show();
                      OK_Maile = false;
                }          
                  else if(/^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/.test(mail_register)){
                    $('#mail_register_success').show();
                    OK_Maile = true;
                    $('#mail_register_err').hide();
                    }
                  else {
                      $('#mail_register_success').hide();
                      $('#mail_register_err').show();
                      OK_Maile = false;
                }
              });
            });
        
        <!-- 权限的成功图标显示 -->
        
        $(document).ready(function(){
        	$("input[name='user_flag']:radio").change(function(){
                  var flag_register = $("input[name='user_flag']:checked").val();
                      $('#flag_register_success').show();
                      OK_flag = true;

              });
            });
        
        
        <!-- **************************************************************************************** -->
        <!-- **************************************************************************************** -->
        
        $(document).ready(function(){
            $("#register").click(function(){
                if(OK_Name && OK_Password && OK_Validate_password && OK_Maile && OK_useName && OK_flag)
                {
                    alert("注册成功！请登录进入系统！"); 
                    $("#register_form").submit();
                }else {
                    alert("注册信息有误！请重新填写！")
                }
            });
        });
        
        </script>
        
        
        
        
        <style>
            .jq22-container{
                

                background: #000;
                filter:alpha(Opacity=00);
                -moz-opacity:0.1;
                opacity: 0.1;
            }
            #msg {
                width: 100%;
                line-height: 40px;
                font-size: 14px;
                text-align: center;
            }
        </style>

    </head>
<body>
<iframe src="index.html" style="float: left;width: 100%;height: 900px;"></iframe>
        <div  style="padding-top:100px">
            
            <div class="login-wrap" >
                
                <div class="login-html">
                    
                    <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">登录</label>
                    <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">注册</label>
                    <div class="login-form">
                        <form action="${ pageContext.request.contextPath }/user_login.action" method="post" id="login_form">
                            <div class="sign-in-htm">
                                <div class="group">
                                    <label for="user" class="label">用户名</label>
                                    <input id="name" name="user_name" value="" type="text" class="input">
                                </div>
                                <div class="group">
                                    <label for="pass" class="label">密码</label>
                                    <input id="password" name="user_password" type="password" class="input">
                                </div>
                                <!--<div class="group">
                                    <div class="container">
                                        <div id="captcha" style="position: relative" data-type="password"></div>
                                        <div id="msg"></div>
                                    </div>
                                </div>-->
                                <div class="group">
                                    <input id="check" type="checkbox" class="check" >
                                    <label for="check"><span class="icon"></span> 保持登录</label>
                                </div>
                                <div class="group">
                                    <input type="submit" class="button" value="登录">
                                </div>
                                <div class="hr"></div>
                                <div class="foot-lnk">
                                    <a href="">忘记密码?</a>
                                </div>
                            </div>
                        </form>
                        <form action="${ pageContext.request.contextPath }/userRegister.action" method="post" id="register_form">
                            <div class="sign-up-htm">
                                <div class="group">
                                    <label for="user" class="label">用户名
                                        <img id="name_register_success" hidden="true" src="img/check.png" style="width: 3%">
                                        <span id="name_register_err" hidden="true" style="float: right;color: red;">用户名已被注册或未输入用户名</span>
                                    </label>
                                    <input id="name_register" name="user_name" type="text" class="input" >
                                </div>
                                <div class="group">
                                    <label for="pass" class="label">密码
                                    <span id="password_register_err" hidden="true" style="float: right;color: red;">密码不能为空且长度为6-20位</span>
                                        <img id="password_register_success" hidden="true" src="img/check.png" style="width: 3%">
                                    </label>
                                    <input id="password_register" name="user_password" type="password" class="input">
                                </div>
                                <div class="group">
                                    <label for="pass" class="label">重复密码
                                        <img id="validate_password_register_success" hidden="true" src="img/check.png" style="width: 3%">
                                        <span id="validate_password_register_err" hidden="true" style="float: right;color: red;">两次密码不一致</span>
                                    </label>
                                    <input id="validate_password_register" type="password" class="input">
                                </div>
                                <div class="group">
                                    <label for="user" class="label">昵称
                                        <img id="useName_register_success" hidden="true" src="img/check.png" style="width: 3%">
                                        <span id="useName_register_err" hidden="true" style="float: right;color: red;">昵称不能为空</span>
                                    </label>
                                    <input id="useName_register" name="user_useName" type="text" class="input" >
                                </div>
                                <div class="group">
                                    <label for="pass" class="label">邮箱地址
                                        <img id="mail_register_success" hidden="true" src="img/check.png" style="width: 3%">
                                        <span id="mail_register_err" hidden="true" style="float: right;color: red;">邮箱格式不对</span>
                                    </label>
                                    <input id="mail_register" name="user_mail" type="text" class="input">
                                </div>
                                <div class="group">
                                    <label for="pass" class="label">确认使用身份
                                        <img id="flag_register_success" hidden="true" src="img/check.png" style="width: 3%">
                                    </label>
                                    <div align="center">
                                    <input id="flag_register_1" name="user_flag" type="radio" class="" value="1"><label for="flag_register_1">学生</label>
                                    <input id="flag_register_2" name="user_flag" type="radio" class="" value="2"><label for="flag_register_2">老师</label>
                                    </div>
                                </div>
                                <div class="group">
                                    <input id="register" type="button" class="button" value="注册">
                                </div>
                                <s:token></s:token>
                                <div class="hr"></div>
                                <div class="foot-lnk">
                                    <label for="tab-1">已经注册?</label>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
<p>© 2009-2018 hhxzxxxwz.top       <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备18038884号</a></p>

</body>
</html>