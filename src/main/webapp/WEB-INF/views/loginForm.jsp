<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"  %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"  %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" >
<title>Casa do Código</title>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"> -->
<%-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script> --%>
<c:url value="/resources/css" var="cssPath" />
<link rel="stylesheet" href="${cssPath}/bootstrap.min.css" />
<link rel="stylesheet" href="${cssPath}/bootstrap-theme.min.css" />
<style type="text/css">body {padding-bottom: 60px;}</style>
</head>
<body>
<div class="container">
	<h1>Login da Casa do Código</h1>
	<form:form servletRelativeAction="/login" method="POST">
		<div class="form-group">
			<label>E-mail</label>
			<input name="username" type="text" class="form-control"/>
		</div>
		<div class="form-group">
			<label>Senha</label>
			<input name="password" type="password" class="form-control"/>
		</div>
		<button type="submit" class="btn btn-primary active">Logar</button>
	</form:form>
</div>	
</body>
</html>