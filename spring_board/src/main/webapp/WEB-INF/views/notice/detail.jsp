<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<body>

  <!-- Content Wrapper. Contains page content -->
  <div  style="max-width:800px;min-width:420px;margin:0 auto;min-height:812px;">
   
   	<jsp:include page="content_header.jsp">
	   	<jsp:param value="공지사항" name="subject"/>
	   	<jsp:param value="list.do" name="url"/>
	   	<jsp:param value="상세보기" name="item"/>
   </jsp:include>
   
    <!-- Main content -->
    <section class="content container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title">상세보기</h3>
						<div class="card-tools">
							<button type="button" id="modifyBtn" class="btn btn-warning">MODIFY</button>						
						    <button type="button" id="removeBtn" class="btn btn-danger">REMOVE</button>
						    <button type="button" id="listBtn" class="btn btn-primary">CLOSE</button>
					    </div>
					</div>
					<div class="card-body">
						<div class="form-group col-sm-12">
							<label for="title">제 목</label>
							<input type="text" class="form-control" id="title" readonly value="${notice.title }" />							
						</div>
						<div class="row">	
							<div class="form-group col-sm-4" >
								<label for="writer">작성자</label>
								<input type="text" class="form-control" id="writer" readonly value="${notice.writer }"/>
							</div>		
							
							<div class="form-group col-sm-4" >
								<label for="regDate">작성일</label>
								<input type="text" class="form-control" id="regDate" readonly 
									value="<fmt:formatDate value="${notice.regDate }" pattern="yyyy-MM-dd" />" />
							
							</div>
							<div class="form-group col-sm-4" >
								<label for="viewcnt">조회수</label>
								<input type="text" class="form-control" id="viewcnt" readonly value="${notice.viewcnt }"/>
							</div>
						</div>		
						<div class="form-group col-sm-12">
							<label for="content">내 용</label>
							<div id="content">${notice.content }</div>	
						</div>
												
					</div>													
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row  -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<form role="form">
	<input type="hidden" name="nno" value="${notice.nno }" />
</form>
	
<script>
var formObj = $("form[role='form']");

$('button#modifyBtn').on('click',function(evnet){
	//alert("modify click");
	formObj.attr({
		'action':'modifyForm.do',
		'method':'post'
	});
	formObj.submit();
});
$("#removeBtn").on("click", function(){
	//alert("remove click");
	var answer = confirm("정말 삭제하시겠습니까?");
	if(answer){		
		formObj.attr("action", "remove.do");
		formObj.attr("method", "post");
		formObj.submit();
	}
});
$("#listBtn").on("click", function(){
	//alert("list click");
	window.opener.location.reload(true);
	window.close();
});
</script>  
  
  
</body>  
  
  
  
  