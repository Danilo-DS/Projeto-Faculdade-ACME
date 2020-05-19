package br.com.projeto.usuario.dao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import br.com.projeto.jpa.JpaUtils;
import br.com.projeto.usuario.model.Usuario;

public class UsuarioImpl implements Usuarios {
	
	EntityManagerFactory conecter = JpaUtils.getEntityManagerFactory();
	EntityManager em = null;

	@Override
	public Usuario findById(Long id) throws Exception {
		this.em = conecter.createEntityManager();
		Usuario user = new Usuario();
		try {
			user = em.find(Usuario.class, id);
			return user;
		}
		catch (Exception e) {
			e.getMessage();
			this.em.getTransaction().rollback();
		}
		finally {
			em.close();
		}
		return null;
	}

	@Override
	public void deleteById(Long id) throws Exception {
		this.em = conecter.createEntityManager();
		Usuario user = new Usuario();
		
		try {
			user = em.find(Usuario.class, id);
			this.em.getTransaction().begin();
			this.em.remove(user);
			this.em.getTransaction().commit();
		}
		catch (Exception e) {
			e.getMessage();
			this.em.getTransaction().rollback();
		}
		finally {
			this.em.close();
		}
		
	}

	@Override
	public void update(Usuario user) throws Exception {
		this.em = conecter.createEntityManager();
		try {
			this.em.getTransaction().begin();
			this.em.merge(user);
			this.em.getTransaction().commit();
			
		}
		catch (Exception e) {
			e.getMessage();
			this.em.getTransaction().rollback();
		}
		finally {
			this.em.close();
		}
		
	}

	@Override
	public Collection<Usuario> listAll() throws Exception {
		this.em = conecter.createEntityManager();
		List<Usuario> userList = new ArrayList<Usuario>();
		
		try {
			em.getTransaction().begin();
			TypedQuery<Usuario> query = em.createNamedQuery("Usuario.findAll", Usuario.class);
			userList = query.getResultList();
			em.getTransaction().commit();
		}
		catch (Exception e) {
			e.getMessage();
			this.em.getTransaction().rollback();
		}
		finally {
			em.close();
		}
		return userList;
	}
	
	@Override
	public void save(Usuario user) throws Exception {
		this.em = conecter.createEntityManager();
		try {
			this.em.getTransaction().begin();
			this.em.persist(user);
			this.em.getTransaction().commit();
		}
		catch (Exception e) {
			e.getMessage();
			this.em.getTransaction().rollback();
		}
		finally {
			em.close();
		}
	}

	@Override
	public Usuario logged(String login, String senha) throws Exception {
		Usuario user = null;
		this.em = conecter.createEntityManager();
		
		try {
			Query query = this.em.createNamedQuery("Usuario.loginUsuario");
			query.setParameter("email", login);
			query.setParameter("senha", senha);
			
			user = (Usuario) query.getSingleResult();
			return user;
		} catch (Exception e) {
			e.getMessage();
			this.em.getTransaction().rollback();
		}
		finally {
			em.close();
		}
		
		return user;
	}

	@Override
	public Usuario active(Long id) throws Exception {
		em = conecter.createEntityManager();
		Usuario user = new Usuario();
		try {
			 user = em.find(Usuario.class, id); System.out.println(user.getNome() +
			 user.getAtivo());
			if(user.getAtivo() != 1) {
				user.setAtivo(1);
				this.update(user);
			}
			else {
				user.setAtivo(0);
				this.update(user);
			}
		}
		catch (Exception e) {
			e.getMessage();
			em.getTransaction().rollback();
		}
		finally {
			em.close();
		}
		return user;
	}
}
