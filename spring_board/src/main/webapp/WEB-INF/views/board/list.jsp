<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<head>
<style>
	
	table th,td{
		text-align:center;		
	}
	
</style>
</head>
	

<body>
  	
   <div class="content-wrapper" >
    
	<jsp:include page="content_header.jsp">
		<jsp:param value="자유게시판" name="subject"/>
		<jsp:param value="list.do" name="url"/>
		<jsp:param value="목 록" name="item"/>
	</jsp:include> 
	
    <!-- Main content -->
    <section class="content">		
		<div class="card">
			<div class="card-header with-border">
				<button type="button" class="btn btn-primary" id="registBtn" onclick="OpenWindow('registForm.do','글등록',800,700);">글등록</button>				
				<div id="keyword" class="card-tools" style="width:350px;">
					<div class="input-group row">	
					
					<!-- sort num -->
				  	<select class="form-control col-md-3" name="perPageNum" id="perPageNum">
				  		<option value="10" >정렬개수</option>
				  		<option value="2" ${cri.perPageNum == 2 ? 'selected':''}>2개씩</option>
				  		<option value="3" ${cri.perPageNum == 3 ? 'selected':''}>3개씩</option>
				  		<option value="5" ${cri.perPageNum == 5 ? 'selected':''}>5개씩</option>
				  	</select>
										
						<select class="form-control col-md-4" name="searchType" id="searchType">
							<option value="tcw"  ${pageMaker.cri.searchType eq 'tcw' ? 'selected':'' }>전 체</option>
							<option value="t" ${pageMaker.cri.searchType eq 't' ? 'selected':'' }>제 목</option>
							<option value="w" ${pageMaker.cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
							<option value="c" ${pageMaker.cri.searchType eq 'c' ? 'selected':'' }>내 용</option>
							<option value="tc" ${pageMaker.cri.searchType eq 'tc' ? 'selected':'' }>제목+내용</option>
							<option value="cw" ${pageMaker.cri.searchType eq 'cw' ? 'selected':'' }>작성자+내용</option>							
						</select>					
						<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-primary" type="button" onclick="searchList_go(1);" 
							data-card-widget="search">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
				</div>						
			</div>
			<div class="card-body">
				<table class="table table-bordered text-center" >					
					<tr style="font-size:0.95em;">
						<th style="width:10%;">번 호</th>
						<th style="width:50%;">제 목</th>
						<th style="width:15%;">작성자</th>
						<th>등록일</th>
						<th style="width:10%;">조회수</th>
					</tr>				
					<c:if test="${empty boardList }" >
						<tr>
							<td colspan="5">
								<strong>해당 내용이 없습니다.</strong>
							</td>
						</tr>
					</c:if>						
					<c:forEach items="${boardList }" var="board">
						<tr style='font-size:0.85em;'>
							<td>${board.bno }</td>
							<td id="boardTitle" style="text-align:left;max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
							<a href="javascript:OpenWindow('detail.do?bno=${board.bno }','상세보기',800,700);">
								<span class="col-sm-12 ">${board.title }
									<c:if test="${board.replycnt ne 0 }">		
										<span class="nav-item">															
										&nbsp;&nbsp;<i class="fa fa-comment"></i>
										<span class="badge badge-warning navbar-badge">${board.replycnt}</span>
										</span>
										
									</c:if>
								</span>
							</a>
							</td>
							<td>${board.writer }</td>
							<td>
								<fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/>
							</td>
							<td><span class="badge bg-red">${board.viewcnt }</span></td>
						</tr>
					</c:forEach>
				</table>				
			</div>
			<div class="card-footer">
				<%@ include file="/WEB-INF/views/pagination/pagination.jsp" %>				
			</div>
		</div>
		
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
	<form id="jobForm">
		  <input type='hidden' name="page" value="${pageMaker.cri.page}" />
		  <input type='hidden' name="perPageNum" 
		  		 value="${pageMaker.cri.perPageNum}"/>
		  <input type='hidden' name="searchType" 
		         value="${pageMaker.cri.searchType }" />
		  <input type='hidden' name="keyword" 
		         value="${pageMaker.cri.keyword }" />
	</form>
   	
<script>
	
	$('#searchBtn').on('click',function(e){
		/* 
		if($('input[name="keyword"]').val() !=""){
			if($('select[name="searchType"]').val()==""){
				alert("검색구분은 필수입니다.");
				$('input[name="searchType"]').focus();
				return;
			}			
		} */
		
		var jobForm=$('#jobForm');
		jobForm.find("[name='page']").val(1);
		jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
		jobForm.find("[name='keyword']").val($('input[name="keyword"]').val());
		
		/* alert(jobForm.serialize()); */
		
		jobForm.attr("action","list.do").attr("method","get");
		jobForm.submit();
	});
	
	
</script>

</body>





  