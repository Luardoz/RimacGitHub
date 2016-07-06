package pe.com.rimac.sat.portal.exception;

/**
 * @author lricardo.
 * @clase: WSException.java  
 * @descripcion Clase específica para excepciones de Web Service
 * @fecha_de_creacion: 27-05-2016.
 * @fecha_de_ultima_actualizacion: 27-05-2016.
 * @version 1.0
 */
 public class WSException extends BaseException{
 
	private static final long serialVersionUID = -4938556712560828963L;
	 
	//Constructores ...
	public WSException(){
	       super();
	}
	
	public WSException( Exception objException ){
		   super( objException );
	}
		
	public WSException( String msjError ){
		   super( msjError );
	}
	
    public WSException( String codError, String msjError, Exception objException ){
           super( codError, msjError, objException );
    }

    public WSException( String codError, String msjError, String urlWS, String nombreWS, Exception objException ){  
           super( codError, msjError, urlWS, nombreWS, objException );
    }
 
 }

 