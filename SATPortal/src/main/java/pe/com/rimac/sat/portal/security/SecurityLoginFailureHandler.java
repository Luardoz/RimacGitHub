package pe.com.rimac.sat.portal.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

@Component
public class SecurityLoginFailureHandler extends SimpleUrlAuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
			response.setHeader("StatusLogin", "Error");
			if (exception.getMessage().contains("Maximum sessions")) {
				response.setHeader("Reason", "Ya tiene una sesi&oacute;n abierta");
			} else {
				response.setHeader("Reason", exception.getMessage());
			}
		} else {
			super.onAuthenticationFailure(request, response, exception);
		}
	}

	@Override
	public void setDefaultFailureUrl(String defaultFailureUrl) {
		super.setDefaultFailureUrl(defaultFailureUrl);
	}
}
