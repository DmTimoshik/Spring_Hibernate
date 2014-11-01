<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="mytag"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="app" value="${pageContext.request.contextPath}"/>
<c:set var="user" value="${sessionScope.current}"/>

<%-- <c:if test="${user.firstName == null}">
<c:redirect url="/index"/>
</c:if> --%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AdminPage</title>
<script type="text/javascript">
	function confirmation() {
		if (confirm("Are you sure?")) {
			return true;
		} else {
			return false;
		}
	}
</script>
</head>
<body>
	<div align="center" style="padding-left: 100px;">
		<div align="right" style="margin-right: 20px;">
			Admin  
			 <sec:authentication property="principal.username"/>
			(<a href="<c:url value="/logout"/>">Logout</a>)
		</div>
		<div align="left" style="margin-left: 20px; margin-top: 50px;">
			<a href="<c:url value="/register"/>">Add new user</a>
		</div>
		<div align="left"
			style="margin-left: 20px; margin-top: 20px; margin-right: 40px">
			<table  width="800px" border="1" frame="void" cellspacing="0"
				cellpadding="5">
				<tr bgcolor="#cccccc">
					<td>Login</td>
					<td>First Name</td>
					<td>Last Name</td>
					<td>Age</td>
					<td>Role</td>
					<td>Actions</td>
				</tr>
				${userrole}
				${useruser}
				<mytag:table list="${userList}" />
			</table>

		</div>
	</div>
</body>
</html>