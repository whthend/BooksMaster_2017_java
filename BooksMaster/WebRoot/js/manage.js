$(function(){
	////导航
	if($('title').text()=="文献")
		$('#nav ul li:nth-of-type(1)').attr("class","now_page");
	else if($('title').text()=="读者")
		$('#nav ul li:nth-of-type(2)').attr("class","now_page");
	else if($('title').text()=="修改")
		$('#nav ul li:nth-of-type(3)').attr("class","now_page");
	else if($('title').text()=="关于")
		$('#nav ul li:nth-of-type(4)').attr("class","now_page");
	////----------------------------------------------------------文献管理页面
	$('#submitButton').click(function(){
		
		var inps=document.getElementsByTagName('input');
		//alert(inps[3].value);
		
		if(inps[0].value==""||inps[1].value==""||inps[2].value==""||inps[3].value==""||inps[4].value==""||inps[5].value=="")
		{
			alert("请输入全部数据，谢谢！");
		}
		else{
			$('#docForm').submit();
		}
	});
	
	
	/////////---------------------------------------------------修改页面的js
	$('#updateStaffInput').click(function(){
		$('#accountInput').attr("disabled",true);
		$('#idInput').attr("disabled",true);
	});
	$('#updateReaderInput').click(function(){
		$('#accountInput').attr("disabled",false);
		$('#idInput').attr("disabled",false);
	});
	
	$('#updateSubmit').click(function(){
		//alert($('#updateForm input:nth-of-type(3)').val());
		if($('#updateForm input:nth-of-type(3)').val()=="" && $('#updateForm input:nth-of-type(3)').attr('disabled')==null)
		{
			alert("请输入账号！");
		}
		else if($('#updateForm input:nth-of-type(6)').val()=="")
		{
			alert("请输入姓名！");
		}
		else if($('#updateForm input:nth-of-type(7)').val()==""&&$('#updateForm input:nth-of-type(7)').attr('disabled')==null)
		{
			alert("请输入身份证！");
		}
		else if($('#updateForm input:nth-of-type(8)').val()=="")
		{
			alert("请输入密码！");
		}
		else if($('#updateForm input:nth-of-type(9)').val()=="")
		{
			alert("请输入确认密码！");
		}
		else if($('#updateForm input:nth-of-type(8)').val()!=$('#updateForm input:nth-of-type(9)').val())
		{
			alert("两次密码不一致！");
		}
		else if($('#updateForm input:nth-of-type(10)').val()=="")
		{
			alert("请输入电话！");
		}
		else
		{
			$('#updateForm').submit();
		}
	});
	
	
	
});