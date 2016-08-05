<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");%>
<%@include file="reclamos-tareas_t.jsp"%> 
<%@include file="reclamos-registrar.jsp"%>
<div id="mis-reclamos" class="reclamos">
	<h3>Hola <span class="js-breadcump-nombreTitular"><c:out value="${sessionScope.user.nomTer} ${sessionScope.user.apePatter}" /></span></h3>
	<p class="page-info-wc">
	A continuación te mostraremos los tickets que has ingresado hasta la fecha.
    </p>
<!-- 	<p class="page-info-wc">
	A continuación te mostraremos los tickets que has ingresado hasta la fecha. Te informamos que de acuerdo a la normativa de la SBS, el tiempo de atención es de 30 días calendario; sin embargo, trata de enviar una respuesta en el menor tiempo posible.
    </p> -->
	
	<div class="form-mis-reclamos" id="frmMisReclamos">
		<fieldset style="border: 1px solid #eaeaea;border-radius: 4px;margin: 10px 0px 20px 0px;padding: 15px 0;">
			<!-- <legend>Datos de Busqueda</legend> -->
			<div class="form-group" style="overflow: visible;">
		        <label class="control-label col-xs-3" style="width: 15%;margin: 7px;">Estado:</label>
		        <div class="col-xs-3" style="margin: 0px 30px 0px -30px;">
		         <select title="" class="selectpicker form-control" id="idestado" name="idestado">
		         	<option value="">Seleccione</option>
		         	<c:forEach items="${lstEstado}" var="comboBox">
		                <option value="${comboBox.value}">${comboBox.descripcion}</option>
		            </c:forEach>
		         </select>		          
		        </div>
		        <div class="result"></div>
		    </div>	
			<div class="form-group" style="overflow: visible;">
		        <label class="control-label col-xs-3" style="width: 15%;">N° Ticket:</label>
		        <div class="col-xs-3">
		            <input title="" type="text" class="numbersOnly form-control" id="nticket" name="nticket" style="margin: -7px 0px 0px -10px;">		             
		        </div>
		        <div class="result"></div>
		    </div>
			<div class="col-xs-offset-3 col-xs-9" style="margin: -6px;width: 0">
				<!-- <a class='btn btn-primary' onclick='traerJsonCompletoMisReclamos();'
					id='linkBuscar'>Buscar</a> -->
					<input class="btn btn-primary" type="button" onclick='traerJsonCompletoMisReclamos();' value="Buscar" >
			</div>
		</fieldset>		
		<div class="group-table-reclamos" id="div-misreclamos">
			<div class="row visible-md-block visible-sm-block visible-lg-block">				
				<div class="table-responsive col-md-12">					
					<table id="table-misreclamos"
						class="table table-hover table-bordered table-inter text-center">
						<thead>
							<tr>
								<th class="text-center">N°</th>
								<th class="text-center">Título</th>
								<th class="text-center">Estado</th>
								<th class="text-center">Fecha Registro</th>
								<th class="text-center">Fecha Atención</th>
								<!-- <th class="text-center">Fecha Cierre</th> -->
								<th class="text-center">Tipo</th>
								<th class="text-center">Tareas</th>
							</tr>
						</thead>
						<tbody class="vcenter">
						</tbody>
					</table>					
					<!-- <div class="row" id="FilaBotones">
						<div class="col-md-12"></div>
					</div> -->
				</div>
			</div>

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
		
		
		<div class="row">
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
	<h3>Hola <span class="js-breadcump-nombreTitular">
	<%-- <c:out value="${sessionScope.user.nomTer} ${sessionScope.user.apePatter}" /> --%>
	</span>,</h3>
	<p class="page-info-wc">
    A la fecha no tenemos ningún reclamo asociado a tu nombre.

    <p class="container-etiqueda-label">
		Si desea registrar un nuevo reclamo haga clic 		
		<span class="label label-danger label-default-dash">
			<a id='btn-reclamo-link' class='js-mis-seguros method-ajax' href='serviceUser/reclamos-registrar'>AQUÍ</a>			
		</span>
	</p>
</div>

<script>
	$(document).ready(function() {		
		$('.numbersOnly').keyup(function () { 
		    this.value = this.value.replace(/[^0-9]/g,'');
		});
		
		var user = $("#nameTitularHeader").text();
		var nomTer = $("#nomTer").val();
		var apePatter = $("#apePatter").val();
		$(".js-breadcump-nombreTitular").html(nomTer + ' ' + apePatter);

		$("#registro-reclamo-container").hide();
		$("#tareas-reclamo-container").hide();
				
		traerJsonCompletoMisReclamos();			
	});
</script>