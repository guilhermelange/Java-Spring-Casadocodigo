<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
    
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
	<nav class="navbar navbar-inverse">
	  <div class="container">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="${s:mvcUrl('HC#index').build()}">Casa do Código</a>
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li><a href="${s:mvcUrl('PC#listar').build()} ">Lista de Produtos</a></li>
	        <li><a href="${s:mvcUrl('PC#form').build()}">Cadastro de Produtos</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right" id="bs-example-navbar-collapse-1">
	      	<li><a href="#" style="padding-right: 2em">
	      		<security:authentication property="principal.username"/>
<%-- 				<security:authentication property="principal" var="usuario"/> --%>
<%-- 				Usuário: ${usuario.username} --%>
	      	</a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div>
	</nav>
	<h1>Lista de Produtos</h1>
	<div>${sucesso}</div>
	<div>${falha}</div>
	<table class="table table-striped table-bordered table-hover table-condensed">
		<tr>
			<th> Título </th>
			<th> Descrição </th>
			<th> Preços </th>
			<th> Páginas </th>
		</tr>
		<c:forEach items="${produtos}" var="produto">
			<tr>
				<td><a href="${s:mvcUrl('PC#detalhe').arg(0,produto.id).build()}">
                	${produto.titulo}
           		 	</a>
            	</td>
				<td>${produto.descricao}</td>
				<td>${produto.precos}</td>
				<td>${produto.paginas}</td>
			</tr>
		</c:forEach>
	</table>
</div>	
</body>
</html>