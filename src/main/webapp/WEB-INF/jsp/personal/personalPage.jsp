<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>表格</title>
<link rel="shortcut icon" href="img/favicon.ico">
<!-- Bootstrap3.3.5 CSS -->
<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- datatime -->
<link href="../bootstrap/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">
</head>

<body>
	<div class="row">
		<div class="header col-md-12 col-xs-12 col-sm-12">
			<img alt="" src="../image/logo2.png" style="height: 85px;">
		</div>
		<div class="col-md-2 col-xs-2 col-sm-2">
            <div class="panel-group table-responsive" role="tablist">
                <div class="panel panel-primary leftMenu">
                    <!-- 利用data-target指定要折叠的分组列表 -->
                    <div class="panel-heading" id="collapseListGroupHeading1" data-toggle="collapse" data-target="#collapseListGroup1" role="tab" >
                        <h4 class="panel-title">
                           员工资料管理
                            <span class="glyphicon glyphicon-menu-up right"></span>
                        </h4>
                    </div>
                    <!-- .panel-collapse和.collapse标明折叠元素 .in表示要显示出来 -->
                    <div id="collapseListGroup1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="collapseListGroupHeading1">
                        <ul class="list-group">
                          <li class="list-group-item">
                            <!-- 利用data-target指定URL -->
                           <button class="menu-item-left" data-target="../emp/empList.html">
                                <span class="glyphicon glyphicon-triangle-right"></span>职工列表
                            </button> 
                          </li>
                          <li class="list-group-item">
                            <button class="menu-item-left" data-target="../emp/addEmp.html">
                                <span class="glyphicon glyphicon-triangle-right"></span>添加职工
                            </button>
                          </li>
                        
                        </ul>
                    </div>
                </div><!--panel end-->
                <div class="panel panel-primary leftMenu">
                    <div class="panel-heading" id="collapseListGroupHeading2" data-toggle="collapse" data-target="#collapseListGroup2" role="tab" >
                        <h4 class="panel-title">
                            公司部门管理
                            <span class="glyphicon glyphicon-menu-down right"></span>
                        </h4>
                    </div>
                    <div id="collapseListGroup2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="collapseListGroupHeading2">
                        <ul class="list-group">
                          <li class="list-group-item">
                          	<button class="menu-item-left" data-target="../depart/departList.html">
                                <span class="glyphicon glyphicon-triangle-right"></span>部门列表
                            </button>
                          </li>
                          <li class="list-group-item">
                          	<button class="menu-item-left" data-target="../depart/addDepart.html">
                                <span class="glyphicon glyphicon-triangle-right"></span>添加部门
                            </button>
                          </li>
                        </ul>
                    </div>
                </div>  
            	<div class="panel panel-primary leftMenu">
                    <!-- 利用data-target指定要折叠的分组列表 -->
                    <div class="panel-heading" id="collapseListGroupHeading3" data-toggle="collapse" data-target="#collapseListGroup3" role="tab" >
                        <h4 class="panel-title">
                           员工考勤管理
                            <span class="glyphicon glyphicon-menu-up right"></span>
                        </h4>
                    </div>
                    <!-- .panel-collapse和.collapse标明折叠元素 .in表示要显示出来 -->
                    <div id="collapseListGroup3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="collapseListGroupHeading3">
                        <ul class="list-group">
                          <li class="list-group-item">
                            <!-- 利用data-target指定URL -->
                          	<button class="menu-item-left" data-target="../attendace/todayAttend.html">
                                <span class="glyphicon glyphicon-triangle-right"></span>今日考勤
                            </button>
                          </li>
                          <li class="list-group-item">
                            <button class="menu-item-left" data-target="../attendace/searchAttend.html">
                                <span class="glyphicon glyphicon-triangle-right"></span>考勤查询
                            </button> 
                          </li>
                          <li class="list-group-item">
                            <button class="menu-item-left" data-target="../attendace/qiandao.html">
                                <span class="glyphicon glyphicon-triangle-right"></span>职工签到
                            </button> 
                          </li>
                        </ul>
                    </div>
                </div>
           		<div class="panel panel-primary leftMenu">
                    <!-- 利用data-target指定要折叠的分组列表 -->
                    <div class="panel-heading" id="collapseListGroupHeading4" data-toggle="collapse" data-target="#collapseListGroup4" role="tab" >
                        <h4 class="panel-title">
                           员工加班管理
                            <span class="glyphicon glyphicon-menu-up right"></span>
                        </h4>
                    </div>
                    <!-- .panel-collapse和.collapse标明折叠元素 .in表示要显示出来 -->
                    <div id="collapseListGroup4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="collapseListGroupHeading4">
                       <ul class="list-group">
                              <li class="list-group-item">
                                <!-- 利用data-target指定URL -->
                                <button class="menu-item-left" data-target="../extrawork/extraworkList.html">
                                    <span class="glyphicon glyphicon-triangle-right"></span>部门加班查询
                                </button>
                              </li>
                              <li class="list-group-item">
                                <button class="menu-item-left" data-target="../extrawork/extraworkList.html">
                                    <span class="glyphicon glyphicon-triangle-right"></span>个人加班查询
                                </button>
                              </li>
                              <li class="list-group-item">
                               <button class="menu-item-left" data-target="../extrawork/addExtrawork.html">
                                    <span class="glyphicon glyphicon-triangle-right"></span>新增加班信息
                                </button>
                              </li>
                            </ul>
                    </div>
                </div>
            	<div class="panel panel-primary leftMenu">
                    <!-- 利用data-target指定要折叠的分组列表 -->
                    <div class="panel-heading" id="collapseListGroupHeading5" data-toggle="collapse" data-target="#collapseListGroup5" role="tab" >
                        <h4 class="panel-title">
                          职工薪资管理
                            <span class="glyphicon glyphicon-menu-up right"></span>
                        </h4>
                    </div>
                    <!-- .panel-collapse和.collapse标明折叠元素 .in表示要显示出来 -->
                    <div id="collapseListGroup5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="collapseListGroupHeading5">
                        <ul class="list-group">
                          <li class="list-group-item">
                            <button class="menu-item-left" data-target="../salary.html">
                                <span class="glyphicon glyphicon-triangle-right"></span>薪资汇总发放
                            </button>
                          </li>
                        </ul>
                    </div>
                </div>
               <div class="panel panel-primary leftMenu">
                        <!-- 利用data-target指定要折叠的分组列表 -->
                        <div class="panel-heading" id="collapseListGroupHeading6" data-toggle="collapse" data-target="#collapseListGroup6" role="tab" >
             				<h4 class="panel-title">
             假期情况管理
                                <span class="glyphicon glyphicon-menu-up right"></span>
                            </h4>
                        </div>
                        <!-- .panel-collapse和.collapse标明折叠元素 .in表示要显示出来 -->
                        <div id="collapseListGroup6" class="panel-collapse collapse" role="tabpanel" aria-labelledby="collapseListGroupHeading6">
                            <ul class="list-group">
                              <li class="list-group-item">
                                <!-- 利用data-target指定URL -->
                                <button class="menu-item-left" data-target="../attendace/applyHoliday.html">
                                    <span class="glyphicon glyphicon-triangle-right"></span>假期申请
                                </button>
                              </li>
                            </ul>
                        </div>
                    </div>
                    <div class="panel panel-primary leftMenu">
                        <!-- 利用data-target指定要折叠的分组列表 -->
                        <div class="panel-heading" id="collapseListGroupHeading7" data-toggle="collapse" data-target="#collapseListGroup7" role="tab" >
                            <h4 class="panel-title">
                               个人页面
                                <span class="glyphicon glyphicon-menu-up right"></span>
                            </h4>
                        </div>
                        <!-- .panel-collapse和.collapse标明折叠元素 .in表示要显示出来 -->
                        <div id="collapseListGroup7" class="panel-collapse collapse  in" role="tabpanel" aria-labelledby="collapseListGroupHeading7">
                            <ul class="list-group">
                              <li class="list-group-item">
                                <!-- 利用data-target指定URL -->
                                <button class="menu-item-left" data-target="../personal/personalPage.html">
                                    <span class="glyphicon glyphicon-triangle-right"></span>个人页面
                                </button>
                              </li>
                            </ul>
                        </div>
                    </div>
                </div>
        </div>
		<div id="content" class="col-md-10 col-xs-10 col-sm-10" style="padding-top: 0; margin: 0;">




			<div id="personaldiv">
				<form class="form-horizontal" action="" method="post"
					enctype="multipart/form-data">
					<fieldset>
						<legend>基本信息</legend>
						<div class="form-group has-feedback">
							<label class="control-label col-md-2 col-xs-2 col-sm-2">职工姓名:</label>
							<div class="col-md-4 col-xs-4 col-sm-4">
								<input type="text" name="username" class="form-control">
								<span class="glyphicon glyphicon-user form-control-feedback"></span>
							</div>
	
						</div>
						<div class="form-group">
							<label class="control-label col-md-2 col-xs-2 col-sm-2">性别:</label>
							<div class="col-md-4 col-xs-4 col-sm-4 radio">
								<label> <input type="radio" name="gender" value="男">男
								</label> <label> <input type="radio" name="gender" value="女">女
								</label>
							</div>
						</div>
						<div class="form-group has-feedback">
							<label class="control-label col-md-2 col-xs-2 col-sm-2">出生日期:</label>
							<div class="col-md-4 col-xs-4 col-sm-4 input-append date"
								id="datetimepicker" data-date-format="yyyy-mm-dd">
								<input class="form-control" size="16" type="text"> <span
									class="add-on form-control-feedback"><i
									class="icon-th glyphicon glyphicon-calendar"></i></span>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-2 col-xs-2 col-sm-2">个人邮箱:</label>
							<div class="col-md-4 col-xs-4 col-sm-4">
								<input type="text" name="email" class="form-control">
							</div>
	
						</div>
						<div class="form-group">
							<label class="control-label col-md-2 col-xs-2 col-sm-2">个人电话:</label>
							<div class="col-md-4 col-xs-4 col-sm-4">
								<input type="text" name="telephone" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-2 col-xs-2 col-sm-2">所属部门:</label>
							<div class="col-md-4 col-xs-4 col-sm-4">
								<input type="text" name="department" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-2 col-xs-2 col-sm-2">职
								位:</label>
							<div class="col-md-4 col-xs-4 col-sm-4">
								<select class="form-control" name="role">
									<option value="0">职工</option>
									<option value="11">经理</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-2 col-xs-2 col-sm-2">薪
								资:</label>
							<div class="col-md-4 col-xs-4 col-sm-4">
								<input type="text" name="salary" class="form-control">
							</div>
						</div>
					</fieldset>
					<fieldset>
						<legend>个人简历</legend>
						<div class="form-group">
							<label class="control-label col-md-1 col-xs-1 col-sm-1"></label>
							<div class="col-md-5 col-xs-5 col-sm-5">
								<textarea class="form-control" rows="5" cols="68" name="info"></textarea>
							</div>
						</div>
					</fieldset>
					<div class="form-group col-md-7 col-xs-7 col-sm-7"
						style="text-align: center;">
						<input type="submit" class="btn btn-success" value="提 交" />
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="../js/jquery-3.2.1.min.js "></script>
	<script src="../bootstrap/js/bootstrap.min.js "></script>
	<script type="text/javascript" src="../js/date.js"></script>
	<script type="text/javascript"
		src="../bootstrap/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript"
		src="../bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
	<script type="text/javascript" src="../js/menu.js"></script>
	<script>
		$(function() {
			$('#datetimepicker').datetimepicker({
				format : 'yyyy-mm-dd',
				autoclose : true,
				minView : 2
			});
		});
	</script>
</body>

</html>

