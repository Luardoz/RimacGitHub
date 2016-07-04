package pe.com.rimac.sat.portal.bean;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Reclamo {

	//private String _csrf;
	private String idtipocaso;
	private String idsistema;
	private String idproducto;
	private String idfecregistro;
	private String desctitulo;
	private String descdetallecaso;
	private List<MultipartFile> archivos;
	
	public String getIdtipocaso() {
		return idtipocaso;
	}
	public void setIdtipocaso(String idtipocaso) {
		this.idtipocaso = idtipocaso;
	}
	public String getIdsistema() {
		return idsistema;
	}
	public void setIdsistema(String idsistema) {
		this.idsistema = idsistema;
	}
	public String getIdproducto() {
		return idproducto;
	}
	public void setIdproducto(String idproducto) {
		this.idproducto = idproducto;
	}
	public String getIdfecregistro() {
		return idfecregistro;
	}
	public void setIdfecregistro(String idfecregistro) {
		this.idfecregistro = idfecregistro;
	}
	public String getDesctitulo() {
		return desctitulo;
	}
	public void setDesctitulo(String desctitulo) {
		this.desctitulo = desctitulo;
	}
	public String getDescdetallecaso() {
		return descdetallecaso;
	}
	public void setDescdetallecaso(String descdetallecaso) {
		this.descdetallecaso = descdetallecaso;
	}
	public List<MultipartFile> getArchivos() {
		return archivos;
	}
	public void setArchivos(List<MultipartFile> archivos) {
		this.archivos = archivos;
	}
//	public String get_csrf() {
//		return _csrf;
//	}
//	public void set_csrf(String _csrf) {
//		this._csrf = _csrf;
//	}
	
}
