package br.com.projeto.empresa.service;

import br.com.projeto.empresa.dao.EmpresasImpl;
import br.com.projeto.empresa.model.Empresa;

public class EmpresaService {
	
	private EmpresasImpl empresaImpl;
	
	public EmpresaService(){
		this.empresaImpl = new EmpresasImpl();
	}
	
	public void save(Empresa empresa) throws Exception{
		empresaImpl.save(empresa);
	}
}
