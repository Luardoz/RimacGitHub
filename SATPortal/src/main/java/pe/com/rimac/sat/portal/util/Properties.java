package pe.com.rimac.sat.portal.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class Properties {

	/*
	 * PROPIEDADES PARA BD
	 */	
	@Value("${bd.sat.nombre}")
	public String cBD_SAT_NOMBRE;
	@Value("${bd.sat.timeout.conexion}")
	public int cBD_SAT_TIMEOUT_CONEXION;
	@Value("${bd.sat.timeout.consulta}")
	public int cBD_SAT_TIMEOUT_CONSULTA;
	@Value("${bd.workflow.owner}")
	public String cBD_WORKFLOW_OWNER;
	@Value("${bd.gestion.owner}")
	public String cBD_GESTION_OWNER;
	@Value("${bd.comunes.owner}")
	public String cBD_COMUNES_OWNER;	
	@Value("${pq.portal}")
	public String cPQ_PORTAL;
	@Value("${pq.wf.seguimiento}")
	public String cPQ_WF_SEGUIMIENTO;
	@Value("${pq.comun.ges}")
	public String cPQ_COMUN_GES;
	@Value("${pq.comun.seguridad}")
	public String cPQ_COMUN_SEGURIDAD;	
	@Value("${sp.combo.tipocaso}")
	public String cSP_COMBO_TIPOCASO;
	@Value("${sp.combo.producto}")
	public String cSP_COMBO_PRODUCTO;
	@Value("${sp.combo.sistema}")
	public String cSP_COMBO_SISTEMA;
	@Value("${sp.combo.sistema.key}")
	public String cSP_COMBO_SISTEMA_KEY;
	@Value("${sp.combo.producto.ideatributo}")
	public int cSP_COMBO_PRODUCTO_IDEATRIBUTO;
	@Value("${sp.registro.workflow}")
	public String cSP_REGISTRO_WORKFLOW;	
	@Value("${sp.registro.workflow.identregable}")
	public int cSP_REGISTRO_WORKFLOW_IDENTREGABLE;
	@Value("${sp.consulta.workflow}")
	public String cSP_CONSULTA_WORKFLOW;
	@Value("${sp.consulta.tareas}")
	public String cSP_CONSULTA_TAREAS;
	@Value("${sp.consulta.documento}")
	public String cSP_CONSULTA_DOCUMENTO;
	@Value("${sp.consulta.usuario}")
	public String cSP_CONSULTA_USUARIO;
	@Value("${sp_consulta.estado.wf}")
	public String cSP_CONSULTA_ESTADO_WF;
	
	/*
	 * PROPIEDADES PARA JSP
	 */
	@Value("${form.registro.lista.tipocaso}")
	public String cFORM_REGISTRO_LISTA_TIPO_CASO;
	@Value("${form.registro.lista.producto}")
	public String cFORM_REGISTRO_LISTA_PRODUCTO;
	@Value("${form.registro.lista.sistema}")
	public String cFORM_REGISTRO_LISTA_SISTEMA;
	
	/*
	 * PROPIEDADES SPRING SECURITY
	 */			
	@Value("${ldap.factory}")
	public String cLDAP_FACTORY;
	@Value("${ldap.host}")
	public String cLDAP_HOST;
	@Value("${ldap.autentification}")
	public String cLDAP_AUTENTIFICATION;	
	@Value("${security.role.prefix}")
	public String cSECURITY_ROLE_PREFIX;		
	@Value("${security.bad.credentials}")
	public String cSECURITY_BAD_CREDENTIALS;
	@Value("${security.credentials.expired}")
	public String cSECURITY_CREDENTIALS_EXPIRED;
	@Value("${security.account.locked}")
	public String cSECURITY_ACCOUNT_LOCKED;
	@Value("${security.account.disabled}")
	public String cSECURITY_ACCOUNT_DISABLED;
	@Value("${security.after.user.no.exist}")
	public String cSECURITY_USER_NOT_EXIST;
	@Value("${application.session.max.time}")
	public int cAPPLICATION_SESSION_TIME;
	@Value("${application.role.user}")
	public String cAPPLICATION_ROLE_USER;
	@Value("${application.role.admin}")
	public String cAPPLICATION_ROLE_ADMIN;	
	@Value("${application.modo.dev}")
	public Boolean cAPPLICATION_MODO_DEV;
	/*
	 * PROPIEDADES CODIGOS ERROR
	 */
	@Value("${codigo.exito.estandar}")
	public String cCODIGO_EXITO_ESTANDAR;
	@Value("${codigo.error.estandar}")
	public String cCODIGO_ERROR_ESTANDAR;
	@Value("${codigo.error.bd}")
	public String cCODIGO_ERROR_BD;
}
