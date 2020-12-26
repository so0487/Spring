<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>

<%@ include file="/WEB-INF/views/include/header.jsp" %>
<body>

<div class="main-wrapper">
	<div class="fullcalendar fullcalendar-example"></div>
</div>


<script>
$('.fullcalendar-example').fullCalendar({
    // put your options and callbacks here
});
</script>


<%@include file="/WEB-INF/views/include/footer.jsp" %>
<!-- Plugins & Activation JS For Only This Page -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/moment/moment.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/fullcalendar/fullcalendar.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/fullcalendar/fullcalendar.active.js"></script>

