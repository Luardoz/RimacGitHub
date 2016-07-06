package pe.com.rimac.sat.portal.exception;

/**
 * @author lricardo.
 * @clase: BaseException.java  
 * @descripcion Clase Base para excepciones personalizadas
 * @fecha_de_creacion: 27-05-2016.
 * @fecha_de_ultima_actualizacion: 27-05-2016.
 * @version 1.0
 */
 public class BaseException extends Exception{
 
	private static final long serialVersionUID = 3186105543822592034L;
	
	private Exception objException;
	private String	  codError;
	private String	  msjError;
	private String	  nombreSP;
	private String 	  nombrePKG;
	private String	  nombreBD;
	
	private String	  nombreWS;
	private String 	  urlWS;
	private String    nombreQueue;
 
    
    public BaseException(){
           super();
    }
    
    public BaseException( Exception objException ){
		   this.objException = objException;
	}
	
	public BaseException( String msjError ){
		   super( msjError );
		   this.msjError = msjError;
	}
	
    public BaseException( String msjError, Exception objException){
        super(objException);        
        this.objException = objException;
        this.msjError     = msjError;
    }
	
	public BaseException( String codError, String msjError, Exception objException ){
		   super( msjError );
		   this.codError     = codError;
		   this.msjError     = msjError;
		   this.objException = objException;
	}

	public BaseException( String codError, String msjError, String nombreSP, String nombrePKG, String nombreBD, Exception objException ){ 
		   super( msjError );
		   this.codError     = codError;
		   this.msjError     = msjError;
		   this.nombreSP     = nombreSP;
		   this.nombrePKG 	 = nombrePKG;
		   this.nombreBD     = nombreBD;
		   this.objException = objException;
	}
 
	public BaseException( String codError, String msjError, String urlWS, String nombreWS, Exception objException ){
		   super( msjError );
		   this.codError     = codError;
		   this.msjError     = msjError;
		   this.urlWS 		 = urlWS;
		   this.nombreWS     = nombreWS;
		   this.objException = objException;
	}
 	 
	public Exception getObjException(){
		return objException;
	}
	
	public void setObjException( Exception objException ){
		this.objException = objException;
	}
	
	public String getCodError(){
		return codError;
	}
	
	public void setCodError( String codError ){
		this.codError = codError;
	}
	
	public String getMsjError(){
		return msjError;
	}
	
	public void setMsjError( String msjError ){
		this.msjError = msjError;
	}
	
	public String getNombreSP(){
		return nombreSP;
	}
	
	public void setNombreSP( String nombreSP ){
		this.nombreSP = nombreSP;
	}
	
	public String getNombreBD(){
		return nombreBD;
	}
	
	public void setNombreBD( String nombreBD ){
		this.nombreBD = nombreBD;
	}
	
	public static long getSerialVersionUID(){
		return serialVersionUID;
	}
	
	public String getNombreWS(){
		return nombreWS;
	}
	
	public void setNombreWS( String nombreWS ){
		this.nombreWS = nombreWS;
	}
    
    public String getNombreQueue(){
        return nombreQueue;
    }
    
    public void setNombreQueue( String nombreQueue ){
        this.nombreQueue = nombreQueue;
    }
    
    public static long getSerialversionuid(){
        return serialVersionUID;
    }

	public String getUrlWS() {
		return urlWS;
	}

	public void setUrlWS(String urlWS) {
		this.urlWS = urlWS;
	}

	public String getNombrePKG() {
		return nombrePKG;
	}

	public void setNombrePKG(String nombrePKG) {
		this.nombrePKG = nombrePKG;
	}
 
  }

 