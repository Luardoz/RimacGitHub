package pe.com.rimac.sat.portal.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import pe.com.rimac.sat.portal.bean.UsuarioRimac;
import pe.com.rimac.sat.portal.controller.HomeController;
import pe.com.rimac.sat.portal.exception.DBException;
import pe.com.rimac.sat.portal.service.SeguridadService;
import pe.com.rimac.sat.portal.util.Properties;

@Component
public class SecurityLoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler{

	private static final Logger logger = LoggerFactory.getLogger(SecurityLoginSuccessHandler.class);
	
	@Autowired
	private SeguridadService seguridadService;	
	@Autowired
	private Properties properties;	
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	public SecurityLoginSuccessHandler() {
		super();
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException, ServletException {
		String traza = "[onAuthenticationSuccess]";		
		String url = "";
		logger.info(traza + "Iniciando el metodo onAuthenticationSuccess");
		try{
			UsuarioRimac usuario = seguridadService.getUsuario(traza, HomeController.getPrincipal(), "");
			request.getSession().setMaxInactiveInterval(properties.cAPPLICATION_SESSION_TIME);
			request.getSession().setAttribute("user", usuario);				
			url = "/autentificacion/decisor";
		}catch(DBException e){
			logger.error("[onAuthenticationSuccess]DBException:" + e.getMsjError());
			url = "/login/userNotExist";
		}
		redirectStrategy.sendRedirect(request, response, url);
	}
}
