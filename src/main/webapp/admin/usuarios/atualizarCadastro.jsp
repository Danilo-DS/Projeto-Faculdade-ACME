<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>

<mt:admin_tamplate title="Projeto" breadcrumb="Editar Cadastro">

	<jsp:attribute name="content">
		
		<section class = "content">
			
			<div class="container" align="center">
				<div class="col-md-8 order-md-1" >
			        <form class="atualiza needs-validation" id="atualiza">
			        	
			        	<!-- Nome --> 
			        	
				       	<div class="mb-3" align="left">
				            <label for="nome">Nome</label>
				            <input type="text" class="form-control" id="nome" placeholder="Nome" required>
				            <div class="invalid-feedback">
				            </div>
				          </div>
				        	
				        	<!-- Email -->
				        	
				          <div class="mb-3" align="left">
				            <label for="email"><span>Email</span></label>
				            <div class="input-group-prepend">              
				              <span class="input-group-text">@</span>
				              <input type="email" class="form-control" id="email" placeholder="email@exemplo.com" required>
				            </div>
				            <div class="invalid-feedback">
				            </div>
				          </div>
				          
				          <!-- Departamento -->
				          
				          <div class="form-group" align="left">
						    <label for="cargos">Departamento</label>
						    <select class="form-control" id="dps">					    
						      <option>Administrativo</option>
						      <option>Logistico</option>
						      <option>Transporte</option>
						      <option>Manutenção</option>
						      <option>Informática</option>
						    </select>
						  </div>
						  
						   <!-- Senha -->
					  		
				          <div class="mb-3" align="left">
				            <label for="address">Senha</label>
				            <input type="password" class="form-control" id="senha" placeholder="Senha" required>
				            <div class="invalid-feedback">
				            </div>
				          </div>
				          
				          <div class="mb-3" align="left">
				            <label for="address">Confirmar Senha</label>
				            <input type="password" class="form-control" id="confSenha" placeholder="Confirmar Senha" required>
				            <div class="invalid-feedback">
				            </div>
				          </div>
					  		
			          <hr class="mb-4">
			          <input class="btn btn-primary btn-lg btn-block" name="btnAtualizar" id="btnAtualizar" type="submit" value="Atualizar">
			          <input class="btn btn-danger btn-lg btn-block" name="btnAtualizar" id="cancelarA" type="submit" value="Cancelar">
			      	</form>
		    	</div>
		    </div>
		</section>	
	</jsp:attribute>

</mt:admin_tamplate>

<script type="text/javascript">
	var userEditar = JSON.parse(sessionStorage.getItem("Editar"));
	var indiceRegistro = - 1
	
	document.getElementById("nome").value = userEditar[0].nome;
	document.getElementById("email").value = userEditar[0].email;
	document.getElementById("dps").value = userEditar[0].dp;
	document.getElementById("senha").value = userEditar[0].senha;

	
	
	const SalvarEdicao = () =>{
		indiceRegistro += userEditar[0].cod;
		let nome = document.querySelector("#nome");
		let email = document.querySelector("#email");
		let dpt = document.querySelector("#dps");
		let senha = document.querySelector("#senha");

		let registro = JSON.parse(localStorage.getItem("Usuarios"));
		
		let Usuario = {
			cod: userEditar[0].cod,
			nome: nome.value,
			email: email.value,
			dp: dpt.value,
			senha: senha.value
		};
		registro.slice(indiceRegistro, Usuario)
		localStorage.setItem("Usuarios",JSON.stringify(registro));
		sessionStorage.setItem("Editar", "");
	} 

	const AcaoAtualizar = document.getElementById("btnAtualizar").addEventListener("click", SalvarEdicao);

</script>