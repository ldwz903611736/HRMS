<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<title>表格</title>
	<base href="<%= request.getServletContext().getContextPath()%>/">
	<link rel="shortcut icon" href="img/favicon.ico">
	<!-- Bootstrap3.3.5 CSS -->
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- datatime -->
	<link href="bootstrap/css/bootstrap-datetimepicker.min.css"
		rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	 <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
</head>

<body>
	<div class="row">
		<!-- 引入公共的头文件 -->
	   <%--  <jsp:include page="header.jsp"></jsp:include> --%>
	   <div id="headers"></div>
	   <script type="text/javascript">
			$("#headers").load("header");
	   </script>
		<div id="content" class="col-md-10 col-xs-10 col-sm-10"
			style="padding-top: 0; margin: 0;">
			<div id="ftdiv">
				<!-- <form class="form-horizontal" action="addEmp.do" method="post" enctype="multipart/form-data"> -->
				<form class="form-horizontal" action="addEmp" method="post"
					enctype="application/x-www-form-urlencoded">
					<fieldset>
						<legend>查看员工信息</legend>
						<div class="form-group has-feedback">
							<label class="control-label col-md-2 col-xs-2 col-sm-2">职工姓名:</label>
							<div class="col-md-4 col-xs-4 col-sm-4">
								${emp.name }
							</div>
					
						</div>
						<div class="form-group">
							<label class="control-label col-md-2 col-xs-2 col-sm-2">性别:</label>
							<div class="col-md-4 col-xs-4 col-sm-4 radio">
									${emp.gender }
							</div>
						</div>
						<div class="form-group has-feedback">
							<label class="control-label col-md-2 col-xs-2 col-sm-2">出生日期:</label>
							<div class="col-md-4 col-xs-4 col-sm-4 input-append date"
								id="datetimepicker" data-date-format="yyyy-mm-dd">
								${emp.birthday }
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-2 col-xs-2 col-sm-2">个人邮箱:</label>
							<div class="col-md-4 col-xs-4 col-sm-4">
								${emp.email }
							</div>
					
						</div>
						<div class="form-group">
							<label class="control-label col-md-2 col-xs-2 col-sm-2">个人电话:</label>
							<div class="col-md-4 col-xs-4 col-sm-4">
								${emp.tel }
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-2 col-xs-2 col-sm-2">所属部门:</label>
							<div class="col-md-4 col-xs-4 col-sm-4">
								${emp.dept.name }
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-2 col-xs-2 col-sm-2">职
								位:</label>
							<div class="col-md-4 col-xs-4 col-sm-4">
								${emp.role }
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-2 col-xs-2 col-sm-2">薪
								资:</label>
							<div class="col-md-4 col-xs-4 col-sm-4">
								${emp.salary }
							</div>
						</div>
					</fieldset>
					<fieldset>
						<legend>个人简历</legend>
						<div class="form-group">
							<label class="control-label col-md-1 col-xs-1 col-sm-1"></label>
							<div class="col-md-5 col-xs-5 col-sm-5">
								${emp.info }
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<script src="js/jquery-3.2.1.min.js "></script>
	<script src="bootstrap/js/bootstrap.min.js "></script>
	<script type="text/javascript" src="js/date.js"></script>
	<script type="text/javascript"
		src="bootstrap/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript"
		src="bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
	<script type="text/javascript" src="js/menu.js"></script>
</body>

</html>

    