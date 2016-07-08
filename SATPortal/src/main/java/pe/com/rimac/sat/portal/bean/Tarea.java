package pe.com.rimac.sat.portal.bean;

import java.math.BigDecimal;
import java.sql.Blob;

public class Tarea {

	private BigDecimal idArchivo;
	private String descripcionTarea;
	private String nombreArchivo;
	private Blob archivoBlob;
	
	public BigDecimal getIdArchivo() {
		return idArchivo;
	}
	public void setIdArchivo(BigDecimal idArchivo) {
		this.idArchivo = idArchivo;
	}
	public String getDescripcionTarea() {
		return descripcionTarea;
	}
	public void setDescripcionTarea(String descripcionTarea) {
		this.descripcionTarea = descripcionTarea;
	}
	public String getNombreArchivo() {
		return nombreArchivo;
	}
	public void setNombreArchivo(String nombreArchivo) {
		this.nombreArchivo = nombreArchivo;
	}
	public Blob getArchivoBlob() {
		return archivoBlob;
	}
	public void setArchivoBlob(Blob archivoBlob) {
		this.archivoBlob = archivoBlob;
	}
}
