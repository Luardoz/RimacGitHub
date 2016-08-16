package pe.com.rimac.sat.portal.dao;

import java.sql.Types;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import com.rimac.security.TripleDesUtil;

import oracle.jdbc.OracleTypes;
import pe.com.rimac.sat.portal.bean.UsuarioRimac;
import pe.com.rimac.sat.portal.dao.mapper.UsuarioRimacMapper;
import pe.com.rimac.sat.portal.exception.DBException;
import pe.com.rimac.sat.portal.util.Constants;
import pe.com.rimac.sat.portal.util.Properties;

@Repository
public class SeguridadDAOImpl implements SeguridadDAO{

	private static final Logger logger = LoggerFactory.getLogger(PortalSatDAOImpl.class);
	
	@Autowired
	@Qualifier("satDS")
	private DataSource satDS;
	
	@Autowired
	@Qualifier("seguridadDS")
	private DataSource seguridadDS;
	
	@Autowired
	private Properties properties;
	
	@SuppressWarnings("unchecked")
	@Override
	public String obtenerValorConstante(String cadenaTraza, String ideconstante) throws DBException {
		String traza = cadenaTraza + "[obtenerValorConstante]";
		String valorConstante = null;
		long timeStart = System.currentTimeMillis();
		JdbcTemplate   objJdbcTemplate = null;
        SimpleJdbcCall objJdbcCall = null;
		logger.info(traza + "<---------- Inicio método obtenerValorConstante ---------->");
		try{
			logger.info(traza + "Consultando a BD: " + properties.cBD_SAT_NOMBRE);
			logger.info(traza + "Tiempo máximo de conexión: " + properties.cBD_SAT_TIMEOUT_CONEXION);
			logger.info(traza + "Tiempo máximo de consulta: " + properties.cBD_SAT_TIMEOUT_CONSULTA);
			logger.info(traza + "Esquema: " + properties.cBD_COMUNES_OWNER);
			logger.info(traza + "Paquete: " + properties.cPQ_COMUN_COMUN);
			logger.info(traza + "Procedimiento: fn_obt_valor_constante");
			logger.info(traza + "Input: [a_ideconstante =  " + ideconstante + "]");
						
			objJdbcTemplate = new JdbcTemplate(satDS);
			objJdbcTemplate.setQueryTimeout(properties.cBD_SAT_TIMEOUT_CONSULTA);
			
			objJdbcCall = new SimpleJdbcCall(satDS)
		            .withSchemaName(properties.cBD_COMUNES_OWNER)
		            .withCatalogName(properties.cPQ_COMUN_COMUN)
		            .withFunctionName("fn_obt_valor_constante")
  					.withReturnValue()
  					.declareParameters(new SqlParameter("a_ideconstante", Types.VARCHAR));
			
			SqlParameterSource objParametrosIN = new MapSqlParameterSource()
		            .addValue("a_ideconstante", ideconstante);
			
			valorConstante = objJdbcCall.executeFunction(String.class, objParametrosIN);
			
		}catch(Exception e){
			logger.error(traza + "Exception: ", e);
			throw new DBException(properties.cCODIGO_ERROR_BD, e.getMessage(), 
					properties.cBD_COMUNES_OWNER + "." + properties.cPQ_COMUN_COMUN + ".fn_obt_valor_constante", 
					properties.cBD_SAT_NOMBRE, e);
		}finally{
			logger.info(traza + "<---------- Fin método obtenerValorConstante. Tiempo total de procesamiento: " + (System.currentTimeMillis() - timeStart) + "(ms) ---------->");
		}
		
		return valorConstante;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public UsuarioRimac getUser(String cadenaTraza, String idUsuario, String clave, String indicadorLDAP) throws DBException {
		String traza = cadenaTraza + "[getUser]";
		long timeStart = System.currentTimeMillis();
		UsuarioRimac resultado = new UsuarioRimac();
		JdbcTemplate   objJdbcTemplate = null;
        SimpleJdbcCall objJdbcCall = null;
		logger.info(traza + "<---------- Inicio método getUser ---------->");
		try{
			logger.info(traza + "Consultando a BD: " + properties.cBD_SAT_NOMBRE);
			logger.info(traza + "Tiempo máximo de conexión: " + properties.cBD_SAT_TIMEOUT_CONEXION);
			logger.info(traza + "Tiempo máximo de consulta: " + properties.cBD_SAT_TIMEOUT_CONSULTA);
			logger.info(traza + "Esquema: " + properties.cBD_COMUNES_OWNER);
			logger.info(traza + "Paquete: " + properties.cPQ_COMUN_SEGURIDAD);
			logger.info(traza + "Procedimiento: " + properties.cSP_CONSULTA_USUARIO);
			logger.info(traza + "Input: [a_idusuario = " + idUsuario + "]");
			logger.info(traza + "Input: [a_clave =  " + clave + "]");
			logger.info(traza + "Input: [indicadorLDAP =  " + indicadorLDAP + "]");
						
			DataSource dataSource;		
			dataSource = Constants.INDICADOR_LDAP_SI.equals(indicadorLDAP) ? seguridadDS : satDS;
			
			objJdbcTemplate = new JdbcTemplate(dataSource);
			objJdbcTemplate.setQueryTimeout(properties.cBD_SAT_TIMEOUT_CONSULTA);
			
			objJdbcCall = new SimpleJdbcCall(dataSource)
    				.withoutProcedureColumnMetaDataAccess()
		            .withSchemaName(properties.cBD_COMUNES_OWNER)
		            .withCatalogName(properties.cPQ_COMUN_SEGURIDAD)
		            .withProcedureName(properties.cSP_CONSULTA_USUARIO)
		            .declareParameters( new SqlParameter("a_idusuario", OracleTypes.VARCHAR),
		            					new SqlParameter("a_clave", OracleTypes.VARCHAR),
		            					new SqlOutParameter("a_cursor", OracleTypes.CURSOR, null,
				            					new UsuarioRimacMapper())
		                                );
			
			SqlParameterSource objParametrosIN = new MapSqlParameterSource()
		            .addValue("a_idusuario", idUsuario)
		            .addValue("a_clave", clave);
			
			Map<String, Object> res = objJdbcCall.execute(objParametrosIN);
			
			if(res != null && !res.isEmpty()){
				
				List<UsuarioRimac> lista = ((List<UsuarioRimac>) res.get("a_cursor"));
				
				if(lista != null && !lista.isEmpty()){
					logger.info(traza + "Usuario obtenido exitosamente");
					resultado = lista.get(0);					
				}else{
					resultado = null;
					logger.info(traza + "No existe el usuario");
					throw new DBException("El usuario " + idUsuario + " no existe en la Base de Datos");
				}
																
			}else{		
				resultado = null;
				logger.info(traza + "No se pudo obtener información de la base de datos");	
				throw new DBException("No se pudo obtener información de la base de datos");
			}
			
		}catch(Exception e){
			logger.error(traza + "Exception: ", e);
			throw new DBException(properties.cCODIGO_ERROR_BD, e.getMessage(), 
					properties.cBD_COMUNES_OWNER + "." + properties.cPQ_COMUN_SEGURIDAD + "." + properties.cSP_CONSULTA_USUARIO, 
					properties.cBD_SAT_NOMBRE, e);
		}finally{
			logger.info(traza + "<---------- Fin método getUser. Tiempo total de procesamiento: " + (System.currentTimeMillis() - timeStart) + "(ms) ---------->");
		}
		
		return resultado;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public boolean validaUsuarioExt(String cadenaTraza, String idUsuario, String clave, String indicadorLDAP) throws DBException {
		String traza = cadenaTraza + "[validaUsuarioExt]";
		long timeStart = System.currentTimeMillis();
		TripleDesUtil objCrypt;
		boolean usuarioValido = false;
		String idUsuarioRS = null;
		JdbcTemplate   objJdbcTemplate = null;
        SimpleJdbcCall objJdbcCall = null;
		logger.info(traza + "<---------- Inicio método validaUsuarioExt ---------->");
		try{
			logger.info(traza + "Consultando a BD: " + properties.cBD_SAT_NOMBRE);
			logger.info(traza + "Tiempo máximo de conexión: " + properties.cBD_SAT_TIMEOUT_CONEXION);
			logger.info(traza + "Tiempo máximo de consulta: " + properties.cBD_SAT_TIMEOUT_CONSULTA);
			logger.info(traza + "Esquema: " + properties.cBD_COMUNES_OWNER);
			logger.info(traza + "Paquete: " + properties.cPQ_COMUN_SEGURIDAD);
			logger.info(traza + "Procedimiento: sp_val_usuario_ext");
			logger.info(traza + "Input: [a_idusuario = " + idUsuario + "]");
			logger.info(traza + "Input: [a_clave =  " + clave + "]");
			logger.info(traza + "Input: [indicadorLDAP =  " + indicadorLDAP + "]");
			
			objCrypt = new TripleDesUtil();
						
			DataSource dataSource;		
			dataSource = Constants.INDICADOR_LDAP_SI.equals(indicadorLDAP) ? seguridadDS : satDS;
			
			objJdbcTemplate = new JdbcTemplate(dataSource);
			objJdbcTemplate.setQueryTimeout(properties.cBD_SAT_TIMEOUT_CONSULTA);
			
			objJdbcCall = new SimpleJdbcCall(dataSource)
    				.withoutProcedureColumnMetaDataAccess()
		            .withSchemaName(properties.cBD_COMUNES_OWNER)
		            .withCatalogName(properties.cPQ_COMUN_SEGURIDAD)
		            .withProcedureName("sp_val_usuario_ext")
		            .declareParameters( new SqlParameter("a_codusuario", OracleTypes.VARCHAR),
		            					new SqlParameter("a_clave", OracleTypes.VARCHAR),
		            					new SqlOutParameter("a_idusuario", OracleTypes.VARCHAR) );
			
			SqlParameterSource objParametrosIN = new MapSqlParameterSource()
		            .addValue("a_codusuario", idUsuario)
		            .addValue("a_clave", (clave!= null && clave.length()>0) ? objCrypt.encripta(clave) : null);
			
			Map<String, Object> res = objJdbcCall.execute(objParametrosIN);
			idUsuarioRS = (String) res.get("a_idusuario");
			
		}catch(Exception e){
			logger.error(traza + "Exception: ", e);
			throw new DBException(properties.cCODIGO_ERROR_BD, e.getMessage(), 
					properties.cBD_COMUNES_OWNER + "." + properties.cPQ_COMUN_SEGURIDAD + "." + properties.cSP_CONSULTA_USUARIO, 
					properties.cBD_SAT_NOMBRE, e);
		}finally{
			logger.info(traza + "<---------- Fin método validaUsuarioExt. Tiempo total de procesamiento: " + (System.currentTimeMillis() - timeStart) + "(ms) ---------->");
		}
		
		if(idUsuario != null && idUsuario.equalsIgnoreCase(idUsuarioRS)) {
			usuarioValido = true;
		}
		
		return usuarioValido;
	}

}
