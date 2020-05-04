<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>

<mt:admin_tamplate title="Projeto" breadcrumb="Permissão">
	<jsp:attribute name="content">
		<section class="content">
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">ID</th>
			      <th scope="col">Nome</th>
			      <th scope="col">Email</th>
			      <th scope="col">Departamento</th>
			      <th scope="col">Permissões</th>
			    </tr>
			  </thead>
			</table>
		</section>
	</jsp:attribute>
</mt:admin_tamplate>
<script type="text/javascript" >

	var permissao = ['Administrador','Master','Usuário','Visitante'];
	var registros = JSON.parse(localStorage.getItem("Usuarios"));
	var user = '';

	/* Mapea o Array de permissõe, gerando os checks com os valores */
	const montaCheck = () =>{
		let mapPermissao = '';
		for (p in permissao){ mapPermissao += 
				'<input type="checkbox" id="permissao" name="permissao">' + 
				'<label for="idPermissao" style="margin: 0 5% 0 1%;">'+ permissao[p] +'</label>' 
				}			
		return mapPermissao;
	}
	
	/* Varre o localStorage e inicializa a montagem da tabela */
	function Listar(){

		for (i in registros){
			user = registros[i];
			montaTabela(user);
		}
	}

	/* Monta a tabela em html */	
	const montaTabela = (item) =>{
		$('.table').append(
		`<tbody>
			<tr>
				<td>`+item.cod+`</td>
				<td>`+item.nome+`</td>
				<td>`+item.email+`</td>
				<td>`+item.dp+`</td>
				<td>`+montaCheck()+`</td>				
				</tr>
		</tbody>`		
		);
	}
	Listar();
</script>