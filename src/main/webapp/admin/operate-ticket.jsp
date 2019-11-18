<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>票务管理- iBook后台管理系统</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="apple-touch-icon-precomposed" href="images/icon/damaiz_icon.png">
<link rel="shortcut icon" href="images/icon/damaiz_icon.png">
<script src="js/jquery-2.1.4.min.js"></script>
<!--[if gte IE 9]>
  <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
  <script src="js/html5shiv.min.js" type="text/javascript"></script>
  <script src="js/respond.min.js" type="text/javascript"></script>
  <script src="js/selectivizr-min.js" type="text/javascript"></script>
<![endif]-->
<!--[if lt IE 9]>
  <script>window.location.href='upgrade-browser.html';</script>
<![endif]-->
<style type="text/css">
		body{
			 font-family:"Hanzipen SC";
		}

</style>
</head>

<body class="user-select">
<section class="container-fluid">
  <header>
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
          <a class="navbar-brand" href="/">iBookCMS</a> </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="">消息 <span class="badge">1</span></a></li>
            <li class="dropdown"><c:if test="${not empty manageuser }">
            
            
           			 <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
           				 ${manageuser.name }
            			 <span class="caret">
            			 </span>
            		</a>
          		  			</c:if>
              <ul class="dropdown-menu dropdown-menu-left">
                <li><a title="查看或修改个人信息" data-toggle="modal" data-target="#seeUserInfo">个人信息</a></li>
                <li><a title="查看您的登录记录" data-toggle="modal" data-target="#seeUserLoginlog">登录记录</a></li>
              </ul>
            </li>
              <li><a href="/ManageUserLogout" onClick="if(!confirm('是否确认退出？'))return false;">退出登录</a></li>
            <li><a data-toggle="modal" data-target="#WeChat">帮助</a></li>
          </ul>
          
            
        
        </div>
      </div>
    </nav>
  </header>
  <div class="row">
    <aside class="col-sm-3 col-md-2 col-lg-2 sidebar">
      <ul class="nav nav-sidebar">
        <li><a href="index.jsp">报告</a></li>
      </ul>
      <ul class="nav nav-sidebar">
          <c:if test="${manageuser.book==1}">
      	 <li class="active"><a href="/AdminGetInitBookInfoServlet?curPage=1">票务</a></li>
      </c:if>
       <c:if test="${manageuser.order==1}">
      	  <li><a href="/FindAllordersServlet?curPage=1">订单</a></li>
      </c:if>
      <c:if test="${manageuser.mark==1}">
      	<li><a href="/MarkListServlet?curPage=1">评论</a></li>
      </c:if>
      <c:if test="${manageuser.vote==1}">
      	  <li><a href="/InitVoteListServlet?curPage=1">投票</a></li>
      </c:if>
      </ul>
      <ul class="nav nav-sidebar">
       <c:if test="${manageuser.mark==1}">
      	 <li><a href="/getCategoryType.do?curPage=1">类别</a></li>
      </c:if>
        <li><a class="dropdown-toggle" id="otherMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">其他</a>
          <ul class="dropdown-menu" aria-labelledby="otherMenu">
            <li><a href="flink.html">友情链接</a></li>
            <li><a href="loginlog.html">访问记录</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav nav-sidebar">
        <li><a class="dropdown-toggle" id="userMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">用户</a>
          <ul class="dropdown-menu" aria-labelledby="userMenu">
            <li><a href="/ManageUserListServlet?curPage=1">管理管理员</a></li>
            <li><a href="/UserListServlet?curPage=1">管理用户</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="loginlog.html">管理登录日志</a></li>
          </ul>
        </li>
        <li><a class="dropdown-toggle" id="settingMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">设置</a>
          <ul class="dropdown-menu" aria-labelledby="settingMenu">
            <li><a href="setting.html">基本设置</a></li>
            <li><a href="readset.html">用户设置</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">安全配置</a></li>
            <li role="separator" class="divider"></li>
            <li class="disabled"><a>扩展菜单</a></li>
          </ul>
        </li>
      </ul>
    </aside>
    
    
          <div style="position: absolute;width: 500px;height: 40px;z-index: 1000;margin-left:69%;margin-top: 10px">

            <form action="/ImportExcelServlet" name="import" method="post"  enctype="multipart/form-data" style="display: inline">
                <input type="file" class="form-control" name="excel" style="width: 200px;background:#f8f5f5;display: inline">
                <button type="submit" class="btn btn-default" style="display: inline"> 导入票务信息</button>

            </form>


            <form action="/ExportExcelServlet" name="export" method="post"  enctype="multipart/form-data" style="display: inline;">
                <button type="submit" class="btn btn-default" style="display: inline"> 导出票务信息</button>

            </form>

        </div>
    
    
    <div id="book-search-type" style="position:absolute;width:600px;height: 40px;top: 185px;left: 54%;z-index:1000;line-height:2px">
    
     
      <input type="radio" value="1" name="searchtye" >根据父栏目查询
      <%--<input type="radio" value="2"  name="searchtye" >根据子栏目查询--%>
      <input type="radio" value="3"  name="searchtye" >根据票务名查询
    </div>
    
    
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
      
        <h1 class="page-header">操作</h1>
        <ol class="breadcrumb">
         <c:if test="${manageuser.change==1 }">
          <li><a href="add-ticket.jsp">增加票务</a></li>
          </c:if>
        </ol>
        <h1 class="page-header">管理票务 <span class="badge">${totalCount }</span></h1>


		

        
		
		
		
<!--搜索框开始-->

      <div class="book-search">

		
          <input type="text" placeholder="输入相应关键字查询" name="BookSearchByKeyword" id="BookSearchByKeyword" />
            	<div class="book-search-1" onclick="searchbook(1)"  >
              
                 		查询
              	
      			 </div>
            
        
        </div>

<!--搜索框结束--

	<!-- <form action="/Semester_Demo/DeleteBookCheckAllServlet" method="POST"> -->
        <div class="table-responsive">
          <table class="table table-striped table-hover">
            <thead>
              <tr>
                <th><span class="glyphicon glyphicon-th-large"></span> <span class="visible-lg">选择</span></th>
                <th><span class="glyphicon glyphicon-file"></span> <span class="visible-lg">名称</span></th>
                <th><span class="glyphicon glyphicon-list"></span> <span class="visible-lg">所属大类</span></th>
                <%--<th class="hidden-sm"><span class="glyphicon glyphicon-tag"></span> <span class="visible-lg">所属小类</span></th>--%>
               <!--  <th class="hidden-sm"><span class="glyphicon glyphicon-comment"></span> <span class="visible-lg">定价</span></th> -->
                <th class="hidden-sm"><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">定价</span></th>
                <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">现价</span></th>
                <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">录入时间</span></th>
                <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">新票</span></th>
                <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">特价</span></th>
                <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">浏览次数</span></th>
                <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
              </tr>
            </thead>
            <tbody>
            <c:forEach items="${spliteBookInfoplist }" var="p">
              <tr>
                	<td><input type="checkbox" class="input-control" name="checkbox[]" value="${p.ID }" /></td>
                	<td class="article-title">${p.bookName }</td>
                	<td>${p.typeBIDName }</td>
                	<%--<td class="hidden-sm">${p.typeIDName }</td>--%>
               		 <td class="hidden-sm">${p.price }</td>
                	<td>${p.nowPrice }</td>
                	
                	<td>
                		<input type="datetime-local" value="${p.INTime }" readonly class="form-control" name="stime" maxlength="10" autocomplete="off" style=""/>
                	</td>	
               		 <td>
                		<c:if test="${p.newBook==1 }" >是</c:if>
                		<c:if test="${p.newBook==0 }" >否</c:if>
                	</td>
                	<td>
                		<c:if test="${p.sale==1 }" >是</c:if>
                		<c:if test="${p.sale==0 }" >否</c:if>
               		 </td>	
                	<td>${p.hit}</td>
                
                	<td>
                		<c:if test="${manageuser.change==1 }">
                			<a href="/ShowBookInfoDetailServlet?ID=${p.ID }">修改</a>
                			<a rel="${p.ID }">删除</a>
                			</c:if>
                	</td>
					</tr>
             </c:forEach>
             
    			
    
    
            </tbody>
          </table>
         
        </div>
        <footer class="message_footer">
          <nav>
            <div class="btn-toolbar operation" role="toolbar">
              <div class="btn-group" role="group"> <a class="btn btn-default" onClick="select()">全选</a> <a class="btn btn-default" onClick="reverse()">反选</a> <a class="btn btn-default" onClick="noselect()">不选</a> </div>
              <div class="btn-group" role="group">
          <!--   <button type="submit" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="删除全部选中" name="checkbox_delete">删除</button>  -->
                <c:if test="${manageuser.change==1 }">
              <div onclick="deletcheckall()" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="删除全部选中" name="checkbox_delete">删除</div> 
              
              </c:if>
              
               <script type="text/javascript">
              
               
          		 	function searchbook(curPage)
      				{
      					
          				/* System.out.println(name+" "+alias+" "+fid+" "+keywords+" "+describe); */
          				/* 输入的搜索关键字 */
          				var bookkeyword=$("#BookSearchByKeyword").val();
          				
          				
          				var searchtype;
          				if($("input[name='searchtye']:checked").val()!=null)
          				{
          						searchtype=$("input[name='searchtye']:checked").val();
          						
          				}
          				else
          				{
          					if("${currentSearchType}"!=null)
          						searchtype=${currentSearchType};
          						
          				}
          				
          				/* alert("search"+searchtype); */
          				var curPage=curPage;
          				/* alert("要转向的结果分页页面:"+curPage); */
          				$.post(
          					"/BookSearchByKeywordServlet",
          					{"bookkeyword":bookkeyword,"curPage":curPage,"searchtype":searchtype},
          					function(data)
          					{
          				
          						location.reload();
          				
          					},
          					"json"
          			  );	
      				}
              		function deletcheckall()
              		{
              			
              			var checkID=[];
                        $("input[name='checkbox[]']:checked").each(function(i){
                              checkID[i] = $(this).val();
                        });

                        $.ajax({
        					url:"/Semester_Demo/DeleteBookCheckAllServlet",
        					traditional:true,
        					type:"POST",
        					data:{"checkID":checkID},
        					success:function(data)
        					{
        							
        							if(data=="请您至少选择一项删除!")
        								{
        										alert(data);
        										location.reload();
        								}
        							else
        								{
        									alert(data);
        									window.location.href="/Semester_Demo/AdminGetInitBookInfoServlet?curPage="+1; 
        								}
        							
        					},
        					error:function()
        					{
        						alert("fail");
        					},
        					dataType:"json"
        				} );	
          				
          			
          				
              		} 
              
              
              
              </script>
              </div>
            </div>
            <!-- 搜索结果页面上一页下一页 -->
            <c:if test="${sessionScope.searchflag==1 }">
             	<div class="pagination pagenav">
             		<c:if test="${curPage!=1}" >
          					
          					
          				<div  onclick="searchbook(${curPage-1})" style="display:inline;font-size:16px" onmouseover="javascript:this.style.color='deepskyblue';this.style.cursor='pointer'" onmouseout="javascript:this.style.color='black'">	
          					上一页
          				</div>&nbsp;&nbsp;
          					
					</c:if>
					
				
					<c:if test="${curPage<totalPage}">
				
					
          				<div onclick="searchbook(${curPage+1})" style="display:inline;font-size:16px" onmouseover="javascript:this.style.color='deepskyblue';this.style.cursor='pointer'" onmouseout="javascript:this.style.color='black'">	
          						下一页
          						
          				</div>&nbsp;&nbsp;
          			
					</c:if>
		
				<span style="font-size:15px">当前第${curPage}页</span>/
				<span style="font-size:15px" >共${totalPage}页</span>/
				<span style="font-size:15px">共有${totalCount}条记录</span>
          
             
           		  　</div>
             </c:if>
            
       <c:if test="${sessionScope.searchflag!=1 }">
            <div class="pagination pagenav">
             
          			<c:if test="${curPage!=1}">
          					
          					
          					
          			<a href="/AdminGetInitBookInfoServlet?curPage=${curPage-1}" style="font-size:16px" onmouseover="javascript:this.style.color='deepskyblue';this.style.cursor='pointer'" onmouseout="javascript:this.style.color='black'">上一页</a>
          					
          					
					
				</c:if>
				<c:if test="${curPage<totalPage }">
				
					
          			
          				<a href="/AdminGetInitBookInfoServlet?curPage=${curPage+1}" style="font-size:16px" onmouseover="javascript:this.style.color='deepskyblue';this.style.cursor='pointer'" onmouseout="javascript:this.style.color='black'">下一页</a>
          			
					
				</c:if>
		
				<span style="font-size:15px">当前第${curPage}页</span>/
				<span style="font-size:15px" >共${totalPage}页</span>/
				<span style="font-size:15px">共有${totalCount}条记录</span>
          
            </div>
        </c:if>
          </nav>
        </footer>
   
    </div>
  </div>
</section>









<!--个人信息模态框-->
<div class="modal fade" id="seeUserInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <form action="" method="post">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" >个人信息</h4>
        </div>
        <div class="modal-body">
          <table class="table" style="margin-bottom:0px;">
            <thead>
              <tr> </tr>
            </thead>
            <tbody>
              <tr>
                <td wdith="20%">姓名:</td>
                <td width="80%"><input type="text" value="王雨" class="form-control" name="truename" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">用户名:</td>
                <td width="80%"><input type="text" value="admin" class="form-control" name="username" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">电话:</td>
                <td width="80%"><input type="text" value="18538078281" class="form-control" name="usertel" maxlength="13" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">旧密码:</td>
                <td width="80%"><input type="password" class="form-control" name="old_password" maxlength="18" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">新密码:</td>
                <td width="80%"><input type="password" class="form-control" name="password" maxlength="18" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">确认密码:</td>
                <td width="80%"><input type="password" class="form-control" name="new_password" maxlength="18" autocomplete="off" /></td>
              </tr>
            </tbody>
            <tfoot>
              <tr></tr>
            </tfoot>
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <button type="submit" class="btn btn-primary">提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
<!--个人登录记录模态框-->
<div class="modal fade" id="seeUserLoginlog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" >登录记录</h4>
      </div>
      <div class="modal-body">
        <table class="table" style="margin-bottom:0px;">
          <thead>
            <tr>
              <th>登录IP</th>
              <th>登录时间</th>
              <th>状态</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>::1:55570</td>
              <td>2016-01-08 15:50:28</td>
              <td>成功</td>
            </tr>
            <tr>
              <td>::1:64377</td>
              <td>2016-01-08 10:27:44</td>
              <td>成功</td>
            </tr>
            <tr>
              <td>::1:64027</td>
              <td>2016-01-08 10:19:25</td>
              <td>成功</td>
            </tr>
            <tr>
              <td>::1:57081</td>
              <td>2016-01-06 10:35:12</td>
              <td>成功</td>
            </tr>
             <tr>
              <td>::1:57081</td>
              <td>2016-01-06 10:35:12</td>
              <td>成功</td>
            </tr>
             <tr>
              <td>::1:57081</td>
              <td>2016-01-06 10:35:12</td>
              <td>成功</td>
            </tr>
             <tr>
              <td>::1:57081</td>
              <td>2016-01-06 10:35:12</td>
              <td>成功</td>
            </tr>
             <tr>
              <td>::1:57081</td>
              <td>2016-01-06 10:35:12</td>
              <td>成功</td>
            </tr>
             <tr>
              <td>::1:57081</td>
              <td>2016-01-06 10:35:12</td>
              <td>成功</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">朕已阅</button>
      </div>
    </div>
  </div>
</div>
<!--微信二维码模态框-->
<div class="modal fade user-select" id="WeChat" tabindex="-1" role="dialog" aria-labelledby="WeChatModalLabel">
  <div class="modal-dialog" role="document" style="margin-top:120px;max-width:280px;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="WeChatModalLabel" style="cursor:default;">微信扫一扫</h4>
      </div>
      <div class="modal-body" style="text-align:center"> <img src="images/weixin.jpg" alt="" style="cursor:pointer"/> </div>
    </div>
  </div>
</div>
<!--提示模态框-->
<div class="modal fade user-select" id="areDeveloping" tabindex="-1" role="dialog" aria-labelledby="areDevelopingModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="areDevelopingModalLabel" style="cursor:default;">该功能正在日以继夜的开发中…</h4>
      </div>
      <div class="modal-body"> <img src="images/baoman/baoman_01.gif" alt="深思熟虑" />
        <p style="padding:15px 15px 15px 100px; position:absolute; top:15px; cursor:default;">很抱歉，程序猿正在日以继夜的开发此功能，本程序将会在以后的版本中持续完善！</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">朕已阅</button>
      </div>
    </div>
  </div>
</div>
<!--右键菜单列表-->
<div id="rightClickMenu">
  <ul class="list-group rightClickMenuList">
    <li class="list-group-item disabled">欢迎访问异清轩客</li>
    <li class="list-group-item"><span>IP：</span>172.16.10.129</li>
    <li class="list-group-item"><span>地址：</span>河南省郑州市</li>
    <li class="list-group-item"><span>系统：</span>Windows10 </li>
    <li class="list-group-item"><span>浏览器：</span>Chrome47</li>
  </ul>
</div>
<script src="js/bootstrap.min.js"></script> 
<script src="js/admin-scripts.js"></script> 
<script>
//是否确认删除
$(function(){   
	$("#main table tbody tr td a").click(function(){
		var name = $(this);
		var id = name.attr("rel"); //对应id  
		if (event.srcElement.outerText == "删除") 
		{
			if(window.confirm("此操作不可逆，是否确认？"))
			{
				$.ajax({
					type: "POST",
					url: "/AdminDeleteSingleBookInfoServlet",
					data: "id=" + id,
					cache: false, //不缓存此页面   
					success: function (data) {
						 alert(data);
						 window.location.href="/AdminGetInitBookInfoServlet?curPage="+${curPage};
						
					}
				});
			};
		};
	});   
});
</script>
</body>
</html>
