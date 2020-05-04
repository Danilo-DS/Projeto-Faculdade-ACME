//------------------- SCRIPT Cadastrar/Listar Usuario @DS---------------------//

let nome = document.querySelector("#nome");
let email = document.querySelector("#email");
let departamento = document.querySelector("#dps");
let senha = document.querySelector("#senha");
let confirmaS = document.querySelector("#confSenha");



let Usuario={}

// Está variavel verifica se o localStorage possui algum registro
let registro = localStorage.getItem("Usuarios");
registro = JSON.parse(registro);
if(registro == null){
	registro =[];
}

//Resposavel pelo armazenamento de registro
const Registrar = () =>{
	event.preventDefault();	

	let Usuario = {
			cod: registro.length+1,
			nome:nome.value,
			email: email.value,
			dp: departamento.value,
			senha: senha.value
	};
	
	registro.push(Usuario);
	localStorage.setItem("Usuarios",JSON.stringify(registro));
	Sucesso(Usuario);
}

//Validação dos campos
const ValidaRegistro = () =>{
	event.preventDefault();	
	let dpinicial = document.getElementById("dps").value;
	
	if(nome.value == "" || email.value == "" || senha.value == "" || confirmaS.value == "" && dpinicial != "Selecione seu Departamento"){
		
		Mensagem("Ops!", "Preencha os Campos" , "error","");
	}
	else if(dpinicial == "Selecione seu Departamento" && nome.value != "" && email.value != "" && senha.value != "" && confirmaS.value != "" ){
		Mensagem("Ops!", "Selecione o Departamento" , "info");
	}
	else if (senha.value != confirmaS.value || confirmaS.value != senha.value){
		Mensagem("Ops!", "Senhas não Coincidem" , "info");
	}
	else{
		Registrar();
	}
	
}

const Salvar = document.getElementById("registro").addEventListener("click",ValidaRegistro);

//----Alertas---------------------------------------------------------
const Sucesso = (obj)=>{
	swal("Sucesso", "Cadastro Realizado","success").then((AlertaS) =>{
		if(AlertaS){
			MontaTabela(obj)
			window.location.assign("usuarios.jsp");
			}
		});
}

const Mensagem = (titulo,msg,tipo)=>{
	swal(titulo, msg, tipo);
}
//---------------------------------------------------------------------

/*function EditarRegistro(){
	Mensagem("Ops!", "Função não Implementada", "info")
}*/


function EditarRegistro(item){
	
	let indiceEdicao = - 1;
	
	indiceEdicao += item;
		
	let users = JSON.parse(localStorage.getItem("Usuarios"));
	
	sessionStorage.setItem("Editar", JSON.stringify([users[indiceEdicao]]));
	window.location.assign("atualizarCadastro.jsp");
}

//Responsavel por excluir Registros

function ExcluirRegistro(item){
	let indiceTabela = -1;
	indiceTabela += item;
	console.log(indiceTabela);
	registro.splice(indiceTabela, 1);
	localStorage.setItem("Usuarios", JSON.stringify(registro));
	swal("Registro Excluido com Sucesso","","success").then((Atualizar) =>{
		if(Atualizar){
			window.location.reload();
		}
	});
}


//Responsavel por montar a tabela no primeiro registro
//E alocar mas registro na tabale
function MontaTabela(item){
	$('.table').append(`
    	<tbody>
    		<tr>
    			<td>${item.cod}</td>
    			<td>${item.nome}</td>
    			<td>${item.email}</td>
    			<td>${item.dp}</td>
    			<td></td>
    			<td></td>
    			<td><input type="submit" id="btnEditar" class="btn btn-outline-info" value ="Editar" onclick="EditarRegistro(${item.cod})"></td>
				<td><input type="submit" id="btnExcluir" class="btn btn-outline-danger" value ="Remover" onclick="ExcluirRegistro(${item.cod})"></td>
    		</tr>
    	</tbody>
	`);
}

//Resposavel por varrer o localStorage, mantendo a função MontaTabela Atualizada
function Listar(){
	const items = JSON.parse(localStorage.getItem('Usuarios'));
	items.forEach(e => MontaTabela(e));
}
Listar();