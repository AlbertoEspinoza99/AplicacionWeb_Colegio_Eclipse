package com.cibertec.project.interfaces;

import java.util.List;

import com.cibertec.project.entity.Menu;
import com.cibertec.project.entity.Usuario;

public interface UsuarioDAO {
	public Usuario iniciarSesion(String vLogin,String vClave);
	public List<Menu> traerMenusPorUsuario(int codUsu);

}
