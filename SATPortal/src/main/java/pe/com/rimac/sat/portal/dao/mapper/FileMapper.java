package pe.com.rimac.sat.portal.dao.mapper;

import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.jdbc.support.lob.LobHandler;

public class FileMapper implements RowMapper<InputStream>{
	
	final LobHandler lobHandler = new DefaultLobHandler();
	
	public InputStream mapRow(ResultSet rs, int rowNum) throws SQLException
	{
		return lobHandler.getBlobAsBinaryStream(rs, "a_archivoblob"); 
//		return rs.getBinaryStream(2);
	}
}
