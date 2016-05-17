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

	<c:url var="loginUrl" value="/login" />                      
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
					<span class="title">
						<span>
							<h1 style="border: medium none; font-size: 26px; color: rgb(105, 109, 115) ! important; font-weight: 300;">Bienvenido a tu cuenta en RIMAC</h1>
						</span>
						<span style="font-size: 20px;">
							Actualiza tus datos para poder comunicarnos contigo cuando más lo necesites
						</span>
					</span>
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
											placeholder="Nro. de documento">
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
								   			<span id="msj-result-login">Credenciales invalidas. Por favor vuelve a ingresar</span>
										</div>
									</div>			   								   	
							   	</div>
						   	 </c:if>
						   	<input type="hidden" name="${_csrf.parameterName}"   value="${_csrf.token}" />
							<div style="margin-top: 15px;">
								<input class="btn btn-primary" type="submit" value="Ingresar">
								</br></br>
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
								<a id="btn_olvide_contrasena"
									data-toggle="modal"
									href="#"
									data-target="#modalOlvideContrasenia"
									class="btn btn-link-login"
									onclick="javascript: abrirOlvideContrasenia();"
									>
										Olvidé mi contraseña
								</a>
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
						
						<div class="loginv2-registro">
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
						</div>
					</div>
		
					<div class="loginv2-ventajas-cotainer">
						<div class="title">Descubre todo lo que tenemos para ti.</div>
		
						<div class="loginv2-ventajas">
							<div class="loginv2-ventaja">
								<span class="ventaja-image icon-detalle"></span>
								<span class="ventaja-descripcion">Consulta el detalle de tus coberturas.</span>
							</div>
							<div class="loginv2-ventaja">
								<span class="ventaja-image icon-emergencia"></span>
								<span class="ventaja-descripcion">Solicita nuestros servicios en caso de emergencia vehicular.</span>
							</div>
							<div class="loginv2-ventaja">
								<span class="ventaja-image icon-clinica"></span>
								<span class="ventaja-descripcion">Encuentra clínicas donde atenderte y <br> talleres mecánicos para tu auto.</span>
							</div>
							<div class="loginv2-ventaja">
								<span class="ventaja-image icon-alerta"></span>
								<span class="ventaja-descripcion">Configura tus alertas de pago.</span>
							</div>
							<div class="loginv2-ventaja">
								<span class="ventaja-image icon-medica"></span>
								<span class="ventaja-descripcion">Realiza consultas médicas en línea.</span>
							</div>
							<div class="loginv2-ventaja">
								<span class="ventaja-image icon-actualizar"></span>
								<span class="ventaja-descripcion">Actualiza tus datos.</span>
							</div>
						</div>
					</div>
		
					<div class="loginv2-footer color-bg-login-transaparent text-center">
						<div style="font-size: 11px; margin-bottom: 10px; margin-top: 10px;">
							Haz clic <a style="cursor: pointer;" id="link-content-navegadores" data-toggle="modal" data-target="#content-navegadores">AQUÍ</a> para ver los navegadores soportados.		
						</div>
						<div class="footer-signature">
							<a target="blank" class="footer" id="tycfooter" onclick="$('#link-content-tycgenerales').click();">
								<span id="link-tycfooter" style="cursor: pointer;">Términos y condiciones</span> </a> <strong>-
								RIMAC Seguros y Reaseguros</strong> . Todos los derechos reservados.			
						</div>
						<div style="display: none;">
							<%@include file="/html-commons/footerpage-default.jsp"%>
						</div>
					</div>
				</div>
			</div>			
		
		</div>
		<%--
		<div id="footer" class="color-bg-login-transaparent">
			<div class="footer-signature">
				<%@include file="/html-commons/footerpage-default.jsp"%>
			</div>
		</div>
		--%>
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
		
		<%-- INI CONTENT TYC DATOS --%>
		<a id="link-content-tycdatos"
			data-toggle="modal" 
			data-target="#content-tycdatos"
			style="display: none;">
		</a>
		
		<div id="content-tycdatos" 
				class="fade" 
				tabindex="-1" 
				role="dialog" 
				aria-hidden="true"
				style="display: none;">			
			<div class="modal-tyc">		      
				<div class="modal-content">
					<span  style="color: white; font-weight: bold; display: block; padding: 5px; width: auto; text-align: center; background-color: rgb(231, 40, 24);">
						<span id="titulo-modal">Condiciones</span>
						<button id="btnclosemodal" type="button" class="close-white" data-dismiss="modal" aria-hidden="true">&times;</button>
					</span>
					<div id="contenido-modal" style="text-align: justify; width: auto; display: block; padding: 15px;">
						<span>
							El Contratante y/o Asegurado manifiesta su aceptación expresa para que las comunicaciones relacionadas con su póliza de seguros puedan ser remitidas a la dirección de correo electrónico señalada por éste.
						</span>
						<br><br>
						<span>
							Instrucciones de uso del correo electrónico:
						</span>
						<br><br>
						<ul>
							<li>i) En caso el Contratante y/o Asegurado no pueda abrir o leer los archivos adjuntos al correo o modifique / anule su dirección de correo electrónico, deberá informar dichas situaciones a: atencionalcliente@rimac.com.pe, o comunicándose al 411-3000; <br><br></li>
							
							<li>ii) El Contratante y/o Asegurado deberá abrir y leer detenidamente las comunicaciones electrónicas, sus archivos y links adjuntos, revisar constantemente sus bandejas de entrada y de correos no deseados, la política de filtro o bloqueo de su proveedor de servicio de correo electrónico y no bloquear nunca al remitente atencionalcliente@rimac.com.pe.</li>
						</ul>
						<br>
						<span>
							<b>Ley 29733 – Ley de Protección de Datos Personales y su Reglamento:</b>
						</span>
						<br><br>
						<span>
							De conformidad con lo establecido en la Ley N° 29733 - Ley de Protección de Datos Personales y su Reglamento, quien suscribe el presente documento, queda informado y da su consentimiento libre, previo, expreso, inequívoco e informado, para el tratamiento y transferencia, nacional e internacional de sus datos personales al banco de datos de titularidad de RIMAC SEGUROS Y REASEGUROS (“La Aseguradora”), que estará ubicado en sus oficinas a nivel nacional que, conjuntamente con cualquier otro dato que pudiera facilitarse a lo largo de la relación jurídica y aquellos obtenidos en fuentes accesibles al público, se tratarán con las finalidades de analizar las circunstancias al celebrar contratos con La Aseguradora, gestionar la contratación y evaluar la calidad del servicio. Asimismo, La Aseguradora utilizará los datos personales con fines comerciales, y publicitarios a fin de remitir información sobre productos y servicios que La Aseguradora considere de su interés.
							Los datos proporcionados serán incorporados, con las mismas finalidades, a las bases de datos de RIMAC SEGUROS Y REASEGUROS y/u otras empresas subsidiarias, filiales, asociadas, afiliadas o miembros del Grupo Económico al cual pertenece y/o terceros con los que éstas mantengan una relación contractual.
							Los datos suministrados son esenciales para las finalidades indicadas. Las bases de datos donde ellos se almacenan cuentan con estrictas medidas de seguridad. En caso se decida no proporcionarlos, no será posible la prestación de servicios por parte La Aseguradora.
							Conforme a Ley, el titular de la información está facultado a ejercitar los derechos de información, acceso, rectificación, supresión o cancelación y oposición que se detallan en la Ley N° 29733 - Ley de Protección de Datos Personales y su Reglamento, mediante comunicación dirigida RIMAC SEGUROS Y REASEGUROS.				
						</span>
					</div> 
		
				</div>
			</div>		  		
		</div>
		<%-- FIN CONTENT TYC DATOS --%>
		
		<%-- INI CONTENT POLITICA DE PROTECCION DE DATOS PERSONALES --%>
		<a id="link-content-protdatos"
			data-toggle="modal" 
			data-target="#content-protdatos"
			style="display: none;">
		</a>
		
		<div id="content-protdatos" 
				class="fade" 
				tabindex="-1" 
				role="dialog" 
				aria-hidden="true"
				style="display: none;">			
			<div class="modal-tyc">		
				<div class="modal-content">
					<span  style="color: white; font-weight: bold; display: block; padding: 5px; width: auto; text-align: center; background-color: rgb(231, 40, 24);">
						<span id="titulo-modal">Política de Protección de Datos Personales </span>
						<button id="btnclosemodal" type="button" class="close-white" data-dismiss="modal" aria-hidden="true">&times;</button>
					</span>
					<div id="contenido-modal" style="text-align: justify; width: auto; display: block; padding: 15px;">
						<span>
							<b>Ley 29733 – Ley de Protección de Datos Personales y su Reglamento:</b>
						</span>
						<br><br>
						<span>
							De conformidad con lo establecido en la Ley N° 29733 - Ley de Protección de Datos Personales y su Reglamento, quien suscribe el presente documento, 
							queda informado y da su consentimiento libre, previo, expreso, inequívoco e informado, para el tratamiento y transferencia, nacional e internacional 
							de sus datos personales consignados en la web http://www.rimac.com.pe al banco de datos de titularidad de RIMAC SEGUROS Y REASEGUROS (“La Aseguradora”), 
							que estará ubicado en sus oficinas a nivel nacional que, conjuntamente con cualquier otro dato que pudiera facilitarse a lo largo de la relación jurídica 
							y aquellos obtenidos en fuentes accesibles al público, se tratarán con las finalidades de analizar las circunstancias al celebrar contratos con La Aseguradora, 
							gestionar la contratación y evaluar la calidad del servicio. Asimismo, La Aseguradora utilizará los datos personales con fines comerciales, y publicitarios a 
							fin de remitir información sobre productos y servicios que La Aseguradora considere de su interés. 				
						</span>
						<br><br>
						<span>
							Los datos proporcionados serán incorporados, con las mismas finalidades, a las bases de datos de RIMAC SEGUROS Y REASEGUROS y/u otras empresas subsidiarias, 
							filiales, asociadas, afiliadas o miembros del Grupo Económico al cual pertenece y/o terceros con los que éstas mantengan una relación contractual. 
						</span>
						<br><br>
						<span>
							Los datos suministrados son esenciales para las finalidades indicadas. Las bases de datos donde ellos se almacenan cuentan con estrictas medidas de seguridad. 
							En caso se decida no proporcionarlos, no será posible la prestación de servicios por parte La Aseguradora. 
						</span>
						<br><br>
						<span>
							Conforme a Ley, el titular de la información está facultado a ejercitar los derechos de información, acceso, rectificación, supresión o cancelación y oposición 
							que se detallan en la Ley N° 29733 - Ley de Protección de Datos Personales y su Reglamento, mediante comunicación dirigida RIMAC SEGUROS Y REASEGUROS.
						</span>
					</div> 
		
				</div>
			</div>		  		
		</div>
		<%-- FIN CONTENT POLITICA DE PROTECCION DE DATOS PERSONALES --%>
		
		<%-- INI CONTENT POLITICA DE COMUNICACIÓN POR CORREO ELECTRÓNICO --%>
		<a id="link-content-commail"
			data-toggle="modal" 
			data-target="#content-commail"
			style="display: none;">
		</a>
		
		<div id="content-commail" 
				class="fade" 
				tabindex="-1" 
				role="dialog" 
				aria-hidden="true"
				style="display: none;">			
			<div class="modal-usomail">		      
				<div class="modal-content">
					<span  style="color: white; font-weight: bold; display: block; padding: 5px; width: auto; text-align: center; background-color: rgb(231, 40, 24);">
						<span id="titulo-modal">Política de comunicación por correo electrónico</span>
						<button id="btnclosemodal" type="button" class="close-white" data-dismiss="modal" aria-hidden="true">&times;</button>
					</span>
					<div id="contenido-modal" style="text-align: justify; width: auto; display: block; padding: 15px;">
						<span>
							El Contratante y/o Asegurado manifiesta su aceptación expresa para que las comunicaciones relacionadas con su póliza de seguros puedan ser remitidas a la dirección de correo electrónico señalada por éste. 
						</span>
						<br><br>
						<span>
							Instrucciones de uso del correo electrónico: 
						</span>
						<br><br>
						<ul>
							<li>i) En caso el Contratante y/o Asegurado no pueda abrir o leer los archivos adjuntos al correo o modifique / anule su dirección de correo electrónico, deberá informar dichas situaciones a: atencionalcliente@rimac.com.pe, o comunicándose al 411-3000;  <br><br></li>
							
							<li>ii) El Contratante y/o Asegurado deberá abrir y leer detenidamente las comunicaciones electrónicas, sus archivos y links adjuntos, revisar constantemente sus bandejas de entrada y de correos no deseados, la política de filtro o bloqueo de su proveedor de servicio de correo electrónico y no bloquear nunca al remitente atencionalcliente@rimac.com.pe.</li>
						</ul>
					</div> 
				</div>
			</div>	  		
		</div>
		<%-- FIN CONTENT POLITICA DE COMUNICACIÓN POR CORREO ELECTRÓNICO --%>
		
		<%-- INI CONTENT TYC GENERALES --%>
		<a id="link-content-tycgenerales"
			data-toggle="modal" 
			data-target="#content-tycgenerales"
			style="display: none;">
		</a>
		
		<div id="content-tycgenerales" 
				class="fade" 
				tabindex="-1" 
				role="dialog" 
				aria-hidden="true"
				style="display: none;">			
		<div class="modal-tyc-gen">		      
			<div class="modal-content">
				<span  style="color: white; font-weight: bold; display: block; padding: 5px; width: auto; text-align: center; background-color: rgb(231, 40, 24);">
					<span id="titulo-modal">TÉRMINOS Y CONDICIONES</span>
					<button id="btnclosemodal" type="button" class="close-white" data-dismiss="modal" aria-hidden="true">&times;</button>
				</span>
				<div id="contenido-modal" style="text-align: justify; width: auto; display: block; padding: 15px;">
					<span>
						<b>INFORMACIÓN ENTREGADA A RÍMAC SEGUROS</b>
					</span>
					<br><br>
					<span>
						Ley 29733 – Ley de Protección de Datos Personales y su Reglamento: 
					</span>
					<br><br>
					<span>
						De conformidad con lo establecido en la Ley N° 29733 - Ley de Protección de Datos Personales y su Reglamento, quien suscribe el presente documento, queda informado y da su consentimiento libre, previo, expreso, inequívoco e informado, para el tratamiento y transferencia, nacional e internacional de sus datos personales consignados en la web http://www.rimac.com.pe al banco de datos de titularidad de RIMAC SEGUROS Y REASEGUROS (“La Aseguradora”), que estará ubicado en sus oficinas a nivel nacional que, conjuntamente con cualquier otro dato que pudiera facilitarse a lo largo de la relación jurídica y aquellos obtenidos en fuentes accesibles al público, se tratarán con las finalidades de analizar las circunstancias al celebrar contratos con La Aseguradora, gestionar la contratación y evaluar la calidad del servicio. Asimismo, La Aseguradora utilizará los datos personales con fines comerciales, y publicitarios a fin de remitir información sobre productos y servicios que La Aseguradora considere de su interés. 
					</span>
					<br><br>
					<span>
						Los datos proporcionados serán incorporados, con las mismas finalidades, a las bases de datos de RIMAC SEGUROS Y REASEGUROS y/u otras empresas subsidiarias, filiales, asociadas, afiliadas o miembros del Grupo Económico al cual pertenece y/o terceros con los que éstas mantengan una relación contractual.
					</span>
					<br><br>
					<span>
						Los datos suministrados son esenciales para las finalidades indicadas. Las bases de datos donde ellos se almacenan cuentan con estrictas medidas de seguridad. En caso se decida no proporcionarlos, no será posible la prestación de servicios por parte La Aseguradora. 
					</span>
					<br><br>
					<span>
						Conforme a Ley, el titular de la información está facultado a ejercitar los derechos de información, acceso, rectificación, supresión o cancelación y oposición que se detallan en la Ley N° 29733 - Ley de Protección de Datos Personales y su Reglamento, mediante comunicación dirigida RIMAC SEGUROS Y REASEGUROS. 
					</span>
					<br><br>
					<span>
						<b>DERECHOS DE AUTOR: RIMAC INTERNACIONAL SE RESERVA TODOS LOS DERECHOS</b>
					</span>
					<br><br>
					
					<span>
						Este sitio Web se encuentra protegido por la normativa vigente sobre derechos de autor. Los derechos de autor en las páginas, en las pantallas que muestran las páginas, y en la información y materiales allí contenidos, así como la forma en que la información y los materiales están dispuestos, pertenecen a RIMAC Seguros y Reaseguros S.A. y RIMAC Entidad Prestadora de Salud, en adelante “RIMAC”, a menos que se indique algo distinto. En tal sentido, se encuentra expresamente prohibido, el empleo, modificación, reproducción, distribución o cualquier otro acto de disposición de los derechos de autor involucrados sin el consentimiento expreso de RIMAC, salvo en los casos permitidos por ley. 
					</span>
					<br><br>
					
					<span>
						<b>DERECHOS DE PROPIEDAD INTELECTUAL - MARCAS REGISTRADAS</b>
					</span>
					<br><br>
					
					<span>
						RIMAC declara que “RIMAC Seguros y Reaseguros”, “RIMAC S.A. Entidad Prestadora de Salud”, “RIMAC Contigo”, “Aló RIMAC”, “RIMAC Soat” y “E-Taller RIMAC” son marcas de su exclusiva propiedad y se encuentran registradas en el Perú. RIMAC también reclama derechos sobre otras marcas registradas y marcas de servicio contenidas en este sitio Web. En tal sentido, se encuentra expresamente prohibido que dichas marcas sean copiadas, reproducidas, modificadas o utilizadas de cualquier manera que se afecten los derechos de propiedad intelectual que RIMAC tiene sobre ellas. 
					</span>
					<br><br>
					
					<span>
						<b>USO DE INFORMACIÓN Y DE MATERIALES</b>
					</span>
					<br><br>
					
					<span>
						La información y los materiales contenidos en este sitio Web y cualquiera de sus páginas, así como los Términos y Condiciones que aquí aparecen se encuentran sujetos a cambios. RIMAC declara que realiza los mayores esfuerzos para brindar la información actualizada y exacta. Sin perjuicio de lo anterior, durante los procesos de actualización de la información de este sitio Web, los usuarios tendrán a su disposición las plataformas de atención al usuario y las centrales telefónicas de atención al cliente en donde podrán recibir toda la información actualizada de los productos y servicios que RIMAC ofrece. Se prohíbe estrictamente el uso no autorizado de este sitio Web y de los sistemas de RIMAC; incluyendo, pero no limitándose, al uso inapropiado de los nombres de usuarios y las contraseñas o de cualquier información que se presente en este sitio Web y cualquiera de sus páginas. Los productos y servicios mencionados en este sitio Web no están todos disponibles en todas las áreas geográficas, para tal efecto el usuario podrá consultar la disponibilidad de los productos a través de cualquiera de los canales de atención al cliente que RIMAC posee. La elegibilidad o asegurabilidad de cualquier persona o bien para productos y servicios mencionados en este sitio Web está sujeta a la determinación final de RIMAC.
					</span>
					<br><br>
					
					<span>
						<b>RESPONSABILIDAD DEL USUARIO</b>
					</span>
					<br><br>
					
					<span>
						Para el ingreso a la zona privada de clientes, es obligatorio completar el formulario de registro en todos sus campos con datos válidos para poder crear una cuenta en este sitio Web. El Usuario asume el compromiso de actualizar los datos personales conforme resulte necesario. Los Usuarios garantizan y responden, en cualquier caso, por la veracidad, exactitud, vigencia y autenticidad de los datos personales ingresados. El Usuario accederá a su cuenta personal mediante el ingreso de su nombre y clave de seguridad personal elegida (Contraseña). El Usuario se obliga a mantener la confidencialidad de su Clave de Seguridad. La Cuenta es personal, única e intransferible. El Usuario será responsable por el manejo de su Cuenta, pues el acceso a la misma está restringido al ingreso y uso de su Clave de Seguridad, de conocimiento exclusivo del Usuario. El Usuario se compromete a notificar a RIMAC en forma inmediata y por medio idóneo y fehaciente, cualquier uso no autorizado de su Cuenta, así como el ingreso por terceros no autorizados a la misma.
					</span>
					<br><br>
					
					<span>
						<b>ENLACES</b>
					</span>
					<br><br>
					
					<span>
						Este sitio Web puede contener enlaces a otros sitios Web controlados u ofrecidos por terceras personas (no relacionadas con RIMAC). RIMAC declara que no se hace responsable en relación a ninguna información, materiales, productos o servicios que aparezcan o que se ofrezcan en cualquiera de los sitios pertenecientes a terceras personas con enlaces a este sitio Web. Al crear un enlace al sitio Web de una tercera persona, RIMAC no apoya ni recomienda ningún producto o servicio que ésta ofrezca, ni tampoco ninguna información que ésta contenga. Tales sitios Web pueden tener unas condiciones y términos de uso y política de privacidad distinta a la de RIMAC así como proveer menos seguridad de la que ofrece el sitio Web de RIMAC.
					</span>
					<br><br>
					
					<span>
						<b>LÍMITES DE RESPONSABILIDAD POR FALLAS INFORMATICAS Y AFINES</b>
					</span>
					<br><br>
					
					<span>
						En ningún caso RIMAC se hará responsable por alguna clase de daño directo o indirecto, incidentales, pérdidas o gastos que surjan en relación a este sitio Web, o a cualquier otro sitio Web enlazado a éste, o en conexión al uso de éstos, debido a la falta de capacidad para usarlos o al mal manejo que pudiera realizar cualquier persona, debido a cualquier, interrupción, defecto, virus de computadora, demora en la operación, transición o falla del sistema.
					</span>
					<br><br>
					<!-- 
					<span>
						<b>INFORMACIÓN ENTREGADA A RÍMAC SEGUROS</b>
					</span>
					<br><br>
					
					<span>
						Ley N° 29733 - Ley de Protección de Datos Personales
						<br>
						De conformidad con lo establecido en la Ley N° 29733 - Ley de Protección de Datos Personales y su Reglamento, el usuario queda informado y da su consentimiento libre, previo, expreso, inequívoco e informado, para el ingreso y tratamiento nacional y/o internacional de sus datos personales consignados en la web http://www.rimac.com.pe, al banco de datos de titularidad de RIMAC SEGUROS Y REASEGUROS (“La Aseguradora”), que estará ubicado en sus oficinas a nivel nacional que, conjuntamente con cualquier otro dato que pudiera facilitarse a lo largo de la relación jurídica que entablen y aquellos obtenidos en fuentes accesibles al público, se tratarán con las finalidades de analizar las circunstancias al celebrar contratos con La Aseguradora, gestionar la contratación de ser el caso y evaluar la calidad del servicio. Asimismo, La Aseguradora utilizará los datos personales con fines comerciales, y publicitarios a fin de remitir información sobre productos y servicios que La Aseguradora considere de su interés.
						<br>
						Los datos proporcionados serán incorporados, con las mismas finalidades, a las bases de datos de RIMAC SEGUROS Y REASEGUROS y/u otras empresas subsidiarias, filiales, asociadas, afiliadas o miembros del Grupo Económico al cual pertenece y/o terceros con los que éstas mantengan una relación contractual.
						<br>
						Los datos suministrados son esenciales para las finalidades indicadas. Las bases de datos donde ellos se almacenan cuentan con estrictas medidas de seguridad. En caso se decida no proporcionarlos, no será posible la prestación de servicios por parte La Aseguradora.
						<br>
						Conforme a Ley, el titular de la información está facultado a ejercitar los derechos de información, acceso, rectificación, supresión o cancelación y oposición que se detallan en la Ley N° 29733 - Ley de Protección de Datos Personales y su Reglamento, mediante comunicación dirigida RIMAC SEGUROS Y REASEGUROS.
					</span>
					<br><br>
					 -->
					<span>
						<b>DISPONIBILIDAD</b>
					</span>
					<br><br>
					
					<span>
						Se encuentra prohibido el uso de este sitio Web por parte de cualquier persona para fines contrarios a las normas de orden público.
					</span>
					<br><br>
					
					<span>
						<b>TÉRMINOS ADICIONALES</b>
					</span>
					<br><br>
					
					<span>
						Ciertas secciones o páginas de este sitio Web pueden contener términos y condiciones que sean adicionales a los presente Términos y Condiciones de Uso que aquí se mencionan. En caso de conflicto, los términos y condiciones adicionales prevalecerán en las secciones o páginas donde aparezcan. En el supuesto que alguna de las disposiciones contenidas en los presentes Términos y Condiciones de Uso sea declarado ilegal, inválido o nulo, el resto de términos quedara vigente y aplicable para cualquier supuesto.
					</span>
					<br><br>
					
					<span>
						<b>LAS LEYES QUE RIGEN</b>
					</span>
					<br><br>
					
					<span>
						El uso de este sitio Web se regirá por todas las leyes aplicables de la República del Perú.
					</span>
					<br><br>
				</div> 
	
			</div>
		</div>			  		
		</div>
		<%-- FIN CONTENT TYC GENERALES --%>		
	</div>	
	</form>
    </body>
</html>