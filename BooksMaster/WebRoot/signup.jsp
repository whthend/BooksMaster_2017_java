<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    <title>Sugoi Admin</title>
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

    <script src="js/modernizr2.js"></script>


  </head>
  <body class="backstretch">

		<div class="container">
      <div class="signup">
        <div class="row">

          <div class="visible-xs text-center">
            <h1 class="text-white p-b-0">signup</h1>
          </div>
        
          <div class="col-sm-8 text-white hidden-xs">
            
            <div class="p-30">
              <h1>欢迎注册，你的到来让我们美丽动人</h1>
              
             
               <p>故事的开始总是这样，适逢其会，猝不及防。故事的结局总是这样，花开两朵，天各一方。</p>
        
              <ul class="unstyled ">
                <li>一个人的记忆就是一座城市，时间腐蚀着一切建筑，把高楼和道路全部沙化 <strong>如果你不往前走</strong> </li>
                <li>就会被沙子掩埋所以我们泪流满面，步步回头</li>
                   <li>可是只能往前走</li>
                  </br>
                <li>我希望有一个如你一般的人</li>
                <li>如山间清爽的风</li>
                <li>如古城温暖的光</li>
                <li>从清晨到夜晚</li>
                <li>由山野到书房</li>
                <li>只要最后是你</li>
                <li>就好</li>
               <li>And much more...</li>
              <a href="/" class="btn m-r-10 btn-default">了解我们</a>
              <a href="#" class="btn btn-primary">了解更多</a>
            </div>
            
          </div>
        
          <div class="col-sm-4">
            <div class="m-t-30">
              <div class="p-t-30">
                <form role="form">
                  <div class="form-group row">
                    <div class="col-xs-6">
                      <input type="text" class="form-control input-glass"
                        id="first" placeholder="First Name">
                    </div>
                    <div class="col-xs-6">
                      <input type="text" class="form-control input-glass"
                        id="last" placeholder="Last Name">
                    </div>
                  </div>
                  <div class="form-group">
                    <input type="email" class="form-control input-glass"
                      id="email" placeholder="Email">
                  </div>
                  <div class="form-group">
                    <input type="text" class="form-control input-glass"
                      id="user" placeholder="Username">
                  </div>
                  <div class="form-group">
                    <input type="password" class="form-control input-glass"
                      id="pass" placeholder="Password">
                  </div>
                  <div class="form-group">
                    <input type="password" class="form-control input-glass"
                      id="pass" placeholder="Repeat Password">
                  </div>
                  <button type="submit" class="btn btn-primary btn-block btn-lg">Register</button>
                </form>
              </div>
              <a href="login.jsp" class="text-white hover-opacity-change hover-white-opacity-text m-t-10 d-block">Already have an account?</a>
            </div>
          </div>
        
        </div>
      </div>
    </div>

    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="js/backstretch.js"></script>

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