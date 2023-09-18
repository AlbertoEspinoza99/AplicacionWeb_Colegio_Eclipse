package com.cibertec.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cibertec.project.entity.Menu;
import com.cibertec.project.entity.Usuario;
import com.cibertec.project.interfaces.UsuarioDAO;
import com.cibertec.project.utils.MySqlConexion;

public class MySqlUsuarioDAO implements UsuarioDAO {

	@Override
	public Usuario iniciarSesion(String vLogin, String vClave) {
		Usuario usu = null;
		Connection cn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			cn = MySqlConexion.getConexion();
			String sql = "select cod_usu,nom_usu,ape_usu,nom_rol from tb_usuario where log_usu=? and pas_usu=?";
			pst = cn.prepareStatement(sql);
			pst.setString(1, vLogin);
			pst.setString(2, vClave);
			rs=pst.executeQuery();
			if(rs.next()) {
				usu = new Usuario();
				usu.setCodigo(rs.getInt(1));
				usu.setNombre(rs.getString(2));
				usu.setApellido(rs.getString(3));
				usu.setRol(rs.getString(4));
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(cn!=null) {
					cn.close();
				}if(pst!=null) {
					pst.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return usu;
	}

	@Override
	public List<Menu> traerMenusPorUsuario(int codUsu) {
		List<Menu> lista= new ArrayList<Menu>();
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=MySqlConexion.getConexion();
			String sql="select M.cod_men, M.des_men, M.url_men from tb_menu M join "+
							"tb_acceso A on M.cod_men = A.cod_men where A.cod_usu=?";
			pstm=cn.prepareStatement(sql);
			pstm.setInt(1, codUsu);
			rs=pstm.executeQuery();
			while(rs.next()) {
				Menu m=new Menu();
				m.setCodigo(rs.getInt(1));
				m.setDescripcion(rs.getString(2));
				m.setUrl(rs.getString(3));
				lista.add(m);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return lista;
	}

}
