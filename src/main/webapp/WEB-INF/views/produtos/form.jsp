<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<%@ page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8" import="java.sql.*" errorPage="" %>
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
	<nav class="navbar navbar-inverse">
	  <div class="container">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="${s:mvcUrl('HC#index').build()} ">Casa do Código</a>
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li><a href="${s:mvcUrl('PC#listar').build()} ">Lista de Produtos</a></li>
	        <li><a href="${s:mvcUrl('PC#form').build()}">Cadastro de Produtos</a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div>
	</nav>
	
	<h1>Cadastro de Produto</h1>
	<form:form action=" ${s:mvcUrl('PC#gravar').build()}" method="POST" commandName="produto" enctype="multipart/form-data">
		<div class="form-group">
			<label>Título</label>
			<form:input path="titulo" cssClass="form-control" placeholder="Digite o título..."/>
			<form:errors path="titulo"> </form:errors>
		</div>
		<div class="form-group">
			<label>Descrição</label>
			<form:textarea path="descricao" cssClass="form-control" placeholder="Descrição completa do livro..."/>
			<form:errors path="descricao"> </form:errors>
		</div>
		<div class="form-group">
			<label>Páginas</label>
			<form:input path="paginas" cssClass="form-control"/>
			<form:errors path="paginas"> </form:errors>
		</div>
		<div class="form-group">
			<label>Data de Lançamento</label>
			<form:input path="dataLancamento" cssClass="form-control" placeholder="Formato dd/MM/yyyy"/>
			<form:errors path="dataLancamento"> </form:errors>
		</div>
<!-- 		<div> -->
<!-- 			<label>E-book</label> -->
<!-- 			<input type="text" name="ebook"> -->
<!-- 		</div> -->
<!-- 		<div> -->
<!-- 			<label>Impresso</label> -->
<!-- 			<input type="text" name="impresso"> -->
<!-- 		</div> -->
<!-- 		<div> -->
<!-- 			<label>Combo</label> -->
<!-- 			<input type="text" name="combo"> -->
<!-- 		</div> -->
		    <c:forEach items="${tipos}" var="tipoPreco" varStatus="status">
		        <div class="form-group">
		            <label>${tipoPreco}</label>
		            <form:input path="precos[${status.index}].valor" cssClass="form-control" placeholder="Valor do ${tipoPreco}"/>
		            <form:hidden path="precos[${status.index}].tipo" value="${tipoPreco}" />
		        </div>
    		</c:forEach>
    		<div class="form-group"> 
		        <label>Sumário</label>
		        <input name="sumario" type="file" class="form-control"/>
		        <form:errors path="sumarioPath"> </form:errors>
		    </div>
		<button type="submit" class="btn btn-primary active">Cadastrar</button>
	</form:form>
</div>	
</body>
</html>