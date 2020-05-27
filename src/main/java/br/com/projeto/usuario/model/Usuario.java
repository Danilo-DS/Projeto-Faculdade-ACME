package br.com.projeto.usuario.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import lombok.Data;

@NamedQueries({@NamedQuery(name = "Usuario.findAll", query = "SELECT u FROM Usuario u"),
			   @NamedQuery(name = "Usuario.loginUsuario", query = "SELECT u FROM Usuario u WHERE u.email = :email AND u.senha = :senha")})

@Table(name = "usuario")
@Entity
@Data
public class Usuario {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String nome;
	private String departamento;
	private String tipouser;
	private String email;
	private String senha;
	private int ativo = 1;
		
}
