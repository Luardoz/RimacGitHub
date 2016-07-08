package pe.com.rimac.sat.portal.dao.mapper;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.SqlReturnType;

import pe.com.rimac.sat.portal.bean.Incidente;

public class IncidenteMapper implements SqlReturnType{

	public Incidente mapRow(ResultSet rs, int rowNum) throws SQLException{
		Incidente bean = new Incidente();
		bean.setDescestado(rs.getString("descestado"));
		bean.setDesctarea(rs.getString("desctarea"));
		bean.setDesctipoinci(rs.getString("desctipoinci"));
		bean.setFecatencion(rs.getString("fecatencion"));
		bean.setFeccierre(rs.getString("feccierre"));
		bean.setFecusu(rs.getString("fecusu"));
		bean.setIdeestwf(rs.getInt("ideestwf"));
		bean.setIdewf(rs.getInt("idewf"));
		bean.setIdewfdef(rs.getInt("idewfdef"));		
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
