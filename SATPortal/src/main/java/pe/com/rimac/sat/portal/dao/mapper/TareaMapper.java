package pe.com.rimac.sat.portal.dao.mapper;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.SqlReturnType;

import pe.com.rimac.sat.portal.bean.Tarea;

public class TareaMapper implements SqlReturnType{

	public Tarea mapRow(ResultSet rs, int rowNum) throws SQLException{
		Tarea bean = new Tarea();
		bean.setDescripcionTarea(rs.getString("descripcion"));
		bean.setIdArchivo(rs.getBigDecimal("idearchivoblob"));
		bean.setNombreArchivo(rs.getString("nomarchivo"));
		return bean;
	}
	
	@Override
	@SuppressWarnings({"unchecked","rawtypes"})
	public Object getTypeValue(CallableStatement cs, int ix, int sqlType,
			String typeName) throws SQLException {
		try {
            ResultSet rs = (ResultSet) cs.getObject(ix);
            List l = new ArrayList();
            for (int i = 0; rs.next(); i++) {
                l.add(this.mapRow(rs, i));
            }
            return l;
        }
        catch (SQLException e) {            
            if (e.getMessage() != null && e.getMessage().startsWith("Cursor is closed")) {            	
                return new ArrayList();
            }
            else {
                throw e;
            }
        }
	}
}
