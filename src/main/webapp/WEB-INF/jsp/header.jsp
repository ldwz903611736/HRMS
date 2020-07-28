<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header col-md-12 col-xs-12 col-sm-12">
<img alt="" src="image/logo2.png" style="height:85px; ">
</div>
      <div class="col-md-2 col-xs-2 col-sm-2">
          <div class="panel-group table-responsive" role="tablist">
     <!-- 小型权限控制 -->
    <%-- <c:if test="${moreflag }"> --%>
   
        <div class="panel panel-primary leftMenu">
            <!-- 利用data-target指定要折叠的分组列表 -->
            <div class="panel-heading" id="collapseListGroupHeading1" data-toggle="collapse" data-target="#collapseListGroup1" role="tab" >
                <h4 class="panel-title">
                 	  员工资料管理
                    <span class="glyphicon glyphicon-menu-up right"></span>
                </h4>
            </div>
            <!-- .panel-collapse和.collapse标明折叠元素 .in表示要显示出来 -->
            <div id="collapseListGroup1" class="panel-collapse collapse  ${num==1?'in':''}" role="tabpanel" aria-labelledby="collapseListGroupHeading1">
                <ul class="list-group">
                  <li class="list-group-item">
                    <!-- 利用data-target指定URL emp/empList.html-->
                    <button class="menu-item-left" data-target="empList"   >
                        <!-- <span class="glyphicon glyphicon-triangle-right"></span>职工列表 -->
                        <a href="empList" class="glyphicon glyphicon-triangle-right" style="text-decoration:none;">职工列表</a>
                    </button>
                  </li>
                  <li class="list-group-item"><!-- emp/addEmp.html -->
                    <button class="menu-item-left" data-target="toAddEmp" >
                        <!-- <span class="glyphicon glyphicon-triangle-right" onclick="window.location.href='toAddEmp'"></span>添加职工 -->
                        <a href="toAddEmp" class="glyphicon glyphicon-triangle-right" style="text-decoration:none;">添加职工</a>
                    </button> 
                  </li>
                </ul>
            </div>
        </div><!--panel end-->
        <div class="panel panel-primary leftMenu">
               <div class="panel-heading" id="collapseListGroupHeading2" data-toggle="collapse" data-target="#collapseListGroup2" role="tab" >
                   <h4 class="panel-title">
                       	公司部门管理
                       <span class="glyphicon glyphicon-menu-up right"></span>
                   </h4>
               </div>
               <div id="collapseListGroup2" class="panel-collapse collapse  ${num==2?'in':'' }" role="tabpanel" aria-labelledby="collapseListGroupHeading2">
                   <ul class="list-group">
					<li class="list-group-item">
                        <!-- 利用data-target指定URL --><!-- depart/departList.html -->
	                    <button class="menu-item-left" data-target="toDepartList">
	                        <!-- <span class="glyphicon glyphicon-triangle-right" onclick="window.location.href='toDepartList'"></span>部门列表 -->
	                        <a href="findAll" class="glyphicon glyphicon-triangle-right" style="text-decoration:none;">部门列表</a>
	                    </button>
                  	</li>
                  <li class="list-group-item">
                    <button class="menu-item-left" data-target="toAddDepart">
                        <!-- <span class="glyphicon glyphicon-triangle-right" onclick="window.location.href='toAddDepart'"></span>添加部门 -->
                        <a href="toAddDepart" class="glyphicon glyphicon-triangle-right" style="text-decoration:none;">添加部门</a>
                    </button> 
                  </li>
                </ul>
            </div>
        </div>  
    
    <%-- </c:if> --%> 	
    	<div class="panel panel-primary leftMenu">
            <!-- 利用data-target指定要折叠的分组列表 -->
            <div class="panel-heading" id="collapseListGroupHeading3" data-toggle="collapse" data-target="#collapseListGroup3" role="tab" >
                <h4 class="panel-title">
                  	 员工考勤管理
                    <span class="glyphicon glyphicon-menu-up right"></span>
                </h4>
            </div>
            <!-- .panel-collapse和.collapse标明折叠元素 .in表示要显示出来 -->
            <div id="collapseListGroup3" class="panel-collapse collapse  ${num==3?'in':''}" role="tabpanel" aria-labelledby="collapseListGroupHeading3">
                <ul class="list-group">
                  <li class="list-group-item">
                    <!-- 利用data-target指定URL -->
                  	<button class="menu-item-left" data-target="todayAttend">
                        <!-- <span class="glyphicon glyphicon-triangle-right" onclick="window.location.href='todayAttend'"></span>今日考勤 -->
                        <a href="todayAttend" class="glyphicon glyphicon-triangle-right" style="text-decoration:none;">今日考勤</a>
                    </button>
                  </li>
                  <li class="list-group-item"><!-- attendace/searchAttend.html -->
                    <button class="menu-item-left" data-target="toSarchAttend">
                        <!-- <span class="glyphicon glyphicon-triangle-right" onclick="window.location.href='toSarchAttend'"></span>考勤查询 -->
                   	  	<a href="toSarchAttend" class="glyphicon glyphicon-triangle-right" style="text-decoration:none;">考勤查询</a>
                    </button>
                  </li>
                  <li class="list-group-item"><!-- attendace/qiandao.html -->
                    <button class="menu-item-left" data-target="toqiandao">
                     <!--    <span class="glyphicon glyphicon-triangle-right" onclick="window.location.href='toqiandao'"></span>职工签到 -->
                        <a href="toqiandao" class="glyphicon glyphicon-triangle-right" style="text-decoration:none;">职工签到</a>
                    </button>
                  </li>
                </ul>
            </div>
        </div>
        
         <div class="panel panel-primary leftMenu">
               <div class="panel-heading" id="collapseListGroupHeading2" data-toggle="collapse" data-target="#collapseListGroup4" role="tab" >
                   <h4 class="panel-title">
                       	系统管理
                       <span class="glyphicon glyphicon-menu-up right"></span>
                   </h4>
               </div>
               <div id="collapseListGroup4" class="panel-collapse collapse  ${num==4?'in':'' }" role="tabpanel" aria-labelledby="collapseListGroupHeading2">
                   <ul class="list-group">
					<li class="list-group-item">
                        <!-- 利用data-target指定URL --><!-- depart/departList.html -->
	                    <button class="menu-item-left" data-target="toDepartList">
	                        <!-- <span class="glyphicon glyphicon-triangle-right" onclick="window.location.href='toDepartList'"></span>部门列表 -->
	                        <a href="quit" class="glyphicon glyphicon-triangle-right" style="text-decoration:none;">退出系统</a>
	                    </button>
                  	</li>
                </ul>
            </div>
        </div> 
   		
    </div>
</div>

    