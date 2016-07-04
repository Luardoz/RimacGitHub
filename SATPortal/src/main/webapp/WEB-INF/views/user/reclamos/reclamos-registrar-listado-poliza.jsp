
<div id="form-reclamos-polizas" class="form-reclamos-polizas">
	 
    <div class="modal-header">
        <button id="btnClose" type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3 class="modal-title">Tus Pólizas</h3>
    </div>    
	
	<div id="loading">	
		<img src="<%=request.getContextPath()%>/img/rimac/loading3.gif">
	</div>
	
	<div id="content-reclamos-polizas">
		
		<div id="seccionEPS"			style="margin-bottom: 20px;"	class="group-table-seguros hidden">
		    <h6 class="vineta-mis-seguros-eps">EPS</h6>
		    <div class="row visible-md-block visible-sm-block visible-lg-block">
		        <div class="table-responsive col-md-12">
		                <table id="table-eps" class="table table-hover table-bordered">
		                    <thead>
		                        <tr>
		                            <th class="text-center"></th>
		                            <th class="text-center">Póliza</th>
		                            <th class="text-center">Seguro</th>
									<!-- <th class="text-center">Nombre Titular</th> -->
		                            <th class="text-center">Vigencia</th>
		                        </tr>
		                    </thead>
		                </table>
		        </div>
		    </div> 
			<div class="row visible-xs-block">
				<div class="col-md-12">
					<div class="panel panel-default"> 
		 				<!-- Table -->
		 				<div class="list-group"  id ="lst-mis-seguros-eps">
		 				</div>
			 		</div>
				</div>
			</div>   
		    <div class="form-mis-seguros_validacion" id="missegurosValidacionEPS"></div>
	    </div>
	    
		<div id="seccionSalud"			style="margin-bottom: 20px;"	class="group-table-seguros hidden">
		    <h6 class="vineta-mis-seguros-salud">Salud</h6>
		    <div class="row visible-md-block visible-sm-block visible-lg-block">
		        <div class="table-responsive col-md-12">
		                <table id="table-salud" class="table table-hover table-bordered">
		                    <thead>
		                        <tr>
		                            <th class="text-center"></th>
		                            <th class="text-center">Póliza</th>
		                            <th class="text-center">Seguro</th>
									<!-- <th class="text-center">Nombre Titular</th> -->
		                            <th class="text-center">Vigencia</th>
		                        </tr>
		                    </thead>
		                </table>
		        </div>
		    </div> 
			<div class="row visible-xs-block">
				<div class="col-md-12">
					<div class="panel panel-default"> 
		 				<!-- Table -->
		 				<div class="list-group"  id ="lst-mis-seguros-salud">
		 				</div>
			 		</div>
				</div>
			</div>   
		    <div class="form-mis-seguros_validacion" id="missegurosValidacionSalud"></div>
	    </div>
	    
	    <div id="seccionVida" 			style="margin-bottom: 20px;"	class="hidden">
		    <h6 class="vineta-mis-seguros-vida">Vida</h6>
		    <div class="row visible-md-block visible-sm-block visible-lg-block">
		        <div class="table-responsive col-md-12">	            
		                <table id="table-vida" class="table table-hover table-bordered">
		                    <thead>
		                        <tr>
		                            <th class="text-center"></th>
		                            <th class="text-center">Póliza</th>
		                            <th class="text-center">Seguro</th>
		                            <!-- <th class="text-center">Nombre Titular</th> -->
		                            <th class="text-center">Vigencia</th>
		                        </tr>
		                    </thead>
		                </table>	            
		        </div>
		    </div>
		    <div class="row visible-xs-block">
				<div class="col-md-12">
					<div class="panel panel-default"> 
		 				<!-- Table -->
		 				<div class="list-group"  id ="lst-mis-seguros-vida">
		 				</div>
			 		</div>
				</div>
			</div>  
		    <div class="form-mis-seguros_validacion" id="missegurosValidacionVida"></div>
	    </div>    
	    
	    <div id="seccionVehicular"		style="margin-bottom: 20px;"	class="hidden">
		    <h6 class="vineta-mis-seguros-vehicular">Vehicular</h6>
		    <div class="row visible-md-block visible-sm-block visible-lg-block">
		        <div class="table-responsive col-md-12">	            
		                <table id="table-vehicular" class="table table-hover table-bordered">
		                    <thead>
		                        <tr>
		                            <th class="text-center"></th>
		                            <th class="text-center">Póliza</th>
		                            <th class="text-center">Seguro</th>
		                            <th class="text-center">Placa</th>
		                            <th class="text-center">Marca</th>
		                            <th class="text-center">Modelo</th>
		                            <th class="text-center">Año</th>
		                            <th class="text-center">Vigencia</th>
		                        </tr>
		                    </thead>                   
		                </table>	            
		        </div>
		    </div>
		    <div class="row visible-xs-block">
				<div class="col-md-12">
					<div class="panel panel-default"> 
		 				<!-- Table -->
		 				<div class="list-group"  id ="lst-mis-seguros-vehicular">
		 				</div>
			 		</div>
				</div>
			</div>  
	    </div>
	    
	    <div id="seccionDomiciliario"	style="margin-bottom: 20px;"	class="hidden">		    
		   	<h6 class="vineta-mis-seguros-domiciliario">Domiciliario</h6>
		    <div class="row visible-md-block visible-sm-block visible-lg-block">
		        <div class="table-responsive col-md-12">	            
		                <table id="table-domiciliario" class="table table-hover table-bordered">
		                    <thead>
		                        <tr>
		                            <th class="text-center"></th>
		                            <th class="text-center">Póliza</th>
		                            <th class="text-center">Seguro</th>
		                            <th class="text-center">Direccion</th>
		                            <th class="text-center">Vigencia</th>
		                        </tr>
		                    </thead>
		                </table>	            
		        </div>
		    </div>
		    <div class="row visible-xs-block">
				<div class="col-md-12">
					<div class="panel panel-default"> 
		 				<!-- Table -->
		 				<div class="list-group"  id ="lst-mis-seguros-domiciliario">
		 				</div>
			 		</div>
				</div>
			</div>  
			<div class="form-mis-seguros_validacion" id="missegurosValidacionDomiciliario"></div>
	    </div>
				
		<div id="seccionOtros"	style="margin-bottom: 20px;"	class="hidden">    
		   	<h6 class="vineta-mis-seguros-otros">Otros</h6>
		    <div class="row visible-md-block visible-sm-block visible-lg-block">
		        <div class="table-responsive col-md-12">	            
		                <table id="table-otros" class="table table-hover table-bordered">
		                    <thead>
		                        <tr>
		                            <th class="text-center"></th>
		                            <th class="text-center">Póliza</th>
		                            <th class="text-center">Seguro</th>
									<th class="text-center">Vigencia</th>
		                        </tr>
		                    </thead>
		                </table>	            
		        </div>
		    </div>
		    <div class="row visible-xs-block">
				<div class="col-md-12">
					<div class="panel panel-default"> 
		 				<!-- Table -->
		 				<div class="list-group"  id ="lst-mis-seguros-otros">
		 				</div>
			 		</div>
				</div>
			</div>  
			<div class="form-mis-seguros_validacion" id="missegurosValidacionOtros"></div>
	    </div>
	    
		<div class="row visible-md-block visible-sm-block visible-lg-block">
		    <div class="col-md-12">
		        <div class="form-group pull-right">
		            <a id="btnSeleccionarPoliza" href="#" class="btn btn-primary" data-dismiss="modal">Aceptar</a>
		        </div>
		    </div>
		</div>	
	</div>
</div>

<script type="text/javascript">

	function generarHidden(poliza, row){

		var idepol			= "";
		var codramo			= "";
		var dscramo			= "";
		var codprod			= "";
		var dscprod			= "";
		var nomcontratante	= "";
		var nomtitular		= "";
		var tipoproducto	= "";
		var numcerti		= "";

		if(row.idepol!=undefined)
			idepol = row.idepol;

		if(row.ramo!=undefined)
			codramo = row.ramo;

		if(row.descramo!=undefined)
			dscramo = row.descramo;

		if(row.codprod!=undefined)
			codprod = row.codprod;

		if(row.descprod!=undefined)
			dscprod = row.descprod;

		if(row.nomcontratante!=undefined)
			nomcontratante = row.nomcontratante;

		if(row.nomtitular!=undefined)
			nomtitular = row.nomtitular;
		
		if(row.tipoproducto!=tipoproducto)
			tipoproducto = row.tipoproducto;
		
		if(row.numcerti!=undefined)
			numcerti = row.numcerti;
		
	
		
	 return '<input type="hidden" name="idepol-'+poliza+'" value="'+idepol+'" />'+
			'<input type="hidden" name="codramo-'+poliza+'" value="'+codramo+'" />'+
			'<input type="hidden" name="descramo-'+poliza+'" value="'+dscramo+'" />'+
			'<input type="hidden" name="codproducto-'+poliza+'" value="'+codprod+'" />'+
			'<input type="hidden" name="descproducto-'+poliza+'" value="'+dscprod+'" />'+
			'<input type="hidden" name="nomcontratante-'+poliza+'" value="'+nomcontratante+'" />'+
			'<input type="hidden" name="nomtitular-'+poliza+'" value="'+nomtitular+'" />'+
			'<input type="hidden" name="tipoproducto-'+poliza+'" value="'+tipoproducto+'" />'+
	 		'<input type="hidden" name="numcerti-'+poliza+'" value="'+numcerti+'" />';
		}
	
$(document).ready(function() {
	
	var param         	= new Object();
	param.idetercero	= $("#form-datos-cliente #idetercero").val();
	param.codexterno	= $("#form-datos-cliente #codexterno").val();
	
    // NOMBRE DE TABLAS PARA CADA PRODUCTO
	var nomListaSalud	= '#lst-mis-seguros-salud';
	var nomListaEPS		= '#lst-mis-seguros-eps';
	var nomListaVida 	= '#lst-mis-seguros-vida';
	var nomListaVehi 	= '#lst-mis-seguros-vehicular';
	var nomListaDomi	= '#lst-mis-seguros-domiciliario';
	var nomListaOtros	= '#lst-mis-seguros-otros'; 	
	
    //$.post("/PORTALWEB/misseguros.do?method=lstPolUsuarioWeb", {datos:JSON.stringify(param)}, function(result){
    	
    	var objetoPolizas	= new Object();
    	var eps    			= new Object();
    	var salud    		= new Object();
  		var vida 			= new Object();
  		var domiciliario	= new Object();
  		var vehicular		= new Object();
  		var soat			= new Object();
  		var otros			= new Object();
  		  		
  		/********************************************
		* CARGAR LA DATA A SUS RESPECTIVOs OBJETOS  *
		********************************************/
    	try{
        	//objetoPolizas	   = eval(result);
        	objetoPolizas = eval(CTE_LISTA_MIS_SEGUROS);
        	CTE_MISSEGUROS_NWR = objetoPolizas[0];	
        	
        	if(!objetoPolizas[0].salud && 
        	   !objetoPolizas[0].eps &&
        	   !objetoPolizas[0].vida &&
        	   !objetoPolizas[0].domiciliario && 
        	   !objetoPolizas[0].vehicular &&
        	   !objetoPolizas[0].soat &&
        	   !objetoPolizas[0].otros)
        	{
        		salud.coderror	  		= true;
        		eps.coderror	  		= true;
    			vida.coderror	  		= true;
    			vehicular.coderror	  	= true;
    			soat.coderror	 	 	= true;
    			domiciliario.coderror	= true;
    			otros.coderror			= true;    			
    			/*
    			var msj = "La información no se encuentra disponible por el momento.";
 		   	 	$("#missegurosValidacion").text( msj );
 		   	 	*/
        	}
        	else{
	      		salud    		= objetoPolizas[0].salud;
	      		eps    			= objetoPolizas[0].eps;
	      		vida 			= objetoPolizas[0].vida;
	      		domiciliario	= objetoPolizas[0].domiciliario;
	      		vehicular		= objetoPolizas[0].vehicular;
	      		soat			= objetoPolizas[0].soat;
	      		otros			= objetoPolizas[0].otros;
	      		
	      		for(var i=0; i < soat.length ; i++)
	      			vehicular.push(soat[i]);	      		
        	}
    	}
		catch(err) {
			 salud.coderror	  		= true;
			 eps.coderror	  		= true;
			 vida.coderror	  		= true;
			 vehicular.coderror	  	= true;
			 soat.coderror	 	 	= true;
			 domiciliario.coderror	= true;
			 otros.coderror			= true;
			 /*			 
		    	var msj = "La información no se encuentra disponible por el momento.";
		   	 	$("#missegurosValidacion").text( msj );
		   	 */
		}

      	/****************************
      	*	SEGUROS EPS  			*
      	****************************/	      	
      	if (eps && eps.coderror){
      		var table = $('#table-eps').dataTable();
   	 		table.parent().toggle(false);
	    	var msj = "La información no se encuentra disponible por el momento.";
	   	 	$("#missegurosValidacionEPS").text( msj );	   	 	
      	}
      	else{
      		eps 		= eps.listPolizaRS.polizaRSs;
      		      		
      		$("#seccionEPS").removeClass("hidden");
			$('#table-eps').DataTable({
				"ordering"	: false,
				"searching"	: false,
				"paging"	: false,
	          	"bInfo"		: false,
	          	"bAutoWidth": false,   	          	
	          	"data"		: eps,
				"columns"   : [
								  { "render"		: function(data, type, row){
									  					var htmlHiddens = generarHidden(row.nropoliza,row);
	   							 						return '<center>'+
	   							 									'<input type="radio" '+
	   							 											'name="polizaSelected" '+ 
		   							 										'id="radio_'+row.nropoliza+'" '+
			   							 									'value="'+row.nropoliza+'-EPS-'+row.dscproducto+'-'+row.numcerti+'" >'+ 
				   							 								//'onclick="('+$('#numpoliza').val(row.nropoliza)+');">'+
				   							 						htmlHiddens +   							 											   							 											   							 											   							 												   							 								
				   							 					'</center>';	   							 					
	   						 	   					  }
								  },             				   
		                          { "data"		: "nropoliza"},
		                          { "data"      : "dscproducto"},
		                          { "data"      : "vigencia"}	                          
							 ],
				"fnDrawCallback": function () {
									load_event_ajax(); 
									var table = $('#table-eps').dataTable();
									if(table.fnGetData().length ==0){
										$("#seccionEPS").addClass("hidden");
					                     table.parent().toggle(false);					   	 
					                     var msj = "No cuentas con este tipo de seguro.";
					                     $("#missegurosValidacionEPS").text( msj );	                     
									}
								}
			});
    
			$.each(eps, function(i, value) {
				var htmlHiddensResponsive = generarHidden(value.nropoliza,value);				
      			var elemento = '<a class="list-group-item method-ajax" style="cursor: pointer;" onclick="javascript:seleccionarPoliza(\''+value.nropoliza+'-EPS-'+value.dscproducto+'-'+value.numcerti+'\')"> '+
									'<span class="label-custom">Póliza: </span> '+ ((!value.nropoliza)?"":value.nropoliza.toUpperCase()) + '<br> ' +
									'<span class="label-custom">Producto: </span>'+ ((!value.dscproducto)?"":value.dscproducto.toUpperCase()) + '<br> ' +
									'<span class="label-custom">Vigencia: </span> '+ ((!value.vigencia)?"":value.vigencia.toUpperCase()) +
									htmlHiddensResponsive +   
								'</a>';
			
      			$(nomListaEPS).append(elemento);
 			});
			
      	}
      	/****************************
      	*	SEGUROS SALUD			*
      	****************************/	      	
      	if (salud && salud.coderror){
      		var table = $('#table-salud').dataTable();
   	 		table.parent().toggle(false);
	    	var msj = "La información no se encuentra disponible por el momento.";
	   	 	$("#missegurosValidacionSalud").text( msj );	   	 	
      	}
      	else{ 

      		salud = salud.listPolizaRS.polizaRSs;
      		  		
      		$("#seccionSalud").removeClass("hidden");
			$('#table-salud').DataTable({
				"ordering"	: false,
				"searching"	: false,
				"paging"	: false,
	          	"bInfo"		: false,
	          	"bAutoWidth": false,   	          	
	          	"data"		: salud,
				"columns"   : [
								  { "render"		: function(data, type, row){
									  					var htmlHiddens = generarHidden(row.nropoliza,row);
	   							 						return '<center>'+
	   							 									'<input type="radio" '+
	   							 											'name="polizaSelected" '+ 
		   							 										'id="radio_'+row.nropoliza+'" '+
			   							 									'value="'+row.nropoliza+'-Salud-'+row.dscproducto+'-'+row.numcerti+'" >'+
				   							 								//'onclick="('+$('#numpoliza').val(row.nropoliza)+');">'+
				   							 						htmlHiddens + 				   							 								
				   							 					'</center>';	   							 					
	   						 	   					  }
								  },             				   
		                          { "data"		: "nropoliza"},
		                          { "data"      : "dscproducto"},
		                          { "data"      : "vigencia"}	                          
							 ],
				"fnDrawCallback": function () {
									load_event_ajax(); 
									var table = $('#table-salud').dataTable();
									if(table.fnGetData().length ==0){
										$("#seccionSalud").addClass("hidden");
					                     table.parent().toggle(false);					   	 
					                     var msj = "No cuentas con este tipo de seguro.";
					                     $("#missegurosValidacionSalud").text( msj );	                     
									}
								}
			});
    
			$.each(salud, function(i, value) {
				var htmlHiddensResponsive = generarHidden(value.nropoliza,value);			
      			var elemento = '<a class="list-group-item method-ajax" style="cursor: pointer;" onclick="javascript:seleccionarPoliza(\''+value.nropoliza+'-Salud-'+value.dscproducto+'-'+value.numcerti+'\')"> '+
									'<span class="label-custom">Póliza: </span> '+ ((!value.nropoliza)?"":value.nropoliza.toUpperCase()) + '<br> ' +
									'<span class="label-custom">Producto: </span>'+ ((!value.dscproducto)?"":value.dscproducto.toUpperCase()) + '<br> ' +
									'<span class="label-custom">Vigencia: </span> '+ ((!value.vigencia)?"":value.vigencia.toUpperCase()) +
									htmlHiddensResponsive +
								'</a>';
			
      			$(nomListaSalud).append(elemento);
 			});
			
      	}
      	
      	/****************************
      	*	SEGUROS VIDA			*
      	****************************/
      	if (vida && vida.coderror){
      		var table = $('#table-vida').dataTable();
   	 		table.parent().toggle(false);
	    	var msj = "La información no se encuentra disponible por el momento.";
	   	 	$("#missegurosValidacionVida").text( msj );	   	 	
      	}else{      		
      		$("#seccionVida").removeClass("hidden");
	        $('#table-vida').DataTable({
	            	"ordering"	: false,
	    			"searching"	: false,
	    			"paging"	: false,
	              	"bInfo"		: false,
	              	"bAutoWidth": false,   	              	
	              	"data"		: vida,
	                "columns" : [
									{ "render"		: function(data, type, row){
					  									var htmlHiddens = generarHidden(row.numpoliza,row);	
														return '<center>'+
																	'<input type="radio" '+
																			'name="polizaSelected" '+
																			'id="radio_'+row.numpoliza+'" '+
																			'value="'+row.numpoliza+'-Vida-'+row.dscproducto+'-'+row.numcerti+'" >'+
																			//'onclick="('+$('#numpoliza').val(row.numpoliza)+');">'+
			   							 							htmlHiddens +  																			
																'</center>';				 
											  		  }
									},
									{ "data"	: "numpoliza"},
			                        { "data"    : "dscproducto"},
			                        { "data"    : "vigencia"}
	            				],
	        		"fnDrawCallback": function () {
					        			load_event_ajax();
					        			var table = $( '#table-vida').dataTable();
										if(table.fnGetData().length ==0){
											$("#seccionVida").addClass("hidden");
						                     table.parent().toggle(false);
										   var msj = "No cuentas con este tipo de seguro.";
						                     $("#missegurosValidacionVida").text( msj );
										}
					                }
	    	});
	    	
			$.each(vida, function(i, value) {
				var htmlHiddensResponsive = generarHidden(value.nropoliza,value);                
      			var elemento = '<a class="list-group-item method-ajax" style="cursor: pointer;" onclick="javascript:seleccionarPoliza(\''+value.numpoliza+'-Vida-'+value.dscproducto+'-'+value.numcerti+'\')"> '+
									'<span class="label-custom">Póliza: </span> '+ ((!value.numpoliza)?"":value.numpoliza.toUpperCase()) + '<br> ' +
									'<span class="label-custom">Producto: </span>'+ ((!value.dscproducto)?"":value.dscproducto.toUpperCase()) + '<br> ' +
									'<span class="label-custom">Vigencia: </span> '+ ((!value.vigencia)?"":value.vigencia.toUpperCase()) +
									htmlHiddensResponsive+
								'</a>';
			
      			$(nomListaVida).append(elemento);
 			});
						
      	}
      	
        /****************************
      	*	SEGUROS VEHICULAR		*
      	****************************/	      	
      	if (vehicular && vehicular.coderror){
      		var table = $('#table-vehicular').dataTable();
   	 		table.parent().toggle(false);
	    	var msj = "La información no se encuentra disponible por el momento.";
	   	 	$("#missegurosValidacionVehicular").text( msj );	   	 	
      	}
      	else{  
      		$("#seccionVehicular").removeClass("hidden");
		    $('#table-vehicular').DataTable({
		            	"ordering"	: false,
						"searching"	: false,
						"paging"	: false,
						"bInfo"		: false,	
						"bAutoWidth": false,   					
						"data"		: vehicular,
		                "columns" : [
										{ "render"		: function(data, type, row){	
		  													var htmlHiddens = generarHidden(row.numpoliza,row);																 	
															return '<center>'+
																		'<input type="radio" '+ 
																				'name="polizaSelected" '+ 
																				'id="radio_'+row.numpoliza+'" '+ 
																				'value="'+row.numpoliza+'-Vehicular-'+row.dscproducto+'-'+row.placa+row.numcerti+'" >'+
																				//'onclick="('+$('#numpoliza').val(row.numpoliza)+');">'
				   							 							htmlHiddens+  																				
																	'</center>';					 
														  }
										},
										{ "data"    : "numpoliza"},
										{ "data"    : "dscproducto"},
					                    { "data"    : "placa"},									
			                    		{ "data"    : "marca"},
			                    		{ "data"    : "modelo"},
			                    		{ "data"    : "ano"},		                    		
			                    		{ "data"    : "vigencia"}		                    
		            				],
		        		"fnDrawCallback": function () {
						        			load_event_ajax();
						        			//var nomtabla = '#table-vehicular';
						        			var table = $('#table-vehicular').dataTable();
						        			if(table.fnGetData().length ==0){
						        				$("#seccionVehicular").addClass("hidden");
							                     table.parent().toggle(false);
											   var msj = "No cuentas con este tipo de seguro.";
							                     $("#missegurosValidacionVehicular").text( msj );
											} /*else if (table.fnGetData().length < 11) {
												 $(nomtabla+"_length").hide();
												 $(nomtabla+"_paginate").hide();
											}*/
						                }
		    	});
		    	
			$.each(vehicular, function(i, value) {
				var htmlHiddensResponsive = generarHidden(value.nropoliza,value);                
      			var elemento = '<a class="list-group-item method-ajax" style="cursor: pointer;" onclick="javascript:seleccionarPoliza(\''+value.numpoliza+'-Vehicular-'+value.dscproducto+'-'+value.numcerti+'\')"> '+
									'<span class="label-custom">Póliza: </span> '+ ((!value.numpoliza)?"":value.numpoliza.toUpperCase()) + '<br> ' +
									'<span class="label-custom">Producto: </span>'+ ((!value.dscproducto)?"":value.dscproducto.toUpperCase()) + '<br> ' +
									'<span class="label-custom">Placa: </span> '+ ((!value.placa)?"":value.placa.toUpperCase()) + '<br> ' +
									'<span class="label-custom">Marca: </span> '+ ((!value.marca)?"":value.marca.toUpperCase()) + '<br> ' +
									'<span class="label-custom">Modelo: </span> '+ ((!value.modelo)?"":value.modelo.toUpperCase()) + '<br> ' +
									'<span class="label-custom">Año: </span> '+ ((!value.ano)?"":value.ano.toUpperCase()) + '<br> ' +
									'<span class="label-custom">Vigencia: </span> '+ ((!value.vigencia)?"":value.vigencia.toUpperCase()) +
									htmlHiddensResponsive+								
								'</a>';
			
      			$(nomListaVehi).append(elemento);
 			});
			
      	}  
      	
        /****************************
      	*	SEGUROS DOMICILIARIO	*
      	****************************/      	
      	if (domiciliario && domiciliario.coderror){
      		var table = $('#table-domiciliario').dataTable();
   	 		table.parent().toggle(false);
	    	var msj = "La información no se encuentra disponible por el momento.";
	   	 	$("#missegurosValidacionDomiciliario").text( msj );	   	 	
      	}
      	else{  
      		$("#seccionDomiciliario").removeClass("hidden");
		    $('#table-domiciliario').DataTable({
		            	"ordering"	: false,
		    			"searching"	: false,
		    			"paging"	: false,
		              	"bInfo"		: false,		
		              	"bAutoWidth": false,                 	
		              	"data"		: domiciliario,
		                "columns" : [
										{ "render"		: function(data, type, row){	
															var htmlHiddens = generarHidden(row.numpoliza,row);
															return '<center>'+
																		'<input type="radio" '+
																				'name="polizaSelected"  '+
																				'id="radio_'+row.numpoliza+'"  '+ 
																				'value="'+row.numpoliza+'-Domiciliario-'+row.dscproducto+'-'+row.numcerti+'-" >'+
																				//'onclick="('+$('#numpoliza').val(row.numpoliza)+');"> '+
				   							 							htmlHiddens+  																				 
																	'</center>';					 
														  }
										},
										{ "data"	: "numpoliza"},
				                        { "data"    : "dscproducto"},
										{ "data"    : "direccion"},
				                        { "data"    : "vigencia"}		                    
		            				],
		        		"fnDrawCallback": function () {
						        			load_event_ajax();
						        			var table = $('#table-domiciliario').dataTable();
						    				if(table.fnGetData().length ==0){
						    					$("#seccionDomiciliario").addClass("hidden");
						                         table.parent().toggle(false);
						    				   var msj = "No cuentas con este tipo de seguro.";
						                         $("#missegurosValidacionDomiciliario").text( msj );
						    				}
						                }
		    	});
		    	
			$.each(domiciliario, function(i, value) {
				var htmlHiddensResponsive = generarHidden(value.nropoliza,value);                     
      			var elemento = '<a class="list-group-item method-ajax" style="cursor: pointer;" onclick="javascript:seleccionarPoliza(\''+value.numpoliza+'-Domiciliario-'+value.dscproducto+'-'+value.numcerti+'\')"> '+
									'<span class="label-custom">Póliza: </span> '+ ((!value.numpoliza)?"":value.numpoliza.toUpperCase()) + '<br> ' +
									'<span class="label-custom">Producto: </span>'+ ((!value.dscproducto)?"":value.dscproducto.toUpperCase()) + '<br> ' +
									'<span class="label-custom">Dirección: </span> '+ ((!value.direccion)?"":value.direccion.toUpperCase()) + '<br> ' +						
									'<span class="label-custom">Vigencia: </span> '+ ((!value.vigencia)?"":value.vigencia.toUpperCase()) +
									htmlHiddensResponsive +								
								'</a>';
			
      			$(nomListaDomi).append(elemento);
 			});
			
      	}

      	/****************************
      	*	SEGUROS OTROS			*
      	****************************/
   		//console('otros : '+otros);
      	if (otros && otros.coderror){
      		var table = $('#table-otros').dataTable();
   	 		table.parent().toggle(false);
	    	var msj = "La información no se encuentra disponible por el momento.";
	   	 	$("#missegurosValidacionOtros").text( msj );	   	 	
      	}
      	else{      		
      		$("#seccionOtros").removeClass("hidden");
	        $('#table-otros').DataTable({
	            	"ordering"	: false,
	    			"searching"	: false,
	    			"paging"	: false,
	              	"bInfo"		: false,
	              	"bAutoWidth": false,   	              	
	              	"data"		: otros,
	                "columns" : [
									{ "render"		: function(data, type, row){		
													var htmlHiddens = generarHidden(row.numpoliza,row);														 	
														return '<center>'+
																	'<input type="radio" '+
																			'name="polizaSelected" '+
																			'id="radio_'+row.numpoliza+'" '+
																			'value="'+row.numpoliza+'-Otros-'+row.dscproducto+'-'+row.numcerti+'" >'+
																			//'onclick="('+$('#numpoliza').val(row.numpoliza)+');">'+
			   							 							htmlHiddens+  																			
																'</center>';				 
											  		  }
									},
									{ "data"	: "numpoliza"},
			                        { "data"    : "dscproducto"},
			                        { "data"    : "vigencia"}
	            				],
	        		"fnDrawCallback": function () {
					        			load_event_ajax();
					        			var table = $( '#table-otros').dataTable();
										if(table.fnGetData().length ==0){
											$("#seccionOtros").addClass("hidden");
						                     table.parent().toggle(false);
										   var msj = "No cuentas con este tipo de seguro.";
						                     $("#missegurosValidacionOtros").text( msj );
										}
					                }
	    	});
	    	
			$.each(otros, function(i, value) {
				var htmlHiddensResponsive = generarHidden(value.nropoliza,value);                             
      			var elemento = '<a class="list-group-item method-ajax" style="cursor: pointer;" onclick="javascript:seleccionarPoliza(\''+value.numpoliza+'-Otros-'+value.dscproducto+'-'+value.numcerti+'\')"> '+
									'<span class="label-custom">Póliza: </span> '+ ((!value.numpoliza)?"":value.numpoliza.toUpperCase()) + '<br> ' +
									'<span class="label-custom">Producto: </span>'+ ((!value.dscproducto)?"":value.dscproducto.toUpperCase()) + '<br> ' +
									'<span class="label-custom">Vigencia: </span> '+ ((!value.vigencia)?"":value.vigencia.toUpperCase()) +
									htmlHiddensResponsive +								
								'</a>';
			
      			$(nomListaOtros).append(elemento);
 			});
						
      	}
      	
      	$("#loading").hide();
      	$("#content-reclamos-polizas").slideDown(2000);
      	
  	//}); 	

  	$('#btnSeleccionarPoliza').click(function() {	
  		
		if($("input[name='polizaSelected']").is(':checked')){		
	  		var value = $("input[name='polizaSelected']:checked").val();			
			var datapoliza = value.split('-');
			var tam = datapoliza.length;
		
			$('#numpoliza').val(datapoliza[0]);
			$('#numcerti').val(datapoliza[tam-1]);
			
			setearCadenaSeguros(datapoliza[0]);			
				
			if(datapoliza[1] == "Salud"){
		    	$(".reclamo-servicio").removeClass("hidden");
		        $(".reclamo-bien").addClass("hidden");
		    }
		    else if(datapoliza[1] == "Vehicular"){
		      	$('#placa').val(datapoliza[3]);
		        $(".reclamo-servicio").addClass("hidden");
		        $(".reclamo-bien").removeClass("hidden");
		    }
		    else{
		        $(".reclamo-servicio").addClass("hidden");
		        $(".reclamo-bien").addClass("hidden");
		    }        	
        }else{
        	$('#numpoliza').val('');
    		$('#placa').val('');
    		$(".reclamo-servicio").addClass("hidden");
            $(".reclamo-bien").addClass("hidden");    	
        }
		
	});
  	
  	$('#btnClose').click(function(){
  		if($("input[name='polizaSelected']").is(':checked')){  			
  			$('#numpoliza').val($('#numpoliza').val());  		
  		}else{
  			$('#numpoliza').val('');
  		}  		
  	});

  	
	if(CTE_NEGOCIO==CTE_NEGOCIO_EPS) {
		$('#seccionEPS').show();
		$('#seccionSalud').hide();
		$('#seccionVida').hide();
		$('#seccionDomiciliario').hide();
		$('#seccionVehicular').hide();
		$('#seccionOtros').hide();
	}

	if(CTE_NEGOCIO==CTE_NEGOCIO_SBS)
		$('#seccionEPS').hide();		
	 	
});

	function seleccionarPoliza(value){

		var datapoliza = value.split('-');
		$('#numpoliza').val(datapoliza[0]);
		var tam = datapoliza.length;
		
		$('#numpoliza').val(datapoliza[0]);
		$('#numcerti').val(datapoliza[tam-1]);

		setearCadenaSeguros(datapoliza[1]);
		$('.modal.in').modal('hide');
		
	}

	function setearCadenaSeguros(poliza){
		
		$("#registroRimacSeguros1 #idepol").val($('#idepol-'+poliza).val());
		$("#registroRimacSeguros1 #codramo").val($('#codramo-'+poliza).val());
		$("#registroRimacSeguros1 #descramo").val($('#descramo-'+poliza).val());
		$("#registroRimacSeguros1 #codproducto").val($('#codproducto-'+poliza).val() );
		$("#registroRimacSeguros1 #descproducto").val($('#descproducto-'+poliza).val());
		$("#registroRimacSeguros1 #nomcontratante").val($('#nomcontratante-'+poliza).val());
		$("#registroRimacSeguros1 #nomtitular").val($('#nomtitular-'+poliza).val());
		//$("#registroRimacSeguros1 #numcerti").val($('#numcerti-'+poliza).val());
	}

</script>