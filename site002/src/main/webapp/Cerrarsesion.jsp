<%@ page session="true" %>
<%
	HttpSession sesionOk = request.getSession();
	sesionOk.invalidate();
%>
<jsp:forward page="Login.jsp"/>