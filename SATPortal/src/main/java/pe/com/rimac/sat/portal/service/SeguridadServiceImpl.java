package pe.com.rimac.sat.portal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pe.com.rimac.sat.portal.bean.UsuarioRimac;
import pe.com.rimac.sat.portal.dao.SeguridadDAO;
import pe.com.rimac.sat.portal.exception.DBException;
import pe.com.rimac.sat.portal.util.Properties;

@Service
public class SeguridadServiceImpl implements SeguridadService{

	@Autowired
	private SeguridadDAO seguridadDAO;
	
	@Autowired
	private Properties properties;
	
	@Override
	public UsuarioRimac getUsuario(String cadenaTraza, String idUsuario, String clave) throws DBException {
		
		String traza = cadenaTraza + "[getUsuario]";
		
		String indicadorLDAP = seguridadDAO.obtenerValorConstante(cadenaTraza, properties.cINDIDACOR_LDAP);
		
		UsuarioRimac usuario  = seguridadDAO.getUser(traza, idUsuario, clave, indicadorLDAP);
		
		return usuario;
	}

}
