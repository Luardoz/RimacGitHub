/*
 * Beans lado cliente
 */
function WorkFlow(idewf,idewfdef,descripcion,usuario,cadena,idewfori){
	this.idewf = idewf;	  
	this.idewfdef = idewfdef;
	this.descripcion = descripcion;
	this.usuario = usuario;
	this.cadena = cadena;
	this.idewfori = idewfori;
}

$(function() {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	console.log(header + ': ' + token);
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
});

/*														
 * 	Funciones para el formulario de Registro de Reclamo
 */
function aniadirFilaAdjunto(){
	 var identificador = "filaAdjunto";
	 var fileIndex;  
	 var cantFila = $('#tablaficheros tr').length;
	 if(cantFila > 0){
		 fileIndex = Number($('#tablaficheros tr:last').attr("id").substring(identificador.length)) + 1;  
	 }else{
		 fileIndex = 0;  
	 }
	 
     $('#tablaficheros').append(               
               '<tr id="'+ identificador + fileIndex+'"><td style="padding: 10px 0px 0px 0px;">'+        
                '   <input type="file" class="form-control" id="archivos['+ fileIndex +']" name="archivos['+ fileIndex +']" />'+  
                '</td>'+
                '<td style="padding: 10px 0px 0px 10px;">' +
                '<input type="button" value="Borrar" onclick="borraFilaAdjunto(filaAdjunto'+fileIndex+');">' +
                '</td>'+
                '</tr>');     
}

function borraFilaAdjunto(idFila){
	$(idFila).remove();

}

function registrarReclamo(){
//	$("#form-reclamos-registrar").submit();
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
function traerJsonCompletoMisReclamos(nametable){
	loadModalCargando();
	var a_codusu = $("#nameTitularHeader").text(); 
	$.ajax({
		type  		: "POST",
		url   		: "serviceUser/reclamos-mis-reclamos/listar",
		cache 		: false,
		async 		: false,						
		data		: '',
		beforeSend : function(xhr) {
			xhr.setRequestHeader('codUsu', a_codusu);
		},
		success 	: function(data) {
					if (data != 'undefined'){							
						tablashtml(data, nametable);
						closeModalCargando();
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
	});
}

function tablashtml(jReclamos, name){
	var cadenaTablas = 	'    <div class="row visible-md-block visible-sm-block visible-lg-block">'+
					    '        <div class="table-responsive col-md-12">'+
					    '            <table id="table-'+name+'" class="table table-hover table-bordered table-inter text-center">'+
					    '                <thead>'+
					    '                    <tr>'+
						'                        <th class="text-center">N°</th>'+
					    '                        <th class="text-center">Título</th>'+
					    '                        <th class="text-center">Fecha Registro</th>'+
					    '                        <th class="text-center">Fecha Atención</th>'+
					    '                        <th class="text-center">Fecha Cierre</th>'+
					    '                        <th class="text-center">Estado</th>'+
					    '                        <th class="text-center">Tipo</th>'+
					    '                        <th class="text-center">Tareas</th>'+
					    '                    </tr>'+
					    '                </thead>'+
					    '                <tbody class="vcenter">'+
					    '                </tbody>'+
					    '            </table>'+
					    '		 <br>'+
					    '		 <div class="row" id="FilaBotones">'+
				        '    	 	<div class="col-md-12">'+
				        '    		</div>'+
			        	'		 </div>'+
					    '        </div>'+
					    '   </div>';

	$("#div-"+name).append(cadenaTablas);

	var idTabla= '#table-'+name;
	$(idTabla).DataTable({
		"data"      : jReclamos,
		"ordering"  : false,
        "searching" : true,
        "paging"    : true,
        "bInfo"		: true,
        "bAutoWidth": true,
        "scrollX"	: true,
//        "scrollY"	: "700px",
//        "scrollCollapse": true,
//        "paging":         true,
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
							return a;},"sWidth": "15%"
         				},
         				{ "data"        : "desctarea","sWidth": "15%"},
         				{ "data"        : "fecusu","sWidth": "15%"},
         				{ "data"        : "fecatencion","sWidth": "15%"},
         				{ "data"        : "feccierre","sWidth": "15%"},
         				{ "data"        : "descestado","sWidth": "15%"},
         				{ "data"        : "desctipoinci","sWidth": "15%"}
         				,{ "data"        : "" ,"render" : function (data, type, full){
         									var param = full.idewf + ",\'"+ full.desctipoinci +"\'";
         									var a ='<a 	data-toggle="modal" onclick="javascript:buscarTareas('
					 							   +full.idewf+',\''+full.desctipoinci+'\');"><img src="img/default/detach.png" width="20px" height="20px" border=0 align="center"> </a>';       					 							 			  
											return a;},"sWidth": "15%"}
                    ],
        "fnDrawCallback": function () {
	        		var table = $(idTabla).dataTable();
	        		if(table.fnGetData().length ==0){
	        		   table.parent().toggle(false);
	        		   $("#idmensajeH6").text("El sistema no encontró Reclamos asociados al DNI.");
	           		   $("#FilaBotones").hide();
	        		}
        }	        
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
	
	$("#table-tareas").DataTable({		
		"ordering"  : false,
        "searching" : true,
        "paging"    : true,
        "bInfo"		: true,
        "bAutoWidth": true,
        "scrollX"	: true,
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
        "ajax" : {
        	"url": "serviceUser/reclamos-mis-reclamos/tareas?idewf="+idewf,
        	"type": "GET"        	
        },
        "columns"   : [			                   			                   	 
	                   
         				{ data        : "descripcionTarea"},
         				{ data        : "nombreArchivo"},
         				{ data        : "idArchivo"}         					
                    ]       
     });
	
	$("#tituloTareas").html('Listado de Tareas - Ticket ' + idewf +' ('+ desctipoinci + ')')	
	$("#content-mis-tareas").modal();				
}	
