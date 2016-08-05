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

import pe.com.rimac.sat.portal.util.Properties;

@Component
public class SecurityLoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler{

	private static final Logger logger = LoggerFactory.getLogger(SecurityLoginSuccessHandler.class);
	
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

		logger.info(traza + "Aplicando tiempo maximo de sesión: " + properties.cAPPLICATION_SESSION_TIME);
		request.getSession().setMaxInactiveInterval(properties.cAPPLICATION_SESSION_TIME);						
		url = "/autentificacion/decisor";
		
		redirectStrategy.sendRedirect(request, response, url);
	}
}
