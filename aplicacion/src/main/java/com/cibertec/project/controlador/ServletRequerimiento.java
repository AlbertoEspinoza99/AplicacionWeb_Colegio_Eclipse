package com.cibertec.project.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cibertec.project.entity.Detalle;
import com.cibertec.project.entity.Requerimiento;
import com.cibertec.project.service.RequerimientoService;
import com.google.gson.Gson;

@WebServlet("/ServletRequerimiento")
public class ServletRequerimiento extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RequerimientoService servicioReque=new RequerimientoService();
	
	
	
    public ServletRequerimiento() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tipo=request.getParameter("accion");
		if(tipo.equals("ADICIONAR")) 
			adicionarBien(request,response);
		else if(tipo.equals("ELIMINAR")) 
			eliminarBien(request,response);
		else if(tipo.equals("CODIGO")) 
			generarCodigo(request,response);
		else if(tipo.equals("GRABAR")) 
			grabarRequerimiento(request,response);
		else if(tipo.equals("DETALLE")) 
			detalleRequerimiento(request,response);
		else if(tipo.equals("LISTAR")) 
			listarRequerimiento(request,response);
		else if(tipo.equals("DETALLEREQUE")) 
			detalleRequerimientoPorCodigo(request,response);
		if(tipo.equals("ELIMINAR_REQUERIMIENTO")) 
			eliminarRequerimiento(request,response);
		
	}

	private void eliminarRequerimiento(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String cod=request.getParameter("codigoEliminar");
		int resu=servicioReque.eliminarPorCodigo(Integer.parseInt(cod));
		if(resu>0)
			response.sendRedirect("requerimiento.jsp?MENSAJE=Requerimiento eliminado");
		else
			response.sendRedirect("requerimiento.jsp?MENSAJE=Errore en eliminar");
	}

	private void detalleRequerimientoPorCodigo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String cod=request.getParameter("codigo");
		List<Detalle> lista=servicioReque.listarDetallePorCodigo(Integer.parseInt(cod));
		//crear json
		Gson gson=new Gson();
		String json=gson.toJson(lista);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter salida=response.getWriter();
		salida.println(json);		
	}

	private void listarRequerimiento(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Requerimiento> lista=null;
		//recuperar atributo de tipo sesión "rol"
		String rol=(String) request.getSession().getAttribute("rol");
		if(rol.equals("SUPERVISOR"))
			lista=servicioReque.listarTodos();
		else {
			//recuperar atributo de tipo sesión "codigoUsuario"
			int codUsu=(int) request.getSession().getAttribute("codigoUsuario");
			lista=servicioReque.listarRequerimientoPorUsuario(codUsu);
		}
		
		
		
		//crear json
		Gson gson=new Gson();
		String json=gson.toJson(lista);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter salida=response.getWriter();
		salida.println(json);		
	}

	private void detalleRequerimiento(HttpServletRequest request, HttpServletResponse response) throws IOException {
		///recuperar el atributo de tipo sesión carrito 
		List<Detalle> lista=(List<Detalle>) request.getSession().getAttribute("carrito");
		//generar json de lista
		//crear json
		Gson gson=new Gson();
		String json=gson.toJson(lista);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter salida=response.getWriter();
		salida.println(json);
	}

	private void grabarRequerimiento(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//recuperar valores de las cajas
		String num,nom,esta,fec;
		num=request.getParameter("numero");
		nom=request.getParameter("nombre");
		fec=request.getParameter("fecha");
		esta=request.getParameter("estado");
		//crear objeto de la clase Requerimiento
		Requerimiento reque=new Requerimiento();
		//setear
		reque.setNumeroRequerimiento(num);
		reque.setNombreRequerimiento(nom);
		reque.setEstado(esta);
		reque.setFechaRequerimiento(Date.valueOf(fec));
		//recuperar atributo de tipo sesión "codigoUsuario"
		int codUsu=(int) request.getSession().getAttribute("codigoUsuario");
		reque.setCodigoUsuario(codUsu);
		///recuperar el atributo de tipo sesión carrito 
		List<Detalle> lista=(List<Detalle>) request.getSession().getAttribute("carrito");
		int resu=servicioReque.grabarRequerimiento(reque, lista);
		if(resu>0) {
			//limpiar arreglo
			lista.clear();
			//actualizar carrito
			request.getSession().setAttribute("carrito",lista);
			response.sendRedirect("requerimiento.jsp?MENSAJE=Requemiento registro");
		}
		else
			response.sendRedirect("requerimiento.jsp?MENSAJE=Error en el registro de requerimiento");
	}

	private void generarCodigo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String num=servicioReque.traerNumeroGenerado();
		//crear json
		Gson gson=new Gson();
		String json=gson.toJson(num);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter salida=response.getWriter();
		salida.println(json);
		
		
	}

	private void eliminarBien(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String cod=request.getParameter("codigo");
		//recuperar el atributo sesión "carrito"
		List<Detalle> data=(List<Detalle>) request.getSession().getAttribute("carrito");
		//bucle
		for(Detalle d:data) {
			if(d.getCodigoBien()==Integer.parseInt(cod)) {
				data.remove(d);
				break;
			}
		}
		//actualizar atributo carrito
		request.getSession().setAttribute("carrito", data);
		//crear json
		Gson gson=new Gson();
		String json=gson.toJson(data);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter salida=response.getWriter();
		salida.println(json);
		
	}

	private void adicionarBien(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//recuperar parámetros
		String cod,des,can;
		cod=request.getParameter("codigo");
		des=request.getParameter("descripcion");
		can=request.getParameter("cantidad");
		//crear objeto de la clase Detalle
		Detalle det=new Detalle();
		//setear
		det.setCodigoBien(Integer.parseInt(cod));
		det.setDescripcion(des);
		det.setCantidad(Integer.parseInt(can));
		
		//declarar arreglo de objetos de la clase Detalle
		List<Detalle> lista=null;
		
		//preguntar si existe un atributo de tipo sesión con nombre "carrito"
		if(request.getSession().getAttribute("carrito")==null) {//no existe
			//crear arreglo "lista"
			lista=new ArrayList<Detalle>();
		}
		else {//si existe el atributo carrito
			lista=(List<Detalle>) request.getSession().getAttribute("carrito");
		}
		
		//validar si existe el código del bien el arreglo "lista"
		for(Detalle deta:lista) {
			if(deta.getCodigoBien()==Integer.parseInt(cod)) {
				//crear json
				Gson gson=new Gson();
				String json=gson.toJson("-1");
				response.setContentType("application/json;charset=UTF-8");
				PrintWriter salida=response.getWriter();
				salida.println(json);
				return;
			}
			
		}
		//adicionar objeto "det" dentro del arreglo "lista"
		lista.add(det);
		
		//crear atributo "carrito"
		request.getSession().setAttribute("carrito", lista);
		
		//crear json
		Gson gson=new Gson();
		String json=gson.toJson(lista);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter salida=response.getWriter();
		salida.println(json);
		
	}

}
