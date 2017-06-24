<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <title>登录页面</title>
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/admin.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

    <script type="text/javascript" src="js/modernizr2.js"></script>


  </head>
  <body class="backstretch">

		<div class="block-absolute-center login-form">

			<div class="text-center m-b-10">
				<!-- <img src="http://placehold.it/200x90"> -->
        <h2 class="text-white font-w-100">Login</h2>
			</div>
			<form role="form" action="servlet/LoginServlet" method="post">
			  <div class="form-group">
			    <input type="text" name="account" class="form-control input-glass"
			    	id="email" placeholder="Username">
			  </div>
			  <div class="form-group">
			    <input type="password" name="pwd" class="form-control input-glass"
			    	id="pass" placeholder="Password">
			  </div>
			  	<input type="radio" value="1" name="identity">管理员
				<input type="radio" value="2" name="identity" checked>读者<br>
			  <button type="submit" class="btn btn-primary btn-block btn-lg">Sign in</button>
			</form>
			<a href="signup.jsp" class="text-white hover-opacity-change hover-white-opacity-text m-t-10 d-block">Don't have an account yet?</a>

		</div>

    <script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
    <script type="text/javascript" src="js/backstretch.js"></script>

    <script>
      $(".backstretch").backstretch([
        "backgrounds/wg_blurred_backgrounds_8.jpg",
        "backgrounds/wg_blurred_backgrounds_5.jpg",
        "backgrounds/wg_blurred_backgrounds_3.jpg",
        "backgrounds/wg_blurred_backgrounds_1.jpg",
        "backgrounds/wg_blurred_backgrounds_2.jpg",
        "backgrounds/wg_blurred_backgrounds_4.jpg",
        "backgrounds/wg_blurred_backgrounds_6.jpg",
        "backgrounds/wg_blurred_backgrounds_7.jpg",
        "backgrounds/wg_blurred_backgrounds_9.jpg",
      ], {
        duration: 3000,
        fade: 'slow'
      });
    </script>

    <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-49617882-1', 'sugoi-admin-v104.herokuapp.com');
  ga('send', 'pageview');

</script>

  </body>
</html>
