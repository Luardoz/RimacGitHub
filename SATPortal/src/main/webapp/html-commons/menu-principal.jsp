<%--
<script type='text/javascript'>
  (function() {
    var proto  = 'http:';
    var trme   = document.createElement('script');
    trme.type  = 'text/javascript';
    trme.async = true;
    trme.src   = proto +  '//trackme-cls1-cgn-bct.i6.inconcertcc.com/inconcert/apps/trackme/js/tm.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(trme, s);
  })();
</script>
 
<script type='text/javascript'>
  (function() {
    var proto  = 'http:';
    var node   = document.createElement('script');
    node.type  = 'text/javascript';
    node.async = true;
    node.src   = proto +  '//webchat-cls1-cgn-bct.i6.inconcertcc.com/v2/click_to_chat?token=1277462B88711D612ECC577DDE697D2D&container_id=rimacChat';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(node, s);
  })();
</script>
--%>
<%-- <%@page import="rimac.portalweb.commons.Constants"%> --%>

<%@ page language="java" contentType="text/html; charset=utf-8"%>

<%-- <%
	if(session.getAttribute(Constants.REQ_ATTR_NRODOCUMENTO)== null)
		response.sendRedirect(request.getContextPath());	
%> --%>

<div id="aside">
	<div class="row">
		<ul class="menu panel-group" id="accordion">
			
			<li class="panel" >
				<a 	href="#" 
					id="panelSeguros"
					data-url="/PORTALWEB/misseguros.do?method=goMisSeguros" 
					data-toggle="collapse" 
					data-parent="#accordion" 
					data-target="#seguros">
					<i class="ui-icn-mis-seguros"></i>Tus seguros
				</a>				
			</li>
			
			<li class="panel">
				<a href="#" 
				    id="panelSalud"
				    <%--data-url="pages/servicios-salud/clinicas"--%> 
					data-toggle="collapse" 
					data-parent="#accordion" 
					data-target="#salud"  >
					<i class="ui-icn_servicios_salud"></i>Servicios de Salud <i class="arrow"></i>
				</a>
				<div id="salud" class="collapse">
					<ul>

						<li style="cursor: pointer;">
							<a id="lstMedicoOnline" onclick="javascript:abrirChatMedico();">Médico Online</a>
						</li>
						<li>
							<a href="#" id="lstClinicas" data-url="/PORTALWEB/clinicas.do?method=goMisClinicas">Buscador de Clínicas</a>
						</li>
						<%--
                        <li>
                        	<a href="#" id="lstReembMenu" data-url="../reembolsos.do?method=goReembolsos">Reembolsos</a>
                        </li>
                        <li>
                        	<a href="#" id="regReembMenu" data-url="../reembolsos.do?method=goRegistrarReembolsos">Registrar Reembolso</a>
                        </li>
                        <li>
                        	<a href="#" id="regCuentaBanco" data-url="../reembolsos.do?method=goRegistrarCuentaBancaria">Registrar Cuenta</a>
                        </li>
                        --%>
						<li>
							<a id="btn-Cartas-de-garantia" href="#" data-url="/PORTALWEB/cartasGarantia.do?method=goCartasGarantia">Carta de Garantía</a>
						</li>
						
					</ul>
				</div>
			</li>
			
			<li class="panel">
				<a href="#" 
					id="panelVehicular"
					<%--data-url="pages/servicios-vehiculos/emergencias"--%> 
					data-toggle="collapse" 
					data-parent="#accordion" 
					data-target="#segurovehicular">
					<i class="ui-icn_servicios_veh"></i>Servicios Vehiculares <i class="arrow"></i>
				</a>
				<div id="segurovehicular" class="collapse">   
					<ul>

						<li>
							<a href="#" id="lstTalleres" data-url="/PORTALWEB/talleres.do?method=goMisTalleres">Buscador de Talleres</a>
						</li>
						<li>
							<a href="#" id="obtConductor" data-url="/PORTALWEB/asistenciaveh.do?method=goConductor">Chofer de Reemplazo</a>
						</li>
						<li>
							<a href="#" id="obtSinistro" data-url="/PORTALWEB/asistenciaveh.do?method=goSiniestro">Choque o Robo</a>
						</li>
						
						<li>
							<a href="#" id="obtAuxilio" data-url="/PORTALWEB/asistenciaveh.do?method=goAuxilio">Auxilio Mecánico</a>
						</li>
						<li>
							<a href="#" id="obtGrua" data-url="/PORTALWEB/asistenciaveh.do?method=goGrua">Grúa</a>
						</li>
					</ul>
				</div>
			</li>
			
			<li class="panel">
			    <a href="#" 
			    	id="panelPerfil"
			    	<%--data-url="pages/mi-perfil/mi-perfil"--%> 
			    	data-toggle="collapse" 
			    	data-parent="#accordion" 
			    	data-target="#miperfil">
			        <i class="ui-icn-mi-perfil"></i>Tu Perfil <i class="arrow"></i>
			    </a>
			    <div id="miperfil" class="collapse">
			        <ul>
			            <li>
			                <a id="btn-Actualizar-datos" href="#" data-url="/PORTALWEB/perfil.do?method=goActualizaDatos">Actualiza tus datos</a>
			            </li>
			            <li>
			                <a id="btn-Cambio-contrasenia" href="#" data-url="/PORTALWEB/perfil.do?method=goCambioContrasenia">Cambio de Contraseña</a>
			            </li>
			            <li>			                
			                <a id="btn-Cambio-pregunta-secreta" href="#" data-url="/PORTALWEB/perfil.do?method=goCambioPreguntaSecreta">Pregunta de Seguridad</a>			                			                
			            </li>
			            <li>
			            	<a id="btn-Alertas" href="#" data-url="/PORTALWEB/alertas.do?method=goAlerta">Alertas de Pago</a>
			            </li>
			        </ul>
			    </div>
			</li>
			
			<li class="panel">
				<a href="#" 
					id="panelReclamos"
					<%--data-url="/PORTALWEB/reclamos.do?method=goMisReclamos"--%>  
					data-toggle="collapse" 
					data-parent="#accordion" 
					data-target="#reclamos">
					<i class="ui-icn_reclamos"></i>Reclamos <i class="arrow"></i>
				</a>				
				<div id="reclamos" class="collapse">
					<ul>												
						<li>														 
							<a id="obtreclamos" href="#" data-url="/PORTALWEB/portalweb.do?method=goReclamos">Registrar Reclamo</a>
						</li>	
						<li>														 
							<a id="btn-mis-reclamos" href="#" data-url="/PORTALWEB/portalweb.do?method=goMisReclamos">Mis Reclamos</a>
						</li>	
					</ul>
				</div>
			</li>
		</ul>
	</div>
	
	<script>
		bindBreadcrumb();
	</script>
</div>
