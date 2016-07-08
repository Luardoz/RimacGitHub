<%@ page language="java" contentType="text/html; charset=utf-8" %>
<% 	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");%>
<%@include file="reclamos-tareas_t.jsp"%> 
<%@include file="reclamos-registrar.jsp"%>
<div id="mis-reclamos" class="reclamos">
	<h3>Hola <span class="js-breadcump-nombreTitular"></span></h3>
	
	<p class="page-info-wc">
	A continuación te mostraremos los tickets que has ingresado hasta la fecha. Te informamos que de acuerdo a la normativa de la SBS, el tiempo de atención es de 30 días calendario; sin embargo, trata de enviar una respuesta en el menor tiempo posible.
    </p>
	
	<div class="form-mis-reclamos" id="frmMisReclamos">		
		<div class="group-table-reclamos" id="div-misreclamos">
		</div>
		<br> 
		    
        <div class="row visible-xs-block">
        	<div class="col-md-12">        	    
	            <div class="panel panel-default" style="margin-bottom: 10px;"> 
		        	<div class="list-group"  id="res-misreclamos">
		        	</div>
	            </div>
	            <input value="Historial de solicitudes" type="button" class="method-ajax btn btn-default" onclick="javascript:historialSol();">
			</div>
        </div>
		
		
		<div class="row" style="margin-top: 20px;">
			<div class="col-md-12">
				<p class="bg-info">
					<small>
						NOTA: La información que se muestra en "Mis Reclamos" es actualizada cada 24 horas.
					</small>
				</p>
			</div>
		</div>
	</div>
</div>

<div id="sin-reclamos" style="display:none;">
	<h3>Hola <span class="js-breadcump-nombreTitular"></span>,</h3>
	<p class="page-info-wc">
    A la fecha no tenemos ningún reclamo asociado a tu nombre.

    <p class="container-etiqueda-label">
		Si desea registrar un nuevo reclamo haga clic 		
		<span class="label label-danger label-default-dash">
			<a id='btn-reclamo-link' class='js-mis-seguros method-ajax' href='../portalweb.do?method=goReclamos'>AQUÍ</a>			
		</span>
	</p>
</div>

<script>
	$(document).ready(function() {
		
		var user = $("#nameTitularHeader").text();
		$(".js-breadcump-nombreTitular").html(user);

		$("#registro-reclamo-container").hide();
		$("#tareas-reclamo-container").hide();
		var nomTablaReclamos	= 'misreclamos';
		
		traerJsonCompletoMisReclamos(nomTablaReclamos);			
	});
</script>