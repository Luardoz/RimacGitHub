package pe.com.rimac.sat.portal.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pe.com.rimac.sat.portal.bean.ComboBox;
import pe.com.rimac.sat.portal.bean.Response;
import pe.com.rimac.sat.portal.bean.WorkFlow;
import pe.com.rimac.sat.portal.dao.PortalSatDAO;
import pe.com.rimac.sat.portal.dao.PortalSatDAOImpl;
import pe.com.rimac.sat.portal.exception.DBException;
import pe.com.rimac.sat.portal.util.Properties;

@Service
public class UserServiceImpl implements UserService{

	private static final Logger logger = LoggerFactory.getLogger(PortalSatDAOImpl.class);
	
	@Autowired
	private PortalSatDAO portalSatDAO;
	
	@Autowired
	private Properties properties;
	
	@Override
	public Map<String, List<ComboBox>> getCombosFormRegister(String cadenaTraza) throws DBException {
		String traza = cadenaTraza + "[getCombosFormRegister]";		
		Map<String, List<ComboBox>> resultado = new HashMap<String, List<ComboBox>>();
		List<ComboBox> listaTipoCaso = new ArrayList<ComboBox>();
		List<ComboBox> listaProducto = new ArrayList<ComboBox>();
		List<ComboBox> listaSistema = new ArrayList<ComboBox>();
		
		logger.info(traza + "<------------- Inicio metodo getCombosFormRegister ------------->");		
		
		logger.info(traza + "1. Consultando valores Combo Tipo Caso");
		listaTipoCaso = portalSatDAO.getComboTipoCaso(traza);
		
		logger.info(traza + "2. Consultando valores Combo Producto");
		listaProducto = portalSatDAO.getComboProducto(traza);
		
		logger.info(traza + "3. Consultando valores Combo Sistema");
		listaSistema = portalSatDAO.getComboSistema(traza);
		
		resultado.put(properties.cFORM_REGISTRO_LISTA_TIPO_CASO, listaTipoCaso);
		resultado.put(properties.cFORM_REGISTRO_LISTA_PRODUCTO, listaProducto);
		resultado.put(properties.cFORM_REGISTRO_LISTA_SISTEMA, listaSistema);
		
		logger.info(traza + "<------------- Fin metodo getCombosFormRegister ------------->");
		
		return resultado;
	}

	@Override
	public Response saveWorkFlow(String cadenaTraza, WorkFlow bean) throws DBException {
		String traza = cadenaTraza + "[saveWorkFlow]";	
		Response response = new Response();
		logger.info(traza + "<------------- Inicio metodo saveWorkFlow ------------->");		
		logger.info(traza + "Registrando el WorkFlow en Base de Datos");
		response = portalSatDAO.saveWorkFlowDB(cadenaTraza, bean);		
		
		logger.info(traza + "<------------- Fin metodo saveWorkFlow ------------->");
		return response;
	}

}
