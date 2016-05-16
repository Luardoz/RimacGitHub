package pe.com.rimac.sat.portal.controller;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
    @RequestMapping(value = { "/" }, method = RequestMethod.GET)
    public String homePage(ModelMap model) {
    	logger.info("[homePage]Devolviendo Login");        
        return "public/login";
    }
 
	/**
	 * @return devuelve pagina de acuerdo al role
	 */
	@RequestMapping(value = "/autentificacion/decisor", method = RequestMethod.GET)
	public String decisor(HttpServletRequest request) {
	
		String page = "";
		logger.info("[decisor]Identificando rol");
		Collection<? extends GrantedAuthority> authorities= loggedUserAuthorities();		
		 if (authorities.contains(new SimpleGrantedAuthority("ROLE_ADMIN"))) {
			 logger.info("[decisor]Acceso administrador");
			 page = "redirect:../admin";
		 }else if (authorities.contains(new SimpleGrantedAuthority("ROLE_USER"))) {
			 logger.info("[decisor]Acceso usuario");
		     page = "redirect:../user";
		 }
		
		return page;
	}
 
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {
    	logger.info("[loginPage]Devolviendo Login"); 
        return "public/login";
    }
 
    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
    	logger.info("Saliendo de la aplicación");
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){    
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";
    }
 
    @RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
    public String accessDeniedPage(ModelMap model) {
    	logger.info("Acceso denegado");
        model.addAttribute("user", getPrincipal());        
        return "accessDenied";
    }
     
    private String getPrincipal(){
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
