<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script>
$('#replyAddBtn').on('click',function(e){

	var replyer=$('#newReplyWriter').val();
	var replytext=$('#newReplyText').val();
	
	if(replytext==""){
		alert('댓글 내용은 필수입니다.');
		$('#newReplyText').focus().css("border-color","red")
		.attr("placeholder","내용은 필수입니다.");			
		return;
	}
	
	var data={
			"bno":"${board.bno}",
			"replyer":replyer,
			"replytext":replytext	
	}
	
	//alert(JSON.stringify(data));
	
	$.ajax({
		url:"<%=request.getContextPath()%>/replies",
		type:"post",
		data:JSON.stringify(data),	
		contentType:"application/json", //보내는 data 형식 지정
		dataType:"text", //받는 data 형식 지정
		success:function(data){
			var result=data.split(',');
			if(result[0]=="SUCCESS"){
				alert('댓글이 등록되었습니다.');
				getPage("<%=request.getContextPath()%>/replies/${board.bno}/"+result[1]);
				$('#newReplyText').val("");
			}else{
				alert('댓글이 등록을 실패했습니다.');	
			}
		}
	});
	
});

</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="reply-list-template" >
{{#each .}}
<div class="replyLi" >
	<i class="fas fa-comments bg-yellow"></i>
 	<div class="timeline-item" >
  		<span class="time">
    		<i class="fa fa-clock"></i>{{prettifyDate regdate}}
	 		<a class="btn btn-primary btn-xs" id="modifyReplyBtn" data-rno={{rno}}
	    		data-replyer={{replyer}} data-toggle="modal" data-target="#modifyModal">Modify</a>
  		</span>
	
  		<h3 class="timeline-header"><strong style="display:none;">{{rno}}</strong>{{replyer}}</h3>
  		<div class="timeline-body" id="{{rno}}-replytext">{{replytext}} </div>
	</div>
</div>
{{/each}}	
</script>
<script> //댓글 리스트
var replyPage=1;
var realEndPage=1;


getPage("<%=request.getContextPath()%>/replies/${board.bno}/"+replyPage);

//reply list
function getPage(pageInfo){	 
	$.getJSON(pageInfo,function(data){	
		printData(data.replyList,$('#repliesDiv'),$('#reply-list-template'));
		printPaging(data.pageMaker,$('.pagination'));	
		if(data.pageMaker.realEndPage>0){
			realEndPage=data.pageMaker.realEndPage;
		}
	});
}

var printData=function(replyArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(replyArr);	
	$('.replyLi').remove();
	target.after(html);
}

Handlebars.registerHelper("prettifyDate",function(timeValue){
	var dateObj=new Date(timeValue);
	var year=dateObj.getFullYear();
	var month=dateObj.getMonth()+1;
	var date=dateObj.getDate();
	return year+"/"+month+"/"+date;
});


//reply pagination
var printPaging=function(pageMaker,target){
	
	var str="";
	
	if(pageMaker.prev){
		str+="<li class='page-item'><a class='page-link' href='"+(pageMaker.startPage-1)
				+"'> <i class='fas fa-angle-left'/> </a></li>";			
	}
	for(var i=pageMaker.startPage;i<=pageMaker.endPage;i++){
		var strClass = pageMaker.cri.page == i ? 'active' : '';
		str+="<li class='page-item "+strClass+"'><a class='page-link' href='"+i+"'>"+
		i+"</a></li>";
	}
	if(pageMaker.next){
		str+="<li class='page-item' ><a class='page-link' href='"+(pageMaker.endPage+1)
			+"'> <i class='fas fa-angle-right'/> </a></li>";
	}
	
	target.html(str);
}


$('.pagination').on('click','li a',function(event){
	//event.stopPropagation();
	event.preventDefault();
	replyPage=$(this).attr("href");
	getPage("<%=request.getContextPath()%>/replies/${board.bno}/"+replyPage);
});

//reply modify 권한체크
$('div.timeline').on('click','#modifyReplyBtn',function(event){	
	var rno = $(this).attr("data-rno");
	var replyer = $(this).attr("data-replyer");
	var replytext = $('#'+rno+'-replytext').text();
		
	if(replyer!="${loginUser.id}"){
		alert("수정 권한이 없습니다.");
		$(this).attr("data-toggle","");
	}
	
	$('#replytext').val(replytext);
	$('.modal-title').text(rno);
		
})

$('#replyModBtn').on('click',function(event){
	var rno=$('.modal-title').text();
	var replytext=$('#replytext').val();
	

	var sendData={
			rno:rno,
			replytext:replytext
	}
	
	$.ajax({
		url:"<%=request.getContextPath()%>/replies/"+rno,
		type:"put",
		data:JSON.stringify(sendData),
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"PUT"
		},
		success:function(result){
			alert("수정되었습니다.");			
			getPage("<%=request.getContextPath()%>/replies/${board.bno}/"+replyPage);
		},
		error:function(error){
			alert('수정 실패했습니다.');		
		},
		complete:function(){
			$('#modifyModal').modal('hide');
		}
	});
	
	
});
$('#replyDelBtn').on('click',function(event){
	
	var rno=$('.modal-title').text();
	
	var sendData={
			bno:"${board.bno}",
			rno:rno,
			page:replyPage
	};
	
	
	$.ajax({
		url:"<%=request.getContextPath()%>/replies/"+rno,
		type:"delete",
		data:JSON.stringify(sendData),
		headers:{
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override":"DELETE"
		},
		success:function(page){
			alert("삭제되었습니다.");
			getPage("<%=request.getContextPath()%>/replies/${board.bno}/"+page);			
		},
		error:function(error){
			alert('삭제 실패했습니다.');		
		},
		complete:function(){
			$('#modifyModal').modal('hide');
		}
	});
});
</script>











