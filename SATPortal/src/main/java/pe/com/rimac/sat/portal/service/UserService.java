package pe.com.rimac.sat.portal.service;

import java.util.List;
import java.util.Map;

import pe.com.rimac.sat.portal.bean.ComboBox;
import pe.com.rimac.sat.portal.bean.Incidente;
import pe.com.rimac.sat.portal.bean.Response;
import pe.com.rimac.sat.portal.bean.Tarea;
import pe.com.rimac.sat.portal.bean.WorkFlow;
import pe.com.rimac.sat.portal.exception.DBException;

public interface UserService {

	Map<String, List<ComboBox>> getCombosFormRegister(String cadenaTraza) throws DBException;
	Response saveWorkFlow(String cadenaTraza, WorkFlow bean) throws DBException;
	List<Incidente> getIncidenteList(String cadenaTraza, String codUsu) throws DBException;
	List<Tarea> getTareas(String cadenaTraza, int idewf) throws DBException;
}
