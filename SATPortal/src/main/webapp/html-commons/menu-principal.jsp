<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="aside">
	<div class="row">
		<ul class="menu panel-group" id="accordion">
			
			<li class="panel" >
				<a 	href="#" 
					id="panelSeguros"
					data-url="serviceUser/reclamos-mis-reclamos" 
					data-toggle="collapse" 
					data-parent="#accordion" 
					data-target="#seguros">
					<i class="ui-icn-mis-seguros"></i>Mis Tickets
				</a>				
			</li>
			
			<li class="panel">
				<a href="#" 
				    id="panelReclamos"
				    <%--data-url="pages/servicios-salud/clinicas"--%> 
					data-toggle="collapse" 
					data-parent="#accordion" 
					data-target="#reclamos"  >
					<i class="ui-icn_reclamos"></i>Tickets <i class="arrow"></i>
				</a>
				<div id="reclamos" class="collapse">
					<ul>
						<li>														 
							<a id="obtreclamos" href="#" data-url="<c:url value="/serviceUser/reclamos-registrar" />">Registrar Ticket</a>							
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
