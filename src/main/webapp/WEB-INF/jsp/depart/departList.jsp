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
<style>

	thead, tbody, th, tr, td{
		text-align: center;
	}

</style>
  <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	
</head>
<body>
	<div class="row">
	    <!-- 引入公共的头文件 -->
	    <%-- <jsp:include page="/header.jsp"></jsp:include>	 --%>
		<div id="headers">
	   </div>
	    <script type="text/javascript">
			$("#headers").load("header");
			
	    </script>
		<c:if test="${! empty msg}">
			<script type="text/javascript">
				alert('${msg}');
			</script>
	</c:if>
		<div id="content" class="col-md-10 col-xs-10 col-sm-10" style="padding-top: 0; margin: 0;">
			<div  style="margin-top: 30px;">
			<form class="form-inline" action="toDepartList" method="get">
					<input type="search" name="deptId" class="form-control" placeholder="请输入部门编号">
					<input type="search" name="deptName" class="form-control" placeholder="请输入部门名称">
					<button type="submit" class="btn btn-primary">Search</button>
			</form>
			<div class="table-responsive"  style="margin-top: 20px;">
				<table class="table_list  table-condensed table-hover table-bordered  table-striped">
					<thead>
						<tr>
							<th>部门编号</th>
							<th>部门名称</th>
							<th>职工人数</th>
							<th>部门描述</th>
							<th>操作</th>
						</tr>	
					</thead>
					<tbody>
					<c:forEach items="${depts }" var="dep">
						<tr>
							<td>${dep.id }</td>
							<td>${dep.name }</td>
							<td>${dep.empSize }</td>
							<td>${dep.describe }</td>
							<td><a href="delete?id=${dep.id }"><button class="btn btn-primary">删除</button></a>
							　<a href="toEdit?id=${dep.id }"><button class="btn btn-primary">编辑</button></a>
							</td>
						</tr>		
					</c:forEach>
					</tbody>
					<c:if test="${departmentsInfoPage != null}">
					<tfoot>
						<tr>
							<td colspan="5" style="text-align:right;">
								<ul class="pagination">
									<li><a href="findAll?page=1" aria-label="Previous"> <span
											aria-hidden="true">&laquo;</span>
									</a></li>
									<c:choose>
										<c:when test="${currentPage le 1}">
											<li onclick="alert('已经是首页！')"><a href="javascript:void(0)">上一页</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="findAll?page=${currentPage-1}">上一页</a></li>
										</c:otherwise>
									</c:choose>
									<li><a href="javascript:void(0)">${currentPage }</a></li>
									<c:choose>
										<c:when test="${currentPage >= departmentsInfoPage.getTotalPages()}">
											<li onclick="alert('已经是最后一页！')"><a href="javascript:void(0)">下一页</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="findAll?page=${currentPage+1}">下一页</a></li>
										</c:otherwise>
									</c:choose>
									<%-- <li><a href="toSarchAttend?page=${currentPage-1}">上一页</a></li>
									<li><a href="toSarchAttend?page=${pages.number}">${attendspages.number+1}</a></li>
									<li><a href="toSarchAttend?page=${currentPage+1}">下一页</a></li> --%>
									<!-- <li><a href="#">4</a></li>
									<li><a href="#">5</a></li> -->
									<li><a href="findAll?page=${departmentsInfoPage.getTotalPages() }" aria-label="Next"> <span
											aria-hidden="true">&raquo;</span>
									</a></li>
								</ul>
							</td>
						</tr>
					</tfoot>
					</c:if>
					<%-- <tfoot>
						<tr >
							<td colspan="8" style="text-align: right;"> 
								<ul class="pagination">
								    <li>
								      <a href="toDepartList?pageId=0" aria-label="Previous">
								        <span aria-hidden="true">&laquo;</span>
								      </a>
								    </li>
								   		<li><a href="toDepartList?page=${pages.number-1}">上一页</a>
								   		<li><a href="toDepartList?page=${pages.number}">${pages.number+1}</a></li>
								   		<li><a href="toDepartList?page=${pages.number+1}">下一页</a>
								    <!-- <li><a href="#">2</a></li>
								    <li><a href="#">3</a></li>
								    <li><a href="#">4</a></li>
								    <li><a href="#">5</a></li> -->
								    	
								    <li>
								      <a href="toDepartList?pageId=${pages.totalPages-1 }" aria-label="Next">
								        <span aria-hidden="true">&raquo;</span>
								      </a>
								    </li>
								  </ul>
	      					</td>
						</tr>
					</tfoot> --%>
				</table>
			</div>
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
