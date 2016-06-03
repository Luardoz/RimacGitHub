<%@ page language="java" contentType="text/html; charset=utf-8" %>
<% 	
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	response.setHeader( "Pragma", "no-cache" );
   	response.setHeader( "Cache-Control", "no-cache" );
   	response.setDateHeader( "Expires", 0 );
%>

<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="es"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7 oldie" lang="es"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 oldie" lang="es"> <![endif]-->
<!--[if gt IE 8]><!-->

<html  lang="es">
<!--<![endif]-->
	<head>
		<%@include file="/html-commons/head.jsp"%>		
	</head>
	<script>VP_GO_ZONA = '/zonaprivada';</script>
	<script src="<%=request.getContextPath()%>/js/rimac/googletagmanager.js"></script>
	
	<body>	
		 	
		<!-- Google Tag Manager -->
		<%@include file="/html-commons/gtm-main.jsp"%>
		<!-- End Google Tag Manager -->
		
		<%@include file="/html-commons/containers-modal.jsp"%>
		
		<div class="container-body">
			<div id="idletimeout" style="display: none; text-align: center; background-color: #e6281e; color: white;">
				Tu sesión expirará en <span><!-- countdown place holder --></span>&nbsp;segundos por inactividad en la web. 
				<a id="idletimeout-resume" href="#" style="color: white;text-decoration: underline;">Haz clic aqui si deseas continuar usando la web</a>.
			</div>
			<%@include file="/html-commons/headpage-default.jsp" %>
			
			<div id="container" class="container-fluid">	
				<%@include file="/html-commons/menu-principal.jsp"%>
				
				<div class="row">
					<div class="col-xs-2"></div>
					<div class="col-xs-12 col-md-10">
						
						<div id="content-breadcrumb" style="padding-left:30px; display: none;">
							<ul id="breadcrumb_list" class="breadcrumb">
							</ul>
						</div>
												
						<div class="content-rws"></div>
					</div>
				</div>
			</div>
	        
			<%@include file="/html-commons/footerpage-default.jsp"%>

		</div>
		
		<div id="divLayer" class="divFlotante" style="display:none" >
              <div id="loading-misseguros"></div>
        </div>
	   
		<script>
	
			$().ready(function(){ 
				loadModalCargando();

				obtDatosUsuarioSesion();

				loadSesionInicial();

				opObtenerDatosPersona();
					
				if(CTE_RESP_VAL_LOGIN != RSP_LOGIN_PRIMER_LOGIN && CTE_RESP_VAL_LOGIN != RSP_LOGIN_REG_DIRECCION)
					$(".content-rws").load("/PORTALWEB/perfil.do?method=goDashboard", function(){						
					});		
			});
			
		</script>
		
   		<script type="text/javascript">
			$.idleTimeout('#idletimeout', '.container-body', {
				idleAfter				: 1200,
				pollingInterval			: 300,
				keepAliveURL			: '/PORTALWEB/perfil.do?method=obtDatosUsuarioSesion',
				serverResponseEquals	: 'OK',
				onTimeout				: function(){
											$(this).slideUp();
											window.location = "/PORTALWEB";
				},
				onIdle					: function(){
											$(this).slideDown(); // show the warning bar
				},
				onCountdown				: function( counter ){
											$(this).find("span").html( counter ); // update the counter
				},
				onResume				: function(){
											$(this).slideUp(); // hide the warning bar
				}
			});

// 			$("#idletimeout-resume").bind("click", function(e){
// 				$('#idletimeout').slideUp();
// 			});
			
		</script>
				
	</body>	
</html>
