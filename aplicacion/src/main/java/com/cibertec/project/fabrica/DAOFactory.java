package com.cibertec.project.fabrica;

import com.cibertec.project.interfaces.BienDAO;
import com.cibertec.project.interfaces.CondicionDAO;
import com.cibertec.project.interfaces.DocenteDAO;
import com.cibertec.project.interfaces.RequerimientoDAO;
import com.cibertec.project.interfaces.UsuarioDAO;

public abstract class DAOFactory {
	// los posibles orígenes de datos
    public static final int MYSQL = 1;
    public static final int ORACLE = 2;
    public static final int DB2 = 3;
    public static final int SQLSERVER = 4;
    public static final int XML = 5;
    // Existirá un método get por cada DAO que exista en el sistema
    // Ejemplo:
    //public abstract ArticuloDAO getArticuloDAO();
    // registramos nuestros daos "interfaces"
    public abstract DocenteDAO getDocenteDAO();
    public abstract CondicionDAO getCondicionDAO();
    public abstract UsuarioDAO getUsuarioDAO();
    public abstract BienDAO getBienDAO();
    public abstract RequerimientoDAO getRequerimientoDAO();
    
    
    public static DAOFactory getDAOFactory(int whichFactory){
        switch(whichFactory){
       		case MYSQL:
        	   return new MySqlDAOFactory();
        	case XML:
        	    //return new XmlDAOFactory();
        	case ORACLE:
        	    //return new OracleDAOFactory();
        	/*case DB2:
        	    return new Db2DAOFactory();*/
        	case SQLSERVER:
        	    return new SqlServerDAOFactory();
        	/*case XML:
        	    return new XmlDAOFactory();*/
        	default:
        	    return null;
        }
     }
}
