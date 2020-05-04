package br.com.projeto.empresa.controller;

import java.io.IOException;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import br.com.projeto.empresa.model.Empresa;
import br.com.projeto.empresa.service.EmpresaService;

/**
 * Servlet implementation class EmpresaController
 * 
 */
@WebServlet("/empresaController")
public class EmpresaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Empresa empresa;
	private EmpresaService empService;
	public EmpresaController() {
		this.empresa = new Empresa();
		this.empService = new EmpresaService();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String cnpj = request.getParameter("cnpj");
		String descricao = request.getParameter("descricao");
		
		empresa.setNome(nome);
		empresa.setEmail(email);
		empresa.setCnpj(cnpj);
		empresa.setDescricao(descricao);
		
		try {
			this.empService.save(empresa);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}