package pe.com.rimac.sat.portal.controller;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pe.com.rimac.sat.portal.bean.UsuarioRimac;
import pe.com.rimac.sat.portal.exception.DBException;
import pe.com.rimac.sat.portal.service.SeguridadService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private SeguridadService seguridadService;
	
    @RequestMapping(value = { "/" }, method = RequestMethod.GET)
    public String homePage(HttpServletRequest request) {
    	String ipAddress = request.getHeader("X-FORWARDED-FOR");
		String userAgent = request.getHeader("user-agent");
		if (ipAddress == null) {
			ipAddress = request.getRemoteAddr();
		}
    	logger.info("[homePage]Devolviendo Login para " + ipAddress + " en: " + userAgent);        
        return "public/login";
    }
	
	@RequestMapping(value = "/autentificacion/decisor", method = RequestMethod.POST)	
	public String decisor(@RequestParam("user") String user, @RequestParam("password") String password
			, HttpServletRequest request, HttpServletResponse response){
		
		String page = "";
		String traza = "[decisor]";
		UsuarioRimac usuario;
		logger.info(traza + "Consultando credenciales de usuario");			
		
		try{
			usuario = seguridadService.getUsuario(traza, user, password);
			
			if(usuario != null){
				HttpSession session = request.getSession();
				session.setAttribute("user", usuario);
				page = "redirect:../user";
			}else{
				page = "redirect:/login?error=No existe el usuario. Por favor ingrese las credenciales correctamente";				
			}
		}catch(DBException e){
			logger.error(traza + "Ocurrió un error en la BD");
			page = "redirect:/login?error=Error accediendo a la BD. Intentelo mas tarde";			
		}
		
		return page;
	}
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage(HttpServletRequest request) {
    	String ipAddress = request.getHeader("X-FORWARDED-FOR");
		String userAgent = request.getHeader("user-agent");
		if (ipAddress == null) {
			ipAddress = request.getRemoteAddr();
		}
    	logger.info("[loginPage]Devolviendo Login para " + ipAddress + " en: " + userAgent);    	
        return "public/login";
    }
    
    @RequestMapping(value="/logout", method = RequestMethod.POST)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
    	logger.info("Saliendo de la aplicación");
    	logger.info("Invalidando la sesion");
        request.getSession().invalidate();
        return "redirect:/login?logout";
    }
 
    @RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
    	logger.info("Acceso denegado");
        model.addAttribute("user", getPrincipal());        
        return "accessDenied";
    }
     
    public static String getPrincipal(){
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
 
        if (principal instanceof UserDetails) {
            userName = ((UserDetails)principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }

	public static Collection<? extends GrantedAuthority> loggedUserAuthorities() {
		return SecurityContextHolder.getContext().getAuthentication().getAuthorities();
	}
}
