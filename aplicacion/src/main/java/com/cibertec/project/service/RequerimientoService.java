package com.cibertec.project.service;

import java.util.List;

import com.cibertec.project.entity.Bien;
import com.cibertec.project.entity.Detalle;
import com.cibertec.project.entity.Requerimiento;
import com.cibertec.project.fabrica.DAOFactory;
import com.cibertec.project.interfaces.BienDAO;
import com.cibertec.project.interfaces.RequerimientoDAO;

public class RequerimientoService {
	private DAOFactory  fabrica=DAOFactory.getDAOFactory(1);
	private BienDAO objBien=fabrica.getBienDAO();
	private RequerimientoDAO objReque=fabrica.getRequerimientoDAO();
	
	public List<Bien> listarBienes(){
		return objBien.listAll();
	}
	public int grabarRequerimiento (Requerimiento bean,List<Detalle> lista) {
		return objReque.save(bean,lista);
	} 
	public String traerNumeroGenerado() {
		return objReque.numeroGenerado();
	}
	public List<Requerimiento> listarRequerimientoPorUsuario(int cod) {
		return objReque.listAllByCodigo(cod);
	}
	public List<Requerimiento> listarTodos() {
		return objReque.listAll();
	}
	public List<Detalle> listarDetallePorCodigo(int cod) {
		return objReque.listAllByCodigoRequerimiento(cod);
	}
	public int eliminarPorCodigo(int codReque) {
		return objReque.deleteByID(codReque);
	}
}
