<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.List" import="Bean.MovieBean" import="java.util.ArrayList" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- 
	START
	功能描述：movie.html, 查看单个电影具体信息
	Created by —— 毛恺 
-->
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Movie</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/movie.css" rel="stylesheet" type="text/css">

<link href="css/jumbotron.css" rel="stylesheet">

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
	    		
});
</script>

</head>

<body>

<!-- navbar 悬浮导航栏 -->
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

<%MovieBean movie=(MovieBean)session.getAttribute("movie"); %>

<!--jumbotron 超大屏幕，内容居中显示，两边用底层内容补齐btn btn-primary btn-lg -->
<div class="jumbotron">
	<div class="container">
		<div class="container marketing">
			<!-- Example row of columns -->
			<div class="row">
				<!-- Three columns of text below the carousel -->
				<div class="col-lg-4">
					<img class="card-img" src="pics/<%=movie.getName() %>.jpg" alt="Generic placeholder image" width="140" height="200">
					<h2><%=movie.getName() %></h2>
					<p><span><%=movie.getCountry() %></span>
					<br><span><%=movie.getReleaseDate() %></span>
					</p>
				</div><!-- /.col-lg-4 -->
				<div class="col-lg-8">
					<h2>评分：<%=movie.getRatingNum() %></h2>
					<p>
					<font size="3">导演：<%=movie.getDirection() %>&nbsp </font>
					<font size="3">语言：<%=movie.getLanguage() %>&nbsp </font>
					<font size="3">类型：<%=movie.getType() %>&nbsp </font>
					<br>
					<font size="3">时长：<%=movie.getRuntime() %>&nbsp </font>
					<font size="3">主演：<%=movie.getActors() %>&nbsp </font>
					</p>
					<p><span id="description">简介：<%=movie.getDescription() %></span></p>
				</div><!-- /.col-lg-6 -->
			</div>
		</div>
	</div>
</div>
	
<!-- Carousel 幻灯片，轮转播放，推荐电影
    ================================================== -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>
	<div class="carousel-inner" role="listbox">
		<!-- 幻灯片第一页 -->
		<div class="item active">

			<div class="container marketing">
				<!-- Example row of columns -->
				<div class="row">
					<!-- Three columns of text below the carousel -->
					<div class="col-lg-4">
						<img class="img-circle" src="pics/nms.jpg" alt="Generic placeholder image" width="140" height="140">
						<h2>我不是药神</h2>
						<p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
						<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
					</div><!-- /.col-lg-4 -->
					<div class="col-lg-4">
						<img class="img-circle" src="pics/spman2.jpg" alt="Generic placeholder image" width="140" height="140">
						<h2>超人总动员2</h2>
						<p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh.</p>
						<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
					</div><!-- /.col-lg-4 -->
					<div class="col-lg-4">
						<img class="img-circle" src="pics/hs.jpg" alt="Generic placeholder image" width="140" height="140">
						<h2>他是她，她是他</h2>
						<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
						<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
					</div><!-- /.col-lg-4 -->
				</div><!-- /.row -->
			</div>
		
		</div>
		
		<!-- 幻灯片第二页 -->
		<div class="item">
			
			<div class="container marketing">
				<!-- Example row of columns -->
				<div class="row">
					<!-- Three columns of text below the carousel -->
					<div class="col-lg-4">
						<img class="img-circle" src="pics/Background.jpg" alt="Generic placeholder image" width="140" height="140">
						<h2>侏罗纪世界2</h2>
						<p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
						<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
					</div><!-- /.col-lg-4 -->
					<div class="col-lg-4">
						<img class="img-circle" src="pics/girl.jpg" alt="Generic placeholder image" width="140" height="140">
						<h2>最后一球</h2>
						<p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh.</p>
						<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
					</div><!-- /.col-lg-4 -->
					<div class="col-lg-4">
						<img class="img-circle" src="pics/ut.jpg" alt="Generic placeholder image" width="140" height="140">
						<h2>暹罗决：九神战甲</h2>
						<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
						<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
					</div><!-- /.col-lg-4 -->
				</div><!-- /.row -->
			</div>
			
		</div>
		<!-- 幻灯片第三页 -->
		<div class="item">
			<img class="third-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Third slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>One more for good measure.</h1>
					<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
					<p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
				</div>
			</div>
		</div>
	</div>

	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
</div><!-- /.carousel -->




<!-- 底部文字 -->
<div class="container">
	<!-- FOOTER -->
	<footer>
		<p class="pull-right"><a href="#">Back to top</a></p>
		<p>&copy; 2018 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
	</footer>
</div>


<script src="js/jquery-2.1.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script src="js/holder.min.js"></script>
<script src="js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>

<!-- 
	END
	Created by —— 毛恺 
-->