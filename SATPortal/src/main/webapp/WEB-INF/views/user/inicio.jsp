<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html  lang="es">
	<meta name="_csrf" content="${_csrf.token}" />
	<meta name="_csrf_header" content="${_csrf.headerName}" />
	<head>
		<c:import url="/html-commons/head.jsp" />		
	</head>
	<script>VP_GO_ZONA = '/zonaprivada';</script>
	<script src="<%=request.getContextPath()%>/js/rimac/googletagmanager.js"></script>
	
	<body>	
		 	
		<!-- Google Tag Manager -->
		<c:import url="/html-commons/gtm-main.jsp" />
		<!-- End Google Tag Manager -->
		
		<c:import url="/html-commons/containers-modal.jsp" />
		
		<div class="container-body">
			<c:import url="/html-commons/headpage-default.jsp" />
			
			<div id="container" class="container-fluid">	
				<c:import url="/html-commons/menu-principal.jsp" />
				
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
	        
			<c:import url="/html-commons/footerpage-default.jsp" />

		</div>
		
		<div id="divLayer" class="divFlotante" style="display:none" >
              <div id="loading-misseguros"></div>
        </div>
				
	</body>	
</html>