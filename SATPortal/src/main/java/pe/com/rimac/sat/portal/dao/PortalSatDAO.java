package pe.com.rimac.sat.portal.dao;

import java.util.List;

import pe.com.rimac.sat.portal.bean.ComboBox;
import pe.com.rimac.sat.portal.bean.Response;
import pe.com.rimac.sat.portal.bean.WorkFlow;
import pe.com.rimac.sat.portal.exception.DBException;

public interface PortalSatDAO {

	List<ComboBox> getComboTipoCaso(String cadenaTraza) throws DBException;
	List<ComboBox> getComboProducto(String cadenaTraza) throws DBException;
	List<ComboBox> getComboSistema(String cadenaTraza) throws DBException;	
	Response saveWorkFlowDB(String cadenaTraza, WorkFlow bean) throws DBException;	
}
