<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page session="true"%>
<html>
<head>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel='stylesheet' href='webjars/bootstrap/3.2.0/css/bootstrap.min.css'>
</head>
<body>
<h1>Title : ${title}</h1>
<%--<h1>Message : ${message}</h1>--%>

<c:url value="/logout" var="logoutUrl" />
<form action="${logoutUrl}" method="post" id="logoutForm">
		<td>Fruit</td>
		<td>${fruit}</td>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

<h2>User Information</h2>
<form:form method = "POST" action = "/addVote">
<div class="form-check">
	<table>
		<tr>
			<td><form:label path = "fruit">Gender</form:label></td>
			<td>
				<form:radiobutton  path = "fruit" value = "Apple" label = "Apple" />
				<form:radiobutton path = "fruit" value = "Orange" label = "Orange" />
				<form:radiobutton path = "fruit" value = "Banana" label = "Banana" />
				<form:radiobutton path = "fruit" value = "Pineapple" label = "Pineapple" />
			</td>
		</tr>
		<tr>
			<td colspan = "2">
				<input type = "submit" value = "Submit"/>
			</td>
		</tr>
	</table>
</form:form>



<script>
    function formSubmit() {
        document.getElementById("logoutForm").submit();
    }
</script>

<c:if test="${pageContext.request.userPrincipal.name != null}">
	<h2>
		Welcome : ${pageContext.request.userPrincipal.name} | <a
			href="javascript:formSubmit()"> Logout</a>
	</h2>
</c:if>


<script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>