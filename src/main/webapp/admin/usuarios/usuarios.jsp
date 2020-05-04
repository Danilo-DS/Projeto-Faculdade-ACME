<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>

<%@page import="java.util.Collection"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>

<mt:admin_tamplate title="Projeto" breadcrumb="Usuários">

	<jsp:attribute name="content">
	
	<section class="content">
		<a href="${pageContext.request.contextPath}/usuarioController?action=novo" >
			<input type= "submit" name="cadastro" class="btn btn-lg btn-primary btn-block" id="cadastro" value="Cadastrar Usuário" style="float: right; width: 15%; font-size: 100%;" >
		</a>
		
		<section class="content-header">
			<p> Listagem de Usuários</p>    
	    </section>
	    <br>
    	<table class="table" id="registro">
		    <thead>
		      <tr>
		       	<th>Cod.</th>
		        <th>Nome</th>
		        <th>Email</th>
		        <th>Departamento</th>
		        <th>Tipo</th>
		        <th>Situação</th>
		      </tr>
	    	</thead>
	    	<tbody>
	    		<c:forEach var ="user" items="${userList}">
	    			<tr>
	    				<td>${user.id == null ? '' : user.id}</td>
	    				<td>${user.nome == null ? '' : user.nome}</td>
	    				<td>${user.email == null ? '' : user.email}</td>
	    				<td>${user.departamento == null ? '' : user.departamento}</td>
	    				<td>${user.tipouser == null ? '' : user.tipouser}</td>
	    				<%-- <td>${user.ativo == 1 ? 'Ativa' : 'Desativado'}</td> --%>
	    				<td>
		    				<div class="form-group" align="left">
							    <select class="form-control" id="situacaoUL" name="departamento">
								  <option data-param="${user.id}">${user.ativo == 1 ? 'Ativa' : 'Desativado'}</option>					    
							      <option data-param="${user.id}">${user.ativo != 0 ? 'Desativado' : 'Ativa'}</option>
							    </select>
					  		</div>
	    				</td>
	    				<td>
	    					<button class="btn btn-info" type="button" id="btnEditar" data-toggle="modal" data-placement="top" title="Editar Usuário" data-target="#modalVisualizador" onclick="ModalVisualizar('${user}'),EditarUsuario()">
	    						<i class="fa fa-edit"></i>
	    					</button>
	    				</td>
	    				<td>
	    					<button class="btn btn-warning" type="button" id="btnVisualizar" data-toggle="modal" data-placement="top"  title="Detalhes do Usuário" data-target="#modalVisualizador" onclick="ModalVisualizar('${user}')">
	    						<i class="fa fa-file" style="color: white;"></i>
	    					</button>
	    				</td>
						<td>
							<button class="btn btn-danger" type="button" id="btnExcluir" data-toggle="modal" data-placement="top" title="Excluir Usuário" data-target="#modalExcluir" onclick="ModalExcluir('${user.id}','${user.nome}')">
							<i class="fa fa-trash"></i>
							</button>
						</td>
	    			</tr>
	    			
	    		</c:forEach>
	    	
	    	</tbody>
	    </table>
    </section>
	
	<!-- Modal Visualizar -->
	<div class="modal fade" id="modalVisualizador" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <p class="modal-title" id="exampleModalLabel" style="font-size: 16px;"></p>
	        <p id="idUser" style="font-size: 16px;"></p>
	        <p id="nomeUser" style="font-size: 16px;"></p>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      		<form>
	      		<!-- Nome -->
		          <div class="form-group">
		            <label for="recipient-name" class="col-form-label">Nome</label>
		            <input type="text" class="form-control nomeEdit" id="nomeED">
		          </div>
		        
		        <!-- Email -->  
		          <div class="form-group">
		            <label for="recipient-name" class="col-form-label">Email</label>
		            <input type="text" class="form-control emailEdit" id="emailED">
		          </div>
		        
		        <!-- Departamento -->  
		          <div class="form-group">
		            <label for="recipient-name" class="col-form-label">Departamento</label>
		            <div class="form-group" align="left">
					    <select class="form-control dpEdit" id="dpsED" name="departamento">					    
					      <option>Administrativo</option>
					      <option>Logistico</option>
					      <option>Transporte</option>
					      <option>Manutenção</option>
					      <option>Informática</option>
					    </select>
					  </div>
		          </div>
		          
		          <!-- Tipo Usuario -->  
		          <div class="form-group">
		            <label for="recipient-name" class="col-form-label">Tipo Usuário</label>
		            <input type="text" class="form-control tipoEdit" id="tipoUserED">
		          </div>
		          
		          <!-- Situação -->  
		          <div class="form-group">
		            <label for="recipient-name" class="col-form-label">Situação</label>
		            <input type="text" class="form-control situacaoEdit" id="situacaoED">
		          </div>
		          
		          <!-- Senha -->  
		          <div class="form-group" id="divsenha">
		            <label for="recipient-name" class="col-form-label">Senha</label>
		            <input type="password" class="form-control senhaEdit" id="senhaED">
		          </div>  
		        </form>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary" data-dismiss="modal" id="btnSalvar" onclick="SalvarEdicao()"><i class="fa fa-folder"></i> Salvar</button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Modal Excluir -->
	<div class="modal fade" id="modalExcluir" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Deseja Excluir o Usuário</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      		<span id="id"></span>
	      		<span id="nome"></span>  
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
	        <button type="button" class="btn btn-danger"  onclick="RemoverUsuario()"><i class="fa fa-trash"></i> Excluir</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	</jsp:attribute>

</mt:admin_tamplate>

<script type="text/javascript">

	$(document).ready(function(){
		$('[data-toggle="modal"]').tooltip()
	});
/* Ação Modal Visualizar */
	function ModalVisualizar(user){
		$('#modalVisualizador').on('show.bs.modal', function (event) {
			  
			  /* Recebe o obj e começa a formatação para String em seguinda para Objeto JSON*/	
			  var usuario =  user;
			  let format = '{"'+usuario.slice(8,-1).replace(/ /g,"").replace(/=/g,'":"').replace(/,/g,'","') + '"}'
			  let obj = JSON.parse(format);
			  /* --------------------------- */

			  var modal = $(this)
			  modal.find('.modal-title').text('Usuário:');
			  modal.find('#idUser').text(obj.id)
			  modal.find('#nomeUser').text("-" + obj.nome)
			  modal.find('.nomeEdit').val(obj.nome);
			  modal.find('.emailEdit').val(obj.email);
			  modal.find('.dpEdit').val(obj.departamento);
			  modal.find('.tipoEdit').val(obj.tipouser);
			  modal.find('.situacaoEdit').val(obj.ativo == 1 ? "Ativa" : "Desativado" );
			  modal.find('.senhaEdit').val(obj.senha );
			  
		})
		//Impossibilita a edição dos campos no Modo Visualizar
		document.getElementById("nomeED").disabled = true;
		document.getElementById("emailED").disabled = true;
		document.getElementById("dpsED").disabled = true;
		document.getElementById("tipoUserED").disabled = true;
		document.getElementById("situacaoED").disabled = true;
		document.getElementById("divsenha").hidden = true;
		document.getElementById("btnSalvar").hidden = true;
	}

/* Ação Modal Excluir */
	function ModalExcluir(id, nome){
		$('#modalExcluir').on('show.bs.modal', function(event){
			var modal = $(this);
			modal.find('.modal-title').text('Deseja Excluir o Usuário '+ nome);
			modal.find('#id').text(id);
			modal.find('#nome').text(nome);
		})
	}
	/* Recebe o id do user a ser excluido e manda para o back-end */
	function RemoverUsuario(){
		var id = document.getElementById('id');
		alert(id.textContent)
		window.location.assign("${pageContext.request.contextPath}/usuarioController?action=delete&id="+id.textContent);
	}
/* Fim da Ação Modal Excluir */

/* Ação Modal Editar */
	function EditarUsuario(){
		document.getElementById("nomeED").disabled = false;
		document.getElementById("emailED").disabled = false;
		document.getElementById("dpsED").disabled = false;
		document.getElementById("tipoUserED").disabled = false;
		document.getElementById("situacaoED").disabled = false;
		document.getElementById("divsenha").hidden = false;
		document.getElementById("btnSalvar").hidden = false;
	}

	function SalvarEdicao(){
		let id = document.getElementById("idUser");
		let nome = document.getElementById("nomeED");
		let email = document.getElementById("emailED");
		let dps = document.getElementById("dpsED");
		let tipo = document.getElementById("tipoUserED");
		let situacao = document.getElementById("situacaoED").value == "Ativa" ? 1 : 0;
		let senha = document.getElementById("senhaED");
		
		window.location.assign("${pageContext.request.contextPath}/usuarioController?action=editar&id="+id.textContent+"&nomeED="+nome.value
								+"&emailED="+email.value+"&dpsED="+dps.value+"&tipoUserED="+tipo.value+"&situacao="+situacao+"&senhaED="+senha.value);
	}
	/* Fim da Ação Modal Editar */

	/* Fim da Ação Modal Editar */ 
	/* function AtivarDesativar(){
		document.getElementById('situacaoUL').addEventListener('change', function() {
			var selectedOption = this.children[this.selectedIndex];
	        var id = selectedOption.getAttribute("data-param");
	       console.log(id);
	       MudaStatus(id);
		});
	}
	function MudaStatus(id){
		console.log(id);
		window.location.assign("${pageContext.request.contextPath}/usuarioController?action=ativar_desativar&id="+id);
	}
	AtivarDesativar() */
</script>