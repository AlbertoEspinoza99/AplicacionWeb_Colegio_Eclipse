package com.cibertec.project.fabrica;

import com.cibertec.project.dao.SqlServerDocenteDAO;
import com.cibertec.project.interfaces.BienDAO;
import com.cibertec.project.interfaces.CondicionDAO;
import com.cibertec.project.interfaces.DocenteDAO;
import com.cibertec.project.interfaces.RequerimientoDAO;
import com.cibertec.project.interfaces.UsuarioDAO;

public class SqlServerDAOFactory extends DAOFactory {

	@Override
	public DocenteDAO getDocenteDAO() {
		// TODO Auto-generated method stub
		return new SqlServerDocenteDAO();
	}

	@Override
	public CondicionDAO getCondicionDAO() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UsuarioDAO getUsuarioDAO() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BienDAO getBienDAO() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RequerimientoDAO getRequerimientoDAO() {
		// TODO Auto-generated method stub
		return null;
	}

}
