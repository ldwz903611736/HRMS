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
		<!-- 引入头 -->
		<%-- <jsp:include page="/header.jsp"></jsp:include> --%>
      	 <div id="headers">
	   </div>
	    <script type="text/javascript">
			$("#headers").load("header");
	    </script>
      
		<div id="content" class="col-md-10 col-xs-10 col-sm-10"
			style="padding-top: 0; margin: 0;">
			<div style="padding-top: 20px;">
				<form action="searchAtt" class="form-inline">
					<label class="control-label">请选择部门：</label> <select name="departId"
						class="form-control">
						<c:forEach items="${depts }" var="dept">
						<option value="${dept.id }">${dept.name }</option>
						</c:forEach>
						
						<!-- <option>市场部</option> -->
					</select> <label class="control-label">请选择状态：</label> <select
						name="attendType" class="form-control"
			>
						<option value="缺勤">缺勤</option>
						<option value="在职">在职</option>
						<option value="请假">请假</option>
					</select> <label class="control-label">开始时间：</label> <span
						class="form-group has-feedback input-append date"
						id="datetimepicker1" data-date-format='yyyy-mm-dd'> <input
						class="form-control" name="beginTime" size="16" type="text">
						<span class="add-on form-control-feedback"><i
							class="icon-th glyphicon glyphicon-calendar"></i></span>
					</span> <label class="control-label">结束时间：</label> <span
						class="form-group has-feedback input-append date"
						id="datetimepicker2" data-date-format='yyyy-mm-dd'> <input
						class="form-control" name="endTime" size="16" type="text">
						<span class="add-on form-control-feedback"><i
							class="icon-th glyphicon glyphicon-calendar"></i></span>
					</span>
					<button type="submit" class="btn btn-primary">Search</button>
				</form>
				<table
					class="table table-condensed table-hover table-bordered  table-striped"
					style="margin-top: 20px;">
					<thead>
						<tr>
							<th>职工编号</th>
							<th>职工姓名</th>
							<th>所属部门id</th>
							<th>日期</th>
							<th>状态</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${atts }" var="attendance">
						<tr>
							<td>${attendance.id }</td>
							<td>${attendance.emp.name }</td>
							<td>${attendance.emp.dept.id} </td>
							<td>${attendance.attendTime }</td>
							<td>${attendance.attendState }</td>
						</tr>
					</c:forEach>
					</tbody>
					<c:if test="${attendanceInfoPage != null }">
					<tfoot>
						<tr>
							<td colspan="5" style="text-align:right;">
								<ul class="pagination">
									<li><a href="toSarchAttend?page=1" aria-label="Previous"> <span
											aria-hidden="true">&laquo;</span>
									</a></li>
									<c:choose>
										<c:when test="${currentPage le 1}">
											<li onclick="alert('已经是首页！')"><a href="javascript:void(0)">上一页</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="toSarchAttend?page=${currentPage-1}">上一页</a></li>
										</c:otherwise>
									</c:choose>
									<li><a href="javascript:void(0)">${currentPage }</a></li>
									<c:choose>
										<c:when test="${currentPage >= attendanceInfoPage.getTotalPages()}">
											<li onclick="alert('已经是最后一页！')"><a href="javascript:void(0)">下一页</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="toSarchAttend?page=${currentPage+1}">下一页</a></li>
										</c:otherwise>
									</c:choose>
									<%-- <li><a href="toSarchAttend?page=${currentPage-1}">上一页</a></li>
									<li><a href="toSarchAttend?page=${pages.number}">${attendspages.number+1}</a></li>
									<li><a href="toSarchAttend?page=${currentPage+1}">下一页</a></li> --%>
									<!-- <li><a href="#">4</a></li>
									<li><a href="#">5</a></li> -->
									<li><a href="toSarchAttend?page=${attendanceInfoPage.getTotalPages() }" aria-label="Next"> <span
											aria-hidden="true">&raquo;</span>
									</a></li>
								</ul>
							</td>
						</tr>
					</tfoot>
					</c:if>
				</table>
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
	<script>
		$(function() {
			$('#datetimepicker1').datetimepicker({
				format : 'yyyy-mm-dd',
				autoclose : true,
				minView : 2
			});
			$('#datetimepicker2').datetimepicker({
				format : 'yyyy-mm-dd',
				autoclose : true,
				minView : 2
			});
			var d = new Date();
			$("span>input[type='text']").val(d.toDefineString());
		});
	</script>
</body>

</html>

    