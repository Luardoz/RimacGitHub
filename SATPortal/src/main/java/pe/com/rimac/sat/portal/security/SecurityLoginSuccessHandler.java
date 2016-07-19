package pe.com.rimac.sat.portal.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import pe.com.rimac.sat.portal.bean.UsuarioRimac;
import pe.com.rimac.sat.portal.controller.HomeController;
import pe.com.rimac.sat.portal.exception.DBException;
import pe.com.rimac.sat.portal.service.SeguridadService;
import pe.com.rimac.sat.portal.util.Properties;

@Component
public class SecurityLoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler{

	@Autowired
	private SeguridadService seguridadService;
	
	@Autowired
	private Properties properties;
	
	public SecurityLoginSuccessHandler() {
		super();
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException, ServletException {
		if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
					
			try{
				UsuarioRimac usuario = seguridadService.getUsuario("", HomeController.getPrincipal(), "");
				request.getSession().setMaxInactiveInterval(60000);
				request.getSession().setAttribute("user", usuario.getIdUsuario());
				response.setHeader("StatusLogin", "0");
				response.setHeader("session", usuario.getIdUsuario());
			}catch(DBException e){
				
			}
		} else {
			super.onAuthenticationSuccess(request, response, auth);
		}
	}
}
