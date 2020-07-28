<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 
	页面: 
	1,创建show.jsp
	2,引入jQuery.js文件
	3,引入jstl标签库 核心标签库
	4,在项目中添加two.jsp页面 该页面为产生分页插件的jsp : 下面叫(分页插件页面)
	4,在body标签下创建最大的div class='divtable' : 所有的html代码都要放到这个div里面
	5,在div的合适位置遍历显示list集合
	6,在div的合适位置添加 分页插件 html代码 : 
		eg: 
		<div class="divtable">这个div是页面最大的div
			遍历显示list
			<!-- 分页插件 -->
			<div class="p_btn">
				<c:set var="pager_url"	value="page.action" />
				<c:set var="param_target" value="divtable" />
				<jsp:include page="include/two.jsp">
					<jsp:param name="url" value="${pager_url }" />
					<jsp:param name="target" value="${param_target }" />
				</jsp:include>
			</div> 
		</div>
		注: 这个class 为p_btn的div 就是分页插件的html代码 需要整体拷贝
		解释 :
		<c:set var="pager_url"	value="后台处理分页的action Url" />
		<jsp:include page="需要显示的(分页插件页面)位置">
		
		前台完成
后台:
	1,创建分页servlet page.action
	2,在page.action中需要从请求中获取用户当前点击的是第几页;注:这个参数是固定的
		//String pageNo = request.getParameter("pageNo");
		int pageNo = req.getParameter("pageNo")==null?1:Integer.parseInt(req.getParameter("pageNo"));
		
		SimplePage<BookABC> page = bookDao.page(10, pageNo);
		model.addAttribute("simplePage", page);
		
	3,把固定数据放到request容器中 : key都是固定的
		request.setAttribute("simplePage", sp);
	4,内部跳转到page.jsp页面
	
	或者:
		SimplePage<Employee> simplePage =new SimplePage<Employee>();
		
    	simplePage.setPage(page);//设置每页显示数据量
    	simplePage.setPageDataNum(empDao.countByExample(null));//设置总数量
    	simplePage.setPageNo(pageNo);
    	
    	List<Employee> empList = empDao.getEmployeeByPage(((pageNo-1)*(page+1)), (pageNo*page));
    	simplePage.setList(empList);
    	System.out.println("----|"+((pageNo-1)*(page+1))+"|------|"+(pageNo*page));
    	req.setAttribute("simplePage", simplePage);
    	req.getRequestDispatcher("/目标页面.jsp").forward(req, resp);
	
	注： 需要导入jstl标签库的jar包
	后台完成


--%>

<style type="text/css">
.page-nav{ text-align: center;  margin-top: 50px; }
.page-nav a{text-decoration: none;border:1px solid #D1E0EF;padding: 5px 7px;color: #767675;cursor: pointer;}
.page-nav .page-nava{background-color: #E4E9F7;}
</style>
<script type="text/javascript">
window.onload=function(){
	
	var pageNav = document.getElementsByClassName("page-nav")[0];
	var pageA  = pageNav.getElementsByTagName("a");
	for(var i =0;i<pageA.length;i++){
		pageA[i].onmouseover = function(){
			//console.log(this);
			this.className += ' page-nava ';
		}
		pageA[i].onmouseout=function(){
			//console.log(this);
			this.className = this.className.replace("page-nava","");
		}
	}
	
	//获得转到的inp 这个有bug
	/* var pageNoinp;
	var inputs = document.getElementsByTagName("input");
	for(var i = 0;i<inputs.length;i++){
		if("pageNo"==inputs[i].name){
			pageNoinp = inputs[i];
			//console.log("pageNoInp:"+inputs[i])
		}
	}
	pageNoinp.onkeypress=function(event){
		
		if(13==event.keyCode){
			gotoPage();
		}
	} */
	
	
	
};

/* $(function(){
	$(".page-nav a").on({
		mouseover:function(){
			$(this).toggleClass("page-nava");
		},
		mouseout:function(){
			$(this).toggleClass("page-nava");
		}
	});
	
}); */

</script>


<!-- 分页   -->
<c:set var="target" value="${param.target }" />
<c:set var="pager_url" value="${param.url }" />
<c:set var="pager_old" value="${param.old }" />


<c:set var="offset" value="5" /><!-- 显示10页数据  -->

<!-- 页面数据 -->
<!-- 总共有多少页 -->
<%-- <c:set var="pageCount" value="7"  />  --%>

<!-- 当前少页  -->
<%-- <c:set var="pageNo" value="0"  /> --%>

<%-- 总共有多少页:${pageCount }   当前少页:${pageNo }   --%>
<c:if test="${simplePage.pageCount -1 >= 0  }">
	<%--页数过少 --%>
	<c:if test="${simplePage.pageCount - offset < 0}">
		<c:set var="pager_begin" value="1" />
		<c:set var="pager_end" value="${simplePage.pageCount}" />
	</c:if>
	<c:if test="${simplePage.pageCount - offset >= 0}">
		<c:set var="pager_begin" value="${simplePage.pageNo - (offset / 2)}" />
		<!-- 页码偏前 -->
		<c:if test="${simplePage.pageNo -(offset / 2) < 0 }">
			<c:set var="pager_begin" value="0" />
		</c:if>
		<!-- 页码偏后 -->
		<c:if test="${(simplePage.pageCount - simplePage.pageNo) - (offset / 2) < 0}">
			<c:set var="pager_begin" value="${simplePage.pageCount - offset}" />
		</c:if>
		<c:set var="pager_end" value="${pager_begin + offset}" />
	</c:if>
	
	<div class="page-nav">
		
		<c:if test="${simplePage.pageNo - 1 >  0}">
			<a href='javascript:toLoad("${simplePage.pageNo - 1}")' style="margin-right: 10px;">&lt;上一页 </a>
		</c:if>
		
		     
		<c:forEach var="n" begin="${pager_begin }" end="${pager_end  }" step="1">
			<c:if test="${n != simplePage.pageNo }">
				<a href='javascript:toLoad("${n }");'>${n }</a>
			</c:if>
			<c:if test="${n == simplePage.pageNo }">
				<span style=" color: red;">${n}</span>
			</c:if>
		</c:forEach> 
		<c:if test="${simplePage.pageNo  -  simplePage.pageCount < 0}">
			<a href='javascript:toLoad("${simplePage.pageNo + 1}")'>下一页 &gt;</a>
		</c:if>
		<span class="separator J_pageList">共${simplePage.pageCount }页,${simplePage.pageDataNum }条数据</span>
		
		<input type="text" name="pageNo"  style="width: 40px;">
 		<span onclick="gotoPage()">转到</span>
	</div>
</c:if>
<script type="text/javascript">
/**
 * url 请求的地址
 * content 局部刷新的内容
 */
function toLoad(num){
	
	var a = "${target}";
	var oldParam  = "${pager_old}";
	console.log("-=-=-=-=-"+a);
	var target = document.getElementsByClassName("${target}")[0];
	myajax("${pager_url}","pageNo="+num+"&"+oldParam,target);
	
	//$("${target}").load("${pager_url }",{pageNo:num});
} 
function myajax(url,data,target){
	var ajax = new XMLHttpRequest();
	ajax.open("post",url,true);
	ajax.setRequestHeader("cache-control","no-cache");  //不缓存
	ajax.setRequestHeader("contentType","text/html;charset=uft-8") //指定发送的编码 
	ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;");//form  
	ajax.onreadystatechange = function(){
		if(ajax.readyState == 4 && ajax.status==200){
			target.innerHTML = ajax.responseText;
		}
	}
	ajax.send(data);
}
/**
	 
 */
function gotoPage(){
	
	
	var pageNoinp;
	var inputs = document.getElementsByTagName("input");
	for(var i = 0;i<inputs.length;i++){
		if("pageNo"==inputs[i].name){
			pageNoinp = inputs[i];
			//console.log("pageNoInp:"+inputs[i])
		}
	}
	var pageNo  = pageNoinp.value;
	var pageCount  = Number('${simplePage.pageCount}');
	console.log(pageNo+"----"+pageCount);
	if(pageNo - pageCount <= 0){
		var target = document.getElementsByClassName("${target}")[0];
		myajax("${pager_url}","pageNo="+pageNo,target);
	}else{
		alert("您输入的不合法,请输入有效数据。");
	}
	
	
	/* var pageNo = Number($("input[name='pageNo']").val());
	var pageCount  = Number('${pageCount}');
	if(pageNo - pageCount <= 0){
		$("${target}").load("${pager_url }",{pageNo:pageNo});
	}else{
		alert("您输入的不合法,请输入有效数据。")
	} */
}

</script>