package br.com.projeto.login.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.projeto.utils.Constantes;

@WebServlet("/controllerLogout")
public class ControllerLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ControllerLogout() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
    	if(session != null) {
    		session.invalidate();
    	}
    	RequestDispatcher rd = request.getRequestDispatcher(Constantes.LOGIN);
    	rd.forward(request, response);
	}
    

}
