<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:import url="/html-commons/meta.jsp" />
		<c:import url="/html-commons/css.jsp" />
		<c:import url="/html-commons/js.jsp" />
        <title>Login page</title>       
    </head>
<body style="width: 100%;background:#f1f4f5;">

	<%-- <c:url var="loginUrl" value="/login" /> --%>
	<c:url var="loginUrl" value="/j_spring_security_check" />
	<form method="post" 
			id="formlogin" 
			name="formlogin" 
			autocomplete="off"
			action="${loginUrl}">		
	
	<input id="mobile"
			name="mobile"
		 	type="hidden"
			value="0"/>		    
	<div id="todo">
		
		<div>
		
			<div class="loginv2-container" style="position: relative;">
		
				<a href="http://www.rimac.com.pe/">
					<span class="logo-login loginv2-logo">
					</span>
				</a>
			</div>
		
			<div class="loginv2-header">
				<div class="loginv2-container text-center">
					<h1 class="title" style="border: medium none; font-size: 26px; color: rgb(105, 109, 115) ! important; font-weight: 300;">
							Bienvenido al Sistema de Administración de Tecnología - SAT
							</h1>
					<!-- <span class="title">
						<span>
							<h1 style="border: medium none; font-size: 26px; color: rgb(105, 109, 115) ! important; font-weight: 300;">
							Bienvenido al Sistema de Administración de Tecnología - SAT
							</h1>
						</span>
						<span style="font-size: 20px;">
							Actualiza tus datos para poder comunicarnos contigo cuando más lo necesites
						</span>
					</span> -->
					<span class="loginv2-image-brothercito"></span>					
				</div>
			</div>
			
			
			<div class="loginv2-body">
				<div class="loginv2-container">
					<div class="loginv2-inicio-registro">	
						<div class="loginv2-inicio">					
							<div class="title">Ingresa a tu cuenta</div>
							<div class="input-group" style="margin-right: 10px;">
								<div class="content-input-login">
									<input id="userlogin"
											name="user"
											type="text"
											maxlength="15"
											style="margin-bottom: 5px;"
											<%-- value="<%=nrodocumento%>" --%>
											placeholder="Usuario">
								</div>
								<div class="content-input-login">																
									<input id="passlogin"
											name="password"
											type="password"
											maxlength="12"
											placeholder="Contraseña"
											style="margin-bottom: 5px;"
											onkeypress="javascript:enterPORTALWEB(event);">
								</div>
							</div>
							<c:if test="${param.error != null}">
								<div id="mensajes-login" style="">
									<div class="col-md-12">
								   		<div class="alert alert-danger" style="margin: 5px; padding: 5px;">
								   			<button aria-hidden="true" 
								   					data-dismiss="alert" 
								   					class="close"
								   					type="button">×</button>
								   			<!-- <span id="msj-result-login">Credenciales invalidas. Por favor vuelve a ingresar</span> -->
								   			<span id="msj-result-login"><c:out value="${param.error}" /></span> 								   			
										</div>
									</div>			   								   	
							   	</div>
						   	 </c:if>
						   	 <c:if test="${param.denied != null}">
								<div id="mensajes-login" style="">
									<div class="col-md-12">
								   		<div class="alert alert-danger" style="margin: 5px; padding: 5px;">
								   			<button aria-hidden="true" 
								   					data-dismiss="alert" 
								   					class="close"
								   					type="button">×</button>
								   			<span id="msj-result-login">Credenciales inválidas. Por favor vuelve a ingresar</span>								   										   		
										</div>
									</div>			   								   	
							   	</div>
						   	 </c:if>
						   	 <c:if test="${mensaje != null}">
								<div id="mensajes-login" style="">
									<div class="col-md-12">
								   		<div class="alert alert-danger" style="margin: 5px; padding: 5px;">
								   			<button aria-hidden="true" 
								   					data-dismiss="alert" 
								   					class="close"
								   					type="button">×</button>
								   			<span id="msj-result-login"><c:out value="${mensaje}" /></span>								   										   		
										</div>
									</div>			   								   	
							   	</div>
						   	 </c:if>
						   	 <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">						
						      <div id="mensajes-login" style="">
									<div class="col-md-12">
								   		<div class="alert alert-danger" style="margin: 5px; padding: 5px;">
								   			<button aria-hidden="true" 
								   					data-dismiss="alert" 
								   					class="close"
								   					type="button">×</button>
								   			<span id="msj-result-login">No se pudo ingresar al Sistema. Reason: <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" /></span>								   										   		
										</div>
									</div>			   								   	
							   	</div>
						    </c:if>
						   	<input type="hidden" name="${_csrf.parameterName}"   value="${_csrf.token}" />
							<div style="margin: 15px 0 15px 0;">
								<input class="btn btn-primary" type="submit" value="Ingresar">
								
								<div id="mensajes-login" class="row" style="display: none;">
									<div class="col-md-12">
								   		<div id="mensaje" class="alert alert-danger">
								   			<button aria-hidden="true" 
								   					data-dismiss="alert" 
								   					class="close"
								   					type="button">×</button>
								   			<span id="msj-result-login"></span>
										</div>
									</div>			   								   	
								</div>	
								<!-- <a id="btn_olvide_contrasena"
									data-toggle="modal"
									href="#"
									data-target="#modalOlvideContrasenia"
									class="btn btn-link-login"
									onclick="javascript: abrirOlvideContrasenia();"
									>
										Olvidé mi contraseña
								</a> -->
							</div>
							<div style="display: none;">
								<a id="btn_registrar"
									data-toggle="modal"
									href="#"
									data-target="#modalDireccion"
									class="btn btn-link"
									onclick="javascript: abrirRegistrarDireccion();"
									>
								</a>
							</div>	
						</div>					
						
					<!-- 	<div class="loginv2-registro">
							<div class="title">¿Aún no te has registrado? <br> ¡Hazlo ahora!</div>
							<div style="margin-top: 15px;" >
								<a data-toggle="modal"
									href="#"
									data-target="#modalRegistro"
									class="btn btn-primary"
									onclick="javascript: abrirRegistrarClientes();"
									>
										Regístrate
								</a>
							</div>
						</div> -->
					</div>
		
					<div class="loginv2-footer color-bg-login-transaparent text-center">
						<div style="font-size: 11px; margin-bottom: 10px; margin-top: 10px;">
							Haz clic <a style="cursor: pointer;" id="link-content-navegadores" data-toggle="modal" data-target="#content-navegadores">AQUÍ</a> para ver los navegadores soportados.		
						</div>
						<div class="footer-signature">
							<!-- <a target="blank" class="footer" id="tycfooter" onclick="$('#link-content-tycgenerales').click();">
								<span id="link-tycfooter" style="cursor: pointer;">Términos y condiciones</span> </a> --> 
								<strong>RIMAC Seguros y Reaseguros</strong> . Todos los derechos reservados.			
						</div>
						<div style="display: none;">
							<%@include file="/html-commons/footerpage-default.jsp"%>
						</div>
					</div>
				</div>
			</div>			
		
		</div>

		<div id="inicioLog"></div>
			
		<div class="modal fade"
				id="modalRegistro"
				role="dialog"
				aria-labelledby="Registrate"
				aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="idmodalRegistro"  class="modal-body"></div>
	    		</div>
			</div>	  			 
		</div>
		
		<div class="modal fade"
				id="modalOlvideContrasenia"
				tabindex="-1"
				role="dialog"
				aria-labelledby="olvide mi contrasenia"
				aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="idmodalOlvideContrasenia" class="modal-body"></div>
				</div>
			</div>
		</div>
		
		<%-- INI MODAL LOADING --%>
		<a id="link-content-cargando"
			data-toggle="modal" 
			data-target="#content-cargando"
			style="display: none;">
		</a>
		
		<div id="content-cargando" 
				class="modal fade" 
				tabindex="-1" 
				role="dialog" 
				aria-hidden="true"			
				data-backdrop="static" 
		  		data-keyboard="false">
			<div class="modal-cargando">
				<div class="modal-content">	
					<div class="gif_animation">					
						<img src="<%=request.getContextPath()%>/img/rimac/loading.gif">
					</div>
				</div>
			</div>		  	
		</div>
		<%-- FIN MODAL LOADING --%>
		
		<%-- INI MODAL MENSAJES--%>
		<a id="link-content-mensaje"
			data-toggle="modal" 
			data-target="#content-mensaje"
			style="display: none;">
		</a>
		
		<div id="content-mensaje" 
				class="fade"
				role="dialog" 
				aria-hidden="true"
		  		style="display: none;">			
			<div class="modal-mensaje">
				<div class="modal-content">	
					<span style="color: white; font-weight: bold; display: block; padding: 5px; width: auto; text-align: center; background-color: rgb(231, 40, 24);">
						<span id="titulo-mensaje"></span>
						<button id="btnclosemodal" type="button" class="close-white" data-dismiss="modal" aria-hidden="true">&times;</button>
					</span>									
					<span id="contenido-mensaje" style="text-align: center; width: auto; display: block; padding: 15px;"></span>
				</div>
			</div>		  	
		</div>
		<%-- FIN MODAL MENSAJES--%>			
	
	</div>	
	</form>
    </body>
</html>