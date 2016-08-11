package pe.com.rimac.sat.portal.security;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import pe.com.rimac.sat.portal.bean.UsuarioRimac;
import pe.com.rimac.sat.portal.dao.SeguridadDAO;
import pe.com.rimac.sat.portal.exception.DBException;
import pe.com.rimac.sat.portal.util.Properties;

@Service
@SuppressWarnings({"rawtypes","unchecked","unused"})
public class AuthenticationProviderR implements AuthenticationProvider, Serializable{
	
	private static final long serialVersionUID = 4209894584554690640L;
	private static final Logger logger = LoggerFactory.getLogger(AuthenticationProviderR.class);
	
	@Autowired
	private Properties properties;
	
	@Autowired
	private SeguridadDAO seguridadDAO;
		
	public boolean loginAD(String username, String password){
		
		Hashtable env = new Hashtable();
        env.put(Context.INITIAL_CONTEXT_FACTORY, properties.cLDAP_FACTORY);
        env.put(Context.PROVIDER_URL, properties.cLDAP_HOST);
        env.put(Context.SECURITY_AUTHENTICATION, properties.cLDAP_AUTENTIFICATION);
        env.put(Context.SECURITY_PRINCIPAL, username);
        env.put(Context.SECURITY_CREDENTIALS, password);
        try {
            DirContext ctx = new InitialDirContext(env);
            return true;
        } catch (NamingException ex) {
            logger.error("Exception en LDAP: " + ex);
        }
        return false;
	}
	
	@Override
	public Authentication authenticate(Authentication authentication) 
			throws UsernameNotFoundException, BadCredentialsException {		
		String traza = "[authenticate]";
		User user = null;
		UsuarioRimac usuarioRimac = null;
		String username = authentication.getName();
		String password = (String) authentication.getCredentials();		
		logger.info(traza + "Iniciando la auntenticación en Spring Security");
			
		//roles para prueba
		SimpleGrantedAuthority grantUser = new SimpleGrantedAuthority(properties.cAPPLICATION_ROLE_USER);
		
		try{																	
			logger.info(traza + "Buscando al usuario en la BD..");
			usuarioRimac= seguridadDAO.getUser(traza, username, password);
			logger.info(traza + "Usuario encontrado." + usuarioRimac.getIdUsuario() + " (" + usuarioRimac.getUpn() +")");			
		}catch(DBException e){
			logger.error(traza + "DBException: " + e.getMessage());
			throw new UsernameNotFoundException("Usuario " + username + " no existe en la Base de Datos");
		}
		
		if(properties.cAPPLICATION_MODO_DEV){
			logger.info(traza + "Aunteticación en modo DEV. Sólo se validará con la BD");
			Collection<SimpleGrantedAuthority> roles = new ArrayList();
			roles.add(grantUser);
			user = new User(username, password, roles);
		}else{
			logger.info(traza + "Aunteticación en modo PROD. Se valida AD y BD");
			if(usuarioRimac.getUpn() == null || "".equals(usuarioRimac.getUpn()))
				throw new UsernameNotFoundException("Usuario " + username + " no está registrado en Active Directory");
			else{
				if(loginAD(usuarioRimac.getUpn(), password)){			
					logger.info(traza + "Identificación exitosa contra AD");
					Collection<SimpleGrantedAuthority> roles = new ArrayList();
					roles.add(grantUser);
					user = new User(username, password, roles);
				}else{
					throw new BadCredentialsException("Credenciales inválidas (Active Directory)");
				}
			}
		}
		
		return new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword(), user.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
