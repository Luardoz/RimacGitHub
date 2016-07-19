/*
 * Beans lado cliente
 */
function Usuario(idUsuario, clave){
	this.idUsuario = idUsuario;
	this.clave = clave;
}
function WorkFlow(idewf,idewfdef,descripcion,usuario,cadena,idewfori){
	this.idewf = idewf;	  
	this.idewfdef = idewfdef;
	this.descripcion = descripcion;
	this.usuario = usuario;
	this.cadena = cadena;
	this.idewfori = idewfori;
}

/*														
 * 	Funciones para el formulario de Registro de Reclamo
 */
function validarFormRegistro(){
	$("#form-reclamos-registrar").validate({
		rules			: {
							idtipocaso	: {
									required 		: true
							},
							idsistema	: {
									required 		: true									
							},
							idproducto	: {
									required 		: true									
							},
							desctitulo	: {
									required		: true
							},
							descdetallecaso	: {
									required		: true
							},
							file		: {
									required		: true
							}
					},
		messages 		: {
							idtipocaso 	: {
									required		: "Campo obligatorio"									
							},
							idsistema 	: {
									required		: "Campo obligatorio"									
							},
							idproducto 	: {
									required		: "Campo obligatorio"									
							},
							desctitulo	: {
									required		: "Campo obligatorio"
							},
							descdetallecaso	: {
									required		: "Campo obligatorio"
							},
							file		: {
									required		: "Campo obligatorio"
							}
					}
	});	
}

function confirmarRegistro(){
	validarFormRegistro();
	if($("#form-reclamos-registrar").valid()){
		$("#content-dialog").html('<div id="dialog-confirm" title="Confirmar transacción">' +
									  '<p><span class=".modal.in .modal-dialog" style="float:left; margin:12px 12px 20px 0;"></span>¿Está seguro de registrar el ticket con los datos provistos?</p>'+
									  '</div>');
		
		$( "#dialog-confirm" ).dialog({
		      resizable: false,
		      closeText: "",
		      height: "auto",
		      width: 400,
		      modal: true,
		      buttons: {
		        "Confirmar": function() {
		          $( this ).dialog( "close" );
		          registrarReclamo();
		        },
		        "Cancelar": function() {
		          $( this ).dialog( "close" );	          
		        }
		      }
		    });
	}else
		return false;
}
function registrarReclamo(){
		
	loadModalCargando();
	var formData = new FormData();
	formData.append("fileBytes", file.files[0]);
	formData.append("fileName", $("#file").val());
	formData.append("idtipocaso", $("#idtipocaso").val());
	formData.append("idsistema", $("#idsistema").val());
	formData.append("idproducto", $("#idproducto").val());
	formData.append("idfecregistro",$("#idfecregistro").val());
	formData.append("desctitulo",$("#desctitulo").val());
	formData.append("descdetallecaso",$("#descdetallecaso").val());
	
	$.ajax({
		type : "POST",
		url : "serviceUser/reclamos-registrar/nuevo",
		processData : false,
		contentType : false,
		async: true,
		data : formData,
		cache : false,
		success : function(response, status, xhr) {
			var clase = "";
			if(response.codResp == '0')
				clase = 'alert-success';
			else
				clase = 'alert-danger';
			$("#container-mensaje").html('');
			$("#container-mensaje").append('<div class="alert '+clase+'" style="margin: 5px; padding: 5px;">' +
					'<button aria-hidden="true"' +
							'data-dismiss="alert"' + 
							'class="close"' +
							'type="button">×</button>' +
							 '<span id="msj-result-reg-reclamo"></span>' +
				'</div>');
			$("#msj-result-reg-reclamo").html(response.msjResp);			
			$("#mensajes-registrar").show();
			
			//Reseteando el formulario
			$('#form-reclamos-registrar')[0].reset();			
			var formulario = $('#form-reclamos-registrar').validate();			
			formulario.resetForm();
			
			closeModalCargando();
		},
		error : function(a, b, c) {
			$("#container-mensaje").html('');
			$("#container-mensaje").append('<div class="alert alert-danger" style="margin: 5px; padding: 5px;">' +
							'<button aria-hidden="true"' +
									'data-dismiss="alert"' + 
									'class="close"' +
									'type="button">×</button>' +
									 '<span id="msj-result-reg-reclamo"></span>' +
						'</div>');
			$("#msj-result-reg-reclamo").html("Hubo un error registrando el reclamo");			
			$("#mensajes-registrar").show();
			closeModalCargando();
		}
	});
}

/*														
 * 	Funciones para la consulta de Tickets
 */
function traerJsonCompletoMisReclamos(){
	loadModalCargando();
	var nametable	= 'misreclamos';
	var a_codusu = $("#nameTitularHeader").text(); 
	var estado = $("#idestado").val();
	var ticket = $("#nticket").val();
	
	$.ajax({
		type  		: "POST",
		url   		: "serviceUser/reclamos-mis-reclamos/listar?codUsu="+a_codusu+"&estado="+estado+"&ticket="+ticket,
//		url   		: "serviceUser/reclamos-mis-reclamos/listar",
		cache 		: false,
		async 		: false,						
		data		: '' ,
//		beforeSend : function(xhr) {
//			xhr.setRequestHeader('codUsu', a_codusu);
//			xhr.setRequestHeader('estado', estado);
//			xhr.setRequestHeader('ticket', ticket);			
//		},
		success 	: function(data) {
//					if (data != 'undefined' && data.length > 0){							
//						tablashtml(data, nametable);
//						closeModalCargando();
//					}else{
//						closeModalCargando();
//						$("#mis-reclamos").hide();
//						$("#sin-reclamos").show();
//					};
					tablashtml(data, nametable);
					closeModalCargando();
		},
		error : function(xhr, ajaxOptions, thrownError) {
			closeModalCargando();
			loadModalMensaje('Lo Sentimos','<center>Hubo problemas en el procesamiento de datos. Por favor, inténtelo en unos minutos.</center>','');
		}
	});
}

function tablashtml(jReclamos, name){
	var idTabla= '#table-'+name;
	$(idTabla).dataTable().fnDestroy();
	$(idTabla).DataTable({
		"data"      : jReclamos,
		"ordering"  : false,
        "searching" : false,
        "paging"    : true,
        "bInfo"		: true,
        "bAutoWidth": false,
        "pagingType": "full_numbers" , 	
        "language": {		       
	        "sProcessing":     "Procesando...",
	    	"sLengthMenu":     "Mostrar _MENU_ registros",
	    	"sZeroRecords":    "No se encontraron resultados",
	    	"sEmptyTable":     "Ningún dato disponible en esta tabla",
	    	"sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
	    	"sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
	    	"sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
	    	"sInfoPostFix":    "",
	    	"sSearch":         "Buscar:",
	    	"sUrl":            "",
	    	"sInfoThousands":  ",",
	    	"sLoadingRecords": "Cargando...",
	    	"oPaginate": {
	    		"sFirst":    "Primero",
	    		"sLast":     "Último",
	    		"sNext":     "Siguiente",
	    		"sPrevious": "Anterior"
	    	},
	    	"oAria": {
	    		"sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
	    		"sSortDescending": ": Activar para ordenar la columna de manera descendente"
	    	}
        },
        "columns"   : [			                   			                   	 
	                   	 { "data"        : "marca" , "render" : function (data, type, full){						   
						var a ='<p id="detalle_'+full.idewf+'">'+full.idewf+'</p>'+		 							   
								   '<p id="desctarea" name="desctarea" style="display:none">'+full.desctarea+'</p>'+
								   '<p id="fecusu" name="fecusu" style="display:none">'+full.fecusu+'</p>'+
								   '<p id="fecatencion" name="fecatencion" style="display:none">'+full.fecatencion+'</p>'+
								   '<p id="feccierre" name="feccierre" style="display:none">'+full.fecatencion+'</p>'+
								   '<p id="descestado" name="descestado" style="display:none">'+full.descestado+'</p>' ; 
							return a;},"sWidth": "5%"
         				},
         				{ "data"        : "desctarea","sWidth": "15%"},
         				{ "data"        : "descestado","sWidth": "10%"},
         				{ "data"        : "fecusu","sWidth": "15%"},
         				{ "data"        : "fecatencion","sWidth": "15%"},     				
         				{ "data"        : "desctipoinci","sWidth": "15%"}
         				,{ "data"        : "" ,"render" : function (data, type, full){
         									var param = full.idewf + ",\'"+ full.desctipoinci +"\'";
         									var a ='<a 	data-toggle="modal" onclick="javascript:buscarTareas('
					 							   +full.idewf+',\''+full.desctipoinci+'\');"><img src="img/default/detach.png" width="20px" height="20px" border=0 align="center"> </a>';       					 							 			  
											return a;},"sWidth": "5%"}
                    ]
//        ,"fnDrawCallback": function () {
//	        		var table = $(idTabla).dataTable();
//	        		if(table.fnGetData().length ==0){
//	        		   table.parent().toggle(false);
//	        		   $("#idmensajeH6").text("El sistema no encontró Reclamos asociados al DNI.");
//	           		   $("#FilaBotones").hide();
//	        		}
//        }	        
     });
}

function armarResponsive(json, nametable){
	
	var cadenaFilas="";		
	for(var f=0; f<json.length; f++){
		var dscproducto,fecocureclamo = '';
		dscproducto   = json[f].descproducto == "" ? C_NO_DISPONIBLE : json[f].descproducto;
		fecocureclamo = json[f].fecocureclamo == "" ? C_NO_DISPONIBLE : json[f].fecocureclamo;
		cadenaFilas = '<a onclick="javascript:setDataDetalle(\''+json[f].numreclamo+'\');" class="method-ajax list-group-item">'+
						'<dl><dt><label>Reclamo</label></dt><dd><label>: '+json[f].numreclamo +'</label></dd></dl>'+
						'<dl><dt><label>Producto</label></dt><dd><label>: '+dscproducto +'</label></dd></dl>'+
						'<dl><dt><label>Fecha</label></dt><dd><label>: '+fecocureclamo +'</label></dd></dl>'+
						'<dl><dt><label>Estado</label></dt><dd><label>: '+obtenerEstado(json[f].estadoreclamo);+'</label></dd></dl>'+							
				      '</a>';
		$("#res-"+nametable).append(cadenaFilas);
		marca = "";
	}
}

function buscarTareas(idewf,desctipoinci){	
	
	loadModalCargando();	
	$.ajax({
		type  		: "GET",
		url   		: "serviceUser/reclamos-mis-reclamos/tareas",
		cache 		: false,
		async 		: false,						
		data		: '',
		beforeSend : function(xhr) {
			xhr.setRequestHeader('idewf', idewf);					
		},
		success 	: function(data) {
					if (data != 'undefined'){							
						procesarTablaTareas(data);
						closeModalCargando();
					}else{
						closeModalCargando();
						loadModalMensaje('Informacion','<center>No se encontraron tareas para el Ticket.</center>','');
					};
		},
		error : function(xhr, ajaxOptions, thrownError) {
			closeModalCargando();
			loadModalMensaje('Informacion','<center>No se encontraron tareas para el Ticket.</center>','');
		}
	});

	$("#tituloTareas").html('Listado de Tareas - Ticket ' + idewf +' ('+ desctipoinci + ')')	
	$("#content-mis-tareas").modal();				
}	

function procesarTablaTareas(jsonTareas){
	$("#table-tareas").dataTable().fnDestroy();
	
	$("#table-tareas").DataTable({		
		"data"      : jsonTareas,
		"ordering"  : false,
        "searching" : true,
        "paging"    : true,
        "bInfo"		: true,
        "bAutoWidth": false,        
        "pagingType": "full_numbers" , 	
        "language": {		       
	        "sProcessing":     "Procesando...",
	    	"sLengthMenu":     "Mostrar _MENU_ registros",
	    	"sZeroRecords":    "No se encontraron resultados",
	    	"sEmptyTable":     "Ningún dato disponible en esta tabla",
	    	"sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
	    	"sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
	    	"sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
	    	"sInfoPostFix":    "",
	    	"sSearch":         "Buscar:",
	    	"sUrl":            "",
	    	"sInfoThousands":  ",",
	    	"sLoadingRecords": "Cargando...",
	    	"oPaginate": {
	    		"sFirst":    "Primero",
	    		"sLast":     "Último",
	    		"sNext":     "Siguiente",
	    		"sPrevious": "Anterior"
	    	},
	    	"oAria": {
	    		"sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
	    		"sSortDescending": ": Activar para ordenar la columna de manera descendente"
	    	}
        },
        "columns"   : [			                   			                   	 
	                   
         				{ "data"        : "descripcionTarea"},
         				{ "data"        : "nombreArchivo"},
         				{ "data"        : "" ,"render" : function (data, type, full){								
								var a = '<a target="_blank" href="serviceUser/reclamos-mis-reclamos/tareas/descargarArchivo?idarchivo='+full.idArchivo+'" class="method-ajax list-group-item">Ver Documento</a>';       					 							 			  
							return a;}
         				}    					
                    ]                  
     });
	
	
}
