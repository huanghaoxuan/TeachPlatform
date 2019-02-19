<%@ page language="java" pageEncoding="UTF8"%>
<!Doctype html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>struts2 多文件上传</title>
    <link href="../../ico/ico.jpg" rel="icon" type="image/x-ico">
</head>
<body>
    <h1>struts-多文件 上传</h1>
    <form action="${ pageContext.request.contextPath }/upload.action" method="post" enctype="multipart/form-data">

    文件:<input type="file" name="file_fs"  multiple ><br>
    文件1:<input type="file" name="file_fs"  multiple ><br>
    文件2:<input type="file" name="file_fs"  multiple ><br>
    文件3:<input type="file" name="file_fs"  multiple ><br>
            <input type="submit"   value="上传"><br>
    </form>
    <hr>
    <h1>文件下载</h1>
     
     <a href="${ pageContext.request.contextPath }/download.action?file_fsFileName=test.txt">struts2文件下载</a> 
     <br><br><br><br><br>
<p>© 2009-2018 hhxzxxxwz.top       <a href="http://www.miitbeian.gov.cn/" target="_blank">蜀ICP备18038884号</a></p>
</body>
</html>
