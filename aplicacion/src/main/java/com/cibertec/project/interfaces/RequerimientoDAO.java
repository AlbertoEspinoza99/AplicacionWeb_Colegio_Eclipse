package com.cibertec.project.interfaces;

import java.util.List;

import com.cibertec.project.entity.Detalle;
import com.cibertec.project.entity.Requerimiento;

public interface RequerimientoDAO {
	public int save(Requerimiento bean,List<Detalle> lista);
	public String numeroGenerado();
	public List<Requerimiento> listAllByCodigo(int cod);
	public List<Requerimiento> listAll();
	
	public List<Detalle> listAllByCodigoRequerimiento(int cod);
	
	public int deleteByID(int codReque);
}
