/**
 * 
 */
package br.com.projeto.empresa.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@EqualsAndHashCode
@NoArgsConstructor
@ToString
public class Empresa {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Getter private Long id;

	
	@Getter @Setter private String nome;
	
	@Getter @Setter private String email;
	
	@Getter @Setter private String cnpj;
	
	@Getter @Setter private String descricao;

	
}
