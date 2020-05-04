/**
 * 
 */
package br.com.projeto.utils;

public class Constantes {
	
	//Teste
	public static final String b = "Bem Vindo"; 
	
	// AÇÕES
	public static final String ACTION = "action";
	public static final String NOVO = "novo";
	public static final String DELETE = "delete";
	public static final String EDITAR = "editar";
	public static final String LISTAR = "lista";
	public static final String ATIVAR_DESATIVAR = "ativar_desativar";

	// VALIDAÇÃO DE INPUTS
	public static final String INFORME_LOGIN = "Informe o Email";
	public static final String INFORME_SENHA = "Informe a senha";
	public static final String INFORME_LOGIN_SENHA = "Informe o Email e a Senha";
	public static final String LOGIN_OU_SENHA_INVALIDO = "Email ou Senha incorreto";

	// MENSAGENS DA TELA USUARIO
	public static final String USUARIO_ESTA_DESATIVADO = "Usuário Desativado";
	public static final String USUARIO_ESTA_ATIVADO = "Usuário Ativo";

	// MENSAGENS DA TELA CONTATO
	public static final String CONTATO = "contato";
	public static final String CONTATO_SUCESSO = " cadastrado com sucesso";
	public static final String CONTATO_REMOVIDO = "  removido com sucesso";
	public static final String CONTATO_EDITADO = "  alterado com sucesso";

	// MENSAGENS DA TELA USUARIO
	public static final String USUARIO = " usuario";
	public static final String USUARIO_SUCESSO = "  cadastrado com sucesso";
	public static final String USUARIO_REMOVIDO = "  usuário removido com sucesso";
	public static final String USUARIO_EDITADO = "  alterado com sucesso";

	// MENSAGENS DA TELA USUARIO
	public static final String SOLICITACAO = "solicitação";

	// URL DO SISTEMA
	public static final String CONTATOS = "/admin/pages/contatos/list_contatos.jsp";
	public static final String ADD_CONTATOS = "/admin/contatos/add_contatos.jsp";

	public static final String USUARIOS = "/admin/usuarios/usuarios.jsp";
	public static final String USUARIOS_LIST = "/usuarioController?action=lista";
	public static final String ADD_USUARIOS = "/admin/usuarios/cadastroUsuario.jsp";

	public static final String CADASTRE_SE = "cadastrese.jsp";
	public static final String SOLICITACOES = "solicitacoes.jsp";

	public static final String LOGIN = "/login.jsp";
	public static final String HOME = "/admin/dashboard/index.jsp";

	// LOGOUT
	public static final String OBRIGADO = " Obrigado, até logo!";
	public static final String ADMINISTRADOR = "Administrador";
	public static final String USUARIO_COMUM = "Usuário Comum";
	public static final String VISITANTE = "Visitante";

	// PERSISTENCE_UNITE
	public static final String PERSISTENCE_UNIT_NAME = "EmpresaACME";
	
	//CADASTRO U
	public static final String ID_USUAIRO = "id";
	public static final String TIPO_USUAIRO = "tipoUser";
	public static final String NOME_USUAIRO = "nome";
	public static final String EMAIL_USUARIO = "email";
	public static final String SENHA_USUARIO = "senha";
	public static final String DP_USUARIO = "departamento";
	public static final int ATIVO_USUARIO = 1;
	public static final int ADMINISTRADOR_USUARIO = 1;
	public static final int VISITANTE_USUARIO = 2;
	
	//
	public static final String TIPO_USUAIRO_EDITADO = "tipoUserED";
	public static final String NOME_USUAIRO_EDITADO = "nomeED";
	public static final String EMAIL_USUARIO_EDITADO = "emailED";
	public static final String SENHA_USUARIO_EDITADO = "senhaED";
	public static final String DP_USUARIO_EDITADO = "dpsED";
	public static final String SITUACAO_USUARIO_EDITADO = "situacaoED";
}
