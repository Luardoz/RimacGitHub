package pe.com.rimac.sat.portal.controller;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pe.com.rimac.sat.portal.exception.DBException;
import pe.com.rimac.sat.portal.util.Properties;

/**
 * Maneja las peticiones para la vista p�blica de la aplicaci�n.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private Properties properties;
	
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
 
	/**
	 * @return devuelve pagina de acuerdo al rol
	 */
	@RequestMapping(value = "/autentificacion/decisor", method = RequestMethod.GET)
	public String decisor(HttpServletRequest request, ModelMap model) throws DBException{
	
		String page = "";
		String traza = "[decisor]";
		logger.info(traza + "Identificando rol");		
		Collection<? extends GrantedAuthority> authorities= loggedUserAuthorities();		
		 if (authorities.contains(new SimpleGrantedAuthority(properties.cAPPLICATION_ROLE_ADMIN))) {
			 logger.info(traza + "Acceso administrador");			 
			 page = "redirect:../admin";
		 }else if (authorities.contains(new SimpleGrantedAuthority(properties.cAPPLICATION_ROLE_USER))) {
			 logger.info(traza + "Acceso usuario");
			 logger.info(traza + "Buscando los datos del usuario en la BD");

//			 UsuarioRimac usuario = (UsuarioRimac) request.getSession().getAttribute("user");   
//			 UsuarioRimac usuario = seguridadService.getUsuario(traza, getPrincipal(), "");
//			if(usuario != null){
//				HttpSession session = request.getSession();
//				session.setAttribute("user", usuario);
				page = "redirect:../user";
//			}else{
//				page = "redirect:/login?error=No existe el usuario. Por favor ingrese las credenciales correctamente";				
//			}			 		    
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
 
    @RequestMapping(value = "/login/{error}", method = RequestMethod.GET)    
    public final String displayLoginform(Model model,  @PathVariable final String error) {
    	
    	String mensaje = "";
    	
    	if(properties.cSECURITY_ACCOUNT_DISABLED.equals(error))
    		mensaje = "El usuario est� deshabilitado";
    	else if(properties.cSECURITY_ACCOUNT_LOCKED.equals(error))
    		mensaje = "El usuario est� bloqueado";
    	else if(properties.cSECURITY_BAD_CREDENTIALS.equals(error))
    		mensaje = "Usuario y/o contrase�a son incorrectos";
    	else if(properties.cSECURITY_CREDENTIALS_EXPIRED.equals(error))
    		mensaje = "Las credenciales han expirado";
    	else if(properties.cSECURITY_USER_NOT_EXIST.equals(error))
    		mensaje = "El usuario no existe en la Base de Datos";
    	
        model.addAttribute("mensaje", mensaje);
    	return "public/login";
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
