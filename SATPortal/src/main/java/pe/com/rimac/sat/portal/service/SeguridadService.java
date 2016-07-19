package pe.com.rimac.sat.portal.service;

import pe.com.rimac.sat.portal.bean.UsuarioRimac;
import pe.com.rimac.sat.portal.exception.DBException;

public interface SeguridadService {

	UsuarioRimac getUsuario(String cadenaTraza, String idUsuario, String clave) throws DBException;
}
