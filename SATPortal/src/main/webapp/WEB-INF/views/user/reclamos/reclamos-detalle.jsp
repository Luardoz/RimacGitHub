<!-- <form id="detalleReclamoForm" rol="form" enctype="multipart/form-data"> -->
<form id="detalleReclamoForm" enctype="multipart/form-data">
 		<div id="Paso1Rec" style="display:none">
			<div class="reclamos" id="divValidate">
				
					<h3>Datos del reclamante</h3>
					
			        <div class="panel panel-default">
			            
			            <div class="panel-body">
				            
				            <div class="column-formulario-reclamo" style="width: 100%; margin-top: 10px; margin-bottom: 10px; padding-left: 15px; padding-right: 15px;">
								<h4 style="margin: 0px;">Datos personales</h4>
								<hr style="margin: 0px; border-color: #dddddd;">	            
							</div>
								
							<div class="column-formulario-reclamo">
								
			                	<div>
			                        <div class="form-group form-group-reclamo">
			                            <label for="" class="col-md-5 control-label reclamos-content-maxim required">Tipo de Documento de Identidad: </label>
			                            <div class="col-md-7 reclamos-content-maxim">
			                                <select class="form-control" id="tipodoc_reclamante" name="tipodoc_reclamante"></select>
			                                <div class="result"></div>
			                            </div>
			                        </div>
			                    </div>
			            		
			            		<div>
			                        <div class="form-group form-group-reclamo">
			                            <label for="" class="col-md-5 control-label reclamos-content-maxim required">Número de Documento de Identidad:</label>
			                            <div class="col-md-7 reclamos-content-maxim">
			                                    <input type="text" id="numdoc_reclamante" name="numdoc_reclamante" class="form-control">
			                                    <div class="result"></div>
			                            </div>
			                        </div>
			                    </div>        
			                    
			                    <div>
			                       <div class="form-group form-group-reclamo">
			                           <label for="nombrereclamante" class="col-md-5 control-label reclamos-content-maxim required">Nombre:</label>
			                           <div class="col-md-7 reclamos-content-maxim">
			                                   <input type="text" id="nombrereclamante" name="nombrereclamante" class="form-control">
			                                   <div class="result"></div>
			                           </div>
			                       </div>
			                    </div>
			                    	
			                </div>
				                
			                <div class="column-formulario-reclamo">
				                	
			                	<div>
			                        <div class="form-group form-group-reclamo">
			                            <label for="appatreclamante" class="col-md-5 control-label reclamos-content-maxim required">Apellido paterno:</label>
			                            <div class="col-md-7 reclamos-content-maxim">
			                                    <input type="text" id="appatreclamante" name="appatreclamante" class="form-control">
			                                    <div class="result"></div>
			                            </div>
			                        </div>
			                   	</div>
				                         
			                	<div>
			                        <div class="form-group form-group-reclamo">
			                            <label for="apmatreclamante" class="col-md-5 control-label reclamos-content-maxim required">Apellido materno:</label>
			                            <div class="col-md-7 reclamos-content-maxim">
			                                    <input type="text" id="apmatreclamante" name="apmatreclamante" class="form-control">
			                                    <div class="result"></div>
			                            </div>
			                        </div>
			                   	</div>	 
			                </div>
				            
				            <div class="column-formulario-reclamo" style="width: 100%; margin-top: 10px; margin-bottom: 10px; padding-left: 15px; padding-right: 15px;">
								<h4 style="margin: 0px;">Dirección de contacto</h4>
								<hr style="margin: 0px; border-color: #dddddd;">	            
							</div>
								
			              	<div class="column-formulario-reclamo">
			                                      	 
								<div>
									<div class="form-group form-group-reclamo">
										<label for="idedepartamento" class="col-md-5 control-label reclamos-content-maxim required">Departamento</label>
				                    	<div class="col-md-7 reclamos-content-maxim" id="divdpto">
				                    	<!-- 
				                        	<select class="form-control" id="idedepartamento" name="idedepartamento" onchange="obtenerProvincias(this,'detalleReclamoForm #ideprovincia');"
				                        		data-rule-required="true" data-msg-required="El departamento es obligatorio" required></select>
				                        		 -->
				                        		<input type="text" id="idedepartamento" name="idedepartamento" class="form-control" readonly="readonly" data-msg-required="El departamento es obligatorio" required>		                        
				                        	<div class="result"></div>
				                    	</div>
				                   </div>
				               	</div>
					                
			                    <div>
									<div class="form-group form-group-reclamo">
										<label for="" class="col-md-5 control-label reclamos-content-maxim required">Provincia</label>
					                    <div class="col-md-7 reclamos-content-maxim">
					                    <!-- 
					                        <select class="form-control" id="ideprovincia" name="ideprovincia" onchange="obtenerDistritos(this,'detalleReclamoForm #idedistrito');"
				                         		data-rule-required="true" data-msg-required="La provincia es obligatorio" required></select>
				                         		 -->
				                         	<input type="text" id="ideprovincia" name="ideprovincia" class="form-control" readonly="readonly" data-msg-required="La provincia es obligatorio" required>			                        
				                         	<div class="result"></div>
					                    </div>
				                    </div>
				                </div>
				                
				                <div>
									<div class="form-group form-group-reclamo">
										<label for="" class="col-md-5 control-label reclamos-content-maxim required">Distrito</label>
					                    <div class="col-md-7 reclamos-content-maxim">
					                    <!-- 
					                        <select class="form-control" id="idedistrito" name="idedistrito" data-rule-required="true" data-msg-required="El distrito es obligatorio" required></select>
					                         -->
					                        <input type="text" id="idedistrito" name="idedistrito" class="form-control" readonly="readonly" data-msg-required="El distrito es obligatori" required>
					                        <div class="result"></div>                        
					                    </div>
				                    </div>
				                </div>
				                
				                <div>
									<div class="form-group form-group-reclamo">
			                        	<label for="" class="col-md-5 control-label reclamos-content-maxim">Urbanización:</label>
										<div class="col-md-7 reclamos-content-maxim">
											<input type="text" id="tipozona" name="tipozona" class="form-control">
											<div class="result"></div>
										</div>
									</div>
			                    </div>
			                	
			                	<div>
									<div class="form-group form-group-reclamo">
										<label for="" class="col-md-5 control-label reclamos-content-maxim required">Tipo via</label>
					                    <div class="col-md-7 reclamos-content-maxim">
					                        <select class="form-control" id="tipovia" name="tipovia"></select>
					                        <div class="result"></div>                        
					                    </div>
				                    </div>
				                </div>
				                    
								<div>
			                        <div class="form-group form-group-reclamo">
			                            <label for="" class="col-md-5 control-label reclamos-content-maxim required">Nombre via:</label>
			                            <div class="col-md-7 reclamos-content-maxim">
			                                    <input type="text" id="nomvia" name="nomvia" class="form-control">
			                                    <div class="result"></div>
			                            </div>
			                        </div>
			                    </div>
			                    
			                </div>
				                
			                <div class="column-formulario-reclamo">
			                    
			                    <div>
									<div class="form-group form-group-reclamo">
										<label for="" class="col-md-5 control-label reclamos-content-maxim required">Tipo Nº/Mza</label>
					                    <div class="col-md-7 reclamos-content-maxim">
					                        <select class="form-control" id="via" name="via"></select>
			                        		<div class="result"></div>                        
					                    </div>
				                    </div>
				                </div>
				                
				                <div>
			                        <div class="form-group form-group-reclamo">
			                            <label for="" class="col-md-5 control-label reclamos-content-maxim required">Número Nº/Mza:</label>
			                            <div class="col-md-7 reclamos-content-maxim">
			                                    <input type="text" id="nrovia" name="nrovia" class="form-control">
			                                    <div class="result"></div>
			                            </div>
			                        </div>
			                    </div>
				                
				                <div>
									<div class="form-group form-group-reclamo">
										<label for="" class="col-md-5 control-label reclamos-content-maxim required">Tipo Interior/Depto</label>
					                    <div class="col-md-7">
					                        <select class="form-control reclamos-content-maxim" id="tipointerior" name="tipointerior"></select>
					                        <div class="result"></div>                        
					                    </div>
				                    </div>
				                </div>
				            
				            	<div>
			                        <div class="form-group form-group-reclamo">
			                            <label for="" class="col-md-5 control-label reclamos-content-maxim required">Número Interior/Depto:</label>
			                            <div class="col-md-7 reclamos-content-maxim">
			                                    <input type="text" id="interior" name="interior" class="form-control">
			                                    <div class="result"></div>
			                            </div>
			                        </div>
			                    </div>        
			                	
			                	<div>
									<div class="form-group form-group-reclamo">
			                            <label for="" class="col-md-5 control-label reclamos-content-maxim">Lote:</label>
			                            <div class="col-md-7 reclamos-content-maxim">
			                                <input type="text" id="lote" name="lote" class="form-control">
			                                <div class="result"></div>
			                            </div>
			                        </div>
			                    </div>
				                    
			               	 	<div>
			                        <div class="form-group form-group-reclamo">
			                            <label for="" class="col-md-5 control-label reclamos-content-maxim">Referencia de domicilio:</label>
			                            <div class="col-md-7 reclamos-content-maxim">
			                                <input type="text" id="referencia" name="referencia" class="form-control">
			                                <div class="result"></div>
			                            </div>
			                        </div>
			                    </div>    
			                    
			                </div>
				                
							 <div class="column-formulario-reclamo" style="width: 100%; margin-top: 10px; margin-bottom: 10px; padding-left: 15px; padding-right: 15px;">
								<h4 style="margin: 0px;">Medios de contacto</h4>
								<hr style="margin: 0px; border-color: #dddddd;">	            
							</div>
							     
			                <div class="column-formulario-reclamo">
			                
			                	<div>
									<div class="form-group form-group-reclamo">
					                    <label for="" class="col-md-5 control-label reclamos-content-maxim">Teléfono fijo:</label>
				                        <div class="col-md-7 reclamos-content-maxim">
				    	                    <input type="text" id="telfijoreclamante" name="telfijoreclamante" class="form-control">
				                            <div class="result"></div>
				                        </div>			            
				                 	</div>
			                	</div>
					                
								<div>
									<div class="form-group form-group-reclamo">
			                      		<label for="" class="col-md-5 control-label reclamos-content-maxim required">Teléfono celular:</label>
			                      		<div class="col-md-7 reclamos-content-maxim">
			                          		<input type="text" id="telcelularreclamante" name="telcelularreclamante" class="form-control">
			                          		<div class="result"></div>
			                 			</div>
			               			</div>
			              		</div>
			              		
			                </div>
				                
			               	<div class="column-formulario-reclamo">
			               	
								<div>
									<div class="form-group form-group-reclamo">
								       	<label for="" class="col-md-5 control-label reclamos-content-maxim required">Email:</label>
							           	<div class="col-md-7 reclamos-content-maxim">
						              		<input type="text" id="emailreclamante" name="emailreclamante" class="form-control">
							               	<div class="result"></div>
							           	</div>
							       	</div>
								</div>
								
							</div>
				            
							<br>
							
			 				<div>
			 				
			                    <div class="col-md-12">
			                        <p>Autorizo la comunicación de respuesta a mi reclamo por medio de las siguientes vías:</p>                       
			                        <div class="col-md-4" style="padding: 0px 15px 0px 0px; display: inline-block;">                        
				                        <div class="checkbox-inline">
				                            <label>
				                                <input type="checkbox" id="indautorizatel" name="indautorizatel">
				                                Llamada telefónica
				                            </label>                            
				                        </div>
			                        </div>
			                        <div class="col-md-5" style="padding: 0px 15px 0px 0px; display: inline-block;">
				                        <div class="checkbox-inline">
				                            <label>
				                                <input type="checkbox" id="indautorizaemail" name="indautorizaemail">
				                                Email
				                            </label>
				                        </div>
			                        </div>
			                    </div>
			                    
			                </div> 
			                           
			            </div>
				
			        </div>
			        <div id="contentPage2"></div>
			        
				</div>
		</div>
		
		<div id="Paso2Rec" style="display:none;">
			<h3>Datos del agraviado</h3>
			
			<div class="panel panel-default">
			
				<div class="panel-body">
				
					<div>
					
						<div>
							<div class="form-group form-group-reclamo">
								<label for="nombre_agraviado" class="col-md-3 control-label reclamos-content-maxim required">Nombre del agraviado:</label>
								
								<div class="col-md-9 reclamos-content-maxim">
									<input type="text" id="nombre_agraviado" name="nombre_agraviado" class="form-control">
									<div class="result"></div>
								</div>
								
							</div>
						</div>
						
					</div>
					
					<div>
					
						<div>
							<div class="form-group">
								<label for="menoredad" class="required" style="display: inline-block; padding-left: 15px; padding-right: 15px;">¿El agraviado es menor de edad?</label>
								
								<div style="vertical-align: middle; display: inline-block; padding-left: 15px; padding-right: 15px;">
									<input type="radio" name="indmenoredad" value="0" checked="checked">&nbsp;NO
									<input type="radio" name="indmenoredad" value="1">&nbsp;SÍ&nbsp;&nbsp;&nbsp; 
									<div class="result"></div>
								</div>
								
							</div>
						</div>
			
						<div class="datos-agraviado hidden">
							<div >
								<div class="form-group form-group-reclamo">
									<label id="labelpadres" for="padres" class="col-md-3 control-label reclamos-content-maxim">Nombre del padre o madre:</label>
									
									<div class="col-md-9 reclamos-content-maxim">
										<input type="text" id="nompadre_agraviado"
											name="nompadre_agraviado" class="form-control">
										<div class="result"></div>
									</div>
									
								</div>
							</div>
						</div>
						
					</div>
					
				</div>
				
			</div>
			<h3>Datos de ocurrencia</h3>
			
			<div class="panel panel-default">
			
				<div class="panel-body">
					
					<div class="column-formulario-reclamo">
					
			            <div>
			            	<div class="form-group form-group-reclamo">
			                	<label for="fec_atencion" class="col-md-5 control-label reclamos-content-maxim required">Fecha de ocurrencia:</label>
			                   
			                    <div class="col-md-7 reclamos-content-maxim">         						
			                    	<div id="divfecha" class="input-group">
			                        <input type="text" id="fec_atencion" name="fec_atencion" class="form-control" readonly="readonly">
									<span class="input-group-addon">
										<a id="btnFechaAt" href="javascript:void(0)" class="btn-date">
			                            	<span class="glyphicon glyphicon-calendar"></span>
			                            </a>											                                          
			                        </span>
			                    	<div class="result"></div>										
									</div>
			             		</div>
			             		
			            	</div>  
			   			</div>
						
						<div>
							<div class="form-group form-group-reclamo">
								<label for="dptoocurrencia" class="col-md-5 control-label reclamos-content-maxim required">Departamento de ocurrencia:</label>
						
								<div class="col-md-7 reclamos-content-maxim">
									<input type="text" id="dptoocurrencia" name="dptoocurrencia" class="form-control" readonly="readonly">
									<div class="result"></div>
								</div>
								
							</div>
						</div>
						
						<div>
							<div class="form-group form-group-reclamo">
								<label for="provocurrencia" class="col-md-5 control-label reclamos-content-maxim required">Provincia de ocurrencia:</label>
						
								<div class="col-md-7 reclamos-content-maxim">
									<input type="text" id="provocurrencia" name="provocurrencia" class="form-control" readonly="readonly">
									<div class="result"></div>
								</div>
								
							</div>
						</div>
						
						<div>
							<div class="form-group form-group-reclamo">
								<label for="distocurrencia" class="col-md-5 control-label reclamos-content-maxim required">Distrito de ocurrencia:</label>
						
								<div class="col-md-7 reclamos-content-maxim">
									<input type="text" id="distocurrencia" name="distocurrencia" class="form-control" readonly="readonly">
									<div class="result"></div>
								</div>
								
							</div>
						</div>
								
					</div>
				
					<div class="column-formulario-reclamo">
					
						<div>
							<div class="form-group form-group-reclamo">
								<label for="tipoprovnoreg" class="col-md-5 control-label reclamos-content-maxim">Tipo (Lugar/Empresa):</label>
								
								<div class="col-md-7 reclamos-content-maxim">
									<select class="form-control" id="tipoprovnoreg" name="tipoprovnoreg">
									</select>
									<div class="result"></div>
								</div>
								
							</div>
						</div>
							
						<div>
							<div class="form-group form-group-reclamo">
								<label for="provnoreg" class="col-md-5 control-label reclamos-content-maxim">Nombre del Lugar/Empresa:</label>
								
								<div class="col-md-7 reclamos-content-maxim">
									<input type="text" id="provnoreg" name="provnoreg" class="form-control">
									<div class="result"></div>
								</div>
								
							</div>
						</div>
							
						<div>
							<div class="form-group form-group-reclamo">
								<label for="serviciorec" class="col-md-5 control-label reclamos-content-maxim required">Servicio que originó el reclamo:</label>
								
								<div class="col-md-7 reclamos-content-maxim">
									<input type="text" id="serviciorec" name="serviciorec" class="form-control">
									<div class="result"></div>
								</div>
								
							</div>
						</div>	
						
					</div>
					
				</div>
			</div>
			
			<h3>Datos del reclamo</h3>
			
			<div class="panel panel-default">
			
				<div class="panel-body">
					<div class="column-formulario-reclamo">
			                	<div>
			                        <div class="form-group form-group-reclamo">
			                            <label for="numreclamopiv" class="col-md-5 control-label reclamos-content-maxim required">Numero Reclamo: </label>
			                            <div class="col-md-7 reclamos-content-maxim">
			                                <input type="text" id="numreclamopiv" name="numreclamopiv" class="form-control">
			                                <div class="result"></div>
			                            </div>
			                        </div>
			                    </div>
							<div class="form-group form-group-reclamo">
								<label for="numpoliza" class="col-md-5 control-label reclamos-content-maxim">Número de póliza:</label>
								
								<div class="col-md-7 reclamos-content-maxim">
									<div class="input-group" id="div-span-poliza">
										<input type="text" id="numpoliza" name="numpoliza" class="form-control"> 
										<div class="result"></div>
									</div>
								</div>
								
							</div>
					</div>
					<div class="column-formulario-reclamo">

			                	<div>
			                        <div class="form-group form-group-reclamo">
			                            <label for="estadoreclamo" class="col-md-5 control-label reclamos-content-maxim required">Estado del Reclamo: </label>
			                            <div class="col-md-7 reclamos-content-maxim">
			                                <select class="form-control" id="estadoreclamo" name="estadoreclamo"></select>
			                                <div class="result"></div>
			                            </div>
			                        </div>
			                    </div>
						</div>	
					
					<div class="column-formulario-reclamo datosZonaExt" style="display: none">
						
						<div>
							<div class="form-group form-group-reclamo">
								<label for="nom-titular" class="col-md-2 control-label reclamos-content-maxim">Nombre del titular de la póliza</label>
								
								<div class="col-md-10 reclamos-content-maxim">
									<input type="text" id="nomtitular" name="nomtitular" class="form-control" data-rule-required="true" data-msg-required="Ingrese un valor" required>
									<div class="result"></div>
								</div>
								
							</div>
						</div>
						
					</div>
					
					<div>
					
						<div class="form-group form-group-reclamo">
							<label for="operaciondsc" class="col-md-5 control-label reclamos-content-maxim required">Código Operacion:</label>
							
							<div class="col-md-7 reclamos-content-maxim">
								<select class="form-control" id="operaciondsc" name="operaciondsc"></select>
								<div class="result"></div>
							</div>
							
						</div>
						
					</div>
					
					<div>
						 
						<div id="divmotivo">
							<div class="form-group form-group-reclamo">
								<label for="motivodsc" class="col-md-5 control-label reclamos-content-maxim required">Motivo:</label>
								
								<div class="col-md-7 reclamos-content-maxim">
									<select class="form-control" id="motivodsc" name="motivodsc"></select>
									<div class="result"></div>
								</div>
								
							</div>
						</div>
						
					</div>
					
					<div>
			
						<div>
							<div class="form-group form-group-reclamo">
								<label for="tipodereclamo" class="col-md-5 control-label reclamos-content-maxim required">Queja/Reclamo:</label>
								
								<div class="col-md-7 reclamos-content-maxim">
									<input type="text" id="tipodereclamo" name="tipodereclamo" class="form-control" data-rule-required="true" data-msg-required="Ingrese un valor" required>
									<div class="result"></div>
								</div>
								
							</div>
						</div>
						
					</div>
					
					<div>
					
						<div>
							<div class="form-group form-group-reclamo">
								<label for="detallereclamo" class="col-md-2 control-label reclamos-content-maxim required">Descripcion del reclamo:</label>
								
								<div class="col-md-10 reclamos-content-maxim">
									<textarea name="detallereclamo" id="detallereclamo" cols="20"
										rows="5" class="form-control"></textarea>
									<div class="result"></div>
								</div>
								
							</div>
						</div>
						
					</div>
					
					<div>
					
						<div class="column-formulario-reclamo">
						
							<div>
								<div class="form-group">
									<div class="checkbox-inline">
										<label class="col-md-12 control-label"> 
											<input type="checkbox" id="registradevolucion" name="registradevolucion">
											¿Requiere devolución?
										</label>
									</div>
								</div>
							</div>
							
							<!-- Inicio informacion de devolucion -->
							<div id="reclamo-requiere-devolucion" class="hidden">
								<div class="form-group form-group-reclamo">
									<label for="" class="col-md-5 control-label reclamos-content-maxim">Monto reclamado:</label>
									
									<div class="col-md-7 reclamos-content-maxim">
										<input type="text" id="montoreclamado" name="montoreclamado" class="form-control" data-rule-number="true" data-msg-number="El campo debe ser un monto valido">
									</div>
									
								</div>
							</div>
							<!-- Fin informacion de devolucion -->
							
						</div>
					</div>	
					
					<div>
						
						<div>
							<div class="form-group">
								<div class="checkbox-inline">
									<label class="col-md-12 control-label">
										<input type="checkbox" id="regcuentaabono" name="regcuentaabono">¿Desea registrar una cuenta de abono asociada a este reclamo?
									</label>
								</div>
							</div>
						</div>
						
					</div>
					
					<!-- Inicio informacion de cuenta bancaria -->
					<div id="reclamo-cuenta-bancaria" class="hidden">
					
						<div class="column-formulario-reclamo">
						
							<div>
								<div class="form-group form-group-reclamo">
									<label id="labelentidadbancaria" for="" class="col-md-5 control-label reclamos-content-maxim">Entidad Bancaria:</label>
									
									<div class="col-md-7 reclamos-content-maxim">
										<select class="form-control" id="entidadbancaria" name="entidadbancaria" onchange="javascript:validacionBanco();">
										</select>
										<div class="result"></div>
									</div>
									
								</div>
							</div>
							
							<div>
								<div class="form-group form-group-reclamo">
									<label id="labeltipocuenta" for="" class="col-md-5 control-label reclamos-content-maxim">Tipo de cuenta:</label>
									
									<div class="col-md-7 reclamos-content-maxim">
										<select class="form-control" id="tipocuenta" name="tipocuenta" onchange="javascript:validacionBanco();">
										</select>
										<div class="result"></div>
									</div>
									
								</div>
							</div>
							
						</div>
				
						<div class="column-formulario-reclamo">
				
							<div>
								<div class="form-group form-group-reclamo">
									<label id="labeltipomoneda" for="" class="col-md-5 control-label reclamos-content-maxim">Moneda:</label>
									
									<div class="col-md-7 reclamos-content-maxim">
										<select class="form-control" id="tipomoneda" name="tipomoneda">
										</select>
										<div class="result"></div>
									</div>
									
								</div>
							</div>
							
							<div>
								<div class="form-group form-group-reclamo">
									<label id="labelnumerocuenta" for="" class="col-md-5 control-label reclamos-content-maxim">Número Cta Bancaria:</label>
									
									<div class="col-md-7 reclamos-content-maxim">
										<input type="text" id="numerocuenta" name="numerocuenta" class="form-control">
										<div class="result"></div>
									</div>
									
								</div>
							</div>							
						</div>						
					</div>					
					<!-- Fin informacion de cuenta bancaria -->
				</div>
			
			</div>
			
			<div class="row">				
				<div class="col-md-12">
							<div class="form-group pull-right">
								<a class="btn btn-default method-ajax"  href='../jsp/reclamos/reclamos-mis-reclamos.jsp'>Atras</a> 
				            </div>
				</div>
			</div> 
</div>
</form>