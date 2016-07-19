package pe.com.rimac.sat.portal.dao;

import java.util.List;
import java.util.Map;

import pe.com.rimac.sat.portal.bean.ComboBox;
import pe.com.rimac.sat.portal.bean.Incidente;
import pe.com.rimac.sat.portal.bean.Response;
import pe.com.rimac.sat.portal.bean.Tarea;
import pe.com.rimac.sat.portal.bean.WorkFlow;
import pe.com.rimac.sat.portal.exception.DBException;

public interface PortalSatDAO {

	List<ComboBox> getComboTipoCaso(String cadenaTraza) throws DBException;
	List<ComboBox> getComboProducto(String cadenaTraza) throws DBException;
	List<ComboBox> getComboSistema(String cadenaTraza) throws DBException;	
	Response saveWorkFlowDB(String cadenaTraza, WorkFlow bean) throws DBException;
	List<Incidente> getIncidentes(String cadenaTraza, String codUsuario, Integer idestado, Integer idwf) throws DBException;
	List<Tarea> getTareasDB(String cadenaTraza, int idewf) throws DBException;
	Map<String, Object> getArchivoTareaDB(String cadenaTraza, int idArchivo) throws DBException;
	List<ComboBox> getComboEstadoWF(String cadenaTraza) throws DBException;
}
