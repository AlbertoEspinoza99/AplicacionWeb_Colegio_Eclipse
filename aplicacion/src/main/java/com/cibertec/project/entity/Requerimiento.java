package com.cibertec.project.entity;

import java.sql.Date;

public class Requerimiento {
	private int codigoRequerimiento,codigoUsuario;
	private String numeroRequerimiento,nombreRequerimiento,estado;
	private Date fechaRequerimiento;
	//
	private String datosUsuario;
	
	public int getCodigoRequerimiento() {
		return codigoRequerimiento;
	}
	public void setCodigoRequerimiento(int codigoRequerimiento) {
		this.codigoRequerimiento = codigoRequerimiento;
	}
	public int getCodigoUsuario() {
		return codigoUsuario;
	}
	public void setCodigoUsuario(int codigoUsuario) {
		this.codigoUsuario = codigoUsuario;
	}
	public String getNumeroRequerimiento() {
		return numeroRequerimiento;
	}
	public void setNumeroRequerimiento(String numeroRequerimiento) {
		this.numeroRequerimiento = numeroRequerimiento;
	}
	public String getNombreRequerimiento() {
		return nombreRequerimiento;
	}
	public void setNombreRequerimiento(String nombreRequerimiento) {
		this.nombreRequerimiento = nombreRequerimiento;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public Date getFechaRequerimiento() {
		return fechaRequerimiento;
	}
	public void setFechaRequerimiento(Date fechaRequerimiento) {
		this.fechaRequerimiento = fechaRequerimiento;
	}
	public String getDatosUsuario() {
		return datosUsuario;
	}
	public void setDatosUsuario(String datosUsuario) {
		this.datosUsuario = datosUsuario;
	}
	
	
	
}
