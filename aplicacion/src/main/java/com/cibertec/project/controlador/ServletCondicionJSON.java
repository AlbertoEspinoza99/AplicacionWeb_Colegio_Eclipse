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
import com.cibertec.project.service.DocenteService;
import com.google.gson.Gson;

@WebServlet("/ServletCondicionJSON")
public class ServletCondicionJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public ServletCondicionJSON() {
        super();
 
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//recuperar lista de condiciones
		List<Condicion> lista=new DocenteService().listarCondiciones();
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

}
