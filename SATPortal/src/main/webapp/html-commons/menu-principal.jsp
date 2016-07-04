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

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
					data-url="/serviceUser/reclamos-mis-reclamos" 
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
