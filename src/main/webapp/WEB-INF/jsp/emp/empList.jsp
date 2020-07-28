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
	<link href="bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
     <link href="css/main.css" rel="stylesheet">
     <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>

</head>
<body>
	<div class="row divtable">
	    <!-- 引入公共的头文件 -->
	   <%--  <jsp:include page="../header"></jsp:include> --%>
	   <div id="headers">
	   </div>
	    <script type="text/javascript">
			$("#headers").load("header");
			
	    </script>
    	<div id="content" class="col-md-10 col-xs-10 col-sm-10" style="padding-top: 0;margin: 0;">
			<div  style="margin-top: 30px;">
				<form class="form-inline" action="serach" method="post">
						<input type="search" name="deptName" class="form-control" value="${param.deptName }" placeholder="请输入部门名称">
						<input type="search" name="username" class="form-control" value="${param.username }" placeholder="请输入职工姓名">
						<input type="search" name="empId" class="form-control" value="${param.empId }" placeholder="请输入职工编号">
						<input type="search" name="downSalary" class="form-control" value="${param.downSalary }" placeholder="请输入职工最低薪资">
						<input type="search" name="upSalary" class="form-control" value="${param.upSalary }" placeholder="请输入职工最高薪资">
						<button type="submit" class="btn btn-primary">Search</button>
				</form>
				<div class="table-responsive"  style="margin-top: 20px;">
						<table class="table_list table-condensed table-hover table-bordered  table-striped" >
							<thead>
								<tr>
									<th>编号</th>
									<th>姓名</th>
									<th>性别</th>
									<th>出生日期</th>
									<th>所属部门</th>
									<th>职位</th>
									<th>基本薪资</th>
									<th>电话</th>
									<th>详细信息</th>
								</tr>	
							</thead>
							<tbody>
							<c:forEach items="${emps }" var="emp">
								<tr>
									<td>${emp.id }</td>
									<td>${emp.name }</td>
									<td>${emp.gender }</td>
									<td>${emp.birthday }</td>
									<td>${emp.dept.name }</td>
									<td>${emp.role }</td>
									<td>${emp.salary }</td>
									<td>${emp.tel }</td>
									<td><a href="detail?id=${emp.id }"><button class="btn btn-primary btn-sm">查看</button></a></td>
								</tr>
							</c:forEach>
							</tbody>
							<c:if test="${empInfoPage != null}">
							<tfoot>
						<tr>
							<td colspan="9" style="text-align:right;">
								<ul class="pagination">
									<li><a href="empList?page=1" aria-label="Previous"> <span
											aria-hidden="true">&laquo;</span>
									</a></li>
									<c:choose>
										<c:when test="${currentPage le 1}">
											<li onclick="alert('已经是首页！')"><a href="javascript:void(0)">上一页</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="empList?page=${currentPage-1}">上一页</a></li>
										</c:otherwise>
									</c:choose>
									<li><a href="javascript:void(0)">${currentPage }</a></li>
									<c:choose>
										<c:when test="${currentPage >= empInfoPage.getTotalPages()}">
											<li onclick="alert('已经是最后一页！')"><a href="javascript:void(0)">下一页</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="empList?page=${currentPage+1}">下一页</a></li>
										</c:otherwise>
									</c:choose>
									<%-- <li><a href="toSarchAttend?page=${currentPage-1}">上一页</a></li>
									<li><a href="toSarchAttend?page=${pages.number}">${attendspages.number+1}</a></li>
									<li><a href="toSarchAttend?page=${currentPage+1}">下一页</a></li> --%>
									<!-- <li><a href="#">4</a></li>
									<li><a href="#">5</a></li> -->
									<li><a href="empList?page=${empInfoPage.getTotalPages() }" aria-label="Next"> <span
											aria-hidden="true">&raquo;</span>
									</a></li>
								</ul>
							</td>
						</tr>
					</tfoot>
					</c:if>
							<%-- <tfoot>
								<tr>
									<td colspan="9"  style="text-align: right;"> 
										
										
										
										<div class="p_btn">
											<c:set var="pager_url"	value="toEmpList" />
											<c:set var="param_target" value="divtable" />
											<c:set var="param_old" value="<%= request.getQueryString() %>"></c:set>
											<jsp:include page="../include/three.jsp">
												<jsp:param name="url" value="${pager_url }" />
												<jsp:param name="target" value="${param_target }" />
												<jsp:param name="old" value="${param_old }" />
											</jsp:include>
										</div> 
										<!-- <ul class="pagination">
										    <li>
										      <a href="#" aria-label="Previous">
										        <span aria-hidden="true">&laquo;</span>
										      </a>
										    </li>
										    <li><a href="#">1</a></li>
										    <li><a href="#">2</a></li>
										    <li><a href="#">3</a></li>
										    <li><a href="#">4</a></li>
										    <li><a href="#">5</a></li>
										    <li>
										      <a href="#" aria-label="Next">
										        <span aria-hidden="true">&raquo;</span>
										      </a>
										    </li>
										</ul> -->
			      					</td>
								</tr>
						</tfoot> --%>
						</table>
				</div>
			</div>
        </div>
    </div>
    <script src="js/jquery-3.2.1.min.js " type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/date.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.min.js"></script>
   	<script type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script type="text/javascript" src="js/menu.js"></script>
</body>
</html>