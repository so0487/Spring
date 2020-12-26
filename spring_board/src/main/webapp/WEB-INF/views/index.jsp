<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <script>
	location.href="<%=request.getContextPath()%>/common/login";
</script>  --%>

<%
Cookie[] cookies = request.getCookies();
if (cookies != null && cookies.length > 0) {
	for (int i = 0 ; i < cookies.length ; i++) {
		System.out.println(cookies[i].getName());
		if (cookies[i].getName().equals("loginUser")) {
			request.setAttribute("pastID", cookies[i].getValue());
		}
	}
}
%>


<c:if test="${empty loginUser }">
<jsp:forward page="/WEB-INF/views/common/loginForm.jsp" />
</c:if>

<c:if test="${!empty loginUser }">
<c:redirect url="/index.do"  />
</c:if>

