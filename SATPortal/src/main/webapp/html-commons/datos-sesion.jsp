<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@page session="false" %>

<div id="datos-cliente" class="header-section2">	
	<!-- j_spring_security_logout -->
	
	<form method="post" id="logoutForm" name="logoutForm" action="<c:url value="/j_spring_security_logout" />" >
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<div id="header-section2">
			<i class="m-icn-locked"></i>			
			<span id="avatar">
				<span id="nameTitularHeader"><strong><sec:authorize
							access="isAuthenticated()">
							<c:out value="${pageContext.request.userPrincipal.name}" />
						</sec:authorize>
				</strong></span> <%-- <c:out value="${pageContext.session.maxInactiveInterval}"/>seconds. --%>					
			</span>			
			<input id="logout" 		name="logout" 		type="button" 	value="" style="border:none;float: right;" onclick="javascript:formSubmit();"/>			
			<input id="mobile" 		name="mobile" 		type="hidden" 	value="0"/>
		</div>
	</form>
	
<!-- 	<script>
		function formSubmit() {
			/* document.getElementById("logoutForm").submit(); */
			var url = $(this).attr('action');
			var data = $(this).serializeArray();
			block();
			$.ajax({
				url : url,
				data : data,
				type : "POST",
				async : false,
				success : function(response, status, xhr) {
					console.log('success');
					window.location.reload();
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					var jsonError = JSON.stringify(XMLHttpRequest);
					console.log('error');
					console.log(XMLHttpRequest);
					window.location.href = "login";
				}
			});
		}
	</script> -->
		
	<form method="post" id="form-datos-cliente" name="form-datos-cliente">				
		
		<div id="avatar">
			<span id="nombre-cliente"></span>
		</div>

		<input type="hidden" 	id="nomTer" 		name="nomTer"		value="${nomTer}"/>
		<input type="hidden" 	id="apePatter" 		name="apePatter"	value="${apePatter}"/>
		<input type="hidden" 	id="idptiptercero" 		name="idptiptercero"		value=""/>
		<input type="hidden" 	id="validacionlogin" 	name="validacionlogin"		value=""/>
		<input type="hidden" 	id="idetercero" 		name="idetercero"			value=""/>
		<input type="hidden" 	id="codexterno" 		name="codexterno"			value=""/>
		<input type="hidden" 	id="numerodoc" 			name="numerodoc"			value=""/>
		<input type="hidden" 	id="indmobile" 			name="indmobile"			value=""/>
			
	</form>	
	
	<form id="form-ind-seguros" name="form-ind-seguros">
		<input type="hidden" 	id="ind-seg-salud" 			name="ind-seg-salud"		value="0"/>
		<input type="hidden" 	id="ind-seg-vehicular" 		name="ind-seg-vehicular"	value="0"/>
		<input type="hidden" 	id="ind-seg-vida" 			name="ind-seg-vida"			value="0"/>
		<input type="hidden" 	id="ind-seg-domi" 			name="ind-seg-domi"			value="0"/>
		<input type="hidden" 	id="ind-seg-otros" 			name="ind-seg-otros"		value="0"/>
	</form>
</div>
