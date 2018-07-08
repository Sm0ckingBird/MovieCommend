<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.List" import="Bean.MovieBean" import="java.util.ArrayList" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<!-- 
	START
	功能描述：browse.html，按关键字、类别检索电影
	Created by —— 毛恺 
-->
<html lang="en">


<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Browse</title>
<link href="css/bootstrap.min.css" rel="stylesheet">

<link href="css/jumbotron.css" rel="stylesheet">
<link href="css/browse.css" rel="stylesheet" type="text/css">

<script src="js/html5shiv.min.js"></script>
<script src="js/respond.min.js"></script>

<link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
<script src="js/ie-emulation-modes-warning.js"></script>
<!--
	Start
	传递输入栏关键字信息，实现界面跳转
	@author 宁志豪
-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
    	$("#search").click(function() {
	    	var input=$(this).prev(".form-control");
	    	
	    	console.log(input.val())
			$.ajax({
			    type: "POST",
			    url: "${pageContext.request.contextPath}/findMovie",
			    data: {"name":input.val()},
			    /* dataType: "json", */			   
			    /* contentType: "application/x-www-form-urlencoded; charset=utf-8", */
			    success: function(data){
			    	$(".album .row").load("${pageContext.request.contextPath}/movielist.jsp");
			    },
				error: function(data){
			    	alert("失败");
			    },
			}); 
						
		});
    	
	    $(".col-md-4 .btn").click(function() {
	    	var output=$(this).parent().next();
	    	
	    	console.log(output.html())
			$.ajax({
			    type: "POST",
			    url: "${pageContext.request.contextPath}/movieDetailServlet",
			    data: {"name":output.html()},
			    /* dataType: "json", */			   
			    /* contentType: "application/x-www-form-urlencoded; charset=utf-8", */
			    success: function(data){
			    	window.location.href="${pageContext.request.contextPath}/movie.jsp";
			    },
				error: function(data){
			    	alert("失败");
			    },
			}); 
						
		});
	    
	    $(".collapse .active").click(function() {
	    	var output=$(this).parent().next();
	    	
	    	console.log(output.html())
			$.ajax({
			    type: "POST",
			    url: "${pageContext.request.contextPath}/MovieServlet",
			    
			    /* dataType: "json", */			   
			    /* contentType: "application/x-www-form-urlencoded; charset=utf-8", */
			    success: function(data){
			    	window.location.href="${pageContext.request.contextPath}/index.jsp";
			    },
				error: function(data){
			    	alert("失败");
			    },
			});
						
		});
	    
	    $(".sidebar-sticky .nav-link").click(function() {
	    	var output=$(this).text();
	    	output=output.trim();
	    	console.log(output)
			$.ajax({
			    type: "POST",
			    url: "${pageContext.request.contextPath}/movieListServlet",
			    data: {"type":output},
			    /* dataType: "json", */			   
			    /* contentType: "application/x-www-form-urlencoded; charset=utf-8", */
			    success: function(data){
			    	$(".album .row").load("${pageContext.request.contextPath}/movielist.jsp");
			    },
				error: function(data){
			    	alert("失败");
			    },
			});
						
		});
	    		
});
</script>

</head>

<body>

<!-- navbar 顶部悬浮导航栏 -->
<nav class="navbar navbar-inverse navbar-fixed-top">
<div class="container">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
		data-toggle="collapse" data-target="#navbar"
		aria-expanded="false" aria-controls="navbar">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#">MovieBar</a>
	</div>
	<div id="navbar" class="collapse navbar-collapse">
		<ul class="nav navbar-nav">
			<li class="active"><a href="#">Home</a></li>
			<li><a href="#about">About</a></li>
			<li><a href="#contact">Contact</a></li>
		</ul>
		
		<form class="navbar-form navbar-right">
			<div class="form-group">
				<input type="text" placeholder="Email" class="form-control">
			</div>
			<div class="form-group">
				<input type="password" placeholder="Password" class="form-control">
			</div>
			<button type="submit" class="btn btn-success">Sign in</button>
		</form>
	</div>
</div>
</nav>

<!-- 左侧导航栏 -->
<div class="container-fluid">
	<div class="row">
	<nav class="col-md-2 d-none d-md-block bg-light sidebar">
		<div class="sidebar-sticky">
			<h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
				<span>电影类型</span>
			</h6>
			<ul class="nav flex-column">
				<li class="nav-item">
					<a class="nav-link" href="#">
						<span data-feather="file-text"></span>
						剧情
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">
						<span data-feather="file-text"></span>
						喜剧
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">
						<span data-feather="home"></span>
						动作
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">
						<span data-feather="file"></span>
						爱情
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">
						<span data-feather="shopping-cart"></span>
						科幻
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">
						<span data-feather="users"></span>
						动画
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">
						<span data-feather="bar-chart-2"></span>
						悬疑
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">
						<span data-feather="layers"></span>
						惊悚
					</a>
				</li>
			</ul>

			<h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
				<span>Saved reports</span>
			</h6>
			<ul class="nav flex-column mb-2">
				<li class="nav-item">
					<a class="nav-link" href="#">
						<span data-feather="file-text"></span>
						恐怖
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">
						<span data-feather="file-text"></span>
						纪录片
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">
						<span data-feather="file-text"></span>
						短片
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">
						<span data-feather="file-text"></span>
						音乐
					</a>
				</li>
			</ul>
		</div>
		
		
	</nav>
	</div><!--end row-->
</div><!--end container-->


<!-- main, 结果显示 -->
<main role="main" class="main-board">

<!-- 标题 -->
<section class="jumbotron text-center">
	<div class="container">
		<h1 class="jumbotron-heading">Movie Browser</h1>
		<p class="lead text-muted">Search and browse movies here</p>
		<p>
			<form class="navbar-form">
				<input type="text" placeholder="Search" class="form-control">
				<a class="btn btn-success" href="#" role="button" id="search">Search &raquo;</a>
			</form>
		</p>
	</div>
</section>

<!-- 搜索结果显示 -->
<div class="album py-5 bg-light">
	<div class="container">
		<div class="row">
			<!--
				Start
				展示电影信息
				@author 宁志豪
			-->		
			<% List<MovieBean> movieList = (List<MovieBean>)session.getAttribute("movieList"); 
				if(movieList == null){
					movieList = new ArrayList<MovieBean>();
				}
				for(MovieBean movie : movieList){
			
				%>
			<div class="col-md-4">
				<div class="card mb-4 box-shadow">
					<img class="card-img-top" src="pics/<%=movie.getName() %>.jpg" alt="Card image cap" width="288" height="140">
					<div class="card-body">
						<p class="card-text"><%=movie.getDescription() %></p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
								
							</div>
							<small class="text-muted"><%=movie.getName() %></small>
						</div>
					</div>
				</div>
			</div>
			<% } %>
			<!--
				End
				@author 宁志豪
			-->
			
		</div>
	</div>
</div>

</main>

<!-- footer -->
<footer class="text-muted">
	<div class="container">
		<p class="float-right">
			<a href="#">Back to top</a>
		</p>
		<p>Album example is &copy; Bootstrap, but please download and customize it for yourself!</p>
		<p>New to Bootstrap? <a href="../../">Visit the homepage</a> or read our <a href="../../getting-started/">getting started guide</a>.</p>
	</div>
</footer>

	
<script src="js/jquery-2.1.3.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script src="js/holder.min.js"></script>
<script src="js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
<!-- 
	END
	Created by —— 毛恺 
-->