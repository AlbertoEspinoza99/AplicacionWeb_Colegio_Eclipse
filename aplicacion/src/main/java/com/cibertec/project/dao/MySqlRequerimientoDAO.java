package com.cibertec.project.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.cibertec.project.entity.Detalle;
import com.cibertec.project.entity.Requerimiento;
import com.cibertec.project.interfaces.RequerimientoDAO;
import com.cibertec.project.utils.MySqlConexion;

public class MySqlRequerimientoDAO implements RequerimientoDAO {

	@Override
	public int save(Requerimiento bean, List<Detalle> lista) {
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstmReque=null,pstmDet=null;
		try {
			//paso 1: conexión a BD
			cn=MySqlConexion.getConexion();
			//paso 2: anular los commit's
			cn.setAutoCommit(false);
			//paso 3: sentencia sqlReque	
			String sqlReque="insert into tb_requerimiento values(null,?,?,?,?,?)";
			//paso 4: crear pstmReque y retornar el código generado
			pstmReque=cn.prepareStatement(sqlReque,Statement.RETURN_GENERATED_KEYS);
			//paso 5: parámetros
			pstmReque.setString(1, bean.getNumeroRequerimiento());
			pstmReque.setString(2, bean.getNombreRequerimiento());
			pstmReque.setDate(3, bean.getFechaRequerimiento());
			pstmReque.setInt(4, bean.getCodigoUsuario());
			pstmReque.setString(5, bean.getEstado());
			//paso 6: ejecutar
			salida=pstmReque.executeUpdate();
			//paso 7: retornar el códogo de requerimiento generado
			ResultSet rs=pstmReque.getGeneratedKeys();
			//paso 8: mover cursor dentro rs
			rs.next();
			int cod=rs.getInt(1);
			
			//GRABAR DETALLE REQUERIMIENTO
			//paso 1: sentencia sqlDet
			String sqlDet="insert into tb_detalle_requerimiento values(?,?,?)";
			//paso 2: bucle para realoizar recorrido sobre el arreglo lista
			for(Detalle d:lista) {
				//paso 3: crear objeto pstmDet
				pstmDet=cn.prepareStatement(sqlDet);
				//paso 4: parámetros
				pstmDet.setInt(1, cod);
				pstmDet.setInt(2, d.getCodigoBien());
				pstmDet.setInt(3, d.getCantidad());
				//paso 5: ejecutar
				salida=pstmDet.executeUpdate();
			}
			//confirmar commit's
			cn.commit();
		} catch (SQLException e) {
			try {
				cn.rollback();
				salida=-1;
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmDet!=null) pstmDet.close();
				if(pstmReque!=null) pstmReque.close();
				if(cn!=null) cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}		
		return salida;
	}

	@Override
	public String numeroGenerado() {
		String num=null;
		Connection cn=null;
		CallableStatement cstm=null;
		ResultSet rs=null;
		try {
			cn=MySqlConexion.getConexion();
			String sql="call sp_codigo()";
			cstm=cn.prepareCall(sql);
			rs=cstm.executeQuery();
			if(rs.next()) {
				num=rs.getString(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(cstm!=null) cstm.close();
				if(cn!=null) cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}		
		return num;
	}

	@Override
	public List<Requerimiento> listAllByCodigo(int cod) {
		List<Requerimiento> lista= new ArrayList<Requerimiento>();
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=MySqlConexion.getConexion();
			String sql="select r.cod_reque,r.num_reque,r.nom_reque,r.fec_reque,"
					+ "concat(u.ape_usu,u.nom_usu),r.est_reque from tb_requerimiento r join tb_usuario u "
					+ "on u.cod_usu=r.cod_usu where r.cod_usu=?";
			pstm=cn.prepareStatement(sql);
			pstm.setInt(1, cod);
			rs=pstm.executeQuery();
			while(rs.next()) {
				Requerimiento m=new Requerimiento();
				m.setCodigoRequerimiento(rs.getInt(1));
				m.setNumeroRequerimiento(rs.getString(2));
				m.setNombreRequerimiento(rs.getString(3));
				m.setFechaRequerimiento(rs.getDate(4));
				m.setDatosUsuario(rs.getString(5));
				m.setEstado(rs.getString(6));
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

	@Override
	public List<Requerimiento> listAll() {
		List<Requerimiento> lista= new ArrayList<Requerimiento>();
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=MySqlConexion.getConexion();
			String sql="select r.cod_reque,r.num_reque,r.nom_reque,r.fec_reque,"
					+ "concat(u.ape_usu,u.nom_usu),r.est_reque from tb_requerimiento r join tb_usuario u "
					+ "on u.cod_usu=r.cod_usu";
			pstm=cn.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()) {
				Requerimiento m=new Requerimiento();
				m.setCodigoRequerimiento(rs.getInt(1));
				m.setNumeroRequerimiento(rs.getString(2));
				m.setNombreRequerimiento(rs.getString(3));
				m.setFechaRequerimiento(rs.getDate(4));
				m.setDatosUsuario(rs.getString(5));
				m.setEstado(rs.getString(6));
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

	@Override
	public List<Detalle> listAllByCodigoRequerimiento(int cod) {
		List<Detalle> lista= new ArrayList<Detalle>();
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=MySqlConexion.getConexion();
			String sql="select dr.cod_bien,b.des_bien,dr.can from tb_detalle_requerimiento dr "
					+ "join tb_bien b on dr.cod_bien=b.cod_bien where dr.cod_reque=?";
			pstm=cn.prepareStatement(sql);
			pstm.setInt(1, cod);
			rs=pstm.executeQuery();
			while(rs.next()) {
				Detalle m=new Detalle();
				m.setCodigoBien(rs.getInt(1));
				m.setDescripcion(rs.getString(2));
				m.setCantidad(rs.getInt(3));
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

	@Override
	public int deleteByID(int codReque) {
		int salida=-1;
		Connection cn=null;
		PreparedStatement pstm=null,pstmDet=null;
		try {
			cn=MySqlConexion.getConexion();
			
			String sqlD="delete from tb_detalle_requerimiento where cod_reque=?";
			pstmDet=cn.prepareStatement(sqlD);
			pstmDet.setInt(1, codReque);
			salida=pstmDet.executeUpdate();
			
			String sql="delete from tb_requerimiento where cod_reque=?";
			pstm=cn.prepareStatement(sql);
			pstm.setInt(1, codReque);
			salida=pstm.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstm!=null) pstm.close();
				if(pstmDet!=null) pstmDet.close();
				if(cn!=null) cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return salida;
	}
	
}
