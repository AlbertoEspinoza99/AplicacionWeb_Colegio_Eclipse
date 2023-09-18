package com.cibertec.project.service;

import java.util.List;

import com.cibertec.project.entity.Menu;
import com.cibertec.project.entity.Usuario;
import com.cibertec.project.fabrica.DAOFactory;
import com.cibertec.project.interfaces.UsuarioDAO;

public class UsuarioService {
	private DAOFactory fabrica=DAOFactory.getDAOFactory(1);
	private UsuarioDAO objUsu=fabrica.getUsuarioDAO();
	
	public Usuario sesionUsuario(String vLogin, String vClave) {
		return objUsu.iniciarSesion(vLogin, vClave);
	}
	public List<Menu> nenusPorUsuario(int codUsu) {
		return objUsu.traerMenusPorUsuario(codUsu);
	}
}
