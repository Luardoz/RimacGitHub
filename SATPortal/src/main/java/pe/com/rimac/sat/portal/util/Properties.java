package pe.com.rimac.sat.portal.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class Properties {

	@Value("${application.role.user}")
	public String cAPPLICATION_ROLE_USER;
	@Value("${application.role.admin}")
	public String cAPPLICATION_ROLE_ADMIN;
}
