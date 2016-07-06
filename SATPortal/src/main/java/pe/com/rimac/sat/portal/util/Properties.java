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
	@Value("${pq.portal}")
	public String cPQ_PORTAL;
	@Value("${pq.wf.seguimiento}")
	public String cPQ_WF_SEGUIMIENTO;
	@Value("${pq.comun.ges}")
	public String cPQ_COMUN_GES;
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
	@Value("${application.role.user}")
	public String cAPPLICATION_ROLE_USER;
	@Value("${application.role.admin}")
	public String cAPPLICATION_ROLE_ADMIN;
	@Value("${ruta.destino.archivo}")
	public String cRUTA_DESTINO_ARCHIVO;
	
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
