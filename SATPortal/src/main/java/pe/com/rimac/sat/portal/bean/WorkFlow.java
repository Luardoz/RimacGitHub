package pe.com.rimac.sat.portal.bean;

import java.io.Serializable;
import java.math.BigDecimal;

import org.springframework.web.multipart.MultipartFile;

public class WorkFlow implements Serializable{

	private static final long serialVersionUID = -3156897099262122247L;
	
	private BigDecimal idewf;	  
	private Integer idewfdef;
	private String titulo;
	private String sitemas;
	private String descripcion;
	private String usuario;
	private String cadena;
	private String idewfori;
	private MultipartFile archivoAdjunto;
	private String producto;
	
	public BigDecimal getIdewf() {
		return idewf;
	}
	public void setIdewf(BigDecimal idewf) {
		this.idewf = idewf;
	}
	public Integer getIdewfdef() {
		return idewfdef;
	}
	public void setIdewfdef(Integer idewfdef) {
		this.idewfdef = idewfdef;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getCadena() {
		return cadena;
	}
	public void setCadena(String cadena) {
		this.cadena = cadena;
	}
	public String getIdewfori() {
		return idewfori;
	}
	public void setIdewfori(String idewfori) {
		this.idewfori = idewfori;
	}
	public MultipartFile getArchivoAdjunto() {
		return archivoAdjunto;
	}
	public void setArchivoAdjunto(MultipartFile archivoAdjunto) {
		this.archivoAdjunto = archivoAdjunto;
	}
	public String getProducto() {
		return producto;
	}
	public void setProducto(String producto) {
		this.producto = producto;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getSitemas() {
		return sitemas;
	}
	public void setSitemas(String sitemas) {
		this.sitemas = sitemas;
	}

}
