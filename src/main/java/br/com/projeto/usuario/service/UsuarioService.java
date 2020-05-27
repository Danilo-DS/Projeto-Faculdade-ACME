package br.com.projeto.usuario.service;

import java.util.Collection;

import br.com.projeto.usuario.dao.UsuarioImpl;
import br.com.projeto.usuario.model.Usuario;

public class UsuarioService {
	private UsuarioImpl uDao = new UsuarioImpl();;
	
	public UsuarioService() {
	}
	
	public Collection<Usuario> userList(int pagina) throws Exception {	
		return this.uDao.listAll(pagina);
	}
	
	public void save(Usuario user) throws Exception {
		this.uDao.save(user);
	}
	
	public void deleteByID(Long id) throws Exception {
		this.uDao.deleteById(id);
	}
	
	public Usuario findByID(Long id) throws Exception {
		return this.uDao.findById(id);
	}
	
	public void update(Usuario user) throws Exception {
		this.uDao.update(user);
	}
	
	public Usuario active(Long id) throws Exception {
		return this.uDao.active(id);
	}
	
	public int TotalUsuarios() {
		return this.uDao.TotalPagina();
	}
}
