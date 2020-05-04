package br.com.projeto.usuario.controller;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projeto.usuario.model.Usuario;
import br.com.projeto.usuario.service.UsuarioService;
import br.com.projeto.utils.Constantes;

/**
 * Servlet implementation class UsuarioConstroller
 */
@WebServlet("/usuarioController")
public class UsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private Usuario user;
	private UsuarioService service;

    public UsuarioController() {
       this.user = new Usuario();
       this.service = new UsuarioService();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter(Constantes.ACTION);
	
		try {
			switch(action){
				case Constantes.NOVO:
					Novo(request, response);
					break;
				case Constantes.EDITAR:
					Editar(request, response);
					break;
				case Constantes.DELETE:
					Delete(request, response);
					break;
				case Constantes.LISTAR:
					Listar(request, response);
				case Constantes.ATIVAR_DESATIVAR:
					Ativar(request, response);				
					break;
			}
		}
		catch (Exception exp) {
			throw new ServletException(exp);
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Entrei no dopost");
		
		String nome = request.getParameter(Constantes.NOME_USUAIRO);
		String email = request.getParameter(Constantes.EMAIL_USUARIO);
		String departamento = request.getParameter(Constantes.DP_USUARIO);
		String senha = request.getParameter(Constantes.SENHA_USUARIO);
		String id = request.getParameter(Constantes.ID_USUAIRO);
		
		String tipoUser = request.getParameter(Constantes.TIPO_USUAIRO);
		
		if(tipoUser.equalsIgnoreCase(Constantes.ADMINISTRADOR)) {
			this.user.setTipouser(Constantes.ADMINISTRADOR);
		}
		else if(tipoUser.equalsIgnoreCase(Constantes.VISITANTE)){
			this.user.setTipouser(Constantes.VISITANTE);
		}
		else {
			this.user.setTipouser(Constantes.USUARIO_COMUM);
		}
		
		if (tipoUser.equalsIgnoreCase(Constantes.VISITANTE) && departamento.equalsIgnoreCase("Selecione seu Departamento")) {
			this.user.setDepartamento(null);
		}else {
			this.user.setDepartamento(departamento);
		}
		
		//this.user.setAtivo(1);
		this.user.setNome(nome);
		this.user.setEmail(email);
		this.user.setSenha(senha);		
		
		if(id !=null ) {
			this.user.setId(Long.parseLong(id));
			request.setAttribute("editado", Constantes.USUARIO + " " + nome + " " + Constantes.USUARIO_EDITADO);
		}
		else {
			request.setAttribute("cadastro", Constantes.USUARIO + " " + nome + " " + Constantes.USUARIO_SUCESSO);
		}
		try {
			this.service.save(user);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		request.getRequestDispatcher(Constantes.USUARIOS).forward(request, response);
	}
	
	public void Novo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher(Constantes.ADD_USUARIOS).forward(request, response);
	}
	
	public void Editar(HttpServletRequest request, HttpServletResponse response) throws NumberFormatException, Exception {
		System.out.println("cheguei no editar");
		String nome = request.getParameter(Constantes.NOME_USUAIRO_EDITADO);
		String email = request.getParameter(Constantes.EMAIL_USUARIO_EDITADO);
		String departamento = request.getParameter(Constantes.DP_USUARIO_EDITADO);
		String tipoUser = request.getParameter(Constantes.TIPO_USUAIRO_EDITADO);
		String senha = request.getParameter(Constantes.SENHA_USUARIO_EDITADO);
		/*
		 * if(tipoUser.equalsIgnoreCase(Constantes.ADMINISTRADOR)) {
		 * this.user.setTipouser(Constantes.ADMINISTRADOR); } else
		 * if(tipoUser.equalsIgnoreCase(Constantes.VISITANTE)){
		 * this.user.setTipouser(Constantes.VISITANTE); } else {
		 * this.user.setTipouser(Constantes.USUARIO_COMUM); }
		 */
		System.out.println(nome + email + departamento + tipoUser);
		this.user.setId(Long.parseLong(request.getParameter(Constantes.ID_USUAIRO)));
		this.user.setNome(nome);
		this.user.setEmail(email);
		this.user.setDepartamento(departamento);
		this.user.setTipouser(tipoUser);
		this.user.setSenha(senha);
		//Usuario user = this.service.findByID(Long.parseLong(request.getParameter(Constantes.ID_USUAIRO)));
		try {
			this.service.update(user);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		//RequestDispatcher rd = request.getRequestDispatcher(Constantes.USUARIOS);
		request.setAttribute("editado", Constantes.USUARIO + " " + nome + " " + Constantes.USUARIO_EDITADO);
		response.sendRedirect("usuarioController?action=lista");
		//rd.forward(request, response);
		
		//Listar(request, response);
	}
	
	public void Delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		this.service.deleteByID(Long.parseLong(request.getParameter(Constantes.ID_USUAIRO)));
		System.out.println(Long.parseLong(request.getParameter(Constantes.ID_USUAIRO)));
		RequestDispatcher rd = request.getRequestDispatcher(Constantes.USUARIOS);
		request.setAttribute("deletado", Constantes.USUARIO_REMOVIDO);
		rd.forward(request, response);
	}
	
	private void Listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
		Collection<Usuario> userList = this.service.userList();
		request.setAttribute("userList", userList);
		RequestDispatcher rd = request.getRequestDispatcher(Constantes.USUARIOS);
		rd.forward(request, response);
	}
	
	private void Ativar(HttpServletRequest request, HttpServletResponse response) throws Exception{
		this.service.active(Long.parseLong(request.getParameter(Constantes.ID_USUAIRO)));
		RequestDispatcher rd = request.getRequestDispatcher(Constantes.USUARIOS);
		rd.forward(request, response);
	}
}
