$(function(){
	////����
	if($('title').text()=="����")
		$('#nav ul li:nth-of-type(1)').attr("class","now_page");
	else if($('title').text()=="����")
		$('#nav ul li:nth-of-type(2)').attr("class","now_page");
	else if($('title').text()=="�޸�")
		$('#nav ul li:nth-of-type(3)').attr("class","now_page");
	else if($('title').text()=="����")
		$('#nav ul li:nth-of-type(4)').attr("class","now_page");
	////----------------------------------------------------------���׹���ҳ��
	$('#submitButton').click(function(){
		
		var inps=document.getElementsByTagName('input');
		//alert(inps[3].value);
		
		if(inps[0].value==""||inps[1].value==""||inps[2].value==""||inps[3].value==""||inps[4].value==""||inps[5].value=="")
		{
			alert("������ȫ�����ݣ�лл��");
		}
		else{
			$('#docForm').submit();
		}
	});
	
	
	/////////---------------------------------------------------�޸�ҳ���js
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
			alert("�������˺ţ�");
		}
		else if($('#updateForm input:nth-of-type(6)').val()=="")
		{
			alert("������������");
		}
		else if($('#updateForm input:nth-of-type(7)').val()==""&&$('#updateForm input:nth-of-type(7)').attr('disabled')==null)
		{
			alert("���������֤��");
		}
		else if($('#updateForm input:nth-of-type(8)').val()=="")
		{
			alert("���������룡");
		}
		else if($('#updateForm input:nth-of-type(9)').val()=="")
		{
			alert("������ȷ�����룡");
		}
		else if($('#updateForm input:nth-of-type(8)').val()!=$('#updateForm input:nth-of-type(9)').val())
		{
			alert("�������벻һ�£�");
		}
		else if($('#updateForm input:nth-of-type(10)').val()=="")
		{
			alert("������绰��");
		}
		else
		{
			$('#updateForm').submit();
		}
	});
	
	
	
});