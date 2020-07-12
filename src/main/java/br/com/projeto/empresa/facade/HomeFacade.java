package br.com.projeto.empresa.facade;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projeto.utils.Constantes;

@WebServlet("/acme")
public class HomeFacade extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public HomeFacade() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter(Constantes.ACTION);
		
		switch(action) {
			case Constantes.EMPRESAS_URL:
				empresa(request,response);
			case Constantes.ADDEMPRESA:
				addEmpresa(request,response);
			case Constantes.FUNCIONARIO_URL:
				funcionario(request,response);
			case Constantes.DEPENDENTES_URL:
				dependentes(request,response);
			case Constantes.DEPARTAMENTO_URL:
				departamento(request,response);
			case Constantes.CARGOS_URL:
				cargos(request,response);
			case Constantes.USUARIO_URL:
				usuario(request,response);
			case Constantes.NOVO:
				novo(request, response);
			case Constantes.ATIVAR_DESATIVAR:
				ativarDesativa(request, response);
			case Constantes.DELETE:
				deletar(request, response);
			case Constantes.PERMISSAO_URL:
				permissao(request,response);
			case Constantes.DASHBOARD_URL:
				homePage(request,response);
			default :
				request.getRequestDispatcher(action).forward(request, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(Constantes.UCCADASTRAR_EDITAR);
		rd.forward(request, response); 
	}
			
	private void homePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(Constantes.HOME);
		rd.forward(request, response);
	}
	
	private void empresa(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(Constantes.EMPRESAS);
		rd.forward(request, response);
	}
	
	private void addEmpresa(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(Constantes.ADD_EMPRESAS);
		rd.forward(request, response);
	}
	
	private void funcionario(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
		RequestDispatcher rd = request.getRequestDispatcher(Constantes.FUNCIONARIO);
		rd.forward(request, response);
	}
	
	private void dependentes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		RequestDispatcher rd = request.getRequestDispatcher(Constantes.DEPENDENTES);
		rd.forward(request, response);
	}
	
	private void departamento(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		RequestDispatcher rd = request.getRequestDispatcher(Constantes.DEPARTAMENTO);
		rd.forward(request, response);
	}
	
	private void cargos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(Constantes.CARGOS);
		rd.forward(request, response);
	}
	
	private void usuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		RequestDispatcher rd = request.getRequestDispatcher(Constantes.UCLISTAR);
		rd.forward(request, response);
	}
	
	private void novo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(Constantes.ADD_USUARIOS);
		rd.forward(request, response);
	}
	
	private void ativarDesativa (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(Constantes.UCATIVAR);
		rd.forward(request, response);
	}
	
	private void deletar (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(Constantes.UCDELETAR);
		rd.forward(request, response);
	}
	
	private void permissao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(Constantes.PERMISSAO);
		rd.forward(request, response);
	}
}
