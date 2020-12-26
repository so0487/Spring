
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<style>
.fileDrop {
	width: 100%;
	height: 200px;
	border: 1px dotted blue;
}

small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}
</style>
</head>
<body>
	<h3>Ajax File Upload</h3>
	<div class="fileDrop"></div>

	<div class="uploadedList"></div>

	<button type="button" id="submitBtn">등록</button>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
   $(this).on("dragenter dragover drop", function(event){
      event.preventDefault();
   });
   $(".fileDrop").on("drop",function(event){
//       alert("file drop");
      var files = event.originalEvent.dataTransfer.files; <!-- originalEvent : jquery > javascript 변환 -->
      for(var i=0;i<files.length;i++){
//          alert(files[i].name);
         addFile(files[i]);
      }
   });
   
   function addFile(file){
      var formData=new FormData();
      formData.append("file",file);
      $.ajax({
         url:"uploadAjax",
         type:"post",
         data:formData,
         contentType:false,
         processData:false,
         success:function(data){
        	 //alert(data);
        	 var str="";
				if(checkImageType(data)){
					/* 썸네일 */
					str="<div><a class='thumnail' href='displayFile?fileName="+getImageLink(data)+"'>"
					   +"<img src='displayFile?fileName="+data+"'/>"
					   +"</a><small data-src='"+data+"'><button>X</button></small></div>";
				}else{
					/* 텍스트  */
					str="<div><a class='thumnail' href='displayFile?fileName="+data+"'>"
						 +getOriginalName(data)+"</a>"
						 +"<small data-src='"+data+"'>"
						 +"<button>X</button></small></div>";
				}
				
				$(".uploadedList").append(str);
         },
         error:function(){
             alert('이미지 업로드에 실패하였습니다.');
          }
      
      
      });
   }
   
   function checkImageType(fileName){
	   fileName = fileName.substring(fileName.lastIndexOf('.')+1).toLowerCase();
	   var pattern = /jpg|gif|png|jpeg/i;
	   return fileName.match(pattern);
   }
   
   function getOriginalName(fileName){
	   if(checkImageType(fileName)){
		   return;
	   }
	   
	var idx = fileName.indexOf("_")+1;
	return fileName.substr(idx);
   }
   
   function getImageLink(fileName){
	   if(!checkImageType(fileName)){
		   return;
	   }
	   var front = fileName.substr(0,12);
	   var end = fileName.substr(14);
	   return front+end;
   }
   
   $('.uploadedList').on('click','small',function(event){
	  //alert("x click");
	  var data=$(this).attr("data-src");
	  var that = $(this);
	  
	  $.ajax({
		  url : "deleteFile",
		  type : "post",
		  data : {fileName:data},
		  success : function(data){
			  that.parent("div").remove();
		  },
		  error:function(error){
			  alert("해당 파일을 찾을 수 없습니다.");
		  }
	  });
   });
</script>
</html>