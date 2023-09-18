package com.cibertec.project.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cibertec.project.entity.Bien;
import com.cibertec.project.service.RequerimientoService;
import com.google.gson.Gson;

@WebServlet("/ServletBienJSON")
public class ServletBienJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletBienJSON() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<Bien> lista=new RequerimientoService().listarBienes();
		Gson gson=new Gson();
		String json=gson.toJson(lista);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter salida=response.getWriter();
		salida.println(json);
		
	}

}
