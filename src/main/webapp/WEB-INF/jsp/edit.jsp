<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="app" value="${pageContext.request.contextPath}" />

<c:set var="user" value="${currentUser}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit user</title>
<script type="text/javascript">
	function cansel() {
		window.location = "redirect:/welcome"
	}
</script>
</head>
<body>
	<div align="center" style="padding-left: 300px;">
		<div align="right" style="margin-right: 20px">
			Admin  
			<sec:authentication property="principal.username"/>
			&nbsp; (<a href="<c:url value="/logout"/>">Logout</a>)
		</div>
		<div align="left" style="margin-left: 30px">
			<h1>Edit user</h1>
		</div>
		<div align="left" style="margin-top: 20px" >
		<form:form method="post" action="${app}/update" modelAttribute="template">
			
				<input type="hidden" name="action" value="edit" />
				<table >
					<tr>
						<td>Login</td>
						<td>
							<form:input path="login" type="text" size="30" value="${user.login}" readonly="true" style="background-color: #cccfac;"/>
							</td>
						<td><font color="#CC0000"> * </font></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><form:input path="password" size="30" type="password" value="${user.password}"/></td>
						<td><font color="#CC0000"> * </font><form:errors path="password" style="color:red" /></td>
					</tr>
					<tr>
						<td>Password again</td>
						<td><form:input path="passwordConfirm" size="30" type="password" value="${user.password}"/></td>
						<td><font color="#CC0000"> * </font><form:errors path="passwordConfirm" style="color:red" /></td>
					</tr>
					<tr>
						<td>Email</td>
						<td><form:input path="email" size="30" type="text" value="${user.email}"/></td>
						<td><font color="#CC0000"> * </font><form:errors path="email" style="color:red" /></td>
					</tr>
					<tr>
						<td>First name</td>
						<td><form:input path="firstName" size="30" type="text" value="${user.firstName}"/></td>
						<td><font color="#CC0000"> * </font><form:errors path="firstName" style="color:red" /></td>
					</tr>
					<tr>
						<td>Last name</td>
						<td><form:input path="lastName" size="30" type="text" value="${user.lastName}"/></td>
						<td><font color="#CC0000"> * </font><form:errors path="lastName" style="color:red" /></td>
					</tr>
					<tr>
						<td>Birthday(yyyy-mm-dd)</td>
						<td><form:input path="birthday" size="30" type="text" value="${user.birthday}"/></td>
						<td><font color="#CC0000"> * </font><form:errors path="birthday" style="color:red" /></td>
					</tr>
					<tr>
						<td>Role</td>
						<td>
							<form:select path="role">
								<form:option value="${user.role.name}"/>
							<c:if test="${user.role.name == 'Admin'}"> 
								<form:option value="User"/>
							</c:if>
							<c:if test="${user.role.name == 'User'}"> 
								<form:option value="Admin"/>
							</c:if>							
							</form:select></td>
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