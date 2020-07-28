<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("num",3);
%>
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
        <link rel="stylesheet" type="text/css" href="css/sign.css"/>  
     
      <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	
    </head>

    <body>
		<!-- 引入公共的头文件 -->
		<%-- <jsp:include page="/header.jsp"></jsp:include> --%>
		 <div id="headers">
	   </div>
	    <script type="text/javascript">
			$("#headers").load("header");
	    </script>
		
         <div id="content" class="col-md-10 col-xs-10 col-sm-10" style="padding-top: 0;margin: 0;">
         		<div style="margin-top: 20px;">
					 <div style="width:300px;height:300px;" id="calendar"></div>  
				</div>
         </div>
           <script src="js/jquery-3.2.1.min.js "></script>
        <script src="bootstrap/js/bootstrap.min.js "></script>
        <script type="text/javascript" src="js/date.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.min.js"></script>
       	<script type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
        <script type="text/javascript" src="js/menu.js"></script>
        <script type="text/javascript" src="js/qiandao.js"></script>
		<!-- <script type="text/javascript">
			  $(function(){  
			    //ajax获取日历json数据  
			  var signList=[{"signDay":"10","status":"1"},{"signDay":"11","status":"1"},
			                  {"signDay":"12","status":"2"},{"signDay":"13","status":"2"}];  
			     calUtil.init(signList);   
			  });  
		</script> -->
         
		<script type="text/javascript">
			  $(function(){  
				 
				  
				  $.ajax({
						url:"getQianDaoData",
						type:"post",
						contentType:"application/json",
						dateType:"JSON",
						async:false,
						success:function(data){
							 //ajax获取日历json数据  
						  /*   var signList=JSON.parse(data);
						   console.log(data); */
						    calUtil.init(data); 
						}
					});	
			    
			  });  
			//发送ajax请求
			function myAjax(url,obj){
				var json = JSON.stringify(obj);
				console.log("本次发送数据:"+json)
				$.ajax({
					url:url,
					type:"post",
					contentType:"application/json",
					data:json,
					dateType:"JSON",
					success:function(data){
						$("#calendar").html(data);
					}
				});	
			}//发送ajax function end
		</script> 
    </body>

</html>