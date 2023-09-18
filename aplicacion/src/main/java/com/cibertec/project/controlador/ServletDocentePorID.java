package com.cibertec.project.controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cibertec.project.entity.Docente;
import com.cibertec.project.service.DocenteService;
import com.google.gson.Gson;

/**
 * Servlet implementation class ServletDocentePorID
 */
@WebServlet("/ServletDocentePorID")
public class ServletDocentePorID extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletDocentePorID() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String vCod=request.getParameter("codigo");
		Docente lista = new DocenteService().buscarPorID(Integer.parseInt(vCod));
		//crear objeto de la clase Gson
		Gson gson = new Gson();
		//generar JSON(String) del arreglo lista
		String json = gson.toJson(lista);
		//indicar la salia el tipo de dato que se muestra en el navegador
		response.setContentType("application/json;charset=UTF-8");
		//imprimir la variable json en el navegador
		PrintWriter salida = response.getWriter();
		salida.print(json);
	}

}
