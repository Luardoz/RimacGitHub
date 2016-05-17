<div id="aside">
	<div class="row">
		<ul class="menu panel-group" id="accordion">
			
			<li class="panel">
				<a href="#" 
					id="panelSeguros"
					data-url="/PORTALWEB/misseguros.do?method=goMisSeguros" 
					data-toggle="collapse" 
					data-parent="#accordion" 
					data-target="#seguros">
					<i class="ui-icn-mis-seguros"></i>Mis seguros
				</a>				
			</li>
			<!-- INI - EHUAMANIM - 10/03/2016 -->
			<li class="panel">
			    <a href="#" 
			    	id="panelPerfil"
			    	data-toggle="collapse" 
			    	data-parent="#accordion" 
			    	data-target="#miperfil">
			        <i class="ui-icn-mi-perfil"></i>Mi Perfil <i class="arrow"></i>
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
			        </ul>
			    </div>
			</li>		
			<!-- FIN - EHUAMANIM - 10/03/2016 -->			
		</ul>
	</div>
	
	<script>
		bindBreadcrumb();
	</script>
</div>