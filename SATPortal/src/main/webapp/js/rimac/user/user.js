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
		}
	});
}

