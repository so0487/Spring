<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>

<body>

<div class="main-wrapper">

<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ include file="/WEB-INF/views/include/left.jsp" %>

	<!-- Content Body Start -->
	<div class="content-body">

		<!-- Page Headings Start -->
		<div class="row justify-content-between align-items-center mb-10">

			<!-- Page Heading Start -->
			<div class="col-12 col-lg-auto mb-20">
				<div class="page-heading">
					<h3 class="title">
						페이지명 (ex)Table)<span>페이지 소개(ex)테이블 페이지)</span>
					</h3>
				</div>
			</div>
			<!-- Page Heading End -->

		</div>
		<!-- Page Headings End -->



			<!-- 해당 페이지 include -->


			<!-- 로그인 페이지 -->
			<h1>로그인/회원가입</h1>
			<div class="login-register-form">
				<a>아이디/회원가입</a>
				<div class="col-12 mb-20">
					<input class="form-control" type="text"
						placeholder="User ID / Email">
				</div>
				<a>패스워드</a>
				<div class="col-12 mb-20">
					<input class="form-control" type="password" placeholder="Password">
				</div>
				<a>로그인/회원가입 완료 버튼</a>
				<div class="col-12 mt-10">
					<button class="button button-primary button-outline">sign
						in</button>
				</div>
			</div>


			<!-- 캘린더 -->
			<h1>캘린더</h1>
			<div class="main-wrapper">
				<div class="fullcalendar fullcalendar-example"></div>
				<!-- 캘린더 js -->
				<script
					src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/moment/moment.min.js"></script>
				<script
					src="<%=request.getContextPath()%>/resources/bootstrap/adom	x-html-tf-v1.1/html/light/assets/js/plugins/fullcalendar/fullcalendar.min.js"></script>
				<script
					src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/fullcalendar/fullcalendar.active.js"></script>
			</div>



			<!-- 차트 -->
			<h1>차트</h1>
			<!-- 라인 차트 -->
			<div>라인차트</div>
			<div class="example-chartjs">
				<canvas id="example-chartjs-line"></canvas>
			</div>

			<!-- 버티컬 차트 -->
			<div>버티컬 차트</div>
			<div class="example-chartjs">
				<canvas id="example-chartjs-barV"></canvas>
			</div>

			<!-- 파이 차트 -->
			<div>파이차트</div>
			<div class="example-chartjs">
				<canvas id="example-chartjs-pie"></canvas>
			</div>

			<!-- 차트 전체 js -->
			<script
				src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/chartjs/Chart.min.js"></script>
			<script
				src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/chartjs/chartjs.active.js"></script>



			<!-- 메일 리스트 -->
			<h1>메일 리스트</h1>
			<div>메일 메뉴</div>
			<div class="mail-menu">
				<button
					class="button-compose-mail button button-danger button-round"
					data-toggle="modal" data-target="#modal-compose-mail">Compose
					Mail</button>
				<ul>
					<li><a href="#"><i class="zmdi zmdi-email-open"></i> Inbox</a></li>
					<li><a href="#"><i class="zmdi zmdi-mail-send"></i> Send</a></li>
					<li><a href="#"><i class="zmdi zmdi-file"></i> Draft</a></li>
					<li><a href="#"><i class="zmdi zmdi-cloud-done"></i>
							Outbox</a></li>
					<li><a href="#"><i class="zmdi zmdi-star"></i> Stared</a></li>
					<li><a href="#"><i class="zmdi zmdi-comments"></i> Chats</a></li>
					<li><a href="#"><i class="zmdi zmdi-block"></i> Spam</a></li>
					<li><a href="#"><i class="zmdi zmdi-delete"></i> Trash</a></li>
					<li><a href="#"><i class="zmdi zmdi-plus-circle"></i>
							Creat New</a></li>
				</ul>
			</div>


			<div>메일 옵션</div>
			<div class="mail-options">
				<div class="mail-options-group">
					<div class="adomx-dropdown">
						<button class="mail-button-filter toggle">
							<i class="zmdi zmdi-filter-list"></i>
						</button>
						<ul class="adomx-dropdown-menu">
							<li><a href="#">All</a></li>
							<li><a href="#">None</a></li>
							<li><a href="#">Read</a></li>
							<li><a href="#">Unread</a></li>
							<li><a href="#">Starred</a></li>
							<li><a href="#">Unstarred</a></li>
						</ul>
					</div>
					<button class="mail-button-reply">
						<i class="zmdi zmdi-mail-reply"></i>
					</button>
					<button class="mail-button-refresh">
						<i class="zmdi zmdi-replay"></i>
					</button>
				</div>

				<div class="mail-options-group">
					<button class="mail-button-starred">
						<i class="zmdi zmdi-star-outline"></i>
					</button>
					<button class="mail-button-archive">
						<i class="zmdi zmdi-archive"></i>
					</button>
					<div class="adomx-dropdown">
						<button class="mail-button-category toggle">
							<i class="zmdi zmdi-folder"></i>
						</button>
						<ul class="adomx-dropdown-menu">
							<li><span>Move to:</span></li>
							<li>
								<hr>
							</li>
							<li class="checked"><a href="#"><i class="check"></i>
									Forwarded</a></li>
							<li><a href="#"><i class="check"></i> Replied</a></li>
							<li><a href="#"><i class="check"></i> Social</a></li>
							<li><a href="#"><i class="check"></i> Forums</a></li>
							<li><a href="#"><i class="check"></i> Promotions</a></li>
							<li>
								<hr>
							</li>
							<li><a href="#">Spam</a></li>
							<li><a href="#">Trash</a></li>
							<li>
								<hr>
							</li>
							<li><a href="#">Create New</a></li>
							<li><a href="#">Manage Folder</a></li>
						</ul>
					</div>
				</div>

				<div class="mail-options-group">
					<button class="mail-button-delete">
						<i class="zmdi zmdi-delete"></i>
					</button>
					<div class="adomx-dropdown">
						<button class="mail-button-snooze toggle">
							<i class="zmdi zmdi-alarm-snooze"></i>
						</button>
						<ul class="adomx-dropdown-menu">
							<li><span>Snooze ultil..</span></li>
							<li class="checked"><a href="#">Later today <span
									class="ml-auto">6:00 PM</span></a></li>
							<li class="checked"><a href="#">Tomorrow <span
									class="ml-auto">8:00 AM</span></a></li>
							<li class="checked"><a href="#">Next week <span
									class="ml-auto">8:00 AM</span></a></li>
							<li class="checked"><a href="#">Next weekend <span
									class="ml-auto">8:00 AM</span></a></li>
							<li>
								<hr>
							</li>
							<li><a href="#"><i class="zmdi zmdi-calendar"></i> Pick
									date & time</a></li>
						</ul>
					</div>
					<div class="adomx-dropdown">
						<button class="mail-button-label toggle">
							<i class="zmdi zmdi-label"></i>
						</button>
						<ul class="adomx-dropdown-menu">
							<li><span>Label as:</span></li>
							<li>
								<hr>
							</li>
							<li class="checked"><a href="#"><i class="check"></i>
									Forwarded</a></li>
							<li><a href="#"><i class="check"></i> Replied</a></li>
							<li><a href="#"><i class="check"></i> Social</a></li>
							<li><a href="#"><i class="check"></i> Forums</a></li>
							<li><a href="#"><i class="check"></i> Promotions</a></li>
							<li>
								<hr>
							</li>
							<li><a href="#">Create New</a></li>
							<li><a href="#">Manage Labels</a></li>
						</ul>
					</div>
					<div class="adomx-dropdown">
						<button class="mail-button-more toggle">
							<i class="zmdi zmdi-more-vert"></i>
						</button>
						<ul class="adomx-dropdown-menu adomx-dropdown-menu-right">
							<li><a href="#">Mark all as read</a></li>
							<li><a href="#">Mark as read</a></li>
							<li><a href="#">Mark as unread</a></li>
							<li><a href="#">Mark as inportant</a></li>
							<li><a href="#">Mark as not inportant</a></li>
							<li><a href="#">Add to Tasks</a></li>
							<li><a href="#">Add Star</a></li>
							<li><a href="#">Filter messages like these</a></li>
							<li><a href="#">Mute</a></li>
						</ul>
					</div>
				</div>
			</div>



			<div>메일 리스트</div>
			<div class="mail-list">

				<!--Mail Start-->
				<div class="mail">

					<div class="left">
						<label class="adomx-checkbox"><input type="checkbox">
							<i class="icon"></i></label>
						<button class="mail-button-starred">
							<i class="zmdi zmdi-star-outline"></i>
						</button>
					</div>

					<div class="middle">

						<div class="top">
							<h4 class="name">
								<a href="single-mail.html">Adrien Morel</a>
							</h4>
							<span class="date">/ 13 May 2019</span>
						</div>

						<div class="body">
							<p>There are many variations of passages of Lorem Ipsum
								available, but the majority have suffered alteration in some
								form</p>
						</div>

						<div class="bottom">
							<span class="badge badge-outline badge-primary">Design</span> <span
								class="badge badge-outline badge-primary">Element</span>
						</div>

					</div>

					<div class="right">
						<button class="mail-button-delete">
							<i class="zmdi zmdi-delete"></i>
						</button>
						<div class="adomx-dropdown">
							<button class="mail-button-option toggle">
								<i class="zmdi zmdi-more-vert"></i>
							</button>
							<ul class="adomx-dropdown-menu adomx-dropdown-menu-right">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another Action</a></li>
								<li><a href="#">Something else</a></li>
							</ul>
						</div>
					</div>

				</div>
				<!--Mail End-->



				<!-- 메일 리스트 js -->
				<script
					src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/summernote/summernote-bs4.min.js"></script>
				<script
					src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/summernote/summernote.active.js"></script>

			</div>



			<div>메일 세부사항</div>
			<!--Mail Start-->
			<div class="single-mail">
				<!--Top-->
				<div class="top">
					<!--Left-->
					<div class="left">
						<ul>
							<li><strong>From</strong> <span>uessicauensen@mail.com</span></li>
							<li><strong>To</strong> <span>admin@domain.com (me)</span></li>
							<li><strong>CC</strong> <span>N/A</span></li>
						</ul>
					</div>
					<!--Right-->
					<div class="right">
						<button>
							<i class="zmdi zmdi-print"></i>
						</button>
						<button>
							<i class="zmdi zmdi-tag-more"></i>
						</button>
					</div>
				</div>
				<!--Bottom-->
				<div class="bottom">
					<!--User Start-->
					<div class="user">
						<div class="image">
							<img
								src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/images/avatar/avatar-1.jpg"
								alt="">
						</div>
						<div class="info">
							<h5 class="name">David Evans</h5>
							<span class="date">Sep 19, 2018, 3:46 PM</span>
						</div>
					</div>
					<!--User End-->
					<!--Body Start-->
					<div class="body">

						<div class="content">
							<h5>Hello Admin</h5>
							<p>We are oferring a 10% give away for all the new purcahses
								of our plugin. This offer is limited and valid till 24th
								September Lorem Ipsum is simply dummy text of the printing and
								typesetting industry. Lorem Ipsum has been the industry's
								standard dummy text ever since the 1500s, when an unknown
								printer took a galley of type and scrambled it to make a type
								specimen book. It has survived not only five centuries, but also
								the leap into electronic typesettin</p>
							<ul>
								<li><a href="#">Lorem Ipsum has been the industry's
										standard dummy text.</a></li>
								<li><a href="#">Lorem Ipsum has been the industry's
										standard dummy text.</a></li>
							</ul>
						</div>

						<div class="attachment">
							<h5 class="title">Attachment:</h5>
							<ul class="attach-files">
								<li><a href="#"> <img
										src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/images/icons/doc.png"
										alt=""> <span class="type">DOC</span> <i
										class="zmdi zmdi-cloud-download"></i>
								</a></li>
								<li><a href="#"> <img
										src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/images/icons/pdf.png"
										alt=""> <span class="type">PDF</span> <i
										class="zmdi zmdi-cloud-download"></i>
								</a></li>
								<li><a href="#"> <img
										src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/images/icons/zip.png"
										alt=""> <span class="type">ZIP</span> <i
										class="zmdi zmdi-cloud-download"></i>
								</a></li>
								<li><a href="#"> <img
										src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/images/mail/attach-1.png"
										alt=""> <span class="type">PNG</span> <i
										class="zmdi zmdi-cloud-download"></i>
								</a></li>
							</ul>

							<a href="#"
								class="button button-primary button-round button-outline">Download
								zip</a>

						</div>

						<div class="buttons">
							<a href="#"
								class="button button-info button-round button-outline"><i
								class="zmdi zmdi-forward"></i>Forward</a> <a href="#"
								class="button button-primary button-round button-outline"><i
								class="zmdi zmdi-mail-reply"></i>Reply</a>
						</div>

					</div>
					<!--Body End-->
				</div>
			</div>
			<!--Mail End-->


			<!-- mailDetail js -->
			<script
				src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/summernote/summernote-bs4.min.js"></script>
			<script
				src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/summernote/summernote.active.js"></script>


			<!-- 미디어플레이어 -->
			<h1>미디어 플레이어</h1>
			<!--HTML5 Video Start-->
			<div class="row">
				<div class="col-md-8 col-12 mb-30">
					<div class="box">
						<div class="box-head">
							<h4 class="title">HTML5 Video (Plyr)</h4>
						</div>
						<div class="box-body">
							<div class="col-md-8 col-12 mb-30">
							<video
								poster="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/images/bg/video-1-poster.jpg"
								class="plyr-video" playsinline controls>
								<source	
									src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/media/video-1-576p.mp4"
									type="video/mp4" data-res="576" />
								<source
									src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/media/video-1-720p.mp4"
									type="video/mp4" data-res="720" />
								<source
									src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/media/video-1-1080p.mp4"
									type="video/mp4" data-res="1080" />
							</video>
							</div>
						</div>
					</div>
				</div>
				<!-- 메시지(창)영역 -->

				<div class="col-md-4 col-12 mb-30">
					<div class="box">
						<div class="box-head">
							<h4 class="title">메시지(창) 영역</h4>
						</div>
						<div class="box-body">
							<h4>메시지 contents</h4>
						</div>
					</div>
				</div>
			</div>
			
			
			
			
			
			
			<div class="row">
				<!--Youtube Video Start-->
				<div class="col-md-8 col-12 mb-30">
					<div class="box">
						<div class="box-head">
							<h4 class="title">Youtube Video (Plyr)</h4>
						</div>
						<div class="box-body">
							<div class="plyr__video-embed plyr-youtube">
								<iframe
									src="https://www.youtube.com/embed/bTqVqk7FSmY?origin=https://plyr.io&amp;iv_load_policy=3&amp;modestbranding=1&amp;playsinline=1&amp;showinfo=0&amp;rel=0&amp;enablejsapi=1"
									allowfullscreen allow="autoplay"></iframe>
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
			</div>
			
			




			<!-- modal -->
			<h1>modal창</h1>
			<!--Varying Modal Content Start-->
			<div class="col-lg-6 col-12 mb-30">
				<div class="box">
					<div class="box-head">
						<h4 class="title">Varying Modal Content</h4>
					</div>
					<div class="box-body">
						<button class="button button-primary" data-toggle="modal"
							data-target="#exampleModal5" data-whatever="@mdo">Modal
							@mdo</button>
						<button class="button button-primary" data-toggle="modal"
							data-target="#exampleModal5" data-whatever="@fat">Modal
							@fat</button>
						<button class="button button-primary" data-toggle="modal"
							data-target="#exampleModal5" data-whatever="@getbootstrap">Modal
							@getbootstrap</button>
						<!-- Modal -->
						<div class="modal fade" id="exampleModal5">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">New message</h5>
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<form>
											<div class="form-group">
												<label for="recipient-name" class="col-form-label">Recipient:</label>
												<input type="text" class="form-control" id="recipient-name">
											</div>
											<div class="form-group">
												<label for="message-text" class="col-form-label">Message:</label>
												<textarea class="form-control" id="message-text"></textarea>
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<button class="button button-danger" data-dismiss="modal">Close</button>
										<button class="button button-primary">Save changes</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--Varying Modal Content End-->

			<!-- modal js -->
			<script>
			     $('#exampleModal5').on('show.bs.modal', function(event) {
			         var button = $(event.relatedTarget) // Button that triggered the modal
			         var recipient = button.data('whatever') // Extract info from data-* attributes
			         // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			         // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			         var modal = $(this)
			         modal.find('.modal-title').text('New message to ' + recipient)
			         modal.find('.modal-body input').val(recipient)
			     })
			 </script>





			<!-- 테이블 -->
			<h1>테이블</h1>
			<div class="row">

				<!--Basic Start-->
				<div class="col-12 mb-30">
					<div class="box">
						<div class="box-head">
							<h3 class="title">Basic</h3>
						</div>
						<div class="box-body">

							<table class="table footable" data-paging="true"
								data-filtering="true" data-sorting="true"
								data-breakpoints='{ "xs": 480, "sm": 768, "md": 992, "lg": 1200, "xl": 1400 }'>
								<thead>
									<tr>
										<th data-name="Name">Name</th>
										<th data-name="Position">Position</th>
										<th data-breakpoints="xs" data-name="Office">Office</th>
										<th data-breakpoints="xs" data-name="Age">Age</th>
										<th data-breakpoints="xs sm" data-name="Start">Start date</th>
										<th data-breakpoints="xs sm md" data-name="Salary">Salary</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Tiger Nixon</td>
										<td>System Architect</td>
										<td>Edinburgh</td>
										<td>61</td>
										<td>2011/04/25</td>
										<td>$320,800</td>
									</tr>
								</tbody>
							</table>

						</div>
					</div>
				</div>
			</div>
			<!--Basic End-->

			<!-- 테이블 js -->
			<script
				src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/moment/moment.min.js"></script>
			<script
				src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/footable/footable.min.js"></script>
			<script
				src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/footable/footable.active.js"></script>






			<!-- todoList -->
			<h1>todoList</h1>
			<div class="row">
				<!--App Todo List Start-->
				<div class="col-12">
					<!--Todo List Wrapper Start-->
					<div class="todo-list-wrapper">

						<!--Todo List Menu Start-->
						<div class="todo-list-menu">
							<ul>
								<li><a href="#"><i class="zmdi zmdi-star"></i> Stared</a></li>
								<li><a href="#"><i class="zmdi zmdi-time-restore"></i>
										Yesterday</a></li>
								<li><a href="#"><i class="zmdi zmdi-calendar"></i> Last
										7 Days</a></li>
								<li><a href="#"><i class="zmdi zmdi-calendar-check"></i>
										Last 30 Days</a></li>
								<li><a href="#"><i class="zmdi zmdi-check-square"></i>
										Done</a></li>
								<li><a href="#"><i class="zmdi zmdi-delete"></i> Trash</a></li>
							</ul>
						</div>
						<!--Todo List Menu End-->

						<!--Todo List Container Start-->
						<div class="todo-list-container">

							<!--Todo List Search Start-->
							<div class="todo-list-search">
								<form action="#">
									<button>
										<i class="zmdi zmdi-search"></i>
									</button>
									<input type="text" placeholder="Search To Do">
								</form>
							</div>
							<!--Todo List Search End-->

							<!--Todo List Start-->
							<ul class="todo-list">
								<li>
									<div class="list-action">
										<button class="status">
											<i class="zmdi zmdi-star-outline"></i>
										</button>
										<label class="adomx-checkbox"><input type="checkbox">
											<i class="icon"></i></label>
										<button class="remove">
											<i class="zmdi zmdi-delete"></i>
										</button>
									</div>
									<div class="list-content">
										<p>Lorem Ipsum is simply dummy text of the printing and
											typesetting industry. Lorem Ipsum dummy text.</p>
										<span class="time">Time: 03.00 pm (Today)</span>
									</div>
									<div class="list-action right">
										<button class="remove">
											<i class="zmdi zmdi-delete"></i>
										</button>
									</div>
								</li>
								<li class="done">
									<div class="list-action">
										<button class="status">
											<i class="zmdi zmdi-star-outline"></i>
										</button>
										<label class="adomx-checkbox"><input type="checkbox">
											<i class="icon"></i></label>
										<button class="remove">
											<i class="zmdi zmdi-delete"></i>
										</button>
									</div>
									<div class="list-content">
										<p>It is a long established fact that a reader will be
											distracted by the readable content.</p>
										<span class="time">Time: 03.00 pm (Today)</span>
									</div>
									<div class="list-action right">
										<button class="remove">
											<i class="zmdi zmdi-delete"></i>
										</button>
									</div>
								</li>
								<li>
									<div class="list-action">
										<button class="status">
											<i class="zmdi zmdi-star-outline"></i>
										</button>
										<label class="adomx-checkbox"><input type="checkbox">
											<i class="icon"></i></label>
										<button class="remove">
											<i class="zmdi zmdi-delete"></i>
										</button>
									</div>
									<div class="list-content">
										<p>Contrary to popular belief, Lorem Ipsum is not simply
											random text. It has roots in a piece of classical Latin
											literature.</p>
										<span class="time">Time: 03.00 pm (Today)</span>
									</div>
									<div class="list-action right">
										<button class="remove">
											<i class="zmdi zmdi-delete"></i>
										</button>
									</div>
								</li>
								<li>
									<div class="list-action">
										<button class="status">
											<i class="zmdi zmdi-star-outline"></i>
										</button>
										<label class="adomx-checkbox"><input type="checkbox">
											<i class="icon"></i></label>
										<button class="remove">
											<i class="zmdi zmdi-delete"></i>
										</button>
									</div>
									<div class="list-content">
										<p>It is a long established fact that a reader will be
											distracted by the readable content of a page when.</p>
										<span class="time">Time: 03.00 pm (Today)</span>
									</div>
									<div class="list-action right">
										<button class="remove">
											<i class="zmdi zmdi-delete"></i>
										</button>
									</div>
								</li>
								<li class="done">
									<div class="list-action">
										<button class="status">
											<i class="zmdi zmdi-star-outline"></i>
										</button>
										<label class="adomx-checkbox"><input type="checkbox">
											<i class="icon"></i></label>
										<button class="remove">
											<i class="zmdi zmdi-delete"></i>
										</button>
									</div>
									<div class="list-content">
										<p>Lorem Ipsum is simply dummy text of the printing and
											typesetting industry. Lorem Ipsum dummy text.</p>
										<span class="time">Time: 03.00 pm (Today)</span>
									</div>
									<div class="list-action right">
										<button class="remove">
											<i class="zmdi zmdi-delete"></i>
										</button>
									</div>
								</li>
								<li>
									<div class="list-action">
										<button class="status">
											<i class="zmdi zmdi-star-outline"></i>
										</button>
										<label class="adomx-checkbox"><input type="checkbox">
											<i class="icon"></i></label>
										<button class="remove">
											<i class="zmdi zmdi-delete"></i>
										</button>
									</div>
									<div class="list-content">
										<p>There are many variations of passages of Lorem Ipsum
											available, but the majority have suffered.</p>
										<span class="time">Time: 03.00 pm (Today)</span>
									</div>
									<div class="list-action right">
										<button class="remove">
											<i class="zmdi zmdi-delete"></i>
										</button>
									</div>
								</li>
							</ul>
							<!--Todo List End-->

							<!--Add Todo List Start-->
							<form action="#" class="todo-list-add-new">
								<label class="status"><input type="checkbox"><i
									class="icon zmdi zmdi-star-outline"></i></label> <input class="content"
									type="text" placeholder="Type new Task">
								<button class="submit">
									<i class="zmdi zmdi-plus-circle-o"></i>
								</button>
							</form>
							<!--Add Todo List End-->

						</div>
						<!--Todo List Container End-->

					</div>
					<!--Todo List Wrapper End-->
				</div>
				<!--App Todo List End-->
			</div>


			<!-- todoList js -->
			<script
				src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/moment/moment.min.js"></script>


			<!-- tab -->
			<h1>tab</h1>
			<div class="row">
				<!--Basic Tab Start-->
				<div class="col-lg-6 col-12 mb-30">
					<div class="box">
						<div class="box-head">
							<h4 class="title">Basic Tab</h4>
						</div>
						<div class="box-body">
							<ul class="nav nav-tabs mb-15">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#home">Home</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#profile">Profile</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#contact">Contact</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane fade show active" id="home">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Ducimus cumque corporis et hic obcaecati ipsum
										consequatur nostrum, explicabo praesentium saepe porro
										expedita iure suscipit harum illum quas esse quo fugiat vel
										temporibus ad ipsam! Laudantium asperiores ad at saepe illum.</p>
								</div>
								<div class="tab-pane fade" id="profile">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Ducimus cumque corporis et hic obcaecati ipsum
										consequatur nostrum, explicabo praesentium saepe porro
										expedita iure suscipit harum illum quas esse quo fugiat vel
										temporibus ad ipsam! Laudantium asperiores ad at saepe illum.</p>
								</div>
								<div class="tab-pane fade" id="contact">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Ducimus cumque corporis et hic obcaecati ipsum
										consequatur nostrum, explicabo praesentium saepe porro
										expedita iure suscipit harum illum quas esse quo fugiat vel
										temporibus ad ipsam! Laudantium asperiores ad at saepe illum.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--Basic Tab End-->
			</div>

			<script>
				       $('#exampleModal5').on('show.bs.modal', function(event) {
				           var button = $(event.relatedTarget) // Button that triggered the modal
				           var recipient = button.data('whatever') // Extract info from data-* attributes
				           // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
				           // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
				           var modal = $(this)
				           modal.find('.modal-title').text('New message to ' + recipient)
				           modal.find('.modal-body input').val(recipient)
				       })
				   </script>



			<!-- button -->
			<h1>버튼(일반)</h1>
			<div class="row">
				<!--Button Default Start-->
				<div class="col-lg-6 col-12 mb-30">
					<div class="box">
						<div class="box-head">
							<h4 class="title">Button Default</h4>
						</div>
						<div class="box-body">
							<button class="button button-primary">
								<span>primary</span>
							</button>
							<button class="button button-success">
								<span>success</span>
							</button>
							<button class="button button-danger">
								<span>danger</span>
							</button>
							<button class="button button-info">
								<span>info</span>
							</button>
						</div>
					</div>
				</div>
			</div>






			<!-- 페이징 처리 -->
			<div class="row">
				<h1>페이징 처리</h1>
				<!--Alignment Center Start-->
				<div class="col-lg-4 col-md-6 col-12 mb-30">
					<div class="box">
						<div class="box-head">
							<h4 class="title">Alignment Center</h4>
						</div>
						<div class="box-body">
							<ul class="pagination justify-content-center">
								<li class="page-item"><a class="page-link" href="#"><i
										class="zmdi zmdi-chevron-left"></i></a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#"><i
										class="zmdi zmdi-chevron-right"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				<!--Alignment Center End-->
			</div>





			<!-- basic Form(각종버튼, 입력양식......) -->
			<h1>기본입력양식</h1>
			<div class="row">

				<!--Form controls Start-->
				<div class="col-12 mb-30">
					<div class="box">
						<div class="box-head">
							<h3 class="title">Form controls</h3>
						</div>
						<div class="box-body">
							<div class="row mbn-20">

								<!--Form Field-->
								<div class="col-lg-4 col-12 mb-20">

									<h6 class="mb-15">Default</h6>

									<div class="row mbn-15">
										<div class="col-12 mb-15">
											<input type="text" class="form-control" placeholder="Input">
										</div>
										<div class="col-12 mb-15">
											<select class="form-control">
												<option>Select</option>
												<optgroup label="Options One">
													<option>One</option>
													<option>Two</option>
													<option>Three</option>
												</optgroup>
												<optgroup label="Options Two">
													<option>One</option>
													<option>Two</option>
													<option>Three</option>
												</optgroup>
											</select>
										</div>
										<div class="col-12 mb-15">
											<textarea class="form-control" placeholder="Textarea"></textarea>
										</div>
									</div>

								</div>
								<!--Form Field-->

								<!--Readonly Field-->
								<div class="col-lg-4 col-12 mb-20">

									<h6 class="mb-15">Readonly</h6>

									<div class="row mbn-15">
										<div class="col-12 mb-15">
											<input type="text" class="form-control" readonly
												placeholder="Readonly Input">
										</div>
										<div class="col-12 mb-15">
											<select class="form-control">
												<option>Readonly Select</option>
												<optgroup label="Options One">
													<option disabled>One</option>
													<option disabled>Two</option>
													<option disabled>Three</option>
												</optgroup>
												<optgroup label="Options Two">
													<option disabled>One</option>
													<option disabled>Two</option>
													<option disabled>Three</option>
												</optgroup>
											</select>
										</div>
										<div class="col-12 mb-15">
											<textarea class="form-control" readonly
												placeholder="Readonly Textarea"></textarea>
										</div>
									</div>

								</div>
								<!--Readonly Field-->

								<!--Disabled Field-->
								<div class="col-lg-4 col-12 mb-20">

									<h6 class="mb-15">Disabled</h6>

									<div class="row mbn-15">
										<div class="col-12 mb-15">
											<input type="text" class="form-control" disabled
												placeholder="Disabled Input">
										</div>
										<div class="col-12 mb-15">
											<select class="form-control" disabled>
												<option>Disabled Select</option>
												<optgroup label="Options One">
													<option disabled>One</option>
													<option disabled>Two</option>
													<option disabled>Three</option>
												</optgroup>
												<optgroup label="Options Two">
													<option disabled>One</option>
													<option disabled>Two</option>
													<option disabled>Three</option>
												</optgroup>
											</select>
										</div>
										<div class="col-12 mb-15">
											<textarea class="form-control" disabled
												placeholder="Disabled Textarea"></textarea>
										</div>
									</div>

								</div>
								<!--Disabled Field-->

							</div>
						</div>
						<div class="box-foot">
							<p>
								Textual form controls—like inputs, selects, and textareas—are
								styled with the
								<code>.form-control</code>
								class. Included are styles for general appearance, focus state,
								sizing, and more.
							</p>
						</div>
					</div>
				</div>
				<!--Form controls End-->

				<!--Other Default Elements Start-->
				<div class="col-12">
					<div class="box">
						<div class="box-head">
							<h3 class="title">Other Default Elements</h3>
						</div>
						<div class="box-body">
							<div class="row mbn-20">

								<!--Multiple Select-->
								<div class="col-lg-4 col-12 mb-20">

									<h6 class="mb-15">Multiple Select</h6>

									<select class="form-control" multiple>
										<option>One</option>
										<option>Two</option>
										<option>Three</option>
										<option>Four</option>
										<option>Five</option>
									</select>

								</div>
								<!--Multiple Select-->

								<!--File Input-->
								<div class="col-lg-4 col-12 mb-20">

									<h6 class="mb-15">File Input</h6>

									<input type="file" class="form-control">

								</div>
								<!--File Input-->

								<!--Input Range-->
								<div class="col-lg-4 col-12 mb-20">

									<h6 class="mb-15">Range</h6>

									<input type="range" class="form-control-range">

								</div>
								<!--Input Range-->

								<!--Checkbox-->
								<div class="col-lg-4 col-12 mb-20">

									<h6 class="mb-15">Checkbox</h6>

									<label><input type="checkbox">Default checkbox</label>
									<label><input type="checkbox" disabled>Checkbox
										Disabled</label>

								</div>
								<!--Checkbox-->

								<!--Radio-->
								<div class="col-lg-4 col-12 mb-20">

									<h6 class="mb-15">Radio</h6>

									<label><input type="radio" name="basicRadio">Default
										Radio</label> <label><input type="radio" name="basicRadio">Another
										Default Radio</label> <label><input type="radio"
										name="basicRadio" disabled>Radio Disabled</label>

								</div>
								<!--Radio-->

								<!--Inline Checkbox & Radio-->
								<div class="col-lg-4 col-12 mb-20">

									<h6 class="mb-15">Inline Checkbox & Radio</h6>

									<div class="form-group">
										<label class="inline"><input type="checkbox">One</label>
										<label class="inline"><input type="checkbox">Two</label>
									</div>

									<div class="form-group">
										<label class="inline"><input type="radio"
											name="inlineBasicRadio">One</label> <label class="inline"><input
											type="radio" name="inlineBasicRadio">Two</label>
									</div>

								</div>
								<!--Inline Checkbox & Radio-->

							</div>
						</div>
					</div>
				</div>
				<!--Other Default Elements End-->

			</div>

		</div>
	</div>
</body>



<%@ include file="/WEB-INF/views/include/footer.jsp" %>