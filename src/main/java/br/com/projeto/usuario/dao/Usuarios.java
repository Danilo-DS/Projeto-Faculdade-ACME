package br.com.projeto.usuario.dao;

import br.com.projeto.jpa.GenericDao;
import br.com.projeto.usuario.model.Usuario;

public interface Usuarios extends GenericDao<Usuario, Long>{
	
	public Usuario logged(String login, String senha) throws Exception;
	
	public Usuario active(Long ID) throws Exception;

}
