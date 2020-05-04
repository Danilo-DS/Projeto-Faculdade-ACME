<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>

<mt:admin_tamplate title="Projeto" breadcrumb="Cadastro Usuario">

	<jsp:attribute name="content">
		
		<section class = "content">
			
			<div class="container" align="center">
				<div class="col-md-8 order-md-1" >
			        <form class="needs-validation" action="${pageContext.request.contextPath}/usuarioController" method = "POST" >
			        
			        <!-- Nome -->
			        <div class="mb-3" align="left">
			            <label for="nome">Nome</label>
			            <input type="text" class="form-control" id="nome" name="nome" placeholder="Nome" required>
			            <div class="invalid-feedback">
			            </div>
			          </div>
			          
			        <!-- Tipo de User -->
			        <div class="mb-3" align="left">
			        	<label for="tUser">Tipo</label>
				        <div class="input-group">
					        
				        	<!-- Comum -->
				        	<div class="custom-control custom-radio">
					      		<input type="radio" name="tipoUser" id="tUser" value="Usuario">
					      		<label class="costom-control-label" for="usuario">Usuário Comum</label>
							</div>
							
					    	<!-- Administrador -->
					    	<div class="custom-control custom-radio">
					      		<input type="radio" name="tipoUser" id="tUser" value="Administrador">
					      		<label class="costom-control-label" for="administrador">Administrador</label>
					    	</div>
					    	
					    	
					    	<!-- Visitante -->
					    	<div class="custom-control custom-radio">
					      		<input type="radio" name="tipoUser" id="tUser" value="Visitante">
					      		<label class="costom-control-label" for="visitante">Visistante</label>
					    	</div>
				        </div>
			        </div>
			        
			        <!-- Departamento -->
			          <div class="form-group" align="left">
					    <label for="dpt">Departamento</label>
					    <select class="form-control" id="dps" name="departamento">
						  <option>Selecione seu Departamento</option>					    
					      <option>Administrativo</option>
					      <option>Logistico</option>
					      <option>Transporte</option>
					      <option>Manutenção</option>
					      <option>Informática</option>
					    </select>
					  </div>

					  <!-- Email -->
					  
					  <div class="mb-3" align="left">
			            <label for="email"><span>Email</span></label>
			            <div class="input-group-prepend">              
			              <span class="input-group-text">@</span>
			              <input type="email" class="form-control" id="email" name="email" placeholder="email@exemplo.com" required>
			            </div>
			            <div class="invalid-feedback">
			            </div>
			          </div>
			          
			          <!-- Senha -->
					  		
			          <div class="mb-3" align="left">
			            <label for="address">Senha</label>
			            <input type="password" class="form-control" id="senha" name="senha" placeholder="Senha" required>
			            <div class="invalid-feedback">
			            </div>
			          </div>
			          
			          <!-- <div class="mb-3" align="left">
			            <label for="address">Confirmar Senha</label>
			            <input type="password" class="form-control" id="confSenha" placeholder="Confirmar Senha" required>
			            <div class="invalid-feedback">
			            </div>
			          </div> -->
			
			          <hr class="mb-4">
			          <input class="btn btn-primary btn-lg btn-block" name="btnRegistrar" id="registro" type="submit" value="Register">
			      	</form>
		    	</div>
		    </div>
		</section>	
	</jsp:attribute>

</mt:admin_tamplate>