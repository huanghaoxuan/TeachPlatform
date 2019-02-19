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
<title>开设新课</title>
<link href="../../ico/ico.jpg" rel="icon" type="image/x-ico">
<link rel="stylesheet" href="./dist/css/layui.css">
<script type="text/javascript" src="js/jquery-3.3.1.min.js" ></script>
<script src="./dist/layui.js"></script>

</head>
<body class="layui-container">
<br>
<br>
<br>
<br>
<br>
<br>
<fieldset class="layui-elem-field">
  <legend>正在添加课程</legend>
  <div class="layui-field-box">
  
   <!-- 添加课程 -->
   <form class="layui-form" action="${ pageContext.request.contextPath }/categoryClassAddClass.action" onsubmit="return sumbit_form()">

            
            <div class="layui-form-item">
                <label class="layui-form-label">新开设课程名称</label>
                <div class="layui-input-block">
                    <input type="text" name="categoryClass_name" required lay-verify="required" placeholder="新开设课程名称" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">开设课程老师名字</label>
                <div class="layui-input-block">
                    <input type="text" name="categoryClass_teacher" required lay-verify="required" placeholder="开设课程老师名字" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">请选择课程所属院系</label>
                <div class="layui-input-block">
                    <select name="categoryClass_category" lay-verify="required">
                        <option value=""></option>
                        <option value="电计工程学院">电计工程学院</option>
                        <option value="建艺设计学院">建艺设计学院</option>
                        <option value="土交工程学院">土交工程学院</option>
                        <option value="机电工程学院">机电工程学院</option>
                        <option value="制化工程学院">制化工程学院</option>
                        <option value="经济管理学院">经济管理学院</option>
                    </select>
                </div>
            </div>
            
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">请输入课程介绍</label>
                <div class="layui-input-block">
                    <textarea name="categoryClass_introduce" placeholder="简短课程介绍（50个字左右）" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">请选择封面</label>
                <div class="layui-input-block">
                <!--< button type="button" id="layerDemo1" data-method="offset" data-type="auto" class="layui-btn layui-btn-normal">居中弹出</button> -->
                <ul class="flow-default" id="LAY_demo1"></ul>
               <%-- <script>
            layui.use('layer', function() { //独立版的layer无需执行这一句
                var $ = layui.jquery,
                    layer = layui.layer; //独立版的layer无需执行这一句

                //触发事件
                var active = {
                		offset: function(othis){
                		      var type = othis.data('type')
                		      ,text = othis.text();
                		      
                		      layer.open({
                		        type: 1
                		        ,offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                		        ,id: 'layerDemo'+type //防止重复弹出
                		        ,content: '<ul class="flow-default" id="LAY_demo1"></ul>'
                		        ,btn: '关闭全部'
                		        ,btnAlign: 'c' //按钮居中
                		        ,shade: 0 //不显示遮罩
                		        ,yes: function(){
                		          layer.closeAll();
                		        }
                		      });
                		    }
                		  };
                		  
                		  $('#layerDemo1').on('click', function(){
                		    var othis = $(this), method = othis.data('method');
                		    active[method] ? active[method].call(this, othis) : '';
                		  });
                		  
                		});
                		</script> --%>
                    
                    <script type="text/javascript">    
                        	function getphotoid(id){
                        		  document.getElementById("photoid").value=id;
                        		  var newsrc = "../.././images/"+id+".jpg";
                        		  $('#photoShow').attr("src",newsrc);
                        		}
                    </script>
                    <script>
						layui.use('flow', function(){
						  var flow = layui.flow;
						  var j = 0;
						  flow.load({
						    elem: '#LAY_demo1' //流加载容器
						    ,scrollElem: '#LAY_demo1' //滚动条所在元素，一般不用填，此处只是演示需要。
						    ,done: function(page, next){ //执行下一页的回调
						      
						      //模拟数据插入
						      setTimeout(function(){
						        var lis = [];
						        
						        for(var i = 0; i < 10; i++){
						            lis.push('<img style="width: 10%;height: 80px" src="../.././images/' + j + '.jpg" onclick="getphotoid(' + j + ')">')
						            j++;
						        }
						        //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
						        //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
						        next(lis.join(''), page < 5 ); //假设总页数为 10
						      }, 500);
						    }
						  });
						});
						</script>
						
                    <input type="hidden" value="" id="photoid" name="categoryClass_icon">
                </div>
                    <div class="layui-form-item layui-form-text">
		                <label class="layui-form-label">当前封面是</label>
		                <img id="photoShow" style="width: 10%;height: 80px" src="../.././images/0.jpg">
		            </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                    <s:token></s:token>
                    <script language="javascript">
						
					function sumbit_form(){
					var gnl=confirm("是否确认添加新课?");
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