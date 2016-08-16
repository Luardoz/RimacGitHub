package pe.com.rimac.sat.portal.dao;

import pe.com.rimac.sat.portal.bean.UsuarioRimac;
import pe.com.rimac.sat.portal.exception.DBException;

public interface SeguridadDAO {

	String obtenerValorConstante(String cadenaTraza, String ideconstante) throws DBException;
	
	UsuarioRimac getUser(String cadenaTraza, String idUsuario, String clave, String indicadorLDAP) throws DBException;
	
	boolean validaUsuarioExt(String cadenaTraza, String idUsuario, String clave, String indicadorLDAP) throws DBException;
}
