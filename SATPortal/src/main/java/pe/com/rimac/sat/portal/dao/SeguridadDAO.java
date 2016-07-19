package pe.com.rimac.sat.portal.dao;

import pe.com.rimac.sat.portal.bean.UsuarioRimac;
import pe.com.rimac.sat.portal.exception.DBException;

public interface SeguridadDAO {

	UsuarioRimac getUser(String cadenaTraza, String idUsuario, String clave) throws DBException;
}
