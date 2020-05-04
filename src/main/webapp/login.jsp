<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.6">
    <title>Login</title>
	
	 <!--Script alert-->
  	<script src="${pageContext.request.contextPath}/assets/admin/js/sweetalert2.all.js"></script>
  	<script src="${pageContext.request.contextPath}/assets/admin/jqueryalert.min.js"></script>
	
	 <!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/admin/css/bootstrap.min.css"/>
	<meta name="theme-color" content="#563d7c">
	
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/admin/signin.css" >
    
  </head>
  
  <body class="text-center">	
 <%--  <%HashMap erro = (HashMap) request.getAttribute("mensagem");%> --%>			
 
    <form class="form-signin" action="${pageContext.request.contextPath}/controllerLogin" method="POST">
		  <h1 class="h3 mb-3 font-weight-normal">Login</h1>
		  <label for="email" class="sr-only">Email</label>
		  <input type="email" id="email" name="email" class="form-control" placeholder="login" >
		    <br/>
		  <label for="senha" class="sr-only">Senha</label>
		  <input type="password" id="senha" name="senha" class="form-control" placeholder="Senha" >
		  
		  <input class="btn btn-lg btn-primary btn-block" id= "btnLogar" type="submit" value= "Logar">
		  
		  <%-- <!-- Link para Registro -->
		  <label for="cadastro" style="font-size: 150%;">
		  	<a href="${pageContext.request.contextPath}/admin/cadastro/cadastro.jsp" style="color:#007bff; text-decoration: none;">Registre-se</a>
		  </label> --%>
		  
		  <!--Respota do servidor-->
		  	      
	      <br>
	      <c:if test="${mensagem.email != null}">
	      		<div class="alert alert-danger " role="alert">
	      			<strong>${mensagem.email}</strong>
				    <button type="button" class="close" data-dismiss="alert">&times;</button>
  				</div>
	      </c:if>
	      
	      <c:if test="${mensagem.senha != null}">
	      		<div class="alert alert-danger " role="alert">
	      			<strong>${mensagem.senha}</strong>
				    <button type="button" class="close" data-dismiss="alert">&times;</button>
  				</div>
	      </c:if>
	      		
	      <c:if test="${mensagem.preencha != null}">
		  		<div class="alert alert-danger " role="alert">
	      			<strong>${mensagem.preencha}</strong>
				    <button type="button" class="close" data-dismiss="alert">&times;</button>
 				</div>
		  </c:if>		
	      		
		  <c:if test="${mensagem.desativado != null}">
				<div class="alert alert-danger " role="alert">
	      			<strong>${mensagem.desativado}</strong>
				    <button type="button" class="close" data-dismiss="alert">&times;</button>
 				</div>
		  </c:if>
		  <c:if test="${mensagem.email_senha != null}">
		  		<div class="alert alert-danger " role="alert">
	      			<strong>${mensagem.email_senha}</strong>
				    <button type="button" class="close" data-dismiss="alert">&times;</button>
 				</div>
		  </c:if>
		  
		  <p class="mt-5 mb-3 text-muted">&copy;DS</p>
	</form>
</body>

<!-- <script>
	let login = document.querySelector("#email");
	let pass = document.querySelector("#senha");
	
	const logar = () =>{

		event.preventDefault();
		
	  if (localStorage.getItem(login.value) == '"'+pass.value+'"'){
		  window.location.assign("${pageContext.request.contextPath}/index.jsp");
	  }
	  else{
		  fail();
	  }
	};
	
	const acao = document.getElementById("btnLogar").addEventListener("click",logar);
	
	function fail(){
	      swal ( "Ops!" ,  "Email ou Senha Inválida" ,  "error" );
	 };
</script> -->

</html>

