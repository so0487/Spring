<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>

<%@include file="/WEB-INF/views/include/header.jsp" %>
<body>

    <div class="main-wrapper">


            <div class="row">

                <!--HTML5 Video Start-->
                <div class="col-md-8 col-12 mb-30">
                    <div class="box">
                        <div class="box-head">
                            <h4 class="title">HTML5 Video (Plyr)</h4>
                        </div>
                        <div class="box-body">
                            <video poster="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/images/bg/video-1-poster.jpg" class="plyr-video" playsinline controls>
                                <source src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/media/video-1-576p.mp4" type="video/mp4" data-res="576" />
                                <source src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/media/video-1-720p.mp4" type="video/mp4" data-res="720" />
                                <source src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/media/video-1-1080p.mp4" type="video/mp4" data-res="1080" />
                            </video>
                        </div>
                    </div>
                </div>
                
                
				 <div class="col-md-4 col-12 mb-30">
				 	<div class="box">
				 		<div class="box-head">
                            <h4 class="title">메시지 영역</h4>
                        </div>
                        <div class="box-body">
                        	<h4>메시지 contents</h4>
                        </div>
				 	</div>
				 </div>
				
                <!--Youtube Video Start-->
                <div class="col-md-8 col-12 mb-30">
                    <div class="box">
                        <div class="box-head">
                            <h4 class="title">Youtube Video (Plyr)</h4>
                        </div>
                        <div class="box-body">
                            <div class="plyr__video-embed plyr-youtube">
                                <iframe src="https://www.youtube.com/embed/bTqVqk7FSmY?origin=https://plyr.io&amp;iv_load_policy=3&amp;modestbranding=1&amp;playsinline=1&amp;showinfo=0&amp;rel=0&amp;enablejsapi=1" allowfullscreen allow="autoplay"></iframe>
                            </div>
                        </div>
                    </div>
                </div>
                    
				<div class="col-md-4 col-12 mb-30">
					<div class="box">
						<div class="box-head">
	                       <h4 class="title">메시지 영역</h4>
	                   </div>
	                   <div class="box-body">
	                   	<h4>메시지 contents</h4>
	                   </div>
					</div>
				</div> 
                <!--Youtube Video end-->

</div>

<%@include file="/WEB-INF/views/include/footer.jsp" %>

    <!-- Plugins & Activation JS For Only This Page -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/plyr/plyr.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/plyr/plyr.active.js"></script>

</body>

</html>