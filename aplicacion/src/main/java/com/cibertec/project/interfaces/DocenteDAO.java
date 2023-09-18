package com.cibertec.project.interfaces;

import java.util.List;

import com.cibertec.project.entity.Docente;

public interface DocenteDAO {
	public int save(Docente bean);
	public int update(Docente bean);
	public int deleteByID(int cod);
	public Docente findById(int cod);
	public List<Docente> findAll();
	
}
