package com.cibertec.project.service;

import java.util.List;

import com.cibertec.project.entity.Condicion;
import com.cibertec.project.entity.Docente;
import com.cibertec.project.fabrica.DAOFactory;
import com.cibertec.project.interfaces.CondicionDAO;
import com.cibertec.project.interfaces.DocenteDAO;

public class DocenteService {
	//definir tipo de gestor de b.d.
	private DAOFactory fabrica=DAOFactory.getDAOFactory(1);
	//acceso a un dao
	private DocenteDAO daoDocente=fabrica.getDocenteDAO();
	private CondicionDAO daoCondicion=fabrica.getCondicionDAO();
	
	//crear métodos del servicios son para comunicar con los métodos del dao.
	
	public int registrar(Docente bean) {
		return daoDocente.save(bean);
	}
	public int actualizar(Docente bean) {
		return daoDocente.update(bean);
	}
	public int eliminarPorID(int cod) {
		return daoDocente.deleteByID(cod); 
	}
	public Docente buscarPorID(int cod) {
		return daoDocente.findById(cod);
	}
	public List<Docente> listarTodos(){
		return daoDocente.findAll();
	}
	public List<Condicion> listarCondiciones() {
		return daoCondicion.findAll();
	}
	
}
