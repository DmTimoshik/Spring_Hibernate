<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> --%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <c:set var="user" value="${current}" /> --%>
<c:set var="app" value="${pageContext.request.contextPath}" />

<c:set var="user" value="${currentUser}" />

<%-- <c:set var="userAdmin" value="${sessionScope.current}" /> --%>

<%-- <c:if test="${userAdmin.firstName == null}">
<c:redirect url="/index"/>
</c:if> --%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add users</title>



</head>
<body>
	<div align="center" style="padding-left: 300px;">
		<div align="right" style="margin-right: 20px">
			Admin
			<sec:authentication property="principal.username"/>
			&nbsp;(<a href="<c:url value="/logout"/>">Logout</a>)
		</div>
		<div align="left" style="margin-left: 30px">
			<h1>Add user</h1>
		</div>
		<div align="left" style="margin-top: 20px">
			<form:form method="post" action="${app}/adduser"	modelAttribute="template">
				<input type="hidden" name="action" value="add" />
				<table>
					<tr>
						<td>Login</td>
						<td><form:input path="login" size="30" type="text" /></td>
						<td><font color="#CC0000"> * </font><form:errors path="login" style="color:red" /></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><form:input path="password" size="30" type="password" /></td>
						<td><font color="#CC0000"> * </font><form:errors path="password" style="color:red" /></td>
					</tr>
					<tr>
						<td>Password again</td>
						<td><form:input path="passwordConfirm" size="30" type="password" /></td>
						<td><font color="#CC0000"> * </font><form:errors path="passwordConfirm" style="color:red" /></td>
					</tr>
					<tr>
						<td>Email</td>
						<td><form:input path="email" size="30" type="text" /></td>
						<td><font color="#CC0000"> * </font><form:errors path="email" style="color:red" /></td>
					</tr>
					<tr>
						<td>First name</td>
						<td><form:input path="firstName" size="30" type="text" /></td>
						<td><font color="#CC0000"> * </font> <form:errors path="firstName" style="color:red" /></td>
					</tr>
					<tr>
						<td>Last name</td>
						<td><form:input path="lastName" size="30" type="text" /></td>
						<td><font color="#CC0000"> * </font><form:errors path="lastName" style="color:red" /></td>
					</tr>
					<tr>
						<td>Birthday</td>
						<!-- required="required"  value="yyyy-mm-dd"-->
						<td><form:input path="birthday" size="30" type="text" /></td>
						<td><font color="#CC0000"> * </font><form:errors path="birthday" style="color:red" /></td>
					</tr>
					<tr>
						<td>Role</td>
						<td><form:select path="role">
								<form:option value="Admin" />
								<form:option value="User" />
							</form:select></td>
						<td><font color="#CC0000"> * </font></td>
					</tr>
					<tr>
						<td align="left"><input type=submit name="Ok" value=" Ok ">
							<input type="button" value=" Cancel "
							onclick="location.href='${app}/welcome'"></td>
					</tr>
				</table>
				<c:if test="${wrong != null}">
					<p style="color: red; font-size: 20px;">Error - ${wrong}</p>
				</c:if>

			</form:form>
		</div>
	</div>
</body>
</html>