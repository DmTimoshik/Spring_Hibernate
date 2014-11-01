<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ attribute name="list" required="true" type="java.util.List"%>

<c:if  test="${!empty userList}">
    <!-- <table class="data" border="1" width="100%" cellpadding="2" cellspacing="4"> -->

        <c:forEach items="${userList}" var="user">
            <tr>
                <td>${user.login}</td>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${113-user.birthday.year}</td>
                <td>${user.role.name}</td>
                <td><a href="edit/${user.login}">Edit   </a>&nbsp;
                    <a href="delete/${user.login}" onclick="return confirm('Are you sure?');">Delete</a></td>
            </tr>
        </c:forEach>
 <!--    </table> -->
</c:if>