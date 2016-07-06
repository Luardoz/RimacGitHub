package pe.com.rimac.sat.portal.exception;

/**
 * @author lricardo.
 * @clase: DBException.java  
 * @descripcion Clase especifica para excepciones de Base de Datos
 * @fecha_de_creacion: 27-05-2016.
 * @fecha_de_ultima_actualizacion: 27-05-2016.
 * @version 1.0
 */
public class DBException extends BaseException{

	private static final long	serialVersionUID	= -4938556712560828963L;

	// Constructores ...
	public DBException( Exception objException ){
		super( objException );
	}

	public DBException( String msjError ){
		super( msjError );
	}

	public DBException( String codError, String msjError, Exception objException ){
		super( codError, msjError, objException );
	}

	public DBException( String codError, String msjError, String nombreSP, String nombreBD, Exception objException ){
		super( codError, msjError, nombreSP, nombreBD, objException );
	}

}
