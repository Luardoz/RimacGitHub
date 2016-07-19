package pe.com.rimac.sat.portal.dao.mapper;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.SqlReturnType;

import pe.com.rimac.sat.portal.bean.UsuarioRimac;

public class UsuarioRimacMapper implements SqlReturnType{

	public UsuarioRimac mapRow(ResultSet rs, int rowNum) throws SQLException{
		UsuarioRimac bean = new UsuarioRimac();
		bean.setIdUsuario(rs.getString("idusuario"));
		bean.setTipoDocumento(rs.getString("tipodocumento"));
		bean.setNumDocumento(rs.getString("numdocumento"));
		bean.setApePatter(rs.getString("apepatter"));
		bean.setApeMatter(rs.getString("apematter"));
		bean.setNomTer(rs.getString("nomter"));
		bean.setStsUsuario(rs.getString("stsusuario"));
		bean.setIntentosFallidos(rs.getInt("intentosfallidos"));
		bean.setMailTer(rs.getString("mailter"));
		bean.setIdTercero(rs.getBigDecimal("idetercero"));
		bean.setIdCanal(rs.getInt("idecanal"));
		bean.setIdAgencia(rs.getInt("ideagencia"));
		bean.setIdVendedor(rs.getInt("idevendedor"));
		bean.setClave(rs.getString("clave"));
		bean.setRefEmpresaExt(rs.getString("refempresaext"));
		bean.setRefRolExt(rs.getString("refrolext"));
		bean.setRefUsuarioExt(rs.getString("refusuarioext"));
		bean.setIdEquipo(rs.getString("idpequipo"));
		bean.setDscEquipo(rs.getString("dscequipo"));
		bean.setIdpDominio(rs.getString("idpdominio"));
		bean.setDscDominio(rs.getString("dscdominio"));
		bean.setIndTrabajador(rs.getString("indTrabajador"));
		bean.setIdpTipoUsuario(rs.getString("idptipousuario"));
		bean.setIdUsuarioRel(rs.getString("ideusuariorel"));
		bean.setClaveRel(rs.getString("claverel"));
		bean.setCodRolRel(rs.getString("codrolrel"));
		bean.setUpn(rs.getString("upn"));		
		
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
