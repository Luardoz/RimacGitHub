package pe.com.rimac.sat.portal.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlInOutParameter;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import oracle.jdbc.OracleTypes;
import pe.com.rimac.sat.portal.bean.ComboBox;
import pe.com.rimac.sat.portal.bean.Response;
import pe.com.rimac.sat.portal.bean.WorkFlow;
import pe.com.rimac.sat.portal.dao.mapper.ComboProductoMapper;
import pe.com.rimac.sat.portal.dao.mapper.ComboSistemaMapper;
import pe.com.rimac.sat.portal.dao.mapper.ComboTipoCasoMapper;
import pe.com.rimac.sat.portal.exception.DBException;
import pe.com.rimac.sat.portal.util.Properties;

@Repository
public class PortalSatDAOImpl implements PortalSatDAO{

	private static final Logger logger = LoggerFactory.getLogger(PortalSatDAOImpl.class);

	@Autowired
	@Qualifier("satDS")
	private DataSource satDS;
	
	@Autowired
	private Properties properties;	
		
	@Override
	@SuppressWarnings("unchecked")
	public List<ComboBox> getComboTipoCaso(String cadenaTraza) throws DBException {
		String traza = cadenaTraza + "[getComboTipoCaso]";
		long timeStart = System.currentTimeMillis();
		List<ComboBox> resultado = new ArrayList<ComboBox>();
		JdbcTemplate   objJdbcTemplate = null;
        SimpleJdbcCall objJdbcCall = null;
		logger.info(traza + ">> Inicio método getComboTipoCaso");	
		
		try{
			logger.info(traza + "Consultando a BD: " + properties.cBD_SAT_NOMBRE);
			logger.info(traza + "Tiempo máximo de conexión: " + properties.cBD_SAT_TIMEOUT_CONEXION);
			logger.info(traza + "Tiempo máximo de consulta: " + properties.cBD_SAT_TIMEOUT_CONSULTA);
			logger.info(traza + "Esquema: " + properties.cBD_WORKFLOW_OWNER);
			logger.info(traza + "Paquete: " + properties.cPQ_WF_SEGUIMIENTO);
			logger.info(traza + "Procedimiento: " + properties.cSP_COMBO_TIPOCASO);
			logger.info(traza + "Input: Sin parametros de entrada");

			objJdbcTemplate = new JdbcTemplate(satDS);
			objJdbcTemplate.setQueryTimeout(properties.cBD_SAT_TIMEOUT_CONSULTA);
			
			objJdbcCall = new SimpleJdbcCall(satDS)
    				.withoutProcedureColumnMetaDataAccess()
		            .withSchemaName(properties.cBD_WORKFLOW_OWNER)
		            .withCatalogName(properties.cPQ_WF_SEGUIMIENTO)
		            .withProcedureName(properties.cSP_COMBO_TIPOCASO)
		            .declareParameters( new SqlOutParameter("a_cursor", OracleTypes.CURSOR, null,
				            					new ComboTipoCasoMapper())
		                                );
			
			Map<String, Object> res = objJdbcCall.execute();
			
			if(res != null && !res.isEmpty()){
				resultado = (List<ComboBox>) res.get("a_cursor");
				logger.info(traza + "Lista obtenida! Cantidad de elementos: " + + resultado.size());												
			}else{				
				logger.info(traza + "No se pudo obtener lista");
				resultado.clear();
			}
			
		}catch(Exception e){			
			logger.error(traza + "Exception: ", e);
			throw new DBException(properties.cCODIGO_ERROR_BD, e.getMessage(), 
					properties.cBD_WORKFLOW_OWNER + "." + properties.cPQ_WF_SEGUIMIENTO + "." + properties.cSP_COMBO_TIPOCASO, 
					properties.cBD_SAT_NOMBRE, e);
		}finally{
			logger.info(traza + ">> Fin método getComboTipoCaso. Tiempo total de procesamiento: " + (System.currentTimeMillis() - timeStart) + "(ms)");
		}

		return resultado;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<ComboBox> getComboProducto(String cadenaTraza) throws DBException {		
		String traza = cadenaTraza + "[getComboProducto]";
		long timeStart = System.currentTimeMillis();
		List<ComboBox> resultado = new ArrayList<ComboBox>();
		JdbcTemplate   objJdbcTemplate = null;
        SimpleJdbcCall objJdbcCall = null;
		logger.info(traza + ">> Inicio método getComboTipoCaso");
		try{
			logger.info(traza + "Consultando a BD: " + properties.cBD_SAT_NOMBRE);
			logger.info(traza + "Tiempo máximo de conexión: " + properties.cBD_SAT_TIMEOUT_CONEXION);
			logger.info(traza + "Tiempo máximo de consulta: " + properties.cBD_SAT_TIMEOUT_CONSULTA);
			logger.info(traza + "Esquema: " + properties.cBD_WORKFLOW_OWNER);
			logger.info(traza + "Paquete: " + properties.cPQ_WF_SEGUIMIENTO);
			logger.info(traza + "Procedimiento: " + properties.cSP_COMBO_PRODUCTO);
			logger.info(traza + "Input: [a_ideatributo = " + properties.cSP_COMBO_PRODUCTO_IDEATRIBUTO + "]");
			
			objJdbcTemplate = new JdbcTemplate(satDS);
			objJdbcTemplate.setQueryTimeout(properties.cBD_SAT_TIMEOUT_CONSULTA);
			
			objJdbcCall = new SimpleJdbcCall(satDS)
    				.withoutProcedureColumnMetaDataAccess()
		            .withSchemaName(properties.cBD_WORKFLOW_OWNER)
		            .withCatalogName(properties.cPQ_WF_SEGUIMIENTO)
		            .withProcedureName(properties.cSP_COMBO_PRODUCTO)
		            .declareParameters( new SqlParameter("a_ideatributo", OracleTypes.NUMBER),
		            					new SqlOutParameter("a_cursor", OracleTypes.CURSOR, null,
				            					new ComboProductoMapper())
		                                );
			
			SqlParameterSource objParametrosIN = new MapSqlParameterSource()
		            .addValue("a_ideatributo", properties.cSP_COMBO_PRODUCTO_IDEATRIBUTO);
			
			Map<String, Object> res = objJdbcCall.execute(objParametrosIN);
			
			if(res != null && !res.isEmpty()){
				resultado = (List<ComboBox>) res.get("a_cursor");
				logger.info(traza + "Lista obtenida! Cantidad de elementos: " + + resultado.size());												
			}else{				
				logger.info(traza + "No se pudo obtener lista");
				resultado.clear();
			}
			
		}catch(Exception e){
			logger.error(traza + "Exception: ", e);
			throw new DBException(properties.cCODIGO_ERROR_BD, e.getMessage(), 
					properties.cBD_WORKFLOW_OWNER + "." + properties.cPQ_WF_SEGUIMIENTO + "." + properties.cSP_COMBO_PRODUCTO, 
					properties.cBD_SAT_NOMBRE, e);
		}finally{
			logger.info(traza + ">> Fin método getComboProducto. Tiempo total de procesamiento: " + (System.currentTimeMillis() - timeStart) + "(ms)");
		}
		return resultado;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<ComboBox> getComboSistema(String cadenaTraza) throws DBException {
		String traza = cadenaTraza + "[getComboSistema]";
		long timeStart = System.currentTimeMillis();
		List<ComboBox> resultado = new ArrayList<ComboBox>();
		JdbcTemplate   objJdbcTemplate = null;
        SimpleJdbcCall objJdbcCall = null;
		logger.info(traza + ">> Inicio método getComboTipoCaso");
		try{
			logger.info(traza + "Consultando a BD: " + properties.cBD_SAT_NOMBRE);
			logger.info(traza + "Tiempo máximo de conexión: " + properties.cBD_SAT_TIMEOUT_CONEXION);
			logger.info(traza + "Tiempo máximo de consulta: " + properties.cBD_SAT_TIMEOUT_CONSULTA);
			logger.info(traza + "Esquema: " + properties.cBD_GESTION_OWNER);
			logger.info(traza + "Paquete: " + properties.cPQ_COMUN_GES);
			logger.info(traza + "Procedimiento: " + properties.cSP_COMBO_SISTEMA);
			logger.info(traza + "Input: [a_idetippar = " + properties.cSP_COMBO_SISTEMA_KEY + "]");
			
			objJdbcTemplate = new JdbcTemplate(satDS);
			objJdbcTemplate.setQueryTimeout(properties.cBD_SAT_TIMEOUT_CONSULTA);
			
			objJdbcCall = new SimpleJdbcCall(satDS)
    				.withoutProcedureColumnMetaDataAccess()
		            .withSchemaName(properties.cBD_GESTION_OWNER)
		            .withCatalogName(properties.cPQ_COMUN_GES)
		            .withProcedureName(properties.cSP_COMBO_SISTEMA)
		            .declareParameters( new SqlParameter("a_idetippar", OracleTypes.VARCHAR),
		            					new SqlOutParameter("a_cursor", OracleTypes.CURSOR, null,
				            					new ComboSistemaMapper())
		                                );
			
			SqlParameterSource objParametrosIN = new MapSqlParameterSource()
		            .addValue("a_idetippar", properties.cSP_COMBO_SISTEMA_KEY);
			
			Map<String, Object> res = objJdbcCall.execute(objParametrosIN);
			
			if(res != null && !res.isEmpty()){
				resultado = (List<ComboBox>) res.get("a_cursor");
				logger.info(traza + "Lista obtenida! Cantidad de elementos: " + + resultado.size());												
			}else{				
				logger.info(traza + "No se pudo obtener lista");
				resultado.clear();
			}
			
		}catch(Exception e){
			logger.error(traza + "Exception: ", e);
			throw new DBException(properties.cCODIGO_ERROR_BD, e.getMessage(), 
					properties.cBD_GESTION_OWNER + "." + properties.cPQ_COMUN_GES + "." + properties.cSP_COMBO_SISTEMA, 
					properties.cBD_SAT_NOMBRE, e);
		}finally{
			logger.info(traza + ">> Fin método getComboSistema. Tiempo total de procesamiento: " + (System.currentTimeMillis() - timeStart) + "(ms)");
		}
		return resultado;
	}

	@Override
	public Response saveWorkFlowDB(String cadenaTraza, WorkFlow bean) throws DBException {
		String traza = cadenaTraza + "[saveWorkFlowDB]";
		long timeStart = System.currentTimeMillis();
		Response response = new Response();
        SimpleJdbcCall objJdbcCall = null;
		logger.info(traza + "<---------- Inicio método saveWorkFlowDB ---------->");
		
		try{
			logger.info(traza + "Registrando en BD: " + properties.cBD_SAT_NOMBRE);
			logger.info(traza + "Tiempo máximo de conexión: " + properties.cBD_SAT_TIMEOUT_CONEXION);			
			logger.info(traza + "Esquema: " + properties.cBD_WORKFLOW_OWNER);
			logger.info(traza + "Paquete: " + properties.cPQ_PORTAL);
			logger.info(traza + "Procedimiento: " + properties.cSP_REGISTRO_WORKFLOW);
			logger.info(traza + "Input [a_idewf= " + bean.getIdewf() + "]");
			logger.info(traza + "Input [a_idewfdef= " + bean.getIdewfdef() + "]");
			logger.info(traza + "Input [a_titulo= " + bean.getTitulo() + "]");			
			logger.info(traza + "Input [a_usuario= " + bean.getUsuario() + "]");
			logger.info(traza + "Input [a_idpsolicitante= " + bean.getUsuario() + "]");
			logger.info(traza + "Input [a_idpaplicacion= " + bean.getSitemas() + "]");
			logger.info(traza + "Input [a_idpservicio= " + null + "]");
			logger.info(traza + "Input [a_descripcion= " + bean.getDescripcion() + "]");
			logger.info(traza + "Input [a_idproducto= " + bean.getProducto() + "]");			
			
			objJdbcCall = new SimpleJdbcCall(satDS)
    				.withoutProcedureColumnMetaDataAccess()
		            .withSchemaName(properties.cBD_WORKFLOW_OWNER)
		            .withCatalogName(properties.cPQ_PORTAL)
		            .withProcedureName(properties.cSP_REGISTRO_WORKFLOW)
		            .declareParameters( new SqlInOutParameter("a_idewf", OracleTypes.NUMBER),
		            					new SqlParameter("a_idewfdef", OracleTypes.NUMBER),
		            					new SqlParameter("a_titulo", OracleTypes.VARCHAR),		            					
		            					new SqlParameter("a_usuario", OracleTypes.VARCHAR),
		            					new SqlParameter("a_idpsolicitante", OracleTypes.VARCHAR),
		            					new SqlParameter("a_idpaplicacion", OracleTypes.VARCHAR),
		            					new SqlParameter("a_idpservicio", OracleTypes.VARCHAR),
		            					new SqlParameter("a_descripcion", OracleTypes.VARCHAR),
		            					new SqlParameter("a_idproducto", OracleTypes.VARCHAR)
		                                );
			
			SqlParameterSource objParametrosIN = new MapSqlParameterSource()
		            .addValue("a_idewf", bean.getIdewf())
		            .addValue("a_idewfdef", bean.getIdewfdef())
		            .addValue("a_titulo", bean.getTitulo())
		            .addValue("a_usuario", bean.getUsuario())
		            .addValue("a_idpsolicitante", bean.getUsuario())
		            .addValue("a_idpaplicacion", bean.getSitemas())
		            .addValue("a_idpservicio", null)
		            .addValue("a_descripcion", bean.getDescripcion())
		            .addValue("a_idproducto", bean.getProducto());
			
			Map<String, Object> resultado = objJdbcCall.execute(objParametrosIN);			
			
			if(resultado != null && !resultado.isEmpty()){
				response.setCodResp(properties.cCODIGO_EXITO_ESTANDAR);
				response.setObject(resultado.get("a_idewf"));
				response.setMsjResp("Se registró satisfactoriamente el WorkFlow");
			}else{
				response.setCodResp(properties.cCODIGO_ERROR_ESTANDAR);
				response.setMsjResp("No se pudo registrar el WorkFlow");
			}
			
		}catch(Exception e){			
			logger.error(traza + "Exception: ", e);
			throw new DBException(properties.cCODIGO_ERROR_BD, e.getMessage(), 
					properties.cBD_WORKFLOW_OWNER + "." + properties.cPQ_PORTAL + "." + properties.cSP_REGISTRO_WORKFLOW, 
					properties.cBD_SAT_NOMBRE, e);
		}finally{
			logger.info(traza + "<---------- Fin método saveWorkFlowDB. Tiempo total de procesamiento: " + (System.currentTimeMillis() - timeStart) + "(ms) ---------->");
		}
		
		return response;
	}
	
}
