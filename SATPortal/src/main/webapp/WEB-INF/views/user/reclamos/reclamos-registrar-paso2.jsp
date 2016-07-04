<%-- <h1 id="titlemain"></h1> --%>
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
						<select class="form-control" id="dptoocurrencia" name="dptoocurrencia"
							onchange="obtenerProvincias(this,'registroRimacSeguros1 #provocurrencia');">
							<option value="">Seleccionar</option>
						</select>
						<div class="result"></div>
					</div>
					
				</div>
			</div>
			
			<div>
				<div class="form-group form-group-reclamo">
					<label for="provocurrencia" class="col-md-5 control-label reclamos-content-maxim required">Provincia de ocurrencia:</label>
			
					<div class="col-md-7 reclamos-content-maxim">
						<select class="form-control" id="provocurrencia"
							name="provocurrencia"
							onchange="obtenerDistritos(this,'registroRimacSeguros1 #distocurrencia');">
							<option value="">Seleccionar</option>
						</select>
						<div class="result"></div>
					</div>
					
				</div>
			</div>
			
			<div>
				<div class="form-group form-group-reclamo">
					<label for="distocurrencia" class="col-md-5 control-label reclamos-content-maxim required">Distrito de ocurrencia:</label>
			
					<div class="col-md-7 reclamos-content-maxim">
						<select class="form-control" id="distocurrencia" name="distocurrencia">
							<option value="">Seleccionar</option>
						</select>
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
							<option value="">Seleccionar</option>
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
						<select class="form-control" id="serviciorec" name="serviciorec"></select>
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
					<label for="numpoliza" class="col-md-5 control-label reclamos-content-maxim">Número de póliza:</label>
					
					<div class="col-md-7 reclamos-content-maxim">
						<div class="input-group" id="div-span-poliza">
							<input type="text" id="numpoliza" name="numpoliza" class="form-control"> 
							<span id="span-poliza" class="input-group-addon" style="vertical-align: middle;">
								<a data-toggle="modal" class="btn btn-default" href="<%=request.getContextPath()%>/jsp/reclamos/reclamos-registrar-listado-poliza.jsp" data-target="#modalBuscarPoliza"> 
									<i class="ui-icon ui-icon-search"></i>
								</a>
							</span>	
							<input type="hidden" id="idepol"	 		name="idepol"/>
 							<input type="hidden" id="codramo" 			name="codramo"/>
 							<input type="hidden" id="descramo" 			name="descramo"/>
 							<input type="hidden" id="codproducto" 		name="codproducto"/>
 							<input type="hidden" id="descproducto" 		name="descproducto"/>
 							<input type="hidden" id="nomcontratante" 	name="nomcontratante"/>
 							<input type="hidden" id="nomtitular" 		name="nomtitular"/>
 							<input type="hidden" id="tipoproducto" 		name="tipoproducto"/>
 							<input type="hidden" id="numcerti" 			name="numcerti"/>
							<div class="result"></div>
						</div>
					</div>
					
				</div>
				
			</div>
				
		</div>
		
		<div class="column-formulario-reclamo datosZonaExt" style="display: none">
			
			<div>
				<div class="form-group form-group-reclamo">
					<label for="nom-titular" class="col-md-2 control-label reclamos-content-maxim">Nombre del titular de la póliza</label>
					
					<div class="col-md-10 reclamos-content-maxim">
						<input type="text" id="nomtitular" name="nomtitular" class="form-control">
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
						<select class="form-control" id="tipodereclamo" name="tipodereclamo"></select>
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
						<label for="" class="col-md-5 control-label reclamos-content-maxim required">Monto reclamado:</label>
						
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
								<option value="">Seleccionar</option>
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
								<option value="">Seleccionar</option>
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
								<option value="">Seleccionar</option>
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
		<div class="checkbox">
			<label>
				<input type="checkbox" id="aceptarTerminos" name="aceptarTerminos"> Acepto que los datos consignados son verídicos.
			</label>
		</div>
	</div>
	
</div>

<div class="row">
	
	<div class="col-md-12">
		<div class="form-group pull-right">
			<a class='btn btn-default method-ajax'onclick='javascript:regresarPaso1Rec();'>Atrás</a> 
			<a class='btn btn-primary' onclick='javascript:registrar_reclamo();'>Registrar</a>
		</div>
	</div>
	
</div>

<div class="row">

	<div class="col-md-12">
		<div style="padding: 15px; text-align: justify;" class="bg-warning">
			Su solicitud será atendida en un plazo máximo de 30 días <span
				id="dscdiasRec"></span> a partir de su fecha de registro.<br> <br>
			(1)Reclamo: Disconformidad relacionada a los productos o servicios<br>(2)Queja:
			Disconformidad no relacionada a los productos o servicios; o,
			malestar o descontento respecto a la atención al público.<br> <br>
			<span id="disclaimerSBSEPS"></span>
		</div>
	</div>
	
</div>
<script type="text/javascript">
	function inicioPaso2() {
		//Limpiando la validacion
		var idFormulario = 'registroRimacSeguros1';
		$('#'+idFormulario + " .result").empty();

		//Agregando las validaciones
		agregarValidaciones();
		
		//Agregando las propiedades del formulario
		$("input:radio[name=indmenoredad]").click(function() {
			if ($(this).val() == "1") {
				$(".datos-agraviado").removeClass("hidden");
				$("#labelpadres").addClass("required");
				$("#nompadre_agraviado").rules("add", {
					required : true,
					sololetras: true,
					messages : {
						required : "El campo es obligatorio",
						sololetras	:"Ingrese solo texto",
					}
				});
			} else {
				$(".datos-agraviado").addClass("hidden");
				$("#labelpadres").removeClass("required");
				$("#nompadre_agraviado").rules("remove", "required");
			}
		});

		$("#fec_atencion").datepicker(
				{
					maxDate : 'today',
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
						$(".result", $("#fec_atencion").parent()).html(
								"<i class='success'></i>");
						$("label", $("#divfecha").parent())
								.removeClass("error");
						$("label", $("#divfecha").parent()).html("");
						$("#fec_atencion").removeClass("error");
					}
				});

		$("#btnFechaAt").click(function() {
			$("#fec_atencion").datepicker("show");
		});

		$("#lugar_atencion").attr('maxlength', '500');

		$('#registradevolucion').change(function() {
			if ($(this).is(":checked")) {
				$("#reclamo-requiere-devolucion").removeClass("hidden");

				$("#montoreclamado").rules("add", {
					required : true,
					messages : {
						required : 'Ingrese un monto',
					}
				});

			} else {
				$("#reclamo-requiere-devolucion").addClass("hidden");
				$("#montoreclamado").rules("remove", "required");
			}
		});

		$('#regcuentaabono').change(function() {
			if ($(this).is(":checked")) {
				$("#reclamo-cuenta-bancaria").removeClass("hidden");
				$("#labelentidadbancaria, #labeltipocuenta, #labeltipomoneda, #labelnumerocuenta").addClass("required");
				$("#entidadbancaria").rules("add",{
									required : true,
									messages : {
										required : 'Seleccione una entidad bancaria',
									}
				});

				$("#tipocuenta").rules("add", {
					required : true,
					messages : {
						required : 'Seleccione tipo de cuenta',
					}
				});

				$("#tipomoneda").rules("add", {
					required : true,
					messages : {
						required : 'Seleccione tipo de moneda',
					}
				});

				$("#numerocuenta").rules("add",{
									required : true,
									messages : {
										required : 'Ingrese un número de cuenta',
									}
				});
			} else {
				$("#reclamo-cuenta-bancaria").addClass("hidden");
				$("#labelentidadbancaria, #labeltipocuenta, #labeltipomoneda, #labelnumerocuenta").removeClass("required");
				$("#entidadbancaria").rules("remove","required");
				$("#tipocuenta").rules("remove", "required");
				$("#tipomoneda").rules("remove", "required");
				$("#numerocuenta").rules("remove", "required");
				$("#entidadbancaria").val($("#tipocuenta option:first").val());
				$("#tipocuenta").val($("#tipocuenta option:first").val());
				$("#tipomoneda").val($("#tipocuenta option:first").val());
				$("#numerocuenta").val('');
			}
		});

	}

	$('#montoreclamado').autotab({
		format : 'custom',
		pattern : '[^0-9\.]'
	});

	$('#numerocuenta').autotab('filter', {
		format : 'number'
	});

	function registrar_reclamo() {
		
    	if ($("#registroRimacSeguros1").valid()){

        	var acepto = $('#aceptarTerminos').prop('checked');
        	if(acepto){
        		loadModalCargando();
        			
    			$("#autotelef").val($('#indautorizatel').prop('checked') ? CTE_INDACTIVO : CTE_INDINACTIVO);
    			$("#autoenviomail").val($('#indautorizaemail').prop('checked') ? CTE_INDACTIVO : CTE_INDINACTIVO);
    			$("#inddevolucion").val($('#registradevolucion').prop('checked') ? CTE_INDACTIVO : CTE_INDINACTIVO);
    			$("#indabonocuenta").val($('#regcuentaabono').prop('checked') ? CTE_INDACTIVO : CTE_INDINACTIVO);
            	$("#servicio").val($('#serviciorec option:selected').text());
            	$("#motivo").val($('#motivodsc').val());
    			$("#codoperacion").val($('#operaciondsc').val());
    			$("#sexocontacto").val($('#sexorec option:selected').text());
    			
    			$('#tipodoccliente').val($("#tipodoc_reclamante").val());
    			$('#numdoccliente').val($("#numdoc_reclamante").val());
        	
    			$('#fecnaccontacto').val($("#fec_nacim").val());

    			if (CTE_NEGOCIO==CTE_NEGOCIO_EPS){
    				$("#motivo").val("");
    			}
    			//[INI] - DINGAN - 28/10/2015 - PORTALWEB
    			var paramRR = {};
    			paramRR = $("#registroRimacSeguros1").serializeArray();
    			
				$.post(SERVICIO_ASISTENCIA_RECLAMO+'?method=registarReclamo', paramRR,
				//[FIN] - DINGAN - 28/10/2015 - PORTALWEB
      				function(data, textStatus, jqXHR){
						var obj = $.parseJSON(data);
						closeModalCargando();
	       				if(obj.resultado == CTE_INDINACTIVO){
	       					$("#Paso2Rec").hide();
	       					$("#confirmacionRec").show();

							//GOOGLE TAG MANAGER
	       					dataLayer.push({'event': EV_REGISTRAR_RECLAMO, 'typeReclamo': CTE_NEGOCIO, 'numDocument': CTE_NUM_DOC});
	       					
	       					//[INI] KCARRANZAP - 10/08/2015
							dataLayer.push({'event': 'ReclamoSuccess', 'ReclamoID': CTE_NUM_DOC});
							//[FIN] KCARRANZAP - 10/08/2015
							
	       				}else{       					
	       					$("#Paso2Rec").hide();
	       					$("#PasoLoSentimos").show();
	       				}
       			}).fail(function(jqXHR, textStatus, errorThrown){    				
       				closeModalCargando();	
       				loadModalMensaje("Estimado Cliente",'Lo sentimos. Hubo problemas en el procesamiento. Inténtelo más tarde.','');
       		    });
        	}else{
        		closeModalCargando();
        		loadModalMensaje('Advertencia', 'Debe Aceptar la condiciones de servicio.',null);
        	}
        }else{        	
        	$.each($('input[type=text], select ,textarea', '#registroRimacSeguros1'),function(k){
     		   validateItems("registroRimacSeguros1",this);
     		});
        	loadModalMensaje('Advertencia', 'Por favor verifique los datos ingresados e intente nuevamente.',null);
        }
    }


	function validacionBanco() {

		$("#numerocuenta").rules("remove");

		$("#numerocuenta").rules("add", {
			required : true,
			digits : true,
			messages : {
				required : 'Ingrese número de cuenta',
				digits : 'Ingrese sólo números'
			}
		});

		
		if ($("#entidadbancaria").val() == CTE_BANCO_BCP) {
			if ($("#tipocuenta").val() == CTE_CUENTA_AHORROS) {
				$("#numerocuenta").rules("add", {
					minlength : 14,
					maxlength : 14,
					messages : {
						minlength : 'Ingrese 14 dígitos',
						maxlength : 'Ingrese sólo 14 dígitos',
					}
				});
			} else if ($("#tipocuenta").val() == CTE_CUENTA_CORRIENTE
					|| $("#tipocuenta").val() == CTE_CUENTA_MAESTRA) {
				$("#numerocuenta").rules("add", {
					minlength : 13,
					maxlength : 13,
					messages : {
						minlength : 'Ingrese 13 dígitos',
						maxlength : 'Ingrese sólo 13 dígitos',
					}
				});
			}
		} else if ($("#entidadbancaria").val() == CTE_BANCO_BBVA) {
			if ($("#tipocuenta").val() == CTE_CUENTA_AHORROS
					|| $("#tipocuenta").val() == CTE_CUENTA_CORRIENTE) {
				$("#numerocuenta").rules("add", {
					minlength : 20,
					maxlength : 20,
					messages : {
						minlength : 'Ingrese 20 dígitos',
						maxlength : 'Ingrese sólo 20 dígitos',
					}
				});
			}
		} else if ($("#entidadbancaria").val() == CTE_BANCO_INTERBANK) {
			if ($("#tipocuenta").val() == CTE_CUENTA_AHORROS
					|| $("#tipocuenta").val() == CTE_CUENTA_CORRIENTE) {
				$("#numerocuenta").rules("add", {
					minlength : 13,
					maxlength : 13,
					messages : {
						minlength : 'Ingrese 13 dígitos',
						maxlength : 'Ingrese sólo 13 dígitos',
					}
				});
			}
		} else if ($("#entidadbancaria").val() == CTE_BANCO_SCOTIABANK) {
			if ($("#tipocuenta").val() == CTE_CUENTA_AHORROS
					|| $("#tipocuenta").val() == CTE_CUENTA_CORRIENTE) {
				$("#numerocuenta").rules("add", {
					minlength : 10,
					maxlength : 10,
					messages : {
						minlength : 'Ingrese 10 dígitos',
						maxlength : 'Ingrese sólo 10 dígitos',
					}
				});
			}
		}

		$("#numerocuenta").focus();
	}
   
    function agregarValidaciones(){
		$("#fec_atencion").rules("add", {
			required : true,
			messages : {
				required : "Seleccione un fecha"
			}
		});
		$("#dptoocurrencia").rules("add", {
			required : true,
			messages : {
				required : "Seleccione un valor"
			}
		});
		$("#provocurrencia").rules("add", {
			required : true,
			messages : {
				required : "Seleccione un valor"
			}
		});
		$("#distocurrencia").rules("add", {
			required : true,
			messages : {
				required : "Seleccione un valor"
			}
		});
		$("#serviciorec").rules("add", {
			required : true,
			messages : {
				required : "Seleccione un valor"
			}
		});
		$("#tipodereclamo").rules("add", {
			required : true,
			messages : {
				required : "Seleccione un valor"
			}
		});
		$("#nombre_agraviado").rules("add", {
			required : true,
			sololetras : true,
			messages : {
				required : "Ingrese un valor",
				sololetras		:"Ingrese solo texto"
			}
		});
		$("#operaciondsc").rules("add", {
			required : true,
			messages : {
				required : "Seleccione un valor"
			}
		});
		$("#motivodsc").rules("add", {
			required : true,
			messages : {
				required : "Seleccione un valor"
			}
		});
		$("#detallereclamo").rules("add", {
			required : true,
			maxlength: 3000,//RVALDIVC - 25/09/2015 //RVALDIVC - 17/11/2015
			noespeciales : true, //RVALDIVC - 20/11/2015
			messages : {
				required : "Ingrese un valor",//RVALDIVC - 25/09/2015
				maxlength: "Ingrese máximo 3000 carácteres",//RVALDIVC - 25/09/2015 //RVALDIVC - 17/11/2015
				noespeciales: "No se permite los caracteres '&', '<' o '>'" //RVALDIVC - 20/11/2015
			}
		});
    }
</script>
