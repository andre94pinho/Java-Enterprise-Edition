<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
int tipoUtilizador;
try{
	tipoUtilizador = Integer.parseInt(session.getAttribute("login").toString());
} catch (NullPointerException e){
	tipoUtilizador = -1;
}
if (tipoUtilizador == 1){
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Menu Administrador</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand">Menu Administrador</a>
		    </div>
		    <ul class="nav navbar-nav">
			    <li class="active">
			    <li><a href="MenuAdminAlunos.jsp">Alunos</a></li>
			    <li><a href="MenuAdminProfessores.jsp">Professores</a></li>
			    <li><a href="MenuAdminDisciplinas.jsp">Disciplinas</a></li>
		    </ul>
		    <ul class="nav navbar-nav navbar-right">
		    	<li><a href="Logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
		    </ul>
		</div>
	</nav>
	
	<!-- Mensagens de sucesso/erro -->
	<div class="container">
		<c:if test="${not empty mensagemSucesso}">
			<div class="alert alert-success">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Sucesso!</strong> ${mensagemSucesso}
			</div>
		</c:if>
		<c:if test="${not empty mensagemErro}">
			<div class="alert alert-danger">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Erro!</strong> ${mensagemErro}
			</div>
		</c:if>
	</div>
  	
	<!-- Registar, selecionar, editar e remover professor -->
	<div class="container">
		<h2>Professor</h2>
		<form class="form-horizontal" action="GerirProfessor" method="post">
	    	<div class="form-group">
	      		<label class="control-label col-sm-2">Nome:</label>
	      		<div class="col-sm-4">
	      			<input type="text" name="nome" value="${professor.nome}" class="form-control" placeholder="Introduza o nome">
	      		</div>
	    	</div>
	    	<div class="form-group">
	      		<label class="control-label col-sm-2">Data nascimento:</label>
	      		<div class="col-sm-4">
	      			<input type="date" name="dataNascimento" value="${professor.dataNascimento}" class="form-control" placeholder="Introduza a data nascimento">
	      		</div>
	    	</div>
	    	<div class="form-group">
	      		<label class="control-label col-sm-2">Email institucional:</label>
	      		<div class="col-sm-4">
	      			<input type="email" name="emailInstitucional" value="${professor.emailInstitucional}" class="form-control" placeholder="Introduza o email institucional">
	      		</div>
	    	</div>
	    	<div class="form-group">
	      		<label class="control-label col-sm-2">Password:</label>
	      		<div class="col-sm-4">
	      			<input type="password" name="password" value="" class="form-control" placeholder="Introduza a password">
	      		</div>
	    	</div>
	    	<div class="form-group">
	      		<label class="control-label col-sm-2">Email alternativo:</label>
	      		<div class="col-sm-4">
	      			<input type="email" name="emailAlternativo" value="${professor.emailAlternativo}" class="form-control" placeholder="Introduza o email alternativo">
	      		</div>
	    	</div>
	    	<div class="form-group">
	      		<label class="control-label col-sm-2">Morada:</label>
	      		<div class="col-sm-4">
	      			<input type="text" name="morada" value="${professor.morada}" class="form-control" placeholder="Introduza a morada">
	      		</div>
	    	</div>
	    	<div class="form-group">
	      		<label class="control-label col-sm-2">Telefone:</label>
	      		<div class="col-sm-4">
	        		<input type="number" name="telefone" value="${professor.telefone}" class="form-control" placeholder="Introduza o telefone">
	      		</div>
	    	</div>
	    	<div class="form-group">
	      		<label class="control-label col-sm-2">Categoria:</label>
	      		<div class="col-sm-4">
	      			<input type="text" name="categoria" value="${professor.categoria}" class="form-control" placeholder="Introduza a categoria">
	      		</div>
	    	</div>
	    	<div class="form-group">
	      		<label class="control-label col-sm-2">Gabinente:</label>
	      		<div class="col-sm-4">
	      			<input type="text" name="gabinete" value="${professor.gabinente}" class="form-control" placeholder="Introduza o gabinete">
	      		</div>
	    	</div>
	    	<div class="form-group">
	      		<label class="control-label col-sm-2">Telefone interno:</label>
	      		<div class="col-sm-4">
	        		<input type="number" name="telefoneInterno" value="${professor.telefoneInterno}" class="form-control" placeholder="Introduza o telefone interno">
	      		</div>
	    	</div>
	    	<div class="form-group">
	      		<label class="control-label col-sm-2">Sal�rio:</label>
	      		<div class="col-sm-4">
	      			<input type="number" step="any" name="salario" value="${professor.salario}" class="form-control" placeholder="Introduza o sal�rio">
	      		</div>
	    	</div>
			
			<div class="container">
				<input type="submit" class="btn btn-success" name="action" value="Registar"/>
			</div>
			<br><br>
			
			<div class="form-group">
				<div class="col-sm-4">
					<input type="number" name="id" value="${professor.id}" class="form-control" placeholder="Introduza o id do professor">
				</div>
				<input type="submit" class="btn btn-default" name="action" value="Selecionar"/>
	    	</div>
			<div class="container">
				<input type="submit" class="btn btn-primary" name="action" value="Editar"/>
				<input type="submit" class="btn btn-danger" name="action" value="Remover"/>
			</div>
		</form>
	</div><br>
	
	<!-- Tabela com a lista de professores -->
	<div class="container">
		<h2>Listagem dos professores</h2>
		<table class="table table-striped" border="2" cellpadding="5">
			<th>Id</th>
			<th>Nome</th>
			<th>Data nascimento</th>
			<th>Email institucional</th>
			<th>Email alternativo</th>
			<th>Morada</th>
			<th>Telefone</th>
			<th>Categoria</th>
			<th>Gabinente</th>
			<th>Telefone interno</th>
			<th>Sal�rio</th>
			
			<c:forEach items="${listaProfessores}" var="professor">
	 			<tr>
					<td>${professor.id}</td>
					<td>${professor.nome}</td>
					<td>${professor.dataNascimento}</td>
					<td>${professor.emailInstitucional}</td>
					<td>${professor.emailAlternativo}</td>
					<td>${professor.morada}</td>
					<td>${professor.telefone}</td>
					<td>${professor.categoria}</td>
					<td>${professor.gabinente}</td>
					<td>${professor.telefoneInterno}</td>
					<td>${professor.salario}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>

<%
}
else{
	request.getRequestDispatcher("/Login.jsp").forward(request, response);
}
%>