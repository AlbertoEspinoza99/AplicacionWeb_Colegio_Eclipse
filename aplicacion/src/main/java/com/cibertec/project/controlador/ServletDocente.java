package com.cibertec.project.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cibertec.project.entity.Condicion;
import com.cibertec.project.entity.Docente;
import com.cibertec.project.service.DocenteService;
import com.google.gson.Gson;

/**
 * Servlet implementation class ServletDocente
 */
@WebServlet("/ServletDocente")
public class ServletDocente extends HttpServlet {
	
	//objeto global del servicio DocenteService
	private DocenteService repo=new DocenteService();
	
	private static final long serialVersionUID = 1L;
       
    public ServletDocente() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//obtener el valor de parámetro "tipo"
		String accion;
		accion=request.getParameter("tipo");
		//validar accion
		if(accion.equals("GRABAR"))
			grabarDocente(request,response);
		else if(accion.equals("LISTAR"))
			listarDocentes(request,response);
		else if(accion.equals("ELIMINAR"))
			eliminarDocente(request,response);
		else if(accion.equals("LISTARJSON"))
			listarDocentesJSON(request,response);
			
	}

	private void listarDocentesJSON(HttpServletRequest request, HttpServletResponse response) throws IOException {
				List<Docente> lista=new DocenteService().listarTodos();
				//crear objeto de la clase Gson
				Gson gson=new Gson();
				//generar json(String) del arreglo lista
				String json=gson.toJson(lista);
				//indicar el tipo de dato(json true) que se muestra en el navegador
				response.setContentType("application/json;charset=UTF-8");
				//imprimir la variable json en el navegador
				PrintWriter salida=response.getWriter();
				salida.println(json);
		
	}

	private void eliminarDocente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//leer código a eliminar que se encuentra en la caja con name "codigoEliminar" del modal "mosalEliminar"
		String cod,msj;
		cod=request.getParameter("codigoEliminar");
		//invocar al método deleteByID
		int estado=repo.eliminarPorID(Integer.parseInt(cod));
		if(estado>0)
			//crear atributo MENSAJE con el valor de positivo
			msj="Docente eliminado";
		else
			//crear atributo MENSAJE con el valor de negativo
			msj="Error en la eliminación";
		
		response.sendRedirect("docente.jsp?MENSAJE="+msj);
		//direccionar a la pàgina docente.jsp y enviar el atributo "MENSAJE"
		//request.getRequestDispatcher("/docente.jsp").forward(request, response);
		
	}

	private void listarDocentes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//invocar al mètodo findAll
		List<Docente> data=repo.listarTodos();
		//crear atributo
		request.setAttribute("listaDocentes",data);
		
		//direccionar a la pàgina docente.jsp y enviar el atributo "listaDocentes"
		request.getRequestDispatcher("/docente.jsp").forward(request, response);
	}

	private void grabarDocente(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//leer los valores de los controles que existen en el formulario con atributo ID "frmDocente"
		//PARA LOGRAR ELLO TRABAJAR CON EL VALOR DE ATRIBUTO name
		String cod,nom,pat,mat,sexo,sue,hijos,codCondicion,msj;
		cod=request.getParameter("codigo");
		nom=request.getParameter("nombres");
		pat=request.getParameter("paterno");
		mat=request.getParameter("materno");
		sexo=request.getParameter("sexo");
		sue=request.getParameter("sueldo");
		hijos=request.getParameter("hijos");
		codCondicion=request.getParameter("condicion");
		//crear objeto de la clase Docente
		Docente d=new Docente();
		//setear "asignar valor a los atributos del objeto 'd' usando las variables"
		d.setCodigo(Integer.parseInt(cod));
		d.setNombre(nom);
		d.setPaterno(pat);
		d.setMaterno(mat);
		d.setSexo(sexo);
		d.setHijos(Integer.parseInt(hijos));
		d.setSueldo(Double.parseDouble(sue));
		d.setCodigoCondicion(Integer.parseInt(codCondicion));
		//validar el atributo codigo
		if(d.getCodigo()==0) {	
			//invocar al método save y enviar el objeto "d"
			int estado=repo.registrar(d);
			if(estado>0)
				//crear atributo MENSAJE con el valor de positivo
				msj="Docente registrado";
			else
				//crear atributo MENSAJE con el valor de negativo
				msj="Error en el registro";
		}
		else {
			//invocar al método update y enviar el objeto "d"
			int salida=repo.actualizar(d);
			if(salida>0)
				//crear atributo MENSAJE con el valor de positivo
				msj="Docente actualizado";
			else
				//crear atributo MENSAJE con el valor de negativo
				msj="Error en la actualización";
		}
		
		response.sendRedirect("docente.jsp?MENSAJE="+msj);
	}

}
