<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script>
//아이디 중복체크
var checkedID="";

function idCheck_go(){	
	//alert("check id click");
	var input_ID=$('input[name="id"]');
	
	if(input_ID.val()==""){
		alert("아이디를 입력하세요");
		input_ID.focus();
		return;
	}else{
		//아이디는 4~12자의 영문자와 숫자로만 입력
		var reqID=/^[a-z]{1}[a-zA-Z0-9]{3,12}$/;
		if(!reqID.test($('input[name="id"]').val())){
			alert("아이디는 첫글자는 영소문자이며, \n4~13자의 영문자와 숫자로만 입력해야 합니다.");
			$('input[name="id"]').focus();
			return;
		}
	}
	
	var data = {id : input_ID.val().trim()};
	
	$.ajax({
		url:"<%=request.getContextPath()%>/member/idCheck.do",
		data:data,
		type:'post',
		
	 	statusCode: {
			302:function(result){
				alert("세션이 만료되었습니다.");
				window.location.reload();
			}
	 	},
		success:function(result){	//(result,callbak,xhr) -> statecode : xhr.status	
			if(result=="duplicated"){
				alert("중복된 아이디 입니다.");
				$('input[name="id"]').focus();
			}else{
				alert("사용가능한 아이디입니다.");
				checkedID=input_ID.val().trim();
				$('input[name="id"]').val(input_ID.val().trim());
			}
		},
		error:function(error){ // stauscode : error.status
			//alert("error:"+error.status);
			if(error.status=="302") return;
			alert("시스템 장애로 가입이 불가합니다.");
		} 
			
	});
	
	
}

</script>


<script>
$('#registBtn').on('click', function(e) {
	
	var uploadCheck = $('input[name="checkUpload"]').val();
	if(!(uploadCheck>0)){
		alert("사진 업로드는 필수입니다.");	
		//$('input[name="pictureFile"]').click();
		return;
	}
	
	
	if($('input[name="id"]').val()==""){
		alert("아이디는 필수입니다.");
		return;
	} 
		
	if($('input[name="id"]').val()!=checkedID){
		alert("아이디 중복확인이 필요합니다.");
		return;
	}
	
	if($('input[name="pwd"]').val()==""){
		alert("패스워드는 필수입니다.");
		return;
	}	
		
	if($('input[name="name"]').val()==""){
		alert("이름은 필수입니다.");
		return;
	}	
	
	var form = $('form[role="form"]');
	form.submit();
});
</script>







