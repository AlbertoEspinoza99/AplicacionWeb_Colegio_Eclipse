package com.cibertec.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cibertec.project.entity.Condicion;
import com.cibertec.project.interfaces.CondicionDAO;
import com.cibertec.project.utils.MySqlConexion;

public class MySqlCondicionDAO implements CondicionDAO {

	@Override
	public List<Condicion> findAll() {
		List<Condicion> lista=new ArrayList<Condicion>();
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=MySqlConexion.getConexion();
			String sql="select *from tb_condicion";
			pstm=cn.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()) {
				Condicion d=new Condicion();
				d.setCodigo(rs.getInt(1));
				d.setNombre(rs.getString(2));
				lista.add(d);
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
