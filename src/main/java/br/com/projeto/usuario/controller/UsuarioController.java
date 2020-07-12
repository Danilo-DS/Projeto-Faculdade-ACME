package br.com.projeto.usuario.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

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
				case Constantes.CADASTRAR_EDITAR:
					doPost(request, response);
					break;
				case Constantes.DELETE:
					delete(request, response);
					break;
				case Constantes.LISTAR:
					//listar(request, response);
					numeroPaginas(request, response);
					break;
				case Constantes.ATIVAR_DESATIVAR:
					ativar(request, response);				
					break;
			}
		}
		catch (Exception exp) {
			throw new ServletException(exp);
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nome = request.getParameter(Constantes.NOME_USUAIRO);
		String email = request.getParameter(Constantes.EMAIL_USUARIO);
		String departamento = request.getParameter(Constantes.DP_USUARIO);
		String senha = request.getParameter(Constantes.SENHA_USUARIO);
		String id = request.getParameter(Constantes.ID_USUAIRO);
		System.out.println("id" + id);
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
		
		if (tipoUser.equalsIgnoreCase(Constantes.VISITANTE)){
			this.user.setDepartamento(null);
		}
		else {
			this.user.setDepartamento(departamento);
		}
		
		this.user.setNome(nome);
		this.user.setEmail(email);
		this.user.setSenha(senha);
		
		try {
			if(id != null ) {
				this.user.setId(Long.parseLong(id));
				this.service.update(user);
				request.setAttribute("editado", Constantes.USUARIO + " " + nome + " " + Constantes.USUARIO_EDITADO);
			}
			else {
				this.service.save(user);
				request.setAttribute("cadastro", Constantes.USUARIO + " " + nome + " " + Constantes.USUARIO_SUCESSO);
			}
			numeroPaginas(request, response);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}
			
	private void delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		this.service.deleteByID(Long.parseLong(request.getParameter(Constantes.ID_USUAIRO)));
		//RequestDispatcher rd = request.getRequestDispatcher(Constantes.USUARIOS);
		request.setAttribute("deletado", Constantes.USUARIO_REMOVIDO);
		listar(request, response);
		//rd.forward(request, response);
	}
	
	private void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		//Limite de registro por pagina
		//Calc utilizado 5 como limite de registro
		//pg valor da pagina que está sendo solicitado
		// (limite * pg) -  limite
		String pagina = request.getParameter("pg");
		int valorPag = 0;
		if(pagina != null ) { 
			valorPag = (Integer.parseInt(pagina) * 5) - 5;
		}
		
		Collection<Usuario> userList = this.service.userList(valorPag);
		request.setAttribute("userList", userList);
		
		RequestDispatcher rd = request.getRequestDispatcher(Constantes.USUARIOS);
		//numeroPaginas(request, response);
		rd.forward(request, response);
	}
	
	public void numeroPaginas (HttpServletRequest request, HttpServletResponse response) throws Exception{
		//Conta total de registro para saber o
		//número de páginas
		List<Integer> paginas = new ArrayList<Integer>();
		double resultConsulta = this.service.TotalUsuarios();
		int NumPags = 0;
		if(resultConsulta % 5 == 0) {
			NumPags = (int) resultConsulta / 5;
		}
		else {
			NumPags = (int) Math.floor(resultConsulta / 5) + 1;
		}
		
		for (int i = 0; i < NumPags; i++) {
			paginas.add(i);
		}
		request.setAttribute("TotalPags",paginas);
		listar(request, response);
	}
	
	private void ativar(HttpServletRequest request, HttpServletResponse response) throws Exception{
		this.service.active(Long.parseLong(request.getParameter(Constantes.ID_USUAIRO)));
		user = this.service.findByID(Long.parseLong(request.getParameter(Constantes.ID_USUAIRO)));
		if(user.getAtivo() == 1) {
			request.setAttribute("ativado",user.getNome() + " " + Constantes.USUARIO_ESTA_ATIVADO);
		}
		else {
			request.setAttribute("ativado",user.getNome() + " " + Constantes.USUARIO_ESTA_DESATIVADO);
		}
		listar(request, response);
	}
}
