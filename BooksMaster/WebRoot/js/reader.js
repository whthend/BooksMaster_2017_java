$(function(){
	
	
	////导航
	if($('title').text()=="首页")
		$('#nav ul li:nth-of-type(1)').attr("class","now_page");
	else if($('title').text()=="资源")
		$('#nav ul li:nth-of-type(2)').attr("class","now_page");
	else if($('title').text()=="我的")
		$('#nav ul li:nth-of-type(3)').attr("class","now_page");
	else if($('title').text()=="推荐")
		$('#nav ul li:nth-of-type(4)').attr("class","now_page");
	
	////学生登录主页
	$("#search").attr("value","输入书名 / 作者 / 出版社");
	$("#search").css("font-style","italic").css("color","red").css("font-size","10pt");
	$("#search").click(function(){
		if($("#search").val()=="输入书名 / 作者 / 出版社")
		{
			$("#search").attr("value","");
			$("#search").css("font-style","").css("color","").css("font-size","10pt");
		}
	});
	$("#search").blur(function(){
		if($("#search").val()=="")
		{
			$("#search").attr("value","输入书名 / 作者 / 出版社");
			$("#search").css("font-style","italic").css("color","red").css("font-size","10pt");
		}
	});
	
	$("#sub").click(function(){
		if($("#search").val()==""||$("#search").val()=="输入书名 / 作者 / 出版社")
		{
			alert("请输入书名/作者/出版社！");
			return false;
		}
		else{
			console.log("before"+"\n");
			$("#indexSearchForm").submit();
			return true;
		}
			
	});
	
	
	
	////读者“我的”页面
	var x=0;
	var timer=null;
	//$(document).mousemove(function(e){console.log(e.pageX);});
	$('#box').mousedown(function(e){
		$(document).mousemove(function(e){console.log(e.pageX);});
		var startmouseX=e.pageX;
		var startX=x;
		var lastX=e.startmouseX;
		var speedX=0;
		
		$(document).mousemove(function(e){

			x=startX+(e.pageX-startmouseX)/10;
			
			speedX=(e.pageX-lastX)/5;
			
			$('#box').css("transform","rotateY("+x+"deg)");
			
			lastX=e.pageX;
		});
		
		$(document).mouseup(function(e){
			$(document).unbind('mousemove');
			
			clearInterval(timer);
			timer=setInterval(function (){
				x+=speedX;
				
				speedX*=0.93;
				
				if(Math.abs(speedX)<0.1)
					clearInterval(timer);
				
				$('#box').css("transform","rotateY("+x+"deg)");
			}, 30);
			
		});
		
		clearInterval(timer);
		return false;
	});
	
});