package pe.com.rimac.sat.portal.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

@Component
public class SecurityLoginFailureHandler extends SimpleUrlAuthenticationFailureHandler {

	private static final Logger logger = Logger.getLogger(SecurityLoginFailureHandler.class);
	
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {           	
    	logger.error("[onAuthenticationFailure]ERROR de inicio sesion: " + exception);    
    	
    	setUseForward(true);
    	saveException(request, exception);
    	    	
    	if(exception instanceof UsernameNotFoundException)
    		setDefaultFailureUrl("/login/userNotExist");
    	else if(exception instanceof BadCredentialsException)
    		setDefaultFailureUrl("/login/badCredentials");
    	else if(exception instanceof CredentialsExpiredException)
    		setDefaultFailureUrl("/login/credentialsExpired");
    	else if(exception instanceof LockedException)
    		setDefaultFailureUrl("/login/accountLocked");
    	else if(exception instanceof DisabledException)
    		setDefaultFailureUrl("/login/accountDisabled");
    	
    	request.setAttribute("exceptionLogin", exception.getMessage());
    	super.onAuthenticationFailure(request, response, exception);     	
    }

    @Override
    public void setDefaultFailureUrl(String defaultFailureUrl) {
    	logger.info("[setDefaultFailureUrl]Failure url by default: "+defaultFailureUrl);    	
        super.setDefaultFailureUrl(defaultFailureUrl);
    }
}
