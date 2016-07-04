<%-- <h1 id="titlemain"></h1> --%>
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
                            <label for="" class="col-md-5 control-label reclamos-content-maxim required">Tipo de documento de identidad: </label>
                            <div class="col-md-7 reclamos-content-maxim">
                                <select class="form-control" id="tipodoc_reclamante" name="tipodoc_reclamante"></select>
                                <div class="result"></div>
                            </div>
                        </div>
                    </div>
            		
            		<div>
                        <div class="form-group form-group-reclamo">
                            <label for="" class="col-md-5 control-label reclamos-content-maxim required">Número de documento de identidad:</label>
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
                    
                	<div id="div-ext">
                	<!-- 
                        <div class="form-group form-group-reclamo">
                            <label for="appatreclamante" class="col-md-5 control-label reclamos-content-maxim required">Apellido paterno:</label>
                            <div class="col-md-7 reclamos-content-maxim">
                                    <input type="text" id="appatreclamante" name="appatreclamante" class="form-control">
                                    <div class="result"></div>
                            </div>
                        </div> -->
                   	</div>
                </div>
	                
                <div class="column-formulario-reclamo">
	                	
                	<div id="div-int">
                	<!-- 
                        <div class="form-group form-group-reclamo">
                            <label for="appatreclamante" class="col-md-5 control-label reclamos-content-maxim required">Apellido paterno:</label>
                            <div class="col-md-7 reclamos-content-maxim">
                                    <input type="text" id="appatreclamante" name="appatreclamante" class="form-control">
                                    <div class="result"></div>
                            </div>
                        </div> -->
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
	    			
	    			<div class="datosZonaExt" style="display:none;">
						<div class="form-group form-group-reclamo">
							<label for="sexorec" class="col-md-5 control-label reclamos-content-maxim required">Sexo:</label>
							<div class="col-md-7 reclamos-content-maxim">
                                <select class="form-control" id="sexorec" name="sexorec" data-rule-required="true" data-msg-required="Seleccione un valor" required>
                              				<option value="">Seleccionar</option>                                      
                          			   </select>
                                 <div class="result"></div>
							</div>
						</div>
               		</div>
               		
                    <div class="datosZonaExt" style="display:none;">
						<div class="form-group form-group-reclamo">
							<label for="" class="col-md-5 control-label  reclamos-content-maxim required">Fecha de nacimiento:</label>
							<div class="col-md-7 reclamos-content-maxim">         						
								<div id="divfechnacim" class="input-group">
                                	<input type="text" id="fec_nacim" name="fec_nacim" class="form-control" readonly="readonly" data-rule-required="true" data-msg-required="La fecha es obligatoria" required>
									<span class="input-group-addon">
										<a id="btnFecha" href="javascript:void(0)" class="btn-date">
                                         		<span class="glyphicon glyphicon-calendar"></span>
                                        </a>											                                          
                                    </span>
                                    <div class="result"></div>										
								</div>
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
	                        	<select class="form-control" id="idedepartamento" name="idedepartamento" onchange="obtenerProvincias(this,'registroRimacSeguros1 #ideprovincia');"
	                        		data-rule-required="true" data-msg-required="El departamento es obligatorio" required>
									<option value="">Seleccionar</option>
	                        	</select>		                        
	                        	<div class="result"></div>
	                    	</div>
	                   </div>
	               	</div>
		                
                    <div>
						<div class="form-group form-group-reclamo">
							<label for="" class="col-md-5 control-label reclamos-content-maxim required">Provincia</label>
		                    <div class="col-md-7 reclamos-content-maxim">
		                        <select class="form-control" id="ideprovincia" name="ideprovincia" onchange="obtenerDistritos(this,'registroRimacSeguros1 #idedistrito');"
	                         		data-rule-required="true" data-msg-required="La provincia es obligatorio" required>
									<option value="">Seleccionar</option>
	                         	</select>
		                        <div class="result"></div>
		                    </div>
	                    </div>
	                </div>
	                
	                <div>
						<div class="form-group form-group-reclamo">
							<label for="" class="col-md-5 control-label reclamos-content-maxim required">Distrito</label>
		                    <div class="col-md-7 reclamos-content-maxim">
		                        <select class="form-control" id="idedistrito" name="idedistrito" data-rule-required="true" data-msg-required="El distrito es obligatorio" required>
									<option value="">Seleccionar</option>
		                        </select>
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
		                    <div class="col-md-7 reclamos-content-maxim" onchange="javascript:validarRequiredNomVia();">
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
		                    <div class="col-md-7 reclamos-content-maxim" >
		                        <select class="form-control" id="via" name="via" onchange="javascript:validarRequiredNroVia();"></select>
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
		                        <select class="form-control reclamos-content-maxim" id="tipointerior" name="tipointerior" onchange="javascript:validarRequiredInterior();"></select>
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
	                                <input type="checkbox" id="indautorizaemail" name="indautorizaemail" checked>
	                                Email
	                            </label>
	                        </div>
                        </div>
                    </div>
                    
                </div> 
                           
            </div>
	
        </div>
	        
        <div class="row" style="margin-top: 10px;">
	        <div class="col-md-12">
				<div class="form-group pull-right">
					<div class="datosZonaExt" style="display:none;">
						<a id='btn-reclamo-ext-link' class='btn btn-default method-ajax' href='./reclamos'>Atrás</a>
						<a class='btn btn-primary' onclick='javascript:irPaso2Rec();'>Siguiente</a>
					</div>
 					<div class="datosZonaInt">
						<!-- <a id='btn-reclamo-link' class='btn btn-default method-ajax' href='../jsp/reclamos/reclamos-registrar.jsp'>Atrás</a>-->
						<a id='btn-reclamo-link' class='btn btn-default method-ajax' href='../portalweb.do?method=goReclamos'>Atrás</a>
						<a class='btn btn-primary' onclick='javascript:irPaso2Rec();'>Siguiente</a>
					</div>
					 
	            </div>
	        </div>
		</div>	        
			
        <div id="contentPage2"></div>
        
	</div>
	 
	<div class="modal fade" id="modalBuscarPoliza" tabindex="-1" role="dialog" aria-labelledby="modallabel" aria-hidden="true">
		<div class="modal-dialog modal-md">
	    	<div class="modal-content" id="bodyBuscarPoliza">
	    		<div class="modal-body"></div>
	    	</div>
	  	</div>        
	</div>

<script type="text/javascript">

	function inicioPaso1(){

		readyFormPaso1();
		
		loadModalCargando();

		var idCmboDpto = 'registroRimacSeguros1 #idedepartamento';
		var idCmboDptoOcurr = 'registroRimacSeguros1 #dptoocurrencia';
    	obtenerDpto(idCmboDpto);
    	obtenerDpto(idCmboDptoOcurr);
    	
    	//Year range
    	var dateToday = new Date();
		var yrRange = (dateToday.getFullYear() - 80) + ":" + dateToday.getFullYear();
    	
		$("#fec_nacim").datepicker(
				{
					maxDate : 'today',
					yearRange : yrRange,
		            changeMonth: true,
		            changeYear: true,
					beforeShow : function() {
						setTimeout(function() {
							$('.ui-datepicker').css({
								'z-index' : 9999,
								'border' : '1px solid #ccc'
							});
						}, 0);
					},
					onSelect : function(dateText, inst) {
						$(".result", $("#fec_nacim").parent()).html(
								"<i class='success'></i>");
						$("label", $("#divfechnacim").parent())
								.removeClass("error");
						$("label", $("#divfechnacim").parent()).html("");
						$("#fec_nacim").removeClass("error");
					}
				});
    	
    	//Date-Fecha nacimiento
    	/*
    	var dateSet = new Date(dateToday.getFullYear()-40,dateToday.getMonth(),dateToday.getUTCDate());
		
		$('#fec_nacim').datepicker('setDate', dateSet);*/
		//Fin 

		$("#btnFecha").click(function() {
			$("#fec_nacim").datepicker("show");
		});

    	if(CTE_JSON_PERSONAPWEB){
    		if(CTE_JSON_PERSONAPWEB.apepaterno != ""){
    			$('#appatreclamante').val(CTE_JSON_PERSONAPWEB.apepaterno);
    		}
    		if(CTE_JSON_PERSONAPWEB.apematerno != ""){
    			$('#apmatreclamante').val(CTE_JSON_PERSONAPWEB.apematerno);
    		}
    		if(CTE_JSON_PERSONAPWEB.nombre != ""){
    			$('#nombrereclamante').val(CTE_JSON_PERSONAPWEB.nombre);
    		}
    		if(CTE_JSON_PERSONAPWEB.idpgenero != ""){
    			$('#sexocontacto').val(CTE_JSON_PERSONAPWEB.idpgenero);
    			$('#sexorec').val(CTE_JSON_PERSONAPWEB.idpgenero);
    		}
    		if(CTE_JSON_PERSONAPWEB.fecnacimiento != ""){
    			$('#fec_nacim').val(CTE_JSON_PERSONAPWEB.fecnacimiento);
    		}
    	}
    	
    	if(CTE_JSON_DIRPWEB){
	    	if(CTE_JSON_DIRPWEB.idedepartamento != ""){
		        
	    		$('#idedepartamento').val(CTE_JSON_DIRPWEB.idedepartamento);

				var param = new Object();
		    	param.idedepartamento = CTE_JSON_DIRPWEB.idedepartamento;
	
		    	$.ajax({
		        	type 		: "POST",
		        	url 		: SERVICIO_LISTA_UBICACION + "?method=cboProvincia",
		        	cache 		: false ,
		        	dataType	: "json",
		        	contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		        	async 		: false,
		        	data 		: param,		
		        	success 	: function(rsp){					        				
		        					llenarCombo("ideprovincia", rsp, true);					        					
		        				},
		        	error 		: function(xhr, ajaxOptions, thrownError) {
								closeModalCargando();
	        					loadModalMensaje('Lo sentimos','Hubo un error en el procesamiento de datos.',function(){});
			        }
		        });
		        				        	
		        $('#ideprovincia').val(CTE_JSON_DIRPWEB.ideprovincia);
		        
		        if(CTE_JSON_DIRPWEB.ideprovincia != ""){
			        					       
			    	var paramdist = new Object();
			    	paramdist.ideprovincia = CTE_JSON_DIRPWEB.ideprovincia;
			    	
			    	$.ajax({
						type 		: "POST",
						url 		: SERVICIO_LISTA_UBICACION + "?method=cboDistrito",
						cache 		: false ,
						dataType	: "json",
						contentType : "application/x-www-form-urlencoded; charset=UTF-8",
						async 		: false,
						data 		: paramdist,		
						success 	: function(rsp){									
											llenarCombo("idedistrito", rsp, true);														
									},
						complete    : function (){},
						error 		: function(xhr, ajaxOptions, thrownError) {
							closeModalCargando();
						}						
					}); 
			        
			    	$('#idedistrito').val(CTE_JSON_DIRPWEB.idedistrito);
		        }	
	        }/*
    		if(CTE_JSON_DIRPWEB.idptipointerior != ""){
    			$('#tipointerior').val(CTE_JSON_DIRPWEB.idptipointerior);
    		}*/
    		if(CTE_JSON_DIRPWEB.interior != ""){
    			$('#interior').val(CTE_JSON_DIRPWEB.interior);
    		}/*
    		if(CTE_JSON_DIRPWEB.idptipovia != ""){
    			$('#tipovia').val(CTE_JSON_DIRPWEB.idptipovia);
    		}*/
    		if(CTE_JSON_DIRPWEB.nomvia != ""){
    			$('#nomvia').val(CTE_JSON_DIRPWEB.nomvia);
    		}
    		if(CTE_JSON_DIRPWEB.lote != ""){
    			$('#lote').val(CTE_JSON_DIRPWEB.lote);
    		}
    		if(CTE_JSON_DIRPWEB.referencia != ""){
    			$('#referencia').val(CTE_JSON_DIRPWEB.referencia);
    		}
        }

    	$("input:radio:first").prop("checked", true).trigger("click");

		if (CTE_JSON_PERSONAPWEB){
			$('#idetitular').val($("#form-datos-cliente #idetercero").val());
			$('#tipodoc_reclamante').val(CTE_JSON_PERSONAPWEB.idptipodocumento);
			$('#numdoc_reclamante').val(CTE_JSON_PERSONAPWEB.numerodoc);
		}
        
        if(CTE_JSON_TELFPWEB){
        	$('#telcelularreclamante').val(CTE_JSON_TELFPWEB.numlocal);
        }
        
        if(CTE_JSON_TELFSECPWEB){	        
	        $('#telfijoreclamante').val(CTE_JSON_TELFSECPWEB.numlocal);
        }
        
        if(CTE_JSON_CORREOPWEB){
	        $('#emailreclamante').val(CTE_JSON_CORREOPWEB.email);
        }

    	closeModalCargando();
    }
	
	$.autotab({ tabOnSelect: true });
	
	$('#referencia').autotab({ format: 'custom', pattern: '[^a-zA-Z0-9\\s]'});
	$('#telcelularreclamante, #telfijoreclamante').autotab('filter', { format: 'number'});
		
    function obtenerDpto(idCombo) {
		
    	var param = new Object();
    	param.idepais = CODIGO_PERU;
    	param.method = "cboDepartamento";
    	
    	$.ajax({
			type 		: "POST",
			url 		: SERVICIO_LISTA_UBICACION,
			cache 		: false ,
			dataType	: "json",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			async 		: false,
			data 		: param,		
			success 	: function(rsp){
				llenarCombo(idCombo, rsp, true);
			},
			error 		: function(xhr, ajaxOptions, thrownError) {
				loadModalMensaje('Lo sentimos','Hubo un error en el procesamiento de datos.',function(){});
			}
		});
	}

    function obtenerProvincias(padre,idCmbHijo) {

    	if(padre.value!=null && padre.value!=undefined && padre.value!=""){
		
			var param = new Object();
	    	param.idedepartamento = padre.value;
	    	
	    	$.ajax({
				type 		: "POST",
				url 		: SERVICIO_LISTA_UBICACION + "?method=cboProvincia",
				cache 		: false ,
				dataType	: "json",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				async 		: false,
				data 		: param,		
				success 	: function(rsp){
				
					llenarCombo(idCmbHijo, rsp, true);
				},
				error 		: function(xhr, ajaxOptions, thrownError) {
					loadModalMensaje('Lo sentimos','Hubo un error en el procesamiento de datos.',function(){});
				}
			});

    	}
	}
    
    function obtenerDistritos(padre,idCmbHijo) {
    	if(padre.value!=null && padre.value!=undefined && padre.value!=""){
	    	var param = new Object();
	    	param.ideprovincia = padre.value;
	    	
	    	$.ajax({
				type 		: "POST",
				url 		: SERVICIO_LISTA_UBICACION + "?method=cboDistrito",
				cache 		: false ,
				dataType	: "json",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				async 		: false,
				data 		: param,		
				success 	: function(rsp){
					llenarCombo(idCmbHijo, rsp, true);
				},
				complete : function (){},
				error 		: function(xhr, ajaxOptions, thrownError) {}
				
			});
    	}
	}
    
	function irPaso2Rec(){	
    	var indTelef = $('#indautorizatel').prop('checked');
    	var indEmail = $('#indautorizaemail').prop('checked');

		if(!indTelef && !indEmail){
    		closeModalCargando();
    		loadModalMensaje('Advertencia', 'Debe seleccionar por lo menos una vía de comunicación.',null);
		}else{
			if(indTelef && $('#telfijoreclamante').val() == "" && $('#telcelularreclamante').val() == ""){
	    		closeModalCargando();
	    		loadModalMensaje('Advertencia', 'Debe ingresar por lo menos un teléfono',null);
			}else{
				activarChecksValidate("registroRimacSeguros1");
				
				if ($("#registroRimacSeguros1").valid()) {
					inicioPaso2(); 
					$("#Paso1Rec").hide();
					$("#Paso2Rec").show();
				}else{
					$.each($('input[type=text], select ,textarea', '#registroRimacSeguros1'),function(k){
			    		   validateItems("registroRimacSeguros1",this);
			    	});
					loadModalMensaje('Advertencia', 'Por favor verifique los datos ingresados e intente nuevamente.',null);
				}
			}
    	}
	}
	
	function validarRequiredNomVia(){
		if ($("#tipovia").val() == C_NO_APLICA_VIA) {
			$('#nomvia').attr("readonly", true);
			$('#nomvia').val(C_NO_APLICA);
		}else{
			$('#nomvia').attr("readonly", false);
			if($('#nomvia').val() == C_NO_APLICA){
				$('#nomvia').val('');
			}
		}
	}
	
	function validarRequiredNroVia(){
		if ($('#via').val() == C_NO_APLICA_TIPO_VIA) {
			$('#nrovia').attr("readonly", true);
			$('#nrovia').val(C_NO_APLICA);
		}else{
			$('#nrovia').attr("readonly", false);
			if($('#nrovia').val() == C_NO_APLICA){
				$('#nrovia').val('');
			}
		}
	}
	
	function validarRequiredInterior(){
		if ($('#tipointerior').val() == C_NO_APLICA_TIPO_INTERIOR) {
			$('#interior').attr("readonly", true);
			$('#interior').val(C_NO_APLICA);
		}else{
			$('#interior').attr("readonly", false);
			if($('#interior').val() == C_NO_APLICA){
				$('#interior').val('');
			} 
		}
	}

    function readyFormPaso1(){

		$("#registroRimacSeguros1").validate({
			rules : {
				tipodoc_reclamante : {
					required 		: true
				},
				numdoc_reclamante:{
					required 		: true,
					minlength 		: 8,
					maxlength 		: 12,
					digits			: true
				},
				nombrereclamante:{
					required		:true,
					sololetras		:true
				},
				appatreclamante:{
					required		:true,
					sololetras		:true
				},
				apmatreclamante:{
					required		:true,
					sololetras		:true
				},
				idedepartamento	:{
					required		:true
				},
				ideprovincia	:{
					required		:true
				},
				idedistrito		:{
					required		:true
				},
				tipovia		  	:{
					required		:true
				},
				nomvia		   	:{
					required		:true
				},
				via		   		:{
					required		:true
				},
				nrovia		   	:{
					required		:true
				},
				tipointerior	:{
					required		:true
				},
				
				interior		:{
					required		:true
				},
				/*
				telfijoreclamante :{
					minlength 		: 7,
					maxlength 		: 9,
					digits			: true
				},
				telcelularreclamante :{
					required		: true,
					minlength 		: 9,
					maxlength 		: 9,
					digits			: true
				},*/
				emailreclamante	:{
					required		:true,
					email			:true
				}
			},
			messages : {
				tipodoc_reclamante : {
					required 		: "Seleccione un valor"
				},
				numdoc_reclamante : {	
					required		: "Ingrese un documento",
					minlength 		: "Ingrese mínimo 8 carácteres",
					maxlength 		: "Ingrese máximo 12 carácteres",
					digits			: "Ingrese sólo números"
				},
				nombrereclamante   :{
					required		: "Ingrese el nombre",
					sololetras		: "Ingrese solo texto"
				},
				appatreclamante   :{
					required		: "Ingrese el apellido paterno",
					sololetras		: "Ingrese solo texto"
				},
				apmatreclamante   :{
					required		: "Ingrese el apellido materno",
					sololetras		: "Ingrese solo texto"
				},
				idedepartamento	   :{
					required		:"Seleccione departamento"
				},
				ideprovincia	   :{
					required		:"Seleccione provincia"
				},
				idedistrito		   :{
					required		:"Seleccione distrito"
				},
				tipovia		  	:{
					required		:"Seleccione un valor"
				},
				nomvia		   	:{
					required		:"Ingrese un nombre"
				},
				via		   		:{
					required		:"Seleccione un valor"
				},
				
				nrovia		   	:{
					required		:"Ingrese un número"
				},
				tipointerior	:{
					required		:"Seleccione un valor"
				},
				
				interior		:{
					required		:"Ingrese un valor"
				},
				/*
				telfijoreclamante :{
					minlength 		: "Ingrese mínimo 7 carácteres",
					maxlength 		: "Ingrese máximo 9 carácteres",
					digits			: "Ingrese sólo números"
				},
				telcelularreclamante :{
					required		: "Ingrese un valor",
					minlength 		: "Ingrese mínimo 9 carácteres",
					maxlength 		: "Ingrese máximo 9 carácteres",
					digits			: "Ingrese sólo números"
				},*/
				emailreclamante	:{
					required		: "Ingrese correo electrónico",
					email			: "Formato de email incorrecto"
				}
			}
		});
    }
    
    
</script>
