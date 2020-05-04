package br.com.projeto.login.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.projeto.usuario.dao.UsuarioImpl;
import br.com.projeto.usuario.model.Usuario;
import br.com.projeto.utils.Constantes;

/**
 * Servlet implementation class ControllerLogin
 */
@WebServlet("/controllerLogin")
public class ControllerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UsuarioImpl uDao;
	
	public ControllerLogin() {
		this.uDao = new UsuarioImpl();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		request.getRequestDispatcher(Constantes.LOGIN).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("email");
		String pass = request.getParameter("senha");
		
		/*
		 * request.setAttribute("nome", login.replace("@gmail.com", "").replace("d",
		 * "D"));
		 * 
		 * Usuario user = new Usuario(); user.setEmail("carlos@gmail.com");
		 * user.setSenha("123");
		 * 
		 * if(login.compareTo(user.getEmail())== 0 && pass.compareTo(user.getSenha()) ==
		 * 0) { HttpSession session = request.getSession(); session.setAttribute("user",
		 * user);
		 * 
		 * RequestDispatcher rd = request.getRequestDispatcher(Constantes.HOME);
		 * rd.forward(request, response); }else { request.setAttribute("mensagem",
		 * "Email ou Senha Inválido"); RequestDispatcher rd =
		 * request.getRequestDispatcher("login.jsp"); rd.forward(request, response); }
		 */
		Map<String, String> msg = new HashMap<String, String>();
		
		if ((login == null && pass == null) || (login.isEmpty() && pass.isEmpty()) ) {
			msg.put("preencha", Constantes.INFORME_LOGIN_SENHA);
		}
		else {
			if(login == null || login.isEmpty()) {
				msg.put("email", Constantes.INFORME_LOGIN);
				
			}
			if (pass == null || pass.isEmpty()) {
				msg.put("senha", Constantes.INFORME_SENHA);

			}
		}
		
		if(msg.isEmpty()){
			Usuario user; 
			
			try {
				user = this.uDao.logged(login, pass);
				if (user != null){
					if(user.getAtivo() == 1) {
						HttpSession session = request.getSession();
						session.setAttribute("user", user);						 
						
						RequestDispatcher rd = request.getRequestDispatcher(Constantes.HOME);
						rd.forward(request, response);
					}
					else {
						
						msg.put("desativado", Constantes.USUARIO_ESTA_DESATIVADO);
					}
				}
				else {
					msg.put("email_senha", Constantes.LOGIN_OU_SENHA_INVALIDO);
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("mensagem", msg);		
		RequestDispatcher rd = request.getRequestDispatcher(Constantes.LOGIN);
		rd.forward(request, response);
	}

}
