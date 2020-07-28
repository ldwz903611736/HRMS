<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
	
	<title>Briup HR系统</title>
	<base href="<%= request.getServletContext().getContextPath()%>/">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	</head>
<body>

<c:if test="${! empty msg}">
	<script type="text/javascript">
		alert('${msg}');
	</script>
</c:if>

<div class="container">
  <div class="loginBox row">
  		<h2 class="text-center">Briup HR系统登录</h2>
  		<h3 style="color: red;">${msg }</h3>
  		<!-- main.html -->
		<form id="1" name="" action="admin" method="post" class="form-horizontal">
		  <div class="form-group ">
		    <label for="nick_name" class="col-sm-2 col-md-2 control-label">用户名</label>
		    <div class="col-sm-10 col-md-10">
		      <input type="text" class="form-control" name="name" placeholder="用户名" value="">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="user_password" class="col-sm-2 col-md-2 control-label">密码</label>
		    <div class="col-sm-10 col-md-10">
		      <input type="password" class="form-control" name="passwd" placeholder="密码">
		    </div>
		  </div>
	  	  <div class="form-group">
	  	  	<div class="col-sm-offset-4 col-sm-10" style="color: #990033;"></div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-4 col-sm-10 col-md-10">
		    	<!-- <input type="hidden" name="url" value="/admin"/> -->
		      	<button class="btn btn-info" data-loading-text="正在登录..." type="submit">登 录</button>
		      	    <button class="btn btn-info" type="reset">清 空</button>
		    </div>
		  </div>
  		</form>
	</div>
</div>
<!--.content-->

</body>
</html>
    