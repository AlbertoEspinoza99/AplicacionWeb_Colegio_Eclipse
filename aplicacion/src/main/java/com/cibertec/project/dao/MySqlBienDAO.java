package com.cibertec.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cibertec.project.entity.Bien;
import com.cibertec.project.interfaces.BienDAO;
import com.cibertec.project.utils.MySqlConexion;

public class MySqlBienDAO implements BienDAO {

	@Override
	public List<Bien> listAll() {
		List<Bien> lista=new ArrayList<Bien>();
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=MySqlConexion.getConexion();
			String sql="select cod_bien,des_bien from tb_bien";
			pstm=cn.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()) {
				Bien b=new Bien();
				b.setCodigoBien(rs.getInt(1));
				b.setDescripcion(rs.getString(2));
				lista.add(b);
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
