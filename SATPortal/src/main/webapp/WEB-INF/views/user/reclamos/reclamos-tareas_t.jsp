  
 <div id="mis-tareas" class="reclamos">
<%--div class="panel-body" id="tareas-reclamo-container"> --%>
<%-- <div class="column-formulario-reclamo" style="width: 100%; margin-top: 10px; margin-bottom: 10px; padding-left: 15px; padding-right: 15px;"> --%>
	<div style="width: 100%; margin-top: 10px; margin-bottom: 10px; padding-left: 15px; padding-right: 15px;">
				<h4 style="margin: 0px;">Listado de Tareas</h4>
				<hr style="margin: 0px; border-color: #dddddd;">	            
	</div> 
	<br>
	<br>
    
    <div class="form-mis-reclamos" id="frmMisTareas">	
	<%--form enctype="multipart/form-data" id="form-reclamos-tareas" method="post">  --%>
	  <%-- <div class="form-group">
	      <label class="control-label col-xs-3  required">Tipo de Atención:</label>
	      <div class="col-xs-5">
	       <select class="selectpicker form-control" id="idtipocaso" name="idtipocaso">
	       </select>
	        <div class="result"></div>
	      </div>
	  </div> --%>
	  <div class="group-table-reclamos" id="div-mistareas">
	  </div>
	 <%--</form> --%>
	</div>
</div> 
    


<script type="text/javascript">	
$(document).ready(function() {
	    var nomTablaTareas	= 'mistareas';
		traerJsonCompletoMisTareas(nomTablaTareas);
	});
    
    
	function traerJsonCompletoMisTareas(nametable){
	 //alert("tareas");	
	 
	/*	$.ajax({
			type  		: "POST",
			url   		: "/PORTALSAT/portalsat.do?method=listarTareasXTicket",

// 			url   		: "/ASISTENCIA/reclamo.do?method=consultarReclamosCliente",					
			url   		: "/WORKFLOW/mntwf.do?method=consultarIncidentes",
			cache 		: false,
			async 		: false,
			dataType 	: 'json',
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			data		: {datos:JSON.stringify(param)},
			success 	: function(data) {
// 						if (data.resultado == 0 && data.lstReclamos){
						if (data != 'undefined'){
// 							var jsonReclamos = eval(data.lstReclamos);
							var jsonReclamos = eval(data.incidentes);
							tablashtml(jsonReclamos, nametable);
// 							armarResponsive(jsonReclamos, nametable);
						}else{
							closeModalCargando();
							$("#mis-reclamos").hide();
							$("#sin-reclamos").show();
						};
			},
			error : function(xhr, ajaxOptions, thrownError) {
				closeModalCargando();
				loadModalMensaje('Lo Sentimos','<center>Hubo problemas en el procesamiento de datos. Por favor, inténtelo en unos minutos.</center>','');
			}
		});*/
		
		//tablashtml(jsonReclamos, nametable);
		tablashtml_t('', nametable);
		//armarResponsive(jsonReclamos, nametable);
		//armarResponsive('', nametable);
	}

	function tablashtml_t(jReclamos, name){		
		alert("starting tablashtml_t");
		var cadenaTablas = 	'    <div class="row visible-md-block visible-sm-block visible-lg-block">'+
						    '        <div class="table-responsive-tareas col-md-12">'+
						    '            <table id="table-'+name+'" class="table table-hover table-bordered table-inter text-center">'+
						    '                <thead>'+
						    '                    <tr>'+
							'                        <th class="text-center">Tarea</th>'+
						    '                        <th class="text-center">Descripción</th>'+
						    '                        <th class="text-center">Documentos</th>'+						    
						    '                    </tr>'+
						    '                </thead>'+
						    '                <tbody class="vcenter">'+
						    
						    '<tr>'+
						      '<th class="text-center">10. Establecer SGSI</th>'+
							  '<th class="text-center">Establecer_SGSI.doc</th>'+
							  '<th class="text-center"><a onclick="#" class="method-ajax list-group-item"> Ver Detalle</a></th>'+
							'</tr>'+  
							'<tr>'+  
							  '<th class="text-center">10. Establecer SGSI</th>'+
							  '<th class="text-center">Establecer_SGSI.pdf</th>'+
							  '<th class="text-center"><a onclick="#" class="method-ajax list-group-item"> Ver Detalle</a></th>'+							  
							'</tr>'+  
							'<tr>'+  
							  '<th class="text-center">20. Planificar SGSI</th>'+
							  '<th class="text-center">Planificar_SGSI.pdf</th>'+
							  '<th class="text-center"><a onclick="#" class="method-ajax list-group-item"> Ver Detalle</a></th>'+							  
							'</tr>'+ 
						    
						    '                </tbody>'+
						    '            </table>'+
						    '		 <br>'+
						    '		 <div class="row" id="FilaBotones">'+
					        '    	 	<div class="col-md-12">'+
					        '    		</div>'+
				        	'		 </div>'+
						    '        </div>'+
						    '   </div>';
		//alert("part " + cadenaTablas);				    
		$("#div-"+name).append(cadenaTablas);
		//alert("ending tablashtml_t");
		
				
	}
	
function armarResponsive(json, nametable){		
	alert("starting responsive");
		var cadenaFilas="";		
		//for(var f=0; f<json.length; f++){
			var dsctarea, dscadjunto, archivo = '';
			//dscproducto   = json[f].descproducto == "" ? C_NO_DISPONIBLE : json[f].descproducto;
			//fecocureclamo = json[f].fecocureclamo == "" ? C_NO_DISPONIBLE : json[f].fecocureclamo;
			/*cadenaFilas = '<a onclick="javascript:setDataDetalle(\''+json[f].numreclamo+'\');" class="method-ajax list-group-item">'+
							'<dl><dt><label>Producto</label></dt><dd><label>: '+dscproducto +'</label></dd></dl>'+
							'<dl><dt><label>Fecha</label></dt><dd><label>: '+fecocureclamo +'</label></dd></dl>'+							
					      '</a>';
			*/
			cadenaFilas = '<p>10. Establecer SGSI</p>'+
						  '<p>Establecer_SGSI.doc</p>'+
						  '<a onclick="#" class="method-ajax list-group-item"> Ver Detalle</a>';
					      			
			$("#tbl-"+nametable).append(cadenaFilas);
			
			cadenaFilas = '<p>20. Planificar SGSI</p>'+
						  '<p>Establecer_SGSI.pdf</p>'+							
						  '<a onclick="#" class="method-ajax list-group-item"> Ver Detalle</a>';		
			$("#tbl-"+nametable).append(cadenaFilas);
			
		//}*/
		alert("ending responsive");
	}

</script>