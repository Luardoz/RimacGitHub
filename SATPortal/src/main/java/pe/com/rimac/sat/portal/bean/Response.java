package pe.com.rimac.sat.portal.bean;

public class Response {

	private String codResp;
	private String msjResp;
	private Object opcional;
	
	public String getCodResp() {
		return codResp;
	}
	public void setCodResp(String codResp) {
		this.codResp = codResp;
	}
	public String getMsjResp() {
		return msjResp;
	}
	public void setMsjResp(String msjResp) {
		this.msjResp = msjResp;
	}
	public Object getObject() {
		return opcional;
	}
	public void setObject(Object object) {
		this.opcional = object;
	}		
}
