package com.cibertec.project.fabrica;

import com.cibertec.project.dao.MySqlBienDAO;
import com.cibertec.project.dao.MySqlCondicionDAO;
import com.cibertec.project.dao.MySqlDocenteDAO;
import com.cibertec.project.dao.MySqlRequerimientoDAO;
import com.cibertec.project.dao.MySqlUsuarioDAO;
import com.cibertec.project.interfaces.BienDAO;
import com.cibertec.project.interfaces.CondicionDAO;
import com.cibertec.project.interfaces.DocenteDAO;
import com.cibertec.project.interfaces.RequerimientoDAO;
import com.cibertec.project.interfaces.UsuarioDAO;

public class MySqlDAOFactory extends DAOFactory {

	@Override
	public DocenteDAO getDocenteDAO() {
		// TODO Auto-generated method stub
		return new MySqlDocenteDAO();
	}

	@Override
	public CondicionDAO getCondicionDAO() {
		// TODO Auto-generated method stub
		return new MySqlCondicionDAO();
	}

	@Override
	public UsuarioDAO getUsuarioDAO() {
		// TODO Auto-generated method stub
		return new MySqlUsuarioDAO();
	}

	@Override
	public BienDAO getBienDAO() {
		// TODO Auto-generated method stub
		return new MySqlBienDAO();
	}

	@Override
	public RequerimientoDAO getRequerimientoDAO() {
		// TODO Auto-generated method stub
		return new MySqlRequerimientoDAO();
	}

}
