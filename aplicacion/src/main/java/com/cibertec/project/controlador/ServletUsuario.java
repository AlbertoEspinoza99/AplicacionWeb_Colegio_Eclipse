package com.cibertec.project.controlador;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cibertec.project.entity.Menu;
import com.cibertec.project.entity.Usuario;
import com.cibertec.project.service.UsuarioService;

@WebServlet("/ServletUsuario")
public class ServletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UsuarioService servicioUsuario=new UsuarioService();
	
    public ServletUsuario() {
        super();
        
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tipo=request.getParameter("accion");
		if(tipo.equals("INICIAR"))
			sesionUsuarioActual(request,response);
		else if(tipo.equals("CERRAR"))
			cerrarSesionUsuario(request,response);
	}

	private void cerrarSesionUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//obtener sesi�n actual
		HttpSession sesionActual=request.getSession();
		//eliminar atributos de tipo sesi�n
		sesionActual.invalidate();
		String msj="Sesi�n terminada";
		response.sendRedirect("login.jsp?MENSAJE="+msj);
	}

	private void sesionUsuarioActual(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		//leer cajas
		String vLogin,vClave;
		vLogin=request.getParameter("login");
		vClave=request.getParameter("clave");
		//invocar al m�todo sesionUsuario
		Usuario bean=servicioUsuario.sesionUsuario(vLogin, vClave);
		//validar si existe usuario
		if(bean==null) {
			String msj="Usuario y/o clave incorrectos";
			response.sendRedirect("login.jsp?MENSAJE="+msj);
		}
		else {
			//invocar al m�todo nenusPorUsuario
			List<Menu> lista=servicioUsuario.nenusPorUsuario(bean.getCodigo());
			//atributos de tipo sesi�n
			request.getSession().setAttribute("listaMenus", lista);
			request.getSession().setAttribute("codigoUsuario", bean.getCodigo());
			request.getSession().setAttribute("datosUsuario", bean.getApellido()+" "+bean.getNombre());
			request.getSession().setAttribute("fecha", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			request.getSession().setAttribute("rol",bean.getRol());
					
			request.getRequestDispatcher("/menu.jsp").forward(request, response);
		}
		
	}

}
